local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Parmesan Hub - Arm Wrestling Simulator [Beta]", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest", IntroEnabled = false})

local Player = nil
for i,v in pairs(workspace:GetChildren()) do
	if v.Name == game.Players.LocalPlayer.Name then
		Player = v
	end
end

local function SendWebhook(webhook)
	local url = webhook
	local data = {
	   ["content"] = "",
	   ["embeds"] = {{
	   		["title"] = "Arm Wrestling Simulator",
	   		["description"] = (os.date("%A, %B %d, %X", os.time())),
	   		["type"] = "rich",
	   		["color"] = tonumber(0xE69138),
	   		["fields"] = {
	   			{
	   				["name"] = "",
	   				["value"] = 
	   				"Normal World"..
	   				"\n\nWins: "..game.Players.LocalPlayer.PlayerGui.GameUI.Currency.Rebirths.Amount.Text..
	   				"\nBicep Power: "..game.Players.LocalPlayer.PlayerGui.GameUI.Currency.Bicep.Amount.Text..
	   				"\nHand Strength: "..game.Players.LocalPlayer.PlayerGui.GameUI.Currency.Hand.Amount.Text..
	   				"\nKnuckle Strength: "..game.Players.LocalPlayer.PlayerGui.GameUI.Currency.Speed.Amount.Text..
	   				"\n\nEvent World"..
	   				"\n\nWins: "..game.Players.LocalPlayer.PlayerGui.GameUI.LimitedEventCurrency.Rebirths.Amount.Text..
	   				"\nBicep Power: "..game.Players.LocalPlayer.PlayerGui.GameUI.LimitedEventCurrency.Bicep.Amount.Text..
	   				"\nHand Strength: "..game.Players.LocalPlayer.PlayerGui.GameUI.LimitedEventCurrency.Hand.Amount.Text..
	   				"\nKnuckle Strength: "..game.Players.LocalPlayer.PlayerGui.GameUI.LimitedEventCurrency.Speed.Amount.Text..
	   				"\n\nEvent Eggs: "..(game.Players.LocalPlayer.PlayerGui.GameUI.Menus.Event.Amount.Text.gsub(game.Players.LocalPlayer.PlayerGui.GameUI.Menus.Event.Amount.Text, "You have: x", "", 2)),
	   				["inline"] = true
	   			}
	   		}
	   	}}
	}
	local newdata = game:GetService("HttpService"):JSONEncode(data)
	
	local headers = {
	   ["content-type"] = "application/json"
	}
	request = http_request or request or HttpPost or syn.request
	local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
	request(abcdef)
end
	
getgenv().temp = nil
getgenv().temp2 = nil

getgenv().AutoFarmStrength = false
getgenv().StrengthWorld = "1"
getgenv().PillowType = "Tier1"

getgenv().AutoFarmStrengthPos = CFrame.new(-10225.4, 5.3, 114.8)
getgenv().AutoFarmStrengthPos1 = CFrame.new(-10225.4, 5.3, 114.8)
getgenv().AutoFarmStrengthPos2 = CFrame.new(-10225.4, 5.3, 114.8)
getgenv().AutoFarmStrengthPos3 = CFrame.new(-10225.4, 5.3, 114.8)
getgenv().AutoFarmStrengthPos4 = CFrame.new(-10225.4, 5.3, 114.8)
getgenv().AutoFarmStrengthPos5 = CFrame.new(-10225.4, 5.3, 114.8)
getgenv().AutoFarmStrengthPos6 = CFrame.new(-10225.4, 5.3, 114.8)
getgenv().AutoFarmStrengthPosVIP = CFrame.new(-10225.4, 5.3, 114.8)

getgenv().AutoFarmFights = false
getgenv().FightsWorld = "1"
getgenv().OpponentType = "Bully"
getgenv().OpponentModel = workspace.Zones["1"].Interactables.ArmWrestling.NPC.Bully.Table

getgenv().AutoFarmBarbells = false
getgenv().BarbellWorld = 1
getgenv().BarbellType1 = "Tier1"
getgenv().BarbellType2 = "Tier2"
getgenv().BarbellType3 = "Tier3"
getgenv().CurrentBarbell = "Tier1"

getgenv().AutoFarmDumbells = false
getgenv().DumbellsWeight = "1Kg"

getgenv().AutoFarmGrips = false
getgenv().GripsWeight = "1Kg"

getgenv().AutoOpenEgg = false
getgenv().AutoOpenEventEgg = false
getgenv().AutoDeleteEgg = false
getgenv().CurrentEgg = "Earth"
getgenv().DeleteList = {}

getgenv().AutoGoldify = false
getgenv().GoldifyList = {}
getgenv().GoldifyNumber = 1

getgenv().WorldNum = nil
getgenv().WorldStr = nil

getgenv().SendWebhooks = false
getgenv().WebhookTime = 1
local WebhookURL = ""

getgenv().AutoRebirth = false
getgenv().AutoSuperRebirth = false
getgenv().AutoSpin = false
getgenv().AutoClaimDaily = false
getgenv().AutoClaimGifts = false

local PlayerTab = Window:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local PlayerSection = PlayerTab:AddSection({
	Name = "Player"
})

PlayerTab:AddTextbox({
	Name = "Walk Speed",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		WalkSpeed = Value
		for i,v in pairs(workspace:GetDescendants()) do
			if v.Name == game.Players.LocalPlayer.Name and v:FindFirstChild("Humanoid") then
				while true do
					v.Humanoid.WalkSpeed = WalkSpeed
					wait(0.1)
				end
			end
		end
	end	  
})

PlayerTab:AddTextbox({
	Name = "Jump Power",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		JumpPower = Value
		for i,v in pairs(workspace:GetDescendants()) do
			if v.Name == game.Players.LocalPlayer.Name and v:FindFirstChild("Humanoid") then
				while true do
					v.Humanoid.JumpPower = JumpPower
					wait(0.1)
				end
			end
		end
	end	  
})

PlayerTab:AddToggle({
	Name = "Anti AFK",
	Default = false,
	Callback = function(Value)
		AntiAFK = Value
		spawn (function()
			while AntiAFK == true and task.wait(0.5) do
				local bb=game:service'VirtualUser'
				game:service'Players'.LocalPlayer.Idled:connect(function()
					bb:CaptureController()bb:ClickButton2(Vector2.new())
				end)
			end
		end)
	end    
})

PlayerTab:AddButton({
	Name = "Infinite Jump",
	Callback = function()
        spawn (function()
			local Player = nil
			for i,v in pairs(workspace:GetDescendants()) do
				if v.Name == game.Players.LocalPlayer.Name and v:FindFirstChild("Humanoid") then
					Player = v
				end
			end
			
			local UIS = game:GetService'UserInputService'
			 
			function Action(Object, Function) if Object ~= nil then Function(Object); end end
			 
			UIS.InputBegan:connect(function(UserInput)
			    if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
			        Action(Player.Humanoid, function(self)
			            if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
			                Action(self.Parent.HumanoidRootPart, function(self)
			                    self.Velocity = Player.Humanoid.MoveDirection * Vector3.new(40, 1, 40) + Vector3.new(0, 65, 0);
			                end)
			            end
			        end)
			    end
			end)
		end)
  	end    
})


local AutofarmTab = Window:MakeTab({
	Name = "Auto Farm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local AutofarmSection = AutofarmTab:AddSection({
	Name = "Auto Farm - World"
})

AutofarmTab:AddDropdown({
	Name = "World",
	Default = "",
	Options = {"Greek Event", "School", "Gym", "Beach", "Bunker", "Dino World", "Void World"},
	Callback = function(Value)
		if Value == "School" then
			WorldStr = "1"
			WorldNum = 1
			
			BarbellType1 = "Tier1"
			BarbellType2 = "Tier2"
			BarbellType3 = "Tier3"
			
			AutoFarmStrengthPos1 = CFrame.new(-10225.4, 5.3, 114.8)
			AutoFarmStrengthPos2 = CFrame.new(-10225, 5.3, 123.7)
			AutoFarmStrengthPos3 = CFrame.new(-10227.2, 5.33161, 129.463)
			AutoFarmStrengthPos4 = CFrame.new(-10234.8, 5.33161, 129.457)
			AutoFarmStrengthPos5 = CFrame.new(-10244.4, 5.33161, 129.775)
			AutoFarmStrengthPos6 = CFrame.new(-10253.6, 5.33161, 129.888)
			AutoFarmStrengthPosVIP = CFrame.new(-10261.8, 5.23332, 128.767)
			
		elseif Value == "Gym" then
			WorldStr = "2"
			WorldNum = 2
			
			BarbellType1 = "Tier4"
			BarbellType2 = "Tier5"
			BarbellType3 = "Tier6"
			
			AutoFarmStrengthPos1 = CFrame.new(-10332.1, 5.23332, 620.706)
			AutoFarmStrengthPos2 = CFrame.new(-10332, 5.23332, 612.653)
			AutoFarmStrengthPos3 = CFrame.new(-10331.9, 5.23332, 604.453)
			AutoFarmStrengthPos4 = CFrame.new(-10331.1, 5.23332, 594.597)
			AutoFarmStrengthPos5 = CFrame.new(-10330.9, 5.23332, 584.46)
			AutoFarmStrengthPos6 = CFrame.new(-10330.8, 5.23332, 574.862)
			AutoFarmStrengthPosVIP = CFrame.new(-10331.1, 5.23332, 565.853)
			
		elseif Value == "Beach" then
			WorldStr = "3"
			WorldNum = 3
			
			BarbellType1 = "Tier7"
			BarbellType2 = "Tier8"
			BarbellType3 = "Tier9"
			
			AutoFarmStrengthPos1 = CFrame.new(11559.4, 9.96352, 126.04)
			AutoFarmStrengthPos2 = CFrame.new(11558.7, 9.96352, 117.901)
			AutoFarmStrengthPos3 = CFrame.new(11558.1, 9.96352, 110.002)
			AutoFarmStrengthPos4 = CFrame.new(11558.1, 9.96352, 100.705)
			AutoFarmStrengthPos5 = CFrame.new(11557.1, 9.96352, 91.3552)
			AutoFarmStrengthPos6 = CFrame.new(11556.1, 9.96352, 82.3152)
			AutoFarmStrengthPosVIP = CFrame.new(11555.5, 9.96352, 73.2873)
			
		elseif Value == "Bunker" then
			WorldStr = "4"
			WorldNum = 4
			
			BarbellType1 = "Tier10"
			BarbellType2 = "Tier11"
			BarbellType3 = "Tier12"
			
			AutoFarmStrengthPos1 = CFrame.new(-10359.8, 6.32156, -888.622)
			AutoFarmStrengthPos2 = CFrame.new(-10353.7, 6.32156, -893.774)
			AutoFarmStrengthPos3 = CFrame.new(-10347.5, 6.32156, -899.074)
			AutoFarmStrengthPos4 = CFrame.new(-10341.1, 6.32155, -904.37)
			AutoFarmStrengthPos5 = CFrame.new(-10341.1, 6.32155, -904.37)
			AutoFarmStrengthPos6 = CFrame.new(-10341.1, 6.32155, -904.37)
			AutoFarmStrengthPosVIP = CFrame.new(-10334.8, 6.32156, -909.703)
			
		elseif Value == "Dino World" then
			WorldStr = "5"
			WorldNum = 5
			
			BarbellType1 = nil
			BarbellType2 = nil
			BarbellType3 = nil
			
			AutoFarmStrengthPos1 = nil
			AutoFarmStrengthPos2 = nil
			AutoFarmStrengthPos3 = nil
			AutoFarmStrengthPos4 = nil
			AutoFarmStrengthPos5 = nil
			AutoFarmStrengthPos6 = nil
			AutoFarmStrengthPosVIP = nil
			
		elseif Value == "Void World" then
			WorldStr = "6"
			WorldNum = 6
			
			BarbellType1 = "Tier16"
			BarbellType2 = "Tier17"
			BarbellType3 = "Tier18"
			
			AutoFarmStrengthPos1 = CFrame.new(-9795.52, -15.2811, -4544.77)
			AutoFarmStrengthPos2 = CFrame.new(-9800.55, -15.2809, -4550.9)
			AutoFarmStrengthPos3 = CFrame.new(-9803.91, -15.2808, -4557.07)
			AutoFarmStrengthPos4 = CFrame.new(-9807.32, -15.2812, -4563.79)
			AutoFarmStrengthPos5 = CFrame.new(-9810.84, -15.2809, -4570.65)
			AutoFarmStrengthPos6 = CFrame.new(-9814.96, -15.2811, -4578.65)
			AutoFarmStrengthPosVIP = CFrame.new(-9818.92, -15.2809, -4586.42)
			
		elseif Value == "Greek Event" then
			
			WorldStr = "GreekEvent"
			WorldNum = "GreekEvent"
			
			BarbellType1 = "Tier19"
			BarbellType2 = "Tier20"
			BarbellType3 = "Tier21"
			
			AutoFarmStrengthPos1 = CFrame.new(-10071.1, 47.2505, -2320.13)
			AutoFarmStrengthPos2 = CFrame.new(-10071.3, 47.2505, -2312.78)
			AutoFarmStrengthPos3 = CFrame.new(-10071.9, 47.2505, -2310.03)
			AutoFarmStrengthPos4 = CFrame.new(-10081, 47.2505, -2310.72)
			AutoFarmStrengthPos5 = CFrame.new(-10091.2, 47.2506, -2310.64)
			AutoFarmStrengthPos6 = CFrame.new(-10100.4, 47.2506, -2310.57)
			AutoFarmStrengthPosVIP = CFrame.new(-10109.1, 47.2505, -2310.45)
			
		end
		
		if temp == "Tier 1" then
			PillowType = "Tier1"
			AutoFarmStrengthPos = AutoFarmStrengthPos1
		elseif temp == "Tier 2" then
			PillowType = "Tier2"
			AutoFarmStrengthPos = AutoFarmStrengthPos2
		elseif temp == "Tier 3" then
			PillowType = "Tier3"
			AutoFarmStrengthPos = AutoFarmStrengthPos3
		elseif temp == "Tier 4" then
			PillowType = "Tier4"
			AutoFarmStrengthPos = AutoFarmStrengthPos4
		elseif temp == "Tier 5" then
			PillowType = "Tier5"
			AutoFarmStrengthPos = AutoFarmStrengthPos5
		elseif temp == "Tier 6" then
			PillowType = "Tier6"
			AutoFarmStrengthPos = AutoFarmStrengthPos6
		elseif Value == "VIP" then
			PillowType = "VIP"
			AutoFarmStrengthPos = AutoFarmStrengthPosVIP
		end
		
		if temp2 == "Tier 1" then
			CurrentBarbell = BarbellType1
		elseif temp2 == "Tier 2" then
			CurrentBarbell = BarbellType2
		elseif temp2 == "Tier 3" then
			CurrentBarbell = BarbellType3
		end
	end    
})

local AutofarmSection = AutofarmTab:AddSection({
	Name = "Auto Farm Punching Bags"
})

AutofarmTab:AddToggle({
	Name = "Auto Farm Punching Bags",
	Default = false,
	Callback = function(Value)
		AutoFarmStrength = Value
		spawn (function()
			while AutoFarmStrength == true and task.wait() do
				Player.HumanoidRootPart.CFrame = AutoFarmStrengthPos
				game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.PunchBagService.RE.onGiveStats:FireServer(WorldStr, PillowType)
			end
		end)
	end    
})

AutofarmTab:AddDropdown({
	Name = "Punching Bag Tier",
	Default = "Tier 1",
	Options = {"Tier 1", "Tier 2", "Tier 3", "Tier 4", "Tier 5", "Tier 6", "VIP"},
	Callback = function(Value)
		temp = Value
		if Value == "Tier 1" then
			PillowType = "Tier1"
			AutoFarmStrengthPos = AutoFarmStrengthPos1
		elseif Value == "Tier 2" then
			PillowType = "Tier2"
			AutoFarmStrengthPos = AutoFarmStrengthPos2
		elseif Value == "Tier 3" then
			PillowType = "Tier3"
			AutoFarmStrengthPos = AutoFarmStrengthPos3
		elseif Value == "Tier 4" then
			PillowType = "Tier4"
			AutoFarmStrengthPos = AutoFarmStrengthPos4
		elseif Value == "Tier 5" then
			PillowType = "Tier5"
			AutoFarmStrengthPos = AutoFarmStrengthPos5
		elseif Value == "Tier 6" then
			PillowType = "Tier6"
			AutoFarmStrengthPos = AutoFarmStrengthPos6
		elseif Value == "VIP" then
			PillowType = "VIP"
			AutoFarmStrengthPos = AutoFarmStrengthPosVIP
		end
	end    
})

local AutofarmSection = AutofarmTab:AddSection({
	Name = "Auto Farm Barbells"
})

AutofarmTab:AddToggle({
	Name = "Auto Farm Barbells",
	Default = false,
	Callback = function(Value)
		AutoFarmBarbells = Value
		spawn (function()
			while AutoFarmBarbells == true and task.wait(0.75) do
				game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ToolService.RE.onEquipRequest:FireServer(WorldNum, "Barbells", CurrentBarbell)
				game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ToolService.RE.onClick:FireServer()
			end
		end)
	end    
})

AutofarmTab:AddDropdown({
	Name = "Barbell Tier",
	Default = "Tier 1",
	Options = {"Tier 1", "Tier 2", "Tier 3"},
	Callback = function(Value)
		temp2 = Value
		if Value == "Tier 1" then
			CurrentBarbell = BarbellType1
		elseif Value == "Tier 2" then
			CurrentBarbell = BarbellType2
		elseif Value == "Tier 3" then
			CurrentBarbell = BarbellType3
		end
	end    
})

local AutofarmSection = AutofarmTab:AddSection({
	Name = "Auto Farm Dumbells"
})

AutofarmTab:AddToggle({
	Name = "Auto Farm Dumbells",
	Default = false,
	Callback = function(Value)
		AutoFarmDumbells = Value
		spawn (function()
			while AutoFarmDumbells == true and task.wait(0.75) do
				game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ToolService.RE.onGuiEquipRequest:FireServer(WorldStr, "Dumbells", DumbellsWeight)
				game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ToolService.RE.onClick:FireServer()
			end
		end)
	end    
})

AutofarmTab:AddDropdown({
	Name = "Dumbells Weight",
	Default = "1 Kg",
	Options = {"1 Kg", "2 Kg", "3 Kg", "4 Kg", "5 Kg", "10 Kg", "15 Kg", "20 Kg", "25 Kg", "50 Kg", "100 Kg", "250 Kg", "300 Kg", "400 Kg", "500 Kg", "650 Kg", "800 Kg", "1000 Kg", "1500 Kg", "2000 Kg", "2500 Kg", "3000 Kg", "3500 Kg", "4000 Kg", "5000 Kg", "6000 Kg", "7500 Kg", "10000 Kg", "12500 Kg", "15000 Kg", "20000 Kg", "25000 Kg", "30000 Kg", "35000 Kg", "40000 Kg", "45000 Kg", "50000 Kg", "60000 Kg", "70000 Kg", "80000 Kg", "90000 Kg", "100000 Kg", "125000 Kg", "150000 Kg", "175000 Kg", "200000 Kg", "250000 Kg", "300000 Kg", "350000 Kg", "375000 Kg", "400000 Kg", "425000 Kg", "450000 Kg", "475000 Kg", "500000 Kg", "525000 Kg", "550000 Kg", "575000 Kg", "600000 Kg", "625000 Kg"},
	Callback = function(Value)
		DumbellsWeight = string.gsub(Value, " ", "")
	end    
})

local AutofarmSection = AutofarmTab:AddSection({
	Name = "Auto Farm Grips"
})

AutofarmTab:AddToggle({
	Name = "Auto Farm Grips",
	Default = false,
	Callback = function(Value)
		AutoFarmGrips = Value
		spawn (function()
			while AutoFarmGrips == true and task.wait(0.75) do
				print(DumbellsWeight)
				game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ToolService.RE.onGuiEquipRequest:FireServer(WorldStr, "Grips", GripsWeight)
				game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ToolService.RE.onClick:FireServer()
			end
		end)
	end    
})

AutofarmTab:AddDropdown({
	Name = "Grips Weight",
	Default = "1 Kg",
	Options = {"1 Kg", "2 Kg", "3 Kg", "4 Kg", "5 Kg", "10 Kg", "15 Kg", "20 Kg", "25 Kg", "50 Kg", "100 Kg", "250 Kg", "300 Kg", "400 Kg", "500 Kg", "650 Kg", "800 Kg", "1000 Kg", "1500 Kg", "2000 Kg", "2500 Kg", "3000 Kg", "3500 Kg", "4000 Kg", "5000 Kg", "6000 Kg", "7500 Kg", "10000 Kg", "12500 Kg", "15000 Kg", "20000 Kg", "25000 Kg", "30000 Kg", "35000 Kg", "40000 Kg", "45000 Kg", "50000 Kg", "60000 Kg", "70000 Kg", "80000 Kg", "90000 Kg", "100000 Kg", "125000 Kg", "150000 Kg", "175000 Kg", "200000 Kg", "250000 Kg", "300000 Kg", "350000 Kg", "375000 Kg", "400000 Kg", "425000 Kg", "450000 Kg", "475000 Kg", "500000 Kg", "525000 Kg", "550000 Kg", "575000 Kg", "600000 Kg", "625000 Kg"},
	Callback = function(Value)
		GripsWeight = string.gsub(Value, " ", "")
	end    
})

local AutofarmSection = AutofarmTab:AddSection({
	Name = "Auto Fights"
})

AutofarmTab:AddToggle({
	Name = "Auto Fights",
	Default = false,
	Callback = function(Value)
		AutoFarmFights = Value
		spawn (function()
			spawn (function()
				while AutoFarmFights == true and task.wait(0.5) do
					game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer(OpponentType, OpponentModel, FightsWorld)
				end
			end)
			spawn (function()
				while AutoFarmFights == true and task.wait() do
					game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmWrestleService.RE.onClickRequest:FireServer()
				end
			end)
		end)
	end    
})

AutofarmTab:AddDropdown({
	Name = "Opponent",
	Default = "",
	Options = {"Bully", "Teacher", "Gym Rat", "Mafia Boss", "Champion", "Scrap Trader", "Cyber Cop", "Cyber Assasin", "Ripper Doc", "Rogue AI", "Coco Nut", "Fat Pirate", "Mermaid King", "Friendly Shark", "Kraken Boss", "Hercules", "Medusa", "Kratos", "Poseidon", "Zeus"},
	Callback = function(Value)
		if Value == "Bully" then
			OpponentType = "Bully"
			FightsWorld = "1"
			OpponentModel = workspace.Zones["1"].Interactables.ArmWrestling.NPC.Bully.Table
		elseif Value == "Teacher" then
			OpponentType = "Teacher"
			FightsWorld = "1"
			OpponentModel = workspace.Zones["1"].Interactables.ArmWrestling.NPC.Teacher.Table
		elseif Value == "Gym Rat" then
			OpponentType = "GymRat"
			FightsWorld = "1"
			OpponentModel = workspace.Zones["1"].Interactables.ArmWrestling.NPC.GymRat.Table
		elseif Value == "Mafia Boss" then
			OpponentType = "MafiaBoss"
			FightsWorld = "1"
			OpponentModel = workspace.Zones["1"].Interactables.ArmWrestling.NPC.MafiaBoss.Table
		elseif Value == "Champion" then
			OpponentType = "Champion"
			FightsWorld = "1"
			OpponentModel = workspace.Zones["1"].Interactables.ArmWrestling.NPC.Champion.Table
		
		elseif Value == "Scrap Trader" then
			OpponentType = "ScrapTrader"
			FightsWorld = "2"
			OpponentModel = workspace.Zones["2"].Interactables.ArmWrestling.NPC.ScrapTrader.Table
		elseif Value == "Cyber Cop" then
			OpponentType = "CyberCop"
			FightsWorld = "2"
			OpponentModel = workspace.Zones["2"].Interactables.ArmWrestling.NPC.CyberCop.Table
		elseif Value == "Cyber Assasin" then
			OpponentType = "SlicerAssassin"
			FightsWorld = "2"
			OpponentModel = workspace.Zones["2"].Interactables.ArmWrestling.NPC.SlicerAssassin.Table
		elseif Value == "Ripper Doc" then
			OpponentType = "RipperDoc"
			FightsWorld = "2"
			OpponentModel = workspace.Zones["2"].Interactables.ArmWrestling.NPC.RipperDoc.Table
		elseif Value == "Rogue AI" then
			OpponentType = "RogueAi"
			FightsWorld = "2"
			OpponentModel = workspace.Zones["2"].Interactables.ArmWrestling.NPC.RogueAi.Table
		
		elseif Value == "Coco Nut" then
			OpponentType = "CocoNut"
			FightsWorld = "3"
			OpponentModel = workspace.Zones["3"].Interactables.ArmWrestling.NPC.CocoNut.Table
		elseif Value == "Fat Pirate" then
			OpponentType = "FatPirate"
			FightsWorld = "3"
			OpponentModel = workspace.Zones["3"].Interactables.ArmWrestling.NPC.FatPirate.Table
		elseif Value == "Mermaid King" then
			OpponentType = "MermaidKing"
			FightsWorld = "3"
			OpponentModel = workspace.Zones["3"].Interactables.ArmWrestling.NPC.MermaidKing.Table
		elseif Value == "Friendly Shark" then
			OpponentType = "FriendlyShark"
			FightsWorld = "3"
			OpponentModel = workspace.Zones["3"].Interactables.ArmWrestling.NPC.FriendlyShark.Table
		elseif Value == "Kraken Boss" then
			OpponentType = "KrakenBoss"
			FightsWorld = "3"
			OpponentModel = workspace.Zones["3"].Interactables.ArmWrestling.NPC.KrakenBoss.Table
		
		elseif Value == "Barbarian" then
			OpponentType = "Barbarian"
			FightsWorld = "4"
			OpponentModel = workspace.Zones["4"].Interactables.ArmWrestling.NPC.Barbarian.Table
		elseif Value == "Hazmat" then
			OpponentType = "Hazmat"
			FightsWorld = "4"
			OpponentModel = workspace.Zones["4"].Interactables.ArmWrestling.NPC.Hazmat.Table
		elseif Value == "Enforcer" then
			OpponentType = "Enforcer"
			FightsWorld = "4"
			OpponentModel = workspace.Zones["4"].Interactables.ArmWrestling.NPC.Enforcer.Table
		elseif Value == "Bulk" then
			OpponentType = "Bulk"
			FightsWorld = "4"
			OpponentModel = workspace.Zones["4"].Interactables.ArmWrestling.NPC.Bulk.Table
		elseif Value == "Mutant King" then
			OpponentType = "MutantKing"
			FightsWorld = "4"
			OpponentModel = workspace.Zones["4"].Interactables.ArmWrestling.NPC.MutantKing.Table
		
		elseif Value == "Primal" then
			OpponentType = "Primal"
			FightsWorld = "5"
			OpponentModel = workspace.Zones["5"].Interactables.ArmWrestling.NPC.Primal.Table
		elseif Value == "Dino" then
			OpponentType = "Dino"
			FightsWorld = "5"
			OpponentModel = workspace.Zones["5"].Interactables.ArmWrestling.NPC.Dino.Table
		elseif Value == "Archeologist" then
			OpponentType = "Archeologist"
			FightsWorld = "5"
			OpponentModel = workspace.Zones["5"].Interactables.ArmWrestling.NPC.Archeologist.Table
		elseif Value == "Tribe Leader" then
			OpponentType = "TribeLeader"
			FightsWorld = "5"
			OpponentModel = workspace.Zones["5"].Interactables.ArmWrestling.NPC.TribeLeader.Table
		elseif Value == "Mammoth" then
			OpponentType = "Mammoth"
			FightsWorld = "5"
			OpponentModel = workspace.Zones["5"].Interactables.ArmWrestling.NPC.Mammoth.Table
		
		elseif Value == "Orinthian" then
			OpponentType = "Orinthian"
			FightsWorld = "6"
			OpponentModel = workspace.Zones["6"].Interactables.ArmWrestling.NPC.Orinthian.Table
		elseif Value == "Spaceboy" then
			OpponentType = "Spaceboy"
			FightsWorld = "6"
			OpponentModel = workspace.Zones["6"].Interactables.ArmWrestling.NPC.Spaceboy.Table
		elseif Value == "Demon Slayer" then
			OpponentType = "DemonSlayer"
			FightsWorld = "6"
			OpponentModel = workspace.Zones["6"].Interactables.ArmWrestling.NPC.DemonSlayer.Table
		elseif Value == "Ud'zal" then
			OpponentType = "Udzal"
			FightsWorld = "6"
			OpponentModel = workspace.Zones["6"].Interactables.ArmWrestling.NPC.Udzal.Table
		elseif Value == "Cybernetic" then
			OpponentType = "Cybernetic"
			FightsWorld = "6"
			OpponentModel = workspace.Zones["6"].Interactables.ArmWrestling.NPC.Cybernetic.Table
		
		elseif Value == "Hercules" then
			OpponentType = "Hercules"
			FightsWorld = "GreekEvent"
			OpponentModel = workspace.Zones.GreekEvent.Interactables.ArmWrestling.NPC.Hercules.Table
		elseif Value == "Medusa" then
			OpponentType = "Medusa"
			FightsWorld = "GreekEvent"
			OpponentModel = workspace.Zones.GreekEvent.Interactables.ArmWrestling.NPC.Medusa.Table
		elseif Value == "Kratos" then
			OpponentType = "Kratos"
			FightsWorld = "GreekEvent"
			OpponentModel = workspace.Zones.GreekEvent.Interactables.ArmWrestling.NPC.Kratos.Table
		elseif Value == "Poseidon" then
			OpponentType = "Poseidon"
			FightsWorld = "GreekEvent"
			OpponentModel = workspace.Zones.GreekEvent.Interactables.ArmWrestling.NPC.Poseidon.Table
		elseif Value == "Zeus" then
			OpponentType = "Zeus"
			FightsWorld = "GreekEvent"
			OpponentModel = workspace.Zones.GreekEvent.Interactables.ArmWrestling.NPC.Zeus.Table
		end
	end    
})

local EggTab = Window:MakeTab({
	Name = "Auto Eggs",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local EggSection = EggTab:AddSection({
	Name = "Auto Open Eggs"
})

EggTab:AddDropdown({
	Name = "Egg",
	Default = "",
	Options = {"Atom", "Blackhole", "Burning", "Cactus", "Crab", "Crystal", "DinoFossil", "Earth", "Event", "EventOld", "Gem", "GoldenOther", "Greek", "GreekMonster", "Herbivore", "Ice", "Icy", "Inferno", "Iridescent", "Jellyfish", "Lava", "Limited", "Molten", "Moon", "Mutant", "Mystic", "Nebula", "Neo", "Nuclear", "Pterodactyl", "Roman", "Rust", "Sand", "SeasonEgg", "Shark", "Snowman", "Solar", "Spartan", "Star", "Steampunk", "Stone", "Sun", "TRex", "Void", "Warped", "Widget", "Wormhole"},
	Callback = function(Value)
		CurrentEgg = Value
	end    
})

EggTab:AddToggle({
	Name = "Auto Open Eggs",
	Default = false,
	Callback = function(Value)
		AutoOpenEgg = Value
		spawn (function()
			while AutoOpenEgg == true and task.wait(0.3) do
				game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.EggService.RF.purchaseEgg:InvokeServer(CurrentEgg)
			end
		end)
	end    
})

local EggSection = EggTab:AddSection({
	Name = "Auto Delete Pets"
})

EggTab:AddToggle({
	Name = "Auto Delete Pets",
	Default = false,
	Callback = function(Value)
		AutoDeleteEgg = Value
		spawn (function()
			while AutoDeleteEgg == true and task.wait(1) do
				for i,v in pairs(game:GetService("Players").RawMaasdam.PlayerGui.GameUI.Menus.PetInventory.Container.ScrollingFrame.Pets:GetChildren()) do
					if v:FindFirstChild("Toggle") then
						local CurrentPet = v.Toggle.Stat.Text
						local Name = v.Name
						for count = 1, #DeleteList, 1 do
							if CurrentPet == DeleteList[count] then
								game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.PetService.RF.delete:InvokeServer(Name)
							end
						end
					end
				end
			end
		end)
	end
})

local List = EggTab:AddParagraph("Delete List:","")
local PetsList = ""

EggTab:AddTextbox({
	Name = "Add Pet To Delete List",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		spawn (function()
			PetsList = ""
			DeleteList[#DeleteList + 1] = Value
			for count = 1, #DeleteList, 1 do
				PetsList = PetsList.."\n"..DeleteList[count]
			end
			List:Set(PetsList)
		end)
	end	  
})

EggTab:AddTextbox({
	Name = "Remove Pet From Delete List",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		spawn(function()
			for count = 1, #DeleteList, 1 do
				if DeleteList[count] == Value then
					table.remove(DeleteList, count)
				end
			end
			PetsList = ""
			for count = 1, #DeleteList, 1 do
				PetsList = PetsList.."\n"..DeleteList[count]
			end
			List:Set(PetsList)
		end)
	end	  
})

local EventTab = Window:MakeTab({
	Name = "Event",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local EggSection = EventTab:AddSection({
	Name = "Auto Open Event Eggs"
})

EventTab:AddToggle({
	Name = "Auto Open Event Eggs",
	Default = false,
	Callback = function(Value)
		AutoOpenEventEgg = Value
		spawn (function()
			while AutoOpenEventEgg == true and task.wait(0.5) do
				game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.EventService.RF.ClaimEgg:InvokeServer()
			end
		end)
	end
})

local TeleportTab = Window:MakeTab({
	Name = "Teleport",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local TeleportSection = TeleportTab:AddSection({
	Name = "Teleport"
})

TeleportTab:AddButton({
	Name = "Greek Event",
	Callback = function()
      	game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ZoneService.RE.teleport:FireServer(workspace.Zones.GreekEvent.Interactables.Teleports.Locations.Greek)
  	end    
})

TeleportTab:AddButton({
	Name = "School",
	Callback = function()
		game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ZoneService.RE.teleport:FireServer(workspace.Zones["1"].Interactables.Teleports.Locations.BackToSchool)
  	end    
})

TeleportTab:AddButton({
	Name = "Gym",
	Callback = function()
      	game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ZoneService.RE.teleport:FireServer(workspace.Zones["2"].Interactables.Teleports.Locations.Futuristic)
  	end    
})

TeleportTab:AddButton({
	Name = "Beach",
	Callback = function()
      	game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ZoneService.RE.teleport:FireServer(workspace.Zones["3"].Interactables.Teleports.Locations.Beach)
  	end    
})

TeleportTab:AddButton({
	Name = "Bunker",
	Callback = function()
      	game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ZoneService.RE.teleport:FireServer(workspace.Zones["4"].Interactables.Teleports.Locations.NuclearBunker)
  	end    
})

TeleportTab:AddButton({
	Name = "Dino World",
	Callback = function()
      	game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ZoneService.RE.teleport:FireServer(workspace.Zones["5"].Interactables.Teleports.Locations.DinoWorld)
  	end    
})

TeleportTab:AddButton({
	Name = "Void World",
	Callback = function()
      	game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ZoneService.RE.teleport:FireServer(workspace.Zones["6"].Interactables.Teleports.Locations.VoidWorld)
  	end    
})

local MiscellaneousTab = Window:MakeTab({
	Name = "Miscellaneous",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local MiscellaneousSection = MiscellaneousTab:AddSection({
	Name = "Miscellaneous"
})

MiscellaneousTab:AddToggle({
	Name = "Auto Rebirth",
	Default = false,
	Callback = function(Value)
		AutoRebirth = Value 
		spawn(function()
			while AutoRebirth == true do
				game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.RebirthService.RE.onRebirthRequest:FireServer()
				task.wait(3)
			end
		end)
	end    
})

MiscellaneousTab:AddToggle({
	Name = "Auto Super Rebirth",
	Default = false,
	Callback = function(Value)
		AutoSuperRebirth = Value 
		spawn(function()
			while AutoSuperRebirth == true do
				game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.RebirthService.RE.onSuperRebirth:FireServer()
				task.wait(3)
			end
		end)
	end    
})

MiscellaneousTab:AddToggle({
	Name = "Auto Spin",
	Default = false,
	Callback = function(Value)
		AutoSpin = Value 
		spawn(function()
			while AutoSpin == true do
				game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.SpinService.RE.onSpinRequest:FireServer()
				task.wait(0.5)
			end
		end)
	end    
})

MiscellaneousTab:AddToggle({
	Name = "Auto Claim Daily Reward",
	Default = false,
	Callback = function(Value)
		AutoClaimDaily = Value 
		spawn(function()
			while AutoClaimDaily == true do
				game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.DailyRewardService.RE.onClaimReward:FireServer()
				task.wait(0.5)
			end
		end)
	end    
})

MiscellaneousTab:AddToggle({
	Name = "Auto Claim Gifts",
	Default = false,
	Callback = function(Value)
		AutoClaimGifts = Value 
		spawn(function()
			while AutoClaimGifts == true do
				for count = 0, 12, 1 do
					game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.TimedRewardService.RE.onClaim:FireServer(count)
				end
				task.wait(0.5)
			end
		end)
	end    
})

local WebhookTab = Window:MakeTab({
	Name = "Webhooks",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local WebhookSection = WebhookTab:AddSection({
	Name = "Send a Webhook"
})

WebhookTab:AddToggle({
	Name = "Enabled",
	Default = false,
	Callback = function(Value)
		SendWebhooks = Value 
		spawn(function()
			while SendWebhooks == true and task.wait(WebhookTime) do
				SendWebhook(WebhookURL)
			end
		end)
	end    
})

WebhookTab:AddTextbox({
	Name = "Send Webhook Every (minutes)",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		WebhookTime = Value * 60
	end	  
})

WebhookTab:AddTextbox({
	Name = "Webhook URL",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		WebhookURL = Value
	end	  
})

local FeedbackTab = Window:MakeTab({
	Name = "Feedback",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

FeedbackTab:AddParagraph("Discord","Script by rawparmesan")
FeedbackTab:AddButton({
	Name = "Join a Discord Server",
	Callback = function()
		spawn (function()
			local http = game:GetService('HttpService')
			local req = http_request
			if req then
				req({
					Url = 'http://127.0.0.1:6463/rpc?v=1',
					Method = 'POST',
					Headers = {
						['Content-Type'] = 'application/json',
							Origin = 'https://discord.com'
						},
					Body = http:JSONEncode({
						cmd = 'INVITE_BROWSER',
						nonce = http:GenerateGUID(false),
						args = {code = 'bh8jcXc8YQ'}
					})
				})
			end
		end)
	end
})

FeedbackTab:AddButton({
	Name = "Copy a Discord Server Link to Clipboard",
	Callback = function()
        spawn (function()
        	setclipboard("https://discord.gg/HvuQPayGdf")
		end)
  	end    
})

local FeedbackSection = FeedbackTab:AddSection({
	Name = "Reports"
})

FeedbackTab:AddTextbox({
	Name = "Report a Script Error",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		spawn (function()
			SendReport(Value, "Script Error Report", "https://discord.com/api/webhooks/1154189838602477629/1h03p4750qFgqfoIT-ZriqAPVS-HDsqDVS8qpe5YsqXEez8TlqjE9zZVrXNT_-frJvUx")
		end)
	end	  
})

FeedbackTab:AddTextbox({
	Name = "Report a Player",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		spawn (function()
			SendReport(Value, "Player Report", "https://discord.com/api/webhooks/1154189925839818752/488RAN56wHKZSiWyPFvhd9JHlD-dpoEaBRV3GYFoaFfjuSwpwPXyuoqsT1i7Z1kY04rX")
		end)
	end	  
})

FeedbackTab:AddParagraph("Reports","If you found a script error, you will receive a reward in the form of a free key for Parmesan Hub for 1-7 days\n\nFalse messages and spam will lead to HWID ban in Parmesan Hub")
	

OrionLib:Init()

