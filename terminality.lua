local _game = nil
local VER = " v1.3"

function Arrest(player)
 
local bruh = game:GetService("Workspace")[player].HumanoidRootPart
local lol = game:GetService("Workspace").Remote.arrest
lol:InvokeServer(bruh)

end


rconsoleprint("@@LIGHT_BLUE@@")
rconsoleprint[[ 
 $$$$$$$$                                /$$                     /$$    /$$   /$$              
|__  $$__/                               |__/                    | $$   |__/  | $$              
   | $$  /$$$$$$   /$$$$$$  /$$$$$$/$$$$  /$$ /$$$$$$$   /$$$$$$ | $$   /$$ /$$$$$$   /$$   /$$
   | $$ /$$__  $$ /$$__  $$| $$_  $$_  $$| $$| $$__  $$ |____  $$| $$|   $$|_  $$_/  | $$  | $$
   | $$| $$$$$$$$| $$  \__/| $$ \ $$ \ $$| $$| $$  \ $$  /$$$$$$$| $$|   $$  | $$    | $$  | $$
   | $$| $$_____/| $$      | $$ | $$ | $$| $$| $$  | $$ /$$__  $$| $$|   $$  | $$ /$$| $$  | $$
   | $$|  $$$$$$$| $$      | $$ | $$ | $$| $$| $$  | $$|  $$$$$$$| $$  | $$  |  $$$$/|  $$$$$$$
   |__/ \_______/|__/      |__/ |__/ |__/|__/|__/  |__/ \_______/|__/  |__/   \___/   \____  $$
                                                                                    /$$  | $$
                                                                                   |  $$$$$$/
                                                                                    \______/ ]]
if game.GameId == 73885730 then
rconsoleprint("\nGame is supported: Prison Life")
rconsoleprint("\n")
rconsolename("Terminality"..VER)
_game = "prison_life"
else
rconsoleprint("\nGame is unsupported!")
rconsoleprint("\n")
 _game = "universal"
rconsolename("Terminality"..VER)
end

while _game == "prison_life" do
            rconsoleprint("@@WHITE@@");
            rconsoleprint("> ");
            local Input = rconsoleinput("");
            local CommandArgs = Input:split(" ");
            if Input == "arrest all" then
        local Player = game.Players.LocalPlayer
local cpos = Player.Character.HumanoidRootPart.CFrame
for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
if v.Name ~= Player.Name then
local i = 10
    repeat
    wait()
    i = i-1
    game.Workspace.Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
    Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
     until i == 0
     rconsoleinfo(game:GetService("Lighting").TimeOfDay..": "..v.Name.." was arrested.")
   end
end
Player.Character.HumanoidRootPart.CFrame = cpos
elseif Input == "superpunch" then
    mainRemotes = game.ReplicatedStorage
meleeRemote = mainRemotes["meleeEvent"]
mouse = game.Players.LocalPlayer:GetMouse()
punching = false
cooldown = false
function punch()
    cooldown = true
    local part = Instance.new("Part", game.Players.LocalPlayer.Character)
    part.Transparency = 1
    part.Size = Vector3.new(5, 2, 3)
    part.CanCollide = false
    local w1 = Instance.new("Weld", part)
    w1.Part0 = game.Players.LocalPlayer.Character.Torso
    w1.Part1 = part
    w1.C1 = CFrame.new(0, 0, 2)
    part.Touched:connect(
        function(hit)
            if game.Players:FindFirstChild(hit.Parent.Name) then
                local plr = game.Players:FindFirstChild(hit.Parent.Name)
                if plr.Name ~= game.Players.LocalPlayer.Name then
                    part:Destroy()
                    for i = 1, 100 do
                        meleeRemote:FireServer(plr)
                    end
                end
            end
        end
    )
    wait(1)
    cooldown = false
    part:Destroy()
end
mouse.KeyDown:connect(
    function(key)
        if cooldown == false then
            if key:lower() == "f" then
                punch()
            end
        end
    end)
    rconsolewarn("Super punch enabled")
  elseif Input == "removewalls" then
  wait(0.1)
game.Workspace.Prison_Halls.walls:Remove()

wait(0.1)
game.Workspace.Prison_Halls.roof:Remove()

wait(0.1)
game.Workspace.Prison_Halls.outlines:Remove()

wait(0.1)
game.Workspace.Prison_Halls.lights:Remove()

wait(0.1)
Workspace.Prison_Halls.accent:Remove()

wait(0.1)
game.Workspace.Prison_Halls.glass:Remove()

wait(0.1)
game.Workspace.Prison_Cellblock.b_front:Remove()

wait(0.1)
game.Workspace.Prison_Cellblock.doors:Remove()

wait(0.1)
game.Workspace.Prison_Cellblock.c_tables:Remove()

wait(0.1)
game.Workspace.Prison_Cellblock.a_front:Remove()

wait(0.1)
game.Workspace.Prison_Cellblock.b_outerwall:Remove()

wait(0.1)
game.Workspace.Prison_Cellblock.c_wall:Remove()

wait(0.1)
game.Workspace.Prison_Cellblock.b_wall:Remove()

wait(0.1)
game.Workspace.Prison_Cellblock.c_hallwall:Remove()

wait(0.1)
game.Workspace.Prison_Cellblock.a_outerwall:Remove()

wait(0.1)
game.Workspace.Prison_Cellblock.b_ramp:Remove()

wait(0.1)
game.Workspace.Prison_Cellblock.a_ramp:Remove()

wait(0.1)
game.Workspace.Prison_Cellblock.a_walls:Remove()

wait(0.1)
game.Workspace.Prison_Cellblock.Cells_B:Remove()

wait(0.1)
game.Workspace.Prison_Cellblock.Cells_A:Remove()

wait(0.1)
game.Workspace.Prison_Cellblock.c_corner:Remove()

wait(0.1)
game.Workspace.Prison_Cellblock.Wedge:Remove()

wait(0.1)
game.Workspace.Prison_Cellblock.a_ceiling:Remove()

wait(0.1)
game.Workspace.Prison_Cellblock.b_ceiling:Remove()

wait(0.1)
game.Workspace.City_buildings:Remove()

wait(0.1)
game.Workspace.Prison_OuterWall:Remove()

wait(0.1)
game.Workspace.Prison_Fences:Remove()
  rconsoleinfo("Walls removed")
  rconsolewarn("DO NOT run the removewalls command again! If done so, the script will break!")
  elseif Input == "m9" then
local s = game:GetService("Workspace")["Prison_ITEMS"].giver.M9.ITEMPICKUP
local rem = game:GetService("Workspace").Remote.ItemHandler
rem:InvokeServer(s)
  rconsoleinfo("You were given an M9.")
elseif Input == "ak47" then
 local s = game:GetService("Workspace")["Prison_ITEMS"].giver["AK-47"].ITEMPICKUP
local rem = game:GetService("Workspace").Remote.ItemHandler
rem:InvokeServer(s)
  rconsoleinfo("You were given an AK47.")
  
  elseif Input == "fly" or Input == "Fly me" or Input == "Fly" then
  
  --[[
  // Fly Script \\
  
  // CREDITS GO TO AWAKENING ON V3RM \\
 ]]
  
  
  --[[
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ]]
  
  
   repeat wait()
   until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Torso") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
local mouse = game.Players.LocalPlayer:GetMouse()
repeat wait() until mouse
local plr = game.Players.LocalPlayer
local torso = plr.Character.Torso
local flying = true
local deb = true
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local lastctrl = {f = 0, b = 0, l = 0, r = 0}
local maxspeed = 35
local speed = 35

function Fly()
local bg = Instance.new("BodyGyro", torso)
bg.P = 9e4
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
bg.cframe = torso.CFrame
local bv = Instance.new("BodyVelocity", torso)
bv.velocity = Vector3.new(0,0.1,0)
bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
repeat wait()
plr.Character.Humanoid.PlatformStand = true
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
speed = speed+.5+(speed/maxspeed)
if speed > maxspeed then
speed = maxspeed
end
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
speed = speed-1
if speed < 0 then
speed = 0
end
end
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
else
bv.velocity = Vector3.new(0,0.1,0)
end
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
until not flying
ctrl = {f = 0, b = 0, l = 0, r = 0}
lastctrl = {f = 0, b = 0, l = 0, r = 0}
speed = 0
bg:Destroy()
bv:Destroy()
plr.Character.Humanoid.PlatformStand = false
end
mouse.KeyDown:connect(function(key)
if key:lower() == "e" then
if flying then flying = false
else
flying = true
Fly()
end
elseif key:lower() == "w" then
ctrl.f = 1
elseif key:lower() == "s" then
ctrl.b = -1
elseif key:lower() == "a" then
ctrl.l = -1
elseif key:lower() == "d" then
ctrl.r = 1
end
end)
mouse.KeyUp:connect(function(key)
if key:lower() == "w" then
ctrl.f = 0
elseif key:lower() == "s" then
ctrl.b = 0
elseif key:lower() == "a" then
ctrl.l = 0
elseif key:lower() == "d" then
ctrl.r = 0
end
end)
Fly()
  rconsoleinfo("Made "..game:GetService("Players").LocalPlayer.Name.." fly.")
  rconsoleinfo("Press E to toggle fly mode.")
elseif Input == "cmds" then
    rconsoleinfo[[


        Terminality - Prison Life

        Commands

  [1]      arrest all - Arrests all players.
  [2]      superpunch - Become saitama. (Your punches instantly kill anyone)
  [3]      removewalls - Remove the prison walls.
  [4]      m9 - Gives you an M9.
  [5]      ak47 - Gives you an AK-47.
  [6]      fly - Makes you fly. Press E to toggle.


    ]]
                else
                rconsoleerr("Invalid command!")
      end
 
 while _game == "universal" do
  game.Players.LocalPlayer:Kick("\nUniversal is being worked on!\nWe currently only support Prison Life.")
  end
   end
