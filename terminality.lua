local _game = nil
local VER = " v1.2"

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
    rconsoleinfo("You're saitama now, lol")
elseif Input == "cmds" then
    rconsoleinfo[[


        Terminality - Prison Life

        Commands

        arrest all - Arrests all players.
        superpunch - Become saitama. (Your punches instantly kill anyone)


    ]]
                else
                rconsoleerr("Invalid command!")
            end
   end
