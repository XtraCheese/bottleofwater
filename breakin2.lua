local marketplaceService = game:GetService("MarketplaceService")
local isSuccessful, info = pcall(marketplaceService.GetProductInfo, marketplaceService, game.PlaceId)

local function SendReport(message, reportType, webhook)
	local url = webhook
	local data = {
	   ["content"] = "",
	   ["embeds"] = {{
	   		["title"] = reportType,
	   		["description"] = (os.date("%A, %B %d, %X", os.time())),
	   		["type"] = "rich",
	   		["fields"] = {
	   			{
	   				["name"] = game.Players.LocalPlayer.Name,
	   				["value"] = 
	   				"\nGame: "..info.Name.." ("..game.PlaceId..")"..
	   				"\n\nHardware ID: "..game:GetService("RbxAnalyticsService"):GetClientId()..
	   				"\n\nReport Message: "..message..
	   				"\n\nJoin Server: ".."game:GetService(\"TeleportService\"):TeleportToPlaceInstance("..game.PlaceId..", ".."\""..game.JobId.."\""..", "..game.Players.LocalPlayer.Name..")",
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

if game.PlaceId ~= 13864667823 then
	if game.PlaceId == 14775231477 or game.PlaceId == 13864661000 then
        local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
        local Window = OrionLib:MakeWindow({Name = "Parmesan Hub - Break In 2 (Lobby)", HidePremium = false, SaveConfig = true, ConfigFolder = "Parmesan Hub", IntroEnabled = false})
        
        local PlayerTab = Window:MakeTab({
		Name = "Player",
		Icon = "rbxassetid://4483345998",
		PremiumOnly = false
	})
	
	local Section = PlayerTab:AddSection({
		Name = "Player"
	})
	
	PlayerTab:AddSlider({
		Name = "Walk Speed",
		Min = 1,
		Max = 500,
		Default = 30,
		Color = Color3.fromRGB(127,199,255),
		Increment = 1,
		ValueName = "Walk Speed",
		Callback = function(Value)
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(Value)
		end    
	})
	
	PlayerTab:AddSlider({
		Name = "Jump Power",
		Min = 1,
		Max = 500,
		Default = game.Players.LocalPlayer.Character.Humanoid.JumpPower,
		Color = Color3.fromRGB(127,199,255),
		Increment = 1,
		ValueName = "Jump Power",
		Callback = function(Value)
			game.Players.LocalPlayer.Character.Humanoid.JumpPower = tonumber(Value)
		end    
	})
	
	PlayerTab:AddToggle({
		Name = "Noclip",
		Default = false,
		Callback = function(Value)
			Noclip = Value
			local Mouse = game.Players.LocalPlayer:GetMouse()
			getgenv().noclips = true
	    	
	    		noclips = not noclips
	    		local temp
		        temp = game:GetService("RunService").Stepped:connect(function()
			        if noclips then
			            for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			                if v:IsA("BasePart") then
			                    v.CanCollide = false
			                end
			            end
			        else
			        	temp:Disconnect()
			        	for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			                if v.Name == "LowerTorso" or v.Name == "UpperTorso" then
			                    v.CanCollide = true
			                end
			            end
			        end
				end)
			
		end    
	})
	
	PlayerTab:AddToggle({
		Name = "Infinite Jump",
		Default = false,
		Callback = function(Value)
			InfJump = Value
			local InfJumpFunc
			if InfJumpFunc then InfJumpFunc:Disconnect() end
			if InfJump == true then
				while not game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") do
					task.wait()
				end
				InfJumpFunc = game:GetService("UserInputService").JumpRequest:Connect(function()
			    	if InfJump == true then
			    		game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
			    	end
			    end)
			end
		end    
	})
        
        local LobbyTab = Window:MakeTab({
            Name = "Roles",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        })
        
        local LobbySection = LobbyTab:AddSection({
            Name = "Free Roles"
        })

        LobbyTab:AddButton({
            Name = "Hyper Role",
            Callback = function()
                game:GetService("ReplicatedStorage").RemoteEvents.MakeRole:FireServer("Lollipop", false, false)
              end    
        })

        LobbyTab:AddButton({
            Name = "Sporty Role",
            Callback = function()
                game:GetService("ReplicatedStorage").RemoteEvents.MakeRole:FireServer("Bottle", false, false)
              end    
        })
        
        LobbyTab:AddButton({
            Name = "Medic Role",
            Callback = function()
                game:GetService("ReplicatedStorage").RemoteEvents.MakeRole:FireServer("MedKit", false, false)
              end    
        })
        
        LobbyTab:AddButton({
            Name = "Protector Role",
            Callback = function()
                game:GetService("ReplicatedStorage").RemoteEvents.MakeRole:FireServer("Bat", false, false)
              end    
        })
        
        local LobbySection = LobbyTab:AddSection({
            Name = "Gamepass Roles"
        })

        LobbyTab:AddButton({
            Name = "Hacker Role",
            Callback = function()
                game:GetService("ReplicatedStorage").RemoteEvents.OutsideRole:FireServer("Phone", true, false)
              end    
        })

        LobbyTab:AddButton({
            Name = "Nerd Role",
            Callback = function()
                game:GetService("ReplicatedStorage").RemoteEvents.OutsideRole:FireServer("Book", true, false)
              end    
        })
        
	local FeedbackTab = Window:MakeTab({
		Name = "Feedback",
		Icon = "rbxassetid://4483345998",
		PremiumOnly = false
	})
	
	FeedbackTab:AddParagraph("Discord","Scripting - kiriakos777\nFounder - rawparmesan")

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
    end
else
    -- MODULE LOADER


    -- Secret Ending Enabler
    local SecretEndingTable = {
		"HatCollected",
		"MaskCollected",
		"CrowbarCollected"
    }

    -- Items
    local ItemsTable = {
		"Apple",
		"Armor",
		"Bat",
		"Battery",
		"Bloxy Cola",
		"Book",
		"Bottle",
		"Broom",
		"Chips",
		"Cookie",
		"Crowbar",
		"Golden Crowbar",
		"Diamond Crowbar",
		"Expired Bloxy Cola",
		"Gold Key",
		"Gold Pizza",
		"Golden Apple",
		"Hammer",
		"Key",
		"Ladder",
		"Lollipop",
		"Louise",
		"Med Kit",
		"Phone",
		"Pitchfork",
		"Pizza",
		"Rainbow Pizza Box",
		"Rainbow Pizza",
		"Wrench",
	}

    -- Local Modules
    local Events = game:GetService("ReplicatedStorage"):WaitForChild("Events")
	local SelectedItem = "Med Kit"
	local Damange = 5
	local namecall
	local ScriptLoaded = false
	local LocalPlayer = game:GetService("Players").LocalPlayer
	local Lighting = game:GetService("Lighting")
	local OriginalWalkspeed = LocalPlayer.Character.Humanoid.WalkSpeed
	local OriginalJumpPower = LocalPlayer.Character.Humanoid.JumpPower
	local ModifiedWalkspeed = 50
	local ModifiedJumpPower = 100
	local OriginalBrightness = Lighting.Brightness
	local OriginalFog = Lighting.FogEnd
	local OriginalShadow = Lighting.GlobalShadows
	getgenv().RemoveSlipping = false
	getgenv().SemiGodmode = false
	getgenv().WalkSpeedOn = false
	getgenv().JumpPowerOn = false
	
	
    -- Remove slipping
    local mt = getrawmetatable(game)
	local old = mt.__namecall
	setreadonly(mt, false)
	mt.__namecall = newcclosure(function(self, ...)
		local args = {
			...
		}
		if getnamecallmethod() == 'FireServer' and self.Name == 'IceSlip' and RemoveSlipping == true then
			return wait(387420489)
		end
		return old(self, unpack(args))
	end)

    -- Godmode
    namecall = hookmetamethod(game, "__namecall", function(self, ...)
		local args = {
			...
		}
		if getnamecallmethod() == 'FireServer' and self.Name == 'Energy' then
			if SemiGodmode == true then
				if args[1] < 0 then
					args[1] = 0
				end
			else
				args[1] = args[1]
			end
			return namecall(self, unpack(args))
		end
		return namecall(self, ...)
	end)

    -- Create a floating part
    local Part = Instance.new("Part")
	Part.Size = Vector3.new(5, 1, 5)
	Part.Parent = game:GetService("Workspace")
	Part.Anchored = true
	Part.Transparency = 1

    

    -- Functions
    
    local function tpNpc(Npc, NpcPos)
		if Npc:FindFirstChild("HumanoidRootPart") then
			if Npc.HumanoidRootPart:FindFirstChild("Hold") then
				Npc.HumanoidRootPart.Hold:Destroy()
			end
			if Npc.HumanoidRootPart:FindFirstChild("Turn") then
				Npc.HumanoidRootPart.Turn:Destroy()
			end
			if Npc.HumanoidRootPart:FindFirstChild("BodyPosition") then
				Npc.HumanoidRootPart.BodyPosition:Destroy()
			end
			for i,v in pairs(Npc:GetChildren()) do
				if (v.ClassName == "MeshPart" or v.ClassName == "Part") and v.CanCollide == true then
					v.CanCollide = false
				end
			end
			if not Npc.HumanoidRootPart:FindFirstChild("MyForceInstance") then
				local ForceInstance = Instance.new("BodyPosition")
				ForceInstance.Name = "MyForceInstance"
				ForceInstance.P = 1000000
				ForceInstance.Parent = Npc.HumanoidRootPart
				ForceInstance.MaxForce = Vector3.new(2500000, 2500000, 2500000)
			end
			Npc.HumanoidRootPart.MyForceInstance.Position = NpcPos
		end
	end
    
    local function GiveItem(Item)
		if Item == "Armor" then
			Events:WaitForChild("Vending"):FireServer(3, "Armor2", "Armor", tostring(LocalPlayer), 1)
		else
			Events:WaitForChild("GiveTool"):FireServer(tostring(Item:gsub(" ", "")))
		end
	end
    local function EquipAllTools()
		for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
			if v:IsA("Tool") then
				v.Parent = LocalPlayer.Character
			end
		end
	end
    local function UnequipAllTools()
		for i, v in pairs(LocalPlayer.Character:GetChildren()) do
			if v:IsA("Tool") then
				v.Parent = LocalPlayer.Backpack
			end
		end
	end
    local function Train(Ability)
		Events:WaitForChild("RainbowWhatStat"):FireServer(Ability)
	end
	local function TakeDamange(Amount)
		Events:WaitForChild("Energy"):FireServer(-Amount, false, false)
	end
	local function TeleportTo(CFrameArg)
		LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameArg
	end
	local function HealAllPlayers()
		UnequipAllTools()
		task.wait(.2)
		GiveItem("Golden Apple")
		task.wait(.5)
		LocalPlayer.Backpack:WaitForChild("GoldenApple").Parent = LocalPlayer.Character
		task.wait(.5)
		Events:WaitForChild("HealTheNoobs"):FireServer()
	end
	local function HealYourself()
		GiveItem("Pizza")
		Events.Energy:FireServer(25, "Pizza")
	end
	local function BreakBarricades()
		for i, v in pairs(game:GetService("Workspace").FallenTrees:GetChildren()) do
			for i = 1, 20 do
				if v:FindFirstChild("TreeHitPart") then
					Events.RoadMissionEvent:FireServer(1, v.TreeHitPart, 5)
				end
			end
		end
	end
	local function BreakEnemies()
		pcall(function()
			for i, v in pairs(game:GetService("Workspace").BadGuys:GetChildren()) do
				v:FindFirstChild("Humanoid", true).Health = 0
			end
			for i, v in pairs(game:GetService("Workspace").BadGuysBoss:GetChildren()) do
				v:FindFirstChild("Humanoid", true).Health = 0
			end
			for i, v in pairs(game:GetService("Workspace").BadGuysFront:GetChildren()) do
				v:FindFirstChild("Humanoid", true).Health = 0
			end
		end)
	end
	local function KillEnemies()
		pcall(function()
			for i, v in pairs(game:GetService("Workspace").BadGuys:GetChildren()) do
				Events:WaitForChild("HitBadguy"):FireServer(v, 100, 4)
			end
			for i, v in pairs(game:GetService("Workspace").BadGuys:GetChildren()) do
				Events:WaitForChild("HitBadguy"):FireServer(v, 996)
			end
			for i, v in pairs(game:GetService("Workspace").BadGuysBoss:GetChildren()) do
				Events:WaitForChild("HitBadguy"):FireServer(v, 100, 4)
			end
			for i, v in pairs(game:GetService("Workspace").BadGuysFront:GetChildren()) do
				Events:WaitForChild("HitBadguy"):FireServer(v, 100, 4)
			end
			if game:GetService("Workspace"):FindFirstChild("BadGuyPizza", true) then
				Events:WaitForChild("HitBadguy"):FireServer(game:GetService("Workspace"):FindFirstChild("BadGuyPizza", true), 64.8, 4)
			end
			if game:GetService("Workspace"):FindFirstChild("BadGuyBrute") then
				Events:WaitForChild("HitBadguy"):FireServer(game:GetService("Workspace").BadGuyBrute, 64.8, 4)
			end
		end)
	end

	local function GetDog()
		for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Assets.Note.Note.Note:GetChildren()) do
			if v.Name:match("Circle") and v.Visible == true then
				GiveItem(tostring(v.Name:gsub("Circle", "")))
				task.wait(.1)
				LocalPlayer.Backpack:WaitForChild(tostring(v.Name:gsub("Circle", ""))).Parent = LocalPlayer.Character
				TeleportTo(CFrame.new(-257.56839, 29.4499969, -910.452637, -0.238445505, 7.71292363e-09, 0.971155882, 1.2913591e-10, 1, -7.91029819e-09, -0.971155882, -1.76076387e-09, -0.238445505))
				task.wait(.5)
				Events:WaitForChild("CatFed"):FireServer(tostring(v.Name:gsub("Circle", "")))
			end
		end
		task.wait(2)
		for i = 1, 3 do
			TeleportTo(CFrame.new(-203.533081, 30.4500484, -790.901428, -0.0148558766, 8.85941187e-09, -0.999889672, 2.65695732e-08, 1, 8.46563175e-09, 0.999889672, -2.64408779e-08, -0.0148558766) + Vector3.new(0, 5, 0))
			task.wait(.1)
		end
	end

	local function GetAgent()
		GiveItem("Louise")
		task.wait(.1)
		LocalPlayer.Backpack:WaitForChild("Louise").Parent = LocalPlayer.Character
		Events:WaitForChild("LouiseGive"):FireServer(2)
	end

	local function GetUncle()
		GiveItem("Key")
		task.wait(.1)
		LocalPlayer.Backpack:WaitForChild("Key").Parent = LocalPlayer.Character
		wait(.5)
		Events.KeyEvent:FireServer()
	end
	local function ClickPete()
		fireclickdetector(game:GetService("Workspace").UnclePete.ClickDetector)
	end
	local function CollectCash()
		for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
			if v.Name == "Part" and v:FindFirstChild("TouchInterest") and v:FindFirstChild("Weld") and v.Transparency == 1 then
				firetouchinterest(v, LocalPlayer.Character.HumanoidRootPart, 0)
			end
		end
	end
	local function GetAllOutsideItems()
		TeleportTo(CFrame.new(-199.240555, 30.0009422, -790.182739, 0.08340507, 2.48169538e-08, 0.996515751, -2.7112752e-09, 1, -2.46767993e-08, -0.996515751, -6.43658127e-10, 0.08340507))
		for i, v in pairs(game:GetService("Workspace").OutsideParts:GetChildren()) do
			fireclickdetector(v.ClickDetector)
		end
		LocalPlayer.Character.Humanoid:MoveTo(LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(-10, 0, 0))
	end
	local function BringAllEnemies()
		pcall(function()
			for i, v in pairs(game:GetService("Workspace").BadGuys:GetChildren()) do
				v.HumanoidRootPart.Anchored = true
				v.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4)
			end
			for i, v in pairs(game:GetService("Workspace").BadGuysBoss:GetChildren()) do
				v.HumanoidRootPart.Anchored = true
				v.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4)
			end
			
			for i, v in pairs(game:GetService("Workspace").BadGuysFront:GetChildren()) do
				v.HumanoidRootPart.Anchored = true
				v.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4)
			end
		end)
	end
	local function GetSecretEnding()
		for i, v in next, SecretEndingTable do
			Events.LarryEndingEvent:FireServer(v, true)
		end
	end

	local function GetGAppleBadge()
		for i, v in pairs(game:GetService("Workspace").FallenTrees:GetChildren()) do
			for i = 1, 20 do
				if v:FindFirstChild("TreeHitPart") then
					Events.RoadMissionEvent:FireServer(1, v.TreeHitPart, 5)
				end
			end
		end
		task.wait(1)

		TeleportTo(CFrame.new(61.8781624, 29.4499969, -534.381165, -0.584439218, -1.05103076e-07, 0.811437488, -3.12853778e-08, 1, 1.06993674e-07, -0.811437488, 3.71451705e-08, -0.584439218))
		task.wait(.5)
		fireclickdetector(game:GetService("Workspace").GoldenApple.ClickDetector)
	end

	local function AntiMud(Touchable)
		for i, v in pairs(game:GetService("Workspace").BogArea.Bog:GetDescendants()) do
			if v.Name == "Mud" and v:IsA("Part") then
				if Touchable == true then
					v.CanTouch = false
				else 
					v.CanTouch = false
				end
			end
		end
	end
	local function AntiWind()
		if game:GetService("Workspace"):FindFirstChild("WavePart") then
			game:GetService("Workspace").WavePart.CanTouch = false
		end
	end

    --The GUI
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    local function Notify(name, content, image, time)
		OrionLib:MakeNotification({
			Name = name,
			Content = content,
			Image = image,
			Time = time
		})
	end

    local Window = OrionLib:MakeWindow({Name = "Parmesan Hub - Break In 2 (Main Game)", HidePremium = false, SaveConfig = true, ConfigFolder = "Parmesan Hub", IntroEnabled = false})
    
	local PlayerTab = Window:MakeTab({
		Name = "Player",
		Icon = "rbxassetid://4483345998",
		PremiumOnly = false
	})
	
	local Section = PlayerTab:AddSection({
		Name = "Player"
	})
	
	PlayerTab:AddSlider({
		Name = "Walk Speed",
		Min = 1,
		Max = 1000,
		Default = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed,
		Color = Color3.fromRGB(127,199,255),
		Increment = 1,
		ValueName = "Walk Speed",
		Callback = function(Value)
			ModifiedWalkspeed = Value
		end    
	})
	
	PlayerTab:AddToggle({
		Name = "Enable Walk Speed",
		Default = false,
		Callback = function(Value)
			WalkSpeedOn = Value
			temp = game:GetService("RunService").Stepped:connect(function()
				if WalkSpeedOn == true then
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = ModifiedWalkspeed
				else
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 10
					temp:Disconnect()
				end
			end)
		end
	})

	PlayerTab:AddSlider({
		Name = "Jump Power",
		Min = 1,
		Max = 1000,
		Default = game.Players.LocalPlayer.Character.Humanoid.JumpPower,
		Color = Color3.fromRGB(127,199,255),
		Increment = 1,
		ValueName = "Jump Power",
		Callback = function(Value)
			ModifiedJumpPower = Value
		end    
	})

	PlayerTab:AddToggle({
		Name = "Enable Jump Power",
		Default = false,
		Callback = function(Value)
			JumpPowerOn = Value
			temp = game:GetService("RunService").Stepped:connect(function()
				if JumpPowerOn == true then
					game.Players.LocalPlayer.Character.Humanoid.JumpPower = ModifiedJumpPower
					game.Players.LocalPlayer.Character.Humanoid.UseJumpPower = Value
				else
					game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
					temp:Disconnect()
				end
			end)
		end    
	})

	
	PlayerTab:AddToggle({
		Name = "Noclip",
		Default = false,
		Callback = function(Value)
			Noclip = Value
			local Mouse = game.Players.LocalPlayer:GetMouse()
			getgenv().noclips = true
	    	
	    		noclips = not noclips
	    		local temp
		        temp = game:GetService("RunService").Stepped:connect(function()
			        if noclips then
			            for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			                if v:IsA("BasePart") then
			                    v.CanCollide = false
			                end
			            end
			        else
			        	temp:Disconnect()
			        	for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			                if v.Name == "LowerTorso" or v.Name == "UpperTorso" then
			                    v.CanCollide = true
			                end
			            end
			        end
				end)
			
		end    
	})
	
	PlayerTab:AddToggle({
		Name = "Infinite Jump",
		Default = false,
		Callback = function(Value)
			InfJump = Value
			local InfJumpFunc
			if InfJumpFunc then InfJumpFunc:Disconnect() end
			if InfJump == true then
				while not game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") do
					task.wait()
				end
				InfJumpFunc = game:GetService("UserInputService").JumpRequest:Connect(function()
			    	if InfJump == true then
			    		game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
			    	end
			    end)
			end
		end    
	})
	
	PlayerTab:AddToggle({
		Name = "Players ESP",
		Default = false,
		Callback = function(Value)
			if Value == true then
				for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
					local CurrentName = v
					for i,v in pairs(game.Players:GetChildren()) do
						if v.Name == CurrentName.Name and v.Name ~= game.Players.LocalPlayer.Name then
							local highlight = Instance.new("Highlight")
							highlight.Parent = CurrentName
							highlight.FillColor = Color3.fromRGB(255, 255, 255)
							highlight.FillTransparency = 0.25
							highlight.OutlineTransparency = 0.25
							highlight.OutlineColor = Color3.fromRGB(0, 0, 0)
							break
						end
					end
				end
			else
				for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
					local CurrentName = v
					for i,v in pairs(game.Players:GetChildren()) do
						if v.Name == CurrentName.Name and v.Name ~= game.Players.LocalPlayer.Name then
							if CurrentName:FindFirstChild("Highlight") then
								CurrentName:FindFirstChild("Highlight"):Destroy()
							end
							break
						end
					end
				end
			end
		end   
	})
	
	PlayerTab:AddToggle({
		Name = "Hidden Items ESP",
		Default = false,
		Callback = function(Value)
			if Value == true then
				for i, v in pairs(game:GetService("Workspace").Hidden:GetChildren()) do
					local highlight = Instance.new("Highlight")
					highlight.Parent = v
					highlight.FillColor = Color3.fromRGB(255, 0, 255)
					highlight.FillTransparency = 0
					highlight.OutlineTransparency = 0
					highlight.OutlineColor = Color3.fromRGB(0, 0, 255)
				end
			else
				for i, v in pairs(game:GetService("Workspace").Hidden:GetChildren()) do
					if v:FindFirstChild("Highlight") then
						v:FindFirstChild("Highlight"):Destroy()
					end
				end
			end
		end   
	})

    local MainTab = Window:MakeTab({
        Name = "Game",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    local MainSection = MainTab:AddSection({
        Name = "God Mode"
    })

    MainTab:AddToggle({
        Name = "Semi Godmode",
        Default = false,
        Callback = function(Value)
            getgenv().SemiGodmode = Value
			if SemiGodmode == true then
				Notify('Parmesan Hub', "Semi-Godmode avoids your player from getting attacked by most enemies!", 'rbxassetid://4483345998', 7)
			end
        end
    })
    
    local MainSection = MainTab:AddSection({
        Name = "Stats"
    })
    
    MainTab:AddButton({
		Name = "Get +1 Strength",
		Callback = function()
			Train("Strength")
		  end    
	})

	MainTab:AddButton({
		Name = "Get +1 Speed",
		Callback = function()
			Train("Speed")
		  end    
	})
    
    local MainSection = MainTab:AddSection({
        Name = "Items"
    })
    
    MainTab:AddDropdown({
        Name = "Get Item",
        Default = "",
        Options = ItemsTable,
        Callback = function(Value)
        	if Value == "Crowbar" then
        		game:GetService("ReplicatedStorage").Events.GiveCrowbar:FireServer(workspace.TheHouse.Rack)
        	elseif Value == "Golden Crowbar" then
        		game:GetService("ReplicatedStorage").Events.Vending:FireServer(3, "Crowbar2", "Weapons", game.Players.LocalPlayer.Name, nil, 1)
        	elseif Value == "Diamond Crowbar" then
        		game:GetService("ReplicatedStorage").Events.Vending:FireServer(3, "Crowbar3", "Weapons", game.Players.LocalPlayer.Name, nil, 4)
        	elseif Value == "Bat" then
        		game:GetService("ReplicatedStorage").Events.Vending:FireServer(3, "Bat", "Weapons", game.Players.LocalPlayer.Name, nil, 11)
        	elseif Value == "Wrench" then
        		game:GetService("ReplicatedStorage").Events.Vending:FireServer(3, "Wrench", "Weapons", game.Players.LocalPlayer.Name, nil, 12)
        	elseif Value == "Hammer" then
        		game:GetService("ReplicatedStorage").Events.Vending:FireServer(3, "Hammer", "Weapons", game.Players.LocalPlayer.Name, nil, 13)
        	elseif Value == "Broom" then
        		game:GetService("ReplicatedStorage").Events.Vending:FireServer(3, "Broom", "Weapons", game.Players.LocalPlayer.Name, nil, 14)
			elseif Value == "Pitchfork" then
				game:GetService("ReplicatedStorage").Events.Vending:FireServer(3, "Pitchfork", "Weapons", game.Players.LocalPlayer.Name, nil, 14)
        	else
	            if Value == 'Phone' then
	            	Notify('Parmesan Hub', Value..": You need the \"Hacker Class\" gamepass to actually make it work.", 'rbxassetid://4483345998', 7)
	            elseif Value == 'Book' then
					Notify('Parmesan Hub', Value..": You need the \"Nerd Class\" gamepass to actually make it work.", 'rbxassetid://4483345998', 7)
				end
				GiveItem(Value)
			end
        end    
    })
    
    MainTab:AddToggle({
		Name = "Open a Backpack",
		Default = false,
		Callback = function(Value)
			game:GetService("CoreGui").RobloxGui.Backpack.Visible = true
			game:GetService("CoreGui").RobloxGui.Backpack.Hotbar.Visible = false
			game:GetService("CoreGui").RobloxGui.Backpack.Inventory.Visible = Value
		end    
	})
	
	MainTab:AddParagraph("Items","You can have only one weapon at a time. Some weapons you can get only once in the entire round")
    
    local MainSection = MainTab:AddSection({
        Name = "Heal Players"
    })

    MainTab:AddButton({
        Name = "Heal Yourself",
        Callback = function()
            for i = 1, 10 do
				HealYourself()
            end
          end    
    })

    MainTab:AddToggle({
        Name = "Loop Heal Yourself",
        Default = false,
        Callback = function(Value)
            getgenv().HealLoop = Value
			while HealLoop do
				while game:GetService("Players").averylocalcheese.PlayerGui.EnergyBar.EnergyBar.EnergyBar.ImageLabel.NumberHolder.TextLabel.Text == "200/200" do
					task.wait()
				end
				HealYourself()
				task.wait(.1)
            end
        end    
    })

    MainTab:AddButton({
        Name = "Heal All Players",
        Callback = function()
            HealAllPlayers()
          end    
    })

    MainTab:AddToggle({
        Name = "Loop Heal All Players",
        Default = false,
        Callback = function(Value)
            getgenv().HealAllLoop = Value
			while HealAllLoop do
				HealAllPlayers()
				task.wait(3)
        end
    end
    })
    
    local MainSection = MainTab:AddSection({
        Name = "Pick Up Cash"
    })

    MainTab:AddButton({
        Name = "Pick Up All Cash",
        Callback = function()
            CollectCash()
          end    
    })

    MainTab:AddToggle({
        Name = "Auto Pick Up All Cash",
        Default = false,
        Callback = function(Value)
            getgenv().CollectAllCash = Value

			while CollectAllCash do
				CollectCash()
				task.wait(1)
            end
        end    
    })

    -- NPCs
    local NPCTab = Window:MakeTab({
        Name = "NPCs",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    
    local EnemiesSection = NPCTab:AddSection({
		Name = "Hire NPCs"
	})

    NPCTab:AddButton({
        Name = "Hire all NPCs",
        Callback = function()
            GetDog()
			task.wait(5)
			GetAgent()
			task.wait(1)
			GetUncle()
          end    
    })

    NPCTab:AddButton({
        Name = "Hire Uncle Pete",
        Callback = function()
            GetUncle()
          end    
    })

    NPCTab:AddButton({
        Name = "Hire Detective Bradley Beans",
        Callback = function()
            GetAgent()
          end    
    })

    NPCTab:AddButton({
        Name = "Hire Twado the Dog",
        Callback = function()
            GetDog()
          end    
    })
    
    local EnemiesSection = NPCTab:AddSection({
		Name = "Throw NPCs to the Void (Press Only 1 Time)"
	})

    NPCTab:AddButton({
        Name = "Throw Uncle Pete",
        Callback = function()
        	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.UnclePete.HumanoidRootPart.CFrame
            tpNpc(game.workspace.UnclePete, Vector3.new(2500000,-2500000,0))
          end    
    })

    NPCTab:AddButton({
        Name = "Throw Detective Bradley Beans",
        Callback = function()
        	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.AgentBeans.HumanoidRootPart.CFrame
            tpNpc(game.workspace.AgentBeans, Vector3.new(2500000,-2500000,0))
          end    
    })

    NPCTab:AddButton({
        Name = "Throw Twado the Dog",
        Callback = function()
        	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.TheHouse.SmallCat.HumanoidRootPart.CFrame
            tpNpc(game.workspace.TheHouse.SmallCat, Vector3.new(2500000,-2500000,0))
          end    
    })
    
    local EnemiesSection = NPCTab:AddSection({
		Name = "Enemies"
	})

	NPCTab:AddButton({
		Name = "Bring Enemies",
		Callback = function()
			BringAllEnemies()
		  end    
	})

	NPCTab:AddButton({
		Name = "Stomp Enemies",
		Callback = function()
			BreakEnemies()
		  end    
	})
	
	NPCTab:AddButton({
		Name = "Kill Enemies",
		Callback = function()
			for i = 1, 10 do
				KillEnemies()
			end
		  end    
	})

	NPCTab:AddToggle({
		Name = "Loop Kill Enemies",
		Default = false,
		Callback = function(Value)
			getgenv().KillAllLoop = Value
			while KillAllLoop do
				KillEnemies()
				task.wait(0.5)
			end
		end    
	})
	
	NPCTab:AddButton({
		Name = "Remove Scary Mary",
		Callback = function()
		    if game:GetService("Workspace"):FindFirstChild("Villainess") then
				game:GetService("Workspace").Villainess:Destroy()
			else
				Notify('Parmesan Hub', "Scary Marry Is Already Deleted Or Boss Fight Is Not Started", 'rbxassetid://4483345998', 7)
			end
		end
		})

	NPCTab:AddButton({
		Name = "Remove Scary Larry",
		Callback = function()
			if game:GetService("Workspace"):FindFirstChild("BigBoss") then
				game:GetService("Workspace").BigBoss:Destroy()
			else
				Notify('Parmesan Hub', "Scary Larry Is Already Deleted Or Boss Fight Is Not Started", 'rbxassetid://4483345998', 7)
			end
		  end    
	})
	
	local TpTab = Window:MakeTab({
		Name = "Teleports",
		Icon = "rbxassetid://4483345998",
		PremiumOnly = false
	})

	local TpSection = TpTab:AddSection({
		Name = "Areas"
	})

	TpTab:AddButton({
		Name = "Kitchen",
		Callback = function()
			TeleportTo(CFrame.new(-249.753555, 30.4500484, -732.703125, -0.999205947, -1.97705017e-08, 0.0398429185, -2.00601384e-08, 1, -6.86967372e-09, -0.0398429185, -7.66347341e-09, -0.999205947))
		  end    
	})

	TpTab:AddButton({
		Name = "Fight Arena",
		Callback = function()
			TeleportTo(CFrame.new(-255.521988, 62.7139359, -723.436035, -0.0542500541, 4.28905356e-09, -0.998527408, 1.07862625e-08, 1, 3.70936082e-09, 0.998527408, -1.05691456e-08, -0.0542500541))
		  end    
	})

	TpTab:AddButton({
		Name = "Gym",
		Callback = function()
			TeleportTo(CFrame.new(-256.477448, 63.4500465, -840.825562, 0.999789953, 2.17116263e-08, 0.020495005, -2.15169358e-08, 1, -9.7199333e-09, -0.020495005, 9.27690191e-09, 0.999789953))
		  end    
	})

	TpTab:AddButton({
		Name = "Middle Room",
		Callback = function()
			TeleportTo(CFrame.new(-209.951859, 30.4590473, -789.723877, -0.0485812724, 6.74905039e-08, 0.998819232, 1.19352916e-09, 1, -6.75122394e-08, -0.998819232, -2.08771045e-09, -0.0485812724))
		  end    
	})

	TpTab:AddButton({
		Name = "Shop",
		Callback = function()
			TeleportTo(CFrame.new(-246.653229, 30.4500484, -847.319275, 0.999987781, -9.18427645e-08, -0.00494772941, 9.19905787e-08, 1, 2.96483353e-08, 0.00494772941, -3.01031164e-08, 0.999987781))
		  end    
	})

	TpTab:AddButton({
		Name = "Boss Fight Area",
		Callback = function()
			TeleportTo(CFrame.new(-1565.78772, -368.711945, -1040.66626, 0.0929690823, -1.97564436e-08, 0.995669007, -1.53269308e-08, 1, 2.1273511e-08, -0.995669007, -1.72383299e-08, 0.0929690823))
		  end    
	})

	TpTab:AddButton({
		Name = "Fighting Pillar",
		Callback = function()
			TeleportTo(CFrame.new(-1501.49597, -325.156891, -1060.63367, -0.691015959, 7.43958628e-09, 0.722839475, -5.03345055e-09, 1, -1.51040194e-08, -0.722839475, -1.40754954e-08, -0.691015959))
		  end    
	})

	TpTab:AddButton({
		Name = "Experiment Room",
		Callback = function()
			TeleportTo(game:GetService("Workspace").Final.Factory.RedDesk.Drawer:GetChildren()[2].CFrame + Vector3.new(20, 0, 0))
		  end    
	})

	TpTab:AddButton({
		Name = "Cafeteria",
		Callback = function()
			TeleportTo(game:GetService("Workspace").Final.Factory:FindFirstChild("Legs", true).CFrame)
		  end    
	})

	local TpSection = TpTab:AddSection({
		Name = "Items"
	})

	TpTab:AddButton({
		Name = "Feeding Instructions",
		Callback = function()
			TeleportTo(CFrame.new(-207.885056, 60.4500465, -830.583557, 0.118373089, 3.89876789e-08, -0.992969215, 3.47791551e-09, 1, 3.96783406e-08, 0.992969215, -8.15031065e-09, 0.118373089))
		  end    
	})

	TpTab:AddButton({
		Name = "Golden Apple",
		Callback = function()
			TeleportTo(CFrame.new(61.8781624, 29.4499969, -534.381165, -0.584439218, -1.05103076e-07, 0.811437488, -3.12853778e-08, 1, 1.06993674e-07, -0.811437488, 3.71451705e-08, -0.584439218))
		  end    
	})

	TpTab:AddButton({
		Name = "Rainbow Pizza",
		Callback = function()
			TeleportTo(game:GetService("Workspace").RainbowPizzaBox.CFrame + Vector3.new(0,3,0))
		end
	})

	TpTab:AddButton({
		Name = "Loot",
		Callback = function()
			TeleportTo(game:GetService("Workspace").OutsideParts:FindFirstChildWhichIsA("Part", true).CFrame + Vector3.new(10, 0, 0))
		  end    
	})

	TpTab:AddButton({
		Name = "Golden Crowbar",
		Callback = function()
			TeleportTo(CFrame.new(-147.337204, 29.4477005, -929.365295, 0.756779075, 4.53537341e-09, -0.653670728, 5.82708326e-09, 1, 1.36845468e-08, 0.653670728, -1.4165173e-08, 0.756779075))
		  end    
	})

	TpTab:AddButton({
		Name = "Purple Mask",
		Callback = function()
			TeleportTo(CFrame.new(102.560722, 29.2477055, -976.389954, -0.951403797, 3.76210636e-08, -0.307946175, 1.89752569e-08, 1, 6.35433466e-08, 0.307946175, 5.46120233e-08, -0.951403797))
		  end    
	})

	local TpSection = TpTab:AddSection({
		Name = "NPCs"
	})

	TpTab:AddButton({
		Name = "Uncle Pete",
		Callback = function()
			TeleportTo(CFrame.new(-294.208923, 63.4182587, -737.712036, -0.998669028, -7.34403613e-08, -0.05157727, -7.2258743e-08, 1, -2.47743781e-08, 0.05157727, -2.1014495e-08, -0.998669028))
		  end    
	})

	TpTab:AddButton({
		Name = "Agent Bradly",
		Callback = function()
			TeleportTo(CFrame.new(-281.792053, 95.4500275, -790.556946, -0.116918251, -7.95074726e-08, -0.993141532, -2.79918044e-09, 1, -7.97270019e-08, 0.993141532, -6.54155974e-09, -0.116918251))
		  end    
	})

	TpTab:AddButton({
		Name = "Dog",
		Callback = function()
			TeleportTo(CFrame.new(-257.56839, 29.4499969, -910.452637, -0.238445505, 7.71292363e-09, 0.971155882, 1.2913591e-10, 1, -7.91029819e-09, -0.971155882, -1.76076387e-09, -0.238445505))
		  end    
	})

	TpTab:AddButton({
		Name = "Homeless Kid",
		Callback = function()
			TeleportTo(CFrame.new(-79.4871826, 29.4477024, -932.782715, -0.215949073, 3.18771427e-08, 0.976404607, -7.60385461e-08, 1, -4.94647345e-08, -0.976404607, -8.49262562e-08, -0.215949073))
		  end    
	})

	-- Misc

	local MiscTab = Window:MakeTab({
		Name = "Miscellaneous",
		Icon = "rbxassetid://4483345998",
		PremiumOnly = false
	})

	local MiscSection = MiscTab:AddSection({
		Name = "Miscellaneous"
	})
	
	MiscTab:AddButton({
        Name = "Unlock a Secret Ending",
        Callback = function()
            GetSecretEnding()
          end    
    })

	MiscTab:AddToggle({
		Name = "Claim Quests Rewards",
		Default = false,
		Callback = function(Value)
			getgenv().AutoPete = Value

			while AutoPete do
				ClickPete()
				task.wait(10)
			end
		end    
	})

	MiscTab:AddButton({
		Name = "Get Apple Badge",
		Callback = function()
			GetGAppleBadge()
		  end    
	})

	MiscTab:AddButton({
		Name = "Get Loot",
		Callback = function()
			GetAllOutsideItems()
		  end    
	})

	MiscTab:AddToggle({
		Name = "Fullbright",
		Default = false,
		Callback = function(Value)
			if Value == true then
				Lighting.Brightness = 1
				Lighting.FogEnd = 999999
				Lighting.GlobalShadows = false
				Lighting.ClockTime = 12
			else
				Lighting.Brightness = OriginalBrightness
				Lighting.FogEnd = OriginalFog
				Lighting.GlobalShadows = true
				Lighting.ClockTime = 9
			end
		end    
	})
	
	local MiscSection = MiscTab:AddSection({
		Name = "Remove Game Objects"
	})

	MiscTab:AddToggle({
		Name = "Remove Mud",
		Default = false,
		Callback = function(Value)
			AntiMud(Value)
		end    
	})

	MiscTab:AddToggle({
		Name = "Remove Wind",
		Default = false,
		Callback = function(Value)
			getgenv().NoWind = Value
			while NoWind == true do
				AntiWind()
				task.wait(.5)
		end
	end    
	})

	
	local FeedbackTab = Window:MakeTab({
		Name = "Feedback",
		Icon = "rbxassetid://4483345998",
		PremiumOnly = false
	})
	
	FeedbackTab:AddParagraph("Discord","Scripting - kiriakos777\nFounder - rawparmesan")

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
end



