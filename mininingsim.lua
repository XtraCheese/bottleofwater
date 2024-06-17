repeat task.wait() until game:IsLoaded()

local RebirthTokenCodes = {"AnniversaryTokens", "EpicTokens", "#ChristmasHype", "July21st", "America", "1Year", "MoreMoreTokens", "MoreMoreCode", "ILoveTokens", "ImOutOfCodeIdeas2", "ISeriouslyNeedMoreCodeIdeas", "TooManyCodes", "Trails", "ImOutOfCodeIdeas", "Accessories", "Shiny", "owo", "Wings", "SummerParadise", "Challenge", "Oof", "sircfenner", "SuperGems", "GetSlicked", "NewQuests", "SandCastles", "HammieJammieDoesntSuck", "NosniyIsCool", "HammieJammieSucksxInfinity", "HammieJammieSucksx2", "HammieJammieSucks", "Catman"}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui

local MainGui = PlayerGui:WaitForChild("ScreenGui")

local LoadingFrame = MainGui:WaitForChild("LoadingFrame")
local Quality = LoadingFrame:WaitForChild("Quality")
local LowQuality = Quality:WaitForChild("LowQuality")

local StatsFrame = MainGui:WaitForChild("StatsFrame")
local Coins = StatsFrame:WaitForChild("Coins")
local Inventory = StatsFrame:WaitForChild("Inventory")
local Tokens = StatsFrame:WaitForChild("Tokens")

local TopInfoFrame = MainGui:WaitForChild("TopInfoFrame")
local Depth = TopInfoFrame:WaitForChild("Depth")

local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

--[[
-92.17129516601562, 14.48171329498291, 12.779900550842285

21.334880828857422, 14.961414337158203, 26322.658203125

29.979537963867188, 10.882247924804688, 26207.3203125
]]--

_G.Autofarm = false


local DepthThreshold = 1
local CapacityThreshold = 500


function GetRemote()
	local Data = getsenv(MainGui.ClientScript).displayCurrent
	local Values = getupvalue(Data, 8)
	return Values["RemoteEvent"]
end

function GetPlatform()
	if not game.Workspace:FindFirstChild("Platform") then
		local Platform = Instance.new("Part", game.Workspace)
		Platform.Anchored = true
		Platform.Name = "Platform"
		Platform.Size = Vector3.new(10, 0.5, 10)
		Platform.Transparency = 1
	end
	
	return game.Workspace.Platform
end

function GetCurrentDepth()
	local DepthString = string.match(Depth.Text, "%d+")
	local DepthNumber = tonumber(DepthString)
	
	return DepthNumber
end

function GetCurrentCapacity()
	local WithoutCommas = string.gsub(Inventory.Amount.Text, ",", "")
	local BlocksInBag = string.match(WithoutCommas, "%d+")
	local BlocksInBagNumber = tonumber(BlocksInBag)
	
	return BlocksInBagNumber
end

function TpPlatform(HumanoidRootPart: BasePart)
	if Platform ~= nil then
		Platform.Position = HumanoidRootPart.Position - Vector3.new(0, 4, 0)
	end
end

function IsAtLavaSpawn(HumanoidRootPart: BasePart)
	local HRPPos = HumanoidRootPart.Position
	
	return 
		(HRPPos.X >= 0 and HRPPos.X <= 50) and
		(HRPPos.Z >= 26000 and HRPPos.Z <= 26500)
end

function MoveToMine(HumanoidRootPart: BasePart)
	local Tween = TweenService:Create(
		HumanoidRootPart,
		TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false),
		{CFrame = CFrame.new(Vector3.new(29.979537963867188, 10.882247924804688, 26207.3203125))}
	)
	
	Tween:Play(); Tween.Completed:Wait()
end

local SavedPosition = Vector3.new()
local Remote = GetRemote()

function SellBlocks(HumanoidRootPart: BasePart)
	local HRPPos = HumanoidRootPart.Position
	
	if 
		(HRPPos.Z >= 26178 and HRPPos.Z <= 26232) and 
		(HRPPos.X >= 5 and HRPPos.X <= 61) then
		SavedPosition = HRPPos
	end
	
	HumanoidRootPart.CFrame = CFrame.new(Vector3.new(57.55067443847656, 14.810218811035156, 26365.021484375))
	Remote:FireServer("SellItems", {{}})
	
	HumanoidRootPart.CFrame = CFrame.new(SavedPosition)
end




while Quality.Visible == false do RunService.RenderStepped:Wait() end

for _, Connection in pairs(getconnections(LowQuality.MouseButton1Down)) do
	Connection:Fire()
end

while table.find({Coins.Amount.Text, Inventory.Amount.Text, Tokens.Amount.Text}, "Loading...") do
	RunService.RenderStepped:Wait()
end

function MiningLoop()
	local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
	local Humanoid = Character:WaitForChild("Humanoid")

	if not Platform then 
		RunService:UnbindFromRenderStep("Platform")
		Platform = GetPlatform() 
		RunService:BindToRenderStep("Platform", 301, function() TpPlatform(HumanoidRootPart) end)
	end

	Platform.CanCollide = true

	Remote:FireServer("MoveTo", {{"LavaSpawn"}})

	while IsAtLavaSpawn(HumanoidRootPart) == false do RunService.RenderStepped:Wait() end

	MoveToMine(HumanoidRootPart)

	Platform.CanCollide = false

	while GetCurrentDepth() < DepthThreshold and HumanoidRootPart and RunService.RenderStepped:Wait() do
		local min = HumanoidRootPart.Position + Vector3.new(-1,-10,-1)
		local max = HumanoidRootPart.Position + Vector3.new(1,0,1)
		local region = Region3.new(min, max)
		local parts = workspace:FindPartsInRegion3WithWhiteList(region, {game.Workspace.Blocks}, 5)

		for _, CurrentBlock in pairs(parts) do
			Remote:FireServer("MineBlock",{{CurrentBlock.Parent}})
			RunService.RenderStepped:Wait()
		end

		if GetCurrentCapacity() > CapacityThreshold then SellBlocks(HumanoidRootPart) end
	end
end

MiningLoop()

Humanoid:GetPropertyChangedSignal("Health"):Connect(function()
	if Humanoid.Health <= 0 then
		Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
		Humanoid = Character:WaitForChild("Humanoid")
		
		MiningLoop()
	end
end)


--[[
4.9974188804626465, 12.383817672729492, 26232.9296875 - left bottom
4.922764778137207, 12.383817672729492, 26178.345703125 - left upper
60.422000885009766, 12.383818626403809, 26178.615234375 - right upper
59.43182373046875, 12.383817672729492, 26232.974609375 - left bottom
]]
