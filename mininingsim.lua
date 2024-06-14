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

--[[
-92.17129516601562, 14.48171329498291, 12.779900550842285

21.334880828857422, 14.961414337158203, 26322.658203125

29.979537963867188, 10.882247924804688, 26207.3203125
]]--

_G.Autofarm = false

local Platform = nil

local function GetRemote()
	local Data = getsenv(MainGui.ClientScript).displayCurrent
	local Values = getupvalue(Data, 8)
	return Values["RemoteEvent"]
end

local function GetPlatform()
	if not game.Workspace:FindFirstChild("Platform") then
		local Platform = Instance.new("Part", game.Workspace)
		Platform.Anchored = true
		Platform.Name = "Platform"
		Platform.Size = Vector3.new(10, 0.5, 10)
		Platform.Transparency = 1
	end
	
	return game.Workspace.Platform
end

local function GetCurrentDepth()
	local DepthString = string.match(Depth.Text)
	local DepthNumber = tonumber(DepthString)
	
	return DepthNumber
end

local function TpPlatform(HumanoidRootPart: BasePart)
	if Platform ~= nil then
		Platform.Position = HumanoidRootPart.Position - Vector3.new(0, 4, 0)
	end
end

local function IsAtLavaSpawn(HumanoidRootPart: BasePart)
	local HRPPos = HumanoidRootPart.Position
	
	21.350021362304688, 22.326696395874023, 26322.6484375
	
	return 
		(HRPPos.X >= 0 and HRPPos.X <= 50) and
		(HRPPos.Z >= 26000 and HRPPos.Z <= 26500)
end

local function MoveToMine(HumanoidRootPart: BasePart)
	local Tween = TweenService:Create(
		HumanoidRootPart,
		TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false),
		{CFrame = CFrame.new(Vector3.new(29.979537963867188, 10.882247924804688, 26207.3203125))}
	)
	
	Tween:Play(); Tween.Completed:Wait()
end

local DepthThreshold = 240
local CapacityThreshold = 30000

local Remote = GetRemote()

while Quality.Visible == false do RunService.RenderStepped:Wait() end

for _, Connection in pairs(getconnections(LowQuality.MouseButton1Down)) do
	Connection:Fire()
end

while table.find({Coins.Amount.Text, Inventory.Amount.Text, Tokens.Amount.Text}, "Loading...") do
	RunService.RenderStepped:Wait()
end

--while _G.Autofarm == true do
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
	end
--end
