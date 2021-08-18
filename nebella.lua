-- Don't remove this, I want credits for my hub ;(

wait(1.2)
game.StarterGui:SetCore("SendNotification", {
Title = "Thank you for using Impact Hub";
Text = "made by null#0202\ndiscord.gg/rMDGpYvSbn";
Duration = 10;
})

-- arsenal

if game.PlaceId == 286090429 then

	local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

	local Window = Library.CreateLib("Impact Hub - Arsenal", "BloodTheme")
	
	local MainTab = Window:NewTab("Main")
	
	local MainSection = MainTab:NewSection("Main")
	
	local CombatTab = Window:NewTab("Combat")
	
	local CombatSection = CombatTab:NewSection("Combat")
	
	local LocalPlayerTab = Window:NewTab("Local Player")
	
	local LocalPlayerSection = LocalPlayerTab:NewSection("Local Player")
	
	local ESPTab = Window:NewTab("ESP")
	
	local ESPSection = ESPTab:NewSection("ESP Options")
	
	CombatSection:NewButton("Silent Aim", "Auto Wallbang and Auto Head Shot Enemys!", function()
		local players = game:GetService("Players")
		local plr = players.LocalPlayer
		local mouse = plr:GetMouse()
		local camera = game.Workspace.CurrentCamera
		local teamcheck = true
	
		local function ClosestPlayerToMouse()
			local target = nil
			local dist = math.huge
			for i,v in pairs(players:GetPlayers()) do
				if v.Name ~= plr.Name then
					if v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") and teamcheck and v.TeamColor ~= plr.TeamColor then
						local screenpoint = camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
						local check = (Vector2.new(mouse.X,mouse.Y)-Vector2.new(screenpoint.X,screenpoint.Y)).magnitude
	
						if check < dist then
							target  = v
							dist = check
						end
					end
				end
			end
	
			return target 
		end
	
		local mt = getrawmetatable(game)
		local namecall = mt.__namecall
		setreadonly(mt,false)
	
		mt.__namecall = function(self,...)
			local args = {...}
			local method = getnamecallmethod()
	
			if tostring(self) == "HitPart" and method == "FireServer" then
				args[1] = ClosestPlayerToMouse().Character.Head
				return self.FireServer(self, unpack(args))
			end
			return namecall(self,...)
		end
	end)
	
	LocalPlayerSection:NewSlider("WalkSpeed Slider", "WalkSpeed Slider (might reset)", 500, 16, function(s)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
	end)
	
	LocalPlayerSection:NewSlider("JumpPower Slider", "JumpPower Slider (might reset)", 500, 50, function(a)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = a
	end)
	
	ESPSection:NewButton("Name ESP", "Toggles Name ESP On", function()
			while wait() do
			local esp_settings = {
				textsize = 8,
				color = 220,20,60
			}
	
			local gui = Instance.new("BillboardGui")
			local esp = Instance.new("TextLabel", gui)
	
			gui.Name = "Lightning";
			gui.ResetOnSpawn = false
			gui.AlwaysOnTop = true;
			gui.LightInfluence = 0;
			gui.Size = UDim2.new(1.75, 0, 1.75, 0);
			esp.BackgroundColor3 = Color3.fromRGB(220,20,60);
			esp.Text = ""
			esp.Size = UDim2.new(0.0001, 0.00001, 0.0001, 0.00001);
			esp.BorderSizePixel = 4;
			esp.BorderColor3 = Color3.new(esp_settings.color)
			esp.BorderSizePixel = 0
			esp.Font = "GothamSemibold"
			esp.TextSize = esp_settings.textsize
			esp.TextColor3 = Color3.fromRGB(esp_settings.color)
	
			while wait() do
				for i,v in pairs (game:GetService("Players"):GetPlayers()) do
					if v ~= game:GetService("Players").LocalPlayer and v.Character.Head:FindFirstChild("Lightning")==nil and v.TeamColor ~= game:GetService("Players").LocalPlayer.TeamColor then
						esp.Text = "{"..v.Name.."}"
						gui:Clone().Parent = v.Character.HumanoidRootPart
					end
				end
			end
			end
	end)
	
	ESPSection:NewButton("Chams", "Toggle Chams On", function()
			getgenv().chamesp = true
			function CreateSG(name,parent,face)
			local SurfaceGui = Instance.new("SurfaceGui",parent)
			SurfaceGui.Parent = parent
			SurfaceGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			SurfaceGui.Face = Enum.NormalId[face]
			SurfaceGui.LightInfluence = 0
			SurfaceGui.ResetOnSpawn = false
			SurfaceGui.Name = name
			SurfaceGui.AlwaysOnTop = true
			local Frame = Instance.new("Frame",SurfaceGui)
			Frame.BackgroundColor3 = Color3.fromRGB(220,20,60)
			Frame.Size = UDim2.new(1,0,1,0)
		end
	
		while chamesp do
			for i,v in pairs (game:GetService("Players"):GetPlayers()) do
				if v ~= game:GetService("Players").LocalPlayer and v.Character ~= nil and v.Character:FindFirstChild("Head") and v.Character.Head:FindFirstChild("cham") == nil then
					for i,v in pairs (v.Character:GetChildren()) do
						if v:IsA("MeshPart") or v.Name == "Head" then
							CreateSG("cham",v,"Back")
							CreateSG("cham",v,"Front")
							CreateSG("cham",v,"Left")
							CreateSG("cham",v,"Right")
							CreateSG("cham",v,"Right")
							CreateSG("cham",v,"Top")
							CreateSG("cham",v,"Bottom")
						end
					end
				end
			end
			wait()
		end
	end)
	
	MainSection:NewKeybind("Toggle UI Keybind", "Add a Toggle UI Keybind", Enum.KeyCode.RightControl, function()
		Library:ToggleUI()
	end)
	
	MainSection:NewButton("Copy Discord Invite", "https://discord.gg/6x6ZzcmgWU", function()
		setclipboard("https://discord.gg/6x6ZzcmgWU")
	end)

end
