local mystand = nil
for i,v in pairs(game:GetService("Lighting"):GetChildren())do
for i,v2 in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren())do
if v:IsA("LocalScript") and v2:IsA("LocalScript") then
if v.Name == v2.Name then
mystand = v2.Name
end
end
end
end

game.Players.LocalPlayer.Character[mystand]:Destroy()

--Events
local replicatedstorage = game:GetService("ReplicatedStorage")
local damageevent = replicatedstorage.Damage
local damageevent2 = replicatedstorage.BurnDamage
local blockevent = replicatedstorage.Block
local donutevent = replicatedstorage.FOTPSDamageTeleport
local timestopevent = replicatedstorage.Timestop
local transparencyevent = replicatedstorage.Transparency
local strongpunchevent = replicatedstorage.PlayerStrongPunch2
local dodgeevent = replicatedstorage.Dodge
local dodgeevent2 = replicatedstorage.Dodge2
local anchorevent = replicatedstorage.Anchor
local trailevent = replicatedstorage.Trail
local starfingerevent = replicatedstorage.StarFinger
local iggyevent = replicatedstorage.Iggy
local jumpevent = replicatedstorage.Jump
local velocityevent = replicatedstorage.Velocity
local poseevent = replicatedstorage.Menacing
local knockevent = replicatedstorage.Knock
local knockclientevent = replicatedstorage.KnockClient
local knockedevent = replicatedstorage.Knocked
local getupevent = replicatedstorage.GetUp
local berserkclientevent = replicatedstorage.BerserkClient
local tauntevent = replicatedstorage.Taunt
local jumpevent = replicatedstorage.Jump2

local plr = game:GetService("Players").LocalPlayer
repeat
	wait()
until plr.Character and plr.Character.Humanoid
local chr = plr.Character
local human = chr.Humanoid
local hrp = chr.HumanoidRootPart
mouse = plr:GetMouse()
cam = workspace.CurrentCamera

--standevent:FireServer()
	human.WalkSpeed = 16
	human.JumpPower = 50 

--Values
local activu = false

local head = chr["Head"]
local ntorso = chr["Torso"]
local rightarm = chr["Right Arm"]
local leftarm = chr["Left Arm"]
local rightleg = chr["Right Leg"]
local leftleg = chr["Left Leg"]
local rot = chr["HumanoidRootPart"]

function makemotor(parent, p0, p1, c0, c1)
  local wel = Instance.new("Motor6D")
  wel.Part0 = p0
  wel.Part1 = p1
  if c0 ~= nil then
    wel.C0 = c0
  end
  if c1 ~= nil then
    wel.C1 = c1
  end
  wel.Parent = parent
  return wel
end

local stand = chr:WaitForChild("Stand")
local disabled = Instance.new("BoolValue",chr)
disabled.Value = false

--Animation
local anim1 = Instance.new("Animation") -- roll or dash
anim1.AnimationId = "rbxassetid://3451300838"

local anim6 = Instance.new("Animation") -- axe kick
anim6.AnimationId = "rbxassetid://3445853933"

local anim7 = Instance.new("Animation") -- barrage
anim7.AnimationId = "rbxassetid://3445788051"

local anim4 = Instance.new("Animation") -- right punch
anim4.AnimationId = "rbxassetid://3445790486"

local anim5 = Instance.new("Animation") -- left punch
anim5.AnimationId = "rbxassetid://3445791481"

local anim3 = Instance.new("Animation") -- strong punch
anim3.AnimationId = "rbxassetid://3445851410"

local anim2 = Instance.new("Animation") -- block
anim2.AnimationId = "rbxassetid://3445824199"

local Pose1 = Instance.new("Animation") -- pose
Pose1.AnimationId = "rbxassetid://3867480529"

local anim8 = Instance.new("Animation") -- kick
anim8.AnimationId = "rbxassetid://3445855469"

local anim9 = Instance.new("Animation") -- flip
anim9.AnimationId = "rbxassetid://3445806846"

local barrageanim = human:LoadAnimation(anim7)
local strongpunchanim = human:LoadAnimation(anim3)
local rightpunchanim = human:LoadAnimation(anim4)
local leftpunchanim = human:LoadAnimation(anim5)
local rollanim = human:LoadAnimation(anim1)
local axekickanim = human:LoadAnimation(anim6)
local blockanim = human:LoadAnimation(anim2)
local pose1 = human:LoadAnimation(Pose1)
local pose2 = human:LoadAnimation(Pose1)
local kickanim = human:LoadAnimation(anim8)
local flipanim = human:LoadAnimation(anim9)

pose1.Looped = true
pose1.Priority = "Idle"
pose2.Looped = true
pose2.Priority = "Idle"

--Sound
local dodgesfx

if ntorso:FindFirstChild"Dodge" then
	dodgesfx = ntorso.Dodge
	dodgesfx.SoundId = "rbxassetid://1145251796"
else
	dodgesfx = Instance.new("Sound",chr)
	dodgesfx.SoundId = "rbxassetid://1145251796"
	dodgesfx.Volume = 5
end

local punchsfx
if ntorso:FindFirstChild"Swing" then
	punchsfx = ntorso.Swing
	punchsfx.SoundId = "rbxassetid://200632136"
else
	punchsfx = Instance.new("Sound",chr)
	punchsfx.SoundId = "rbxassetid://200632136"
	punchsfx.Volume = 2.5
end
local heavypunchsfx
if ntorso:FindFirstChild"HeavyPunch" then
	heavypunchsfx = ntorso.HeavyPunch
	heavypunchsfx.SoundId = "rbxassetid://2440670891"
else
	heavypunchsfx = Instance.new("Sound",chr)
	heavypunchsfx.SoundId = "rbxassetid://2440670891"
	heavypunchsfx.Volume = 5
end

local rushsfx
if ntorso:FindFirstChild"Rush" then
	rushsfx = ntorso.Rush
	rushsfx.SoundId = "rbxassetid://130767866"
else
	rushsfx = Instance.new("Sound",chr)
	rushsfx.SoundId = "rbxassetid://130767866"
	rushsfx.Volume = 5
end

local blocksfx = dodgesfx

function block()
	if activu == true then return end
	activu = true
	local bep = true
	local de = mouse.KeyUp:connect(function(key)
	    if key == "x" then
	      bep = false
	    end
	end)
	blockanim:Play(0.1, 1,1)
	blockevent:FireServer(true)
	game.ReplicatedStorage.Deflect:FireServer(true)
	--blocksfx:Play()
	human.WalkSpeed = 5
	human.JumpPower = 0
	repeat
		wait()
	until bep == false
	blockevent:FireServer(false)
	   game.ReplicatedStorage.Deflect:FireServer(false)
	blockanim:Stop(0.1)
	human.WalkSpeed = 16
	human.JumpPower = 50
	activu = false
end

local posing = false
local appeared = true
function posefunc()
if activu == false and posing == false then
	if appeared == false then
		return
	end
	if posing == false then do
	activu = true
	posing = true
	local cp = math.random(1, 2)
	if cp == 1 then
		pose1:Play(0.1, 1, 1)
	elseif cp == 2 then
		pose2:Play(0.1, 1, 1)
	end
	human.WalkSpeed = 0
	human.JumpPower = 0
	poseevent:FireServer(true)
	end
	end
	elseif posing == true then
	pose1:Stop(0.3)
	pose2:Stop(0.3)
	if disabled.Value == false then
	human.WalkSpeed = 16
	human.JumpPower = 50
	elseif disabled.Value == true then
	human.WalkSpeed = 4
	human.JumpPower = 10	
	end
	activu = false
	posing = false
	poseevent:FireServer(false)
	end
end

local tauntcd = false
function taunt() -- you can change the taunt go to a abd leak and search a taunt put the id
	if tauntcd == true then return end
	tauntcd = true
	local randomline = math.random(1, 5)
	if randomline == 1 then -- only one taunt atm
		tauntevent:FireServer(head, "rbxassetid://3651526876", 3, 16.95, 0)
	elseif randomline == 2 then
		tauntevent:FireServer(head, "rbxassetid://3651526876", 3, 11.42, 0)
	elseif randomline == 3 then
		tauntevent:FireServer(head, "rbxassetid://3651529648", 3, 13.1, 0)
	elseif randomline == 4 then
		tauntevent:FireServer(head,"rbxassetid://3651526876", 3, 110.75, 0)
elseif randomline == 5 then
tauntevent:FireServer(head, "rbxassetid://3651529648", 10000,15, 0)
		end
	tauntcd = false
end

local leftorright = false
function punch()
if activu == true then return end
	activu = true
	--punchsfx:Play()
	human.JumpPower = 0
	if leftorright == false then
		leftorright = true
		rightpunchanim:Play(0.1, 1, 1)
		--trailevent:FireServer(stand.StandRarm.Trail, true)
		wait(0.2)
		coroutine.resume(coroutine.create(function()
		for _ = 1, 100 do
		wait()
		hito(rightarm, rightarm.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)) ,2.5, 0.5, 0.5, 0.25, hrp.CFrame.lookVector * 10, "rbxassetid://241837157", 0.075, Color3.new(255, 0, 0),"rbxassetid://260430079", math.random(9, 11) / 10, 2)
		end
		end))
	elseif leftorright == true then
		leftorright = false
		leftpunchanim:Play(0.1, 1, 1)
		--trailevent:FireServer(stand.StandLarm.Trail, true)
		wait(0.2)
		coroutine.resume(coroutine.create(function()
		for _ = 1, 5 do
		wait()
		hito(leftarm, leftarm.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)) ,2.5, 0.5, 0.5, 0.25, hrp.CFrame.lookVector * 10, "rbxassetid://241837157", 0.075, Color3.new(255, 0, 0),"rbxassetid://260430079", math.random(9, 11) / 10, 2)
		end
		end))
	end
	wait(0.3)
	human.JumpPower = 50
	activu = false
	--trailevent:FireServer(stand.StandRarm.Trail, false)
	--trailevent:FireServer(stand.StandLarm.Trail, false)
end

local EHMMM = 0
local barragecooldown = false
function barrage()
	if activu == true then return end
	if barragecooldown == true then return end
	activu = true
	barragecooldown = true
	local bep = true
	local de = mouse.KeyUp:connect(function(key)
	    if key == "e" then
	      bep = false
	    end
	end)
	barrageanim:Play(0.1, 1, 1.5)
	--rushsfx:Play()
	repeat
		EHMMM = EHMMM + 1
		--game.ReplicatedStorage.ClonePart:FireServer("FRArm",rightarm,rightarm.BrickColor)
		--game.ReplicatedStorage.ClonePart:FireServer("FLArm",leftarm,leftarm.BrickColor)
		hito3(rightarm, rightarm.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)) ,2, 4, 0.05, 0.25, hrp.CFrame.lookVector * 5, "rbxassetid://241837157", 0.075, Color3.fromRGB(177, 85, 255),"rbxassetid://542443306", math.random(9, 11) / 10, math.random(9, 11) / 20)
		hito3(leftarm, leftarm.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)) ,2, 4, 0.05, 0.25, hrp.CFrame.lookVector * 5, "rbxassetid://241837157", 0.075, Color3.fromRGB(177, 85, 255),"rbxassetid://542443306", math.random(9, 11) / 10, math.random(9, 11) / 20)		
		wait(0.1)
	until bep == false or disabled.Value == true or EHMMM >= 50
	--rushsfx:Stop()
	barrageanim:Stop(0.1)
	activu = false
	EHMMM = 0
	wait(3) -- cooldown
	barragecooldown = false
end

strongpunchcooldown = false
function strongpunch()
if activu == true then return end
if dodgecooldown == true then return end
	activu = true
	strongpunchcooldown = true
	strongpunchanim:Play(0.1, 1,1)
	--dodgesfx:Play()
	human.JumpPower = 0
	local boopyve = Instance.new("BodyVelocity")
    boopyve.MaxForce = Vector3.new(100000, 0, 100000)
    boopyve.P = math.huge
    boopyve.Velocity = hrp.CFrame.lookVector * 17.5
    boopyve.Parent = chr.HumanoidRootPart
	game.Debris:AddItem(boopyve, 0.5)
	coroutine.resume(coroutine.create(function()
	repeat
		wait()
		boopyve.Velocity = hrp.CFrame.lookVector * 17.5
	until bep == false
	end))
	wait(0.15)
	coroutine.resume(coroutine.create(function()
	for _ = 1, 7.5 do
		wait()
hito(rightarm, rightarm.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)) ,5, 5, 0.375, 0.25, hrp.CFrame.lookVector * 5, "rbxassetid://241837157", 0.1, Color3.new(255, 0, 0),"rbxassetid://260430079", math.random(9, 11) / 10, math.random(9, 11) / 10)
	end
	end))
	wait(0.35)
	strongpunchevent:FireServer(Vector3.new(1, 0.5, 1), Vector3.new(0.3, 0.15, 0.3), BrickColor.new("Crimson"))
	coroutine.resume(coroutine.create(function()
	for _ = 1, 7.5 do
		wait()
		hito2(rightarm, rightarm.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)) ,7.5, 10, 0.375, 0.25, hrp.CFrame.lookVector * 62.5 + Vector3.new(0,37.5,0), "rbxassetid://241837157", 0.15, Color3.new(255, 0, 0),"rbxassetid://260430079", math.random(9, 11) / 10, math.random(9, 11) / 10)
	end
	end))
	wait(0.5)
	activu = false
	human.JumpPower = 50
	wait(7.5) -- cooldown
	strongpunchcooldown = false	
end

local kickcooldown = false
function kick()
	if activu == true then return end
	if kickcooldown == true then return end
	activu = true
	kickcooldown = true
	--trailevent:FireServer(stand.StandRarm.Trail, true)
	kickanim:Play(0.1, 1, 1)
	--heavypunchsfx:Play()
	human.JumpPower = 0
	wait(0.4)
	--punchsfx:Play()
	coroutine.resume(coroutine.create(function()
	for _ = 1, 15 do
		wait()
hito2(rightleg, rightleg.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)) ,5, 7.5, 0.6, 0.25, hrp.CFrame.lookVector * 5, "rbxassetid://241837157", 0.1, Color3.new(255, 0, 0),"rbxassetid://386946017", math.random(9, 11) / 10, math.random(9, 11) / 10)
	end
	end))
	wait(0.25)
	--trailevent:FireServer(stand.StandRarm.Trail, false)
	human.JumpPower = 50
	activu = false
	wait(7.5)
	kickcooldown = false
end

local axekickcooldown = false
function axekick()
	if activu == true then return end
	if axekickcooldown == true then return end
	activu = true
	axekickcooldown = true
	--trailevent:FireServer(stand.StandRarm.Trail, true)
	axekickanim:Play(0.1, 1, 1)
	--heavypunchsfx:Play()
	human.JumpPower = 0
	human.WalkSpeed = 30
	wait(0.35)
	--punchsfx:Play()
	jumpevent:FireServer(BrickColor.new("Crimson"))
	coroutine.resume(coroutine.create(function()
	for _ = 1, 10 do
		wait()
hito2(rot, rot.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)) ,12.5, 17.5, 0.4, 0.25, hrp.CFrame.lookVector * 82.5, "rbxassetid://241837157", 0.25, Color3.new(255, 0, 0),"rbxassetid://260430079", math.random(9, 11) / 10, math.random(9, 11) / 10)
	end
	end))
	wait(0.25)
	--trailevent:FireServer(stand.StandRarm.Trail, false)
	human.JumpPower = 50
	human.WalkSpeed = 16
	activu = false
	wait(7.5)
	axekickcooldown = false
end

local donutcooldown = false
function donut()
	if activu == true then return end
	if donutcooldown == true then return end
	if mouse.Target and mouse.Target.Parent:FindFirstChild("Humanoid") then
		local horp = mouse.Target.Parent:FindFirstChild("HumanoidRootPart")
		local magnitude = (horp.Position - hrp.Position).magnitude
		donutcooldown = true
		local char = mouse.Target.Parent
		donutevent:FireServer(char, 50)
		   wait(.1)
		wait() -- cooldown
		donutcooldown = false
	end
end 

dodgecooldown = false
function dodge()
if activu == true then return end
if dodgecooldown == true then return end
	activu = true
	dodgecooldown = true
	rollanim:Play(0.1, 1,1)
	--dodgesfx:Play()
	human.JumpPower = 0
	dodgeevent:FireServer()
	local boopyve = Instance.new("BodyVelocity")
    boopyve.MaxForce = Vector3.new(500000, 500000, 500000)
    boopyve.P = math.huge
    boopyve.Velocity = hrp.CFrame.lookVector * 37.5
    boopyve.Parent = chr.HumanoidRootPart
	game.Debris:AddItem(boopyve, 0.5)
	wait(0.4)
	activu = false
	human.JumpPower = 50
	rollanim:Stop()
	wait(0.1) -- cooldown
	dodgecooldown = false	
end

local flipcooldown = false
local EHMM = 0
function flip()
if disabled.Value == true then return end
if disabled == true then return end
if activu == true then return end
if flipcooldown == true then return end
	activu = true
	movementcooldown = true
	flipanim:Play()
	local bep = true
	local de = mouse.KeyUp:connect(function(key)
	    if key == "t" then
	      bep = false
	    end
	end)
	local boopyve = Instance.new("BodyVelocity")
    boopyve.MaxForce = Vector3.new(100000, 100000, 100000)
    boopyve.P = math.huge
    boopyve.Velocity = hrp.CFrame.lookVector * 32.5
    boopyve.Parent = chr.HumanoidRootPart
	repeat
		wait()
		EHMM = EHMM + 1
		boopyve.Velocity = hrp.CFrame.lookVector * 32.5
hito(rightleg, rightleg.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)) ,5, 0.01, 0.005, 0.25, hrp.CFrame.lookVector * 5, "rbxassetid://241837157", 0.075, Color3.new(255, 0, 0),"rbxassetid://386946017", math.random(9, 11) / 10, math.random(9, 11) / 10)
	until bep == false or EHMM >= 27.5
	boopyve:Destroy()
	activu = false	
	flipanim:Stop()
	EHMM = 0
	wait(7.5)
	flipcooldown = false
end

mouse.Button1Down:connect(function()
if ntorso.Anchored == true then return end
if disabled.Value == true then return end
	punch()
end)
mouse.KeyDown:connect(function(key)
if ntorso.Anchored == true then return end
if disabled.Value == true then return end
	if key == "q" then
		kick()
	end
	if key == "e" then
		barrage()
	end
	if key == "r" then
		strongpunch()
	end
	if key == "t" then
		flip()
	end
	if key == "y" then
		axekick()
	end
	if key == "x" then
		block()
	end
	if key == "f" then
		donut()
	end
	if key == "c" then
		dodge()
	end
	if key == "g" then
		posefunc()
	end
	if key == "n" then
		taunt()
	end
end)


function hito3(partoz, partcfr, magn, dmg, debtim, debtime, bodyfdire, effect, grow, color, sound, pitch, volume)
  for _, guy in pairs(workspace.Entities:GetChildren()) do
	if partoz.Anchored == true then return end
    if guy:FindFirstChild("Humanoid") and guy:FindFirstChild("HumanoidRootPart") and guy ~= chr and magn > (guy:FindFirstChild("HumanoidRootPart").Position - partoz.Position).magnitude and guy:FindFirstChild("HumanoidRootPart"):FindFirstChild("alabo") == nil then
      do
		if partoz.Anchored then return end
        local humz = guy:FindFirstChild("Humanoid")
        local horp = guy:FindFirstChild("HumanoidRootPart")
        damageevent:FireServer(humz, partcfr, dmg, debtime, bodyfdire, effect, grow, color, sound, pitch, volume)
        local db = Instance.new("StringValue")
        db.Name = "alabo"
        db.Parent = horp
        delay(debtim, function()
          db:Destroy()
        end)
      end
    end

	if guy:FindFirstChild("Stand") and guy["Stand"]:FindFirstChild("Stand Torso") and guy ~= chr and guy ~= chr[stand.Name] and magn > (guy["Stand"]:FindFirstChild("Stand Torso").Position - partoz.Position).magnitude and guy:FindFirstChild("HumanoidRootPart"):FindFirstChild("alabo") == nil then
		do 
		if partoz.Anchored then return end
        local humz = guy:FindFirstChild("Humanoid")
        local horp = guy:FindFirstChild("HumanoidRootPart")
        local humz = chr.Humanoid
        damageevent:FireServer(humz, partcfr, dmg, debtime, bodyfdire, effect, grow, color, sound, pitch, volume)
        local db = Instance.new("StringValue")
        db.Name = "alabo"
        db.Parent = horp
        delay(debtim, function()
          db:Destroy()
        end)
      end
    end

  end
end

function hito(partoz, partcfr, magn, dmg, debtim, debtime, bodyfdire, effect, grow, color, sound, pitch, volume)
  for _, guy in pairs(workspace.Entities:GetChildren()) do
	if partoz.Anchored == true then return end
    if guy:FindFirstChild("Humanoid") and guy:FindFirstChild("HumanoidRootPart") and guy ~= chr and magn > (guy:FindFirstChild("HumanoidRootPart").Position - partoz.Position).magnitude and guy:FindFirstChild("HumanoidRootPart"):FindFirstChild("alabo") == nil then
      do
		if partoz.Anchored then return end
        local humz = guy:FindFirstChild("Humanoid")
        local horp = guy:FindFirstChild("HumanoidRootPart")
        damageevent2:FireServer(humz, partcfr, dmg, debtime, bodyfdire, effect, grow, color, sound, pitch, volume)
        local db = Instance.new("StringValue")
        db.Name = "alabo"
        db.Parent = horp
        delay(debtim, function()
          db:Destroy()
        end)
      end
    end

	if guy:FindFirstChild("Stand") and guy["Stand"]:FindFirstChild("Stand Torso") and guy ~= chr and guy ~= chr[stand.Name] and magn > (guy["Stand"]:FindFirstChild("Stand Torso").Position - partoz.Position).magnitude and guy:FindFirstChild("HumanoidRootPart"):FindFirstChild("alabo") == nil then
		do 
		if partoz.Anchored then return end
        local humz = guy:FindFirstChild("Humanoid")
        local horp = guy:FindFirstChild("HumanoidRootPart")
        local humz = chr.Humanoid
        damageevent2:FireServer(humz, partcfr, dmg, debtime, bodyfdire, effect, grow, color, sound, pitch, volume)
        local db = Instance.new("StringValue")
        db.Name = "alabo"
        db.Parent = horp
        delay(debtim, function()
          db:Destroy()
        end)
      end
    end

  end
end
function hito2(partoz, partcfr, magn, dmg, debtim, debtime, bodyfdire, effect, grow, color, sound, pitch, volume)
  for _, guy in pairs(workspace.Entities:GetChildren()) do
	if partoz.Anchored == true then return end
    if guy:FindFirstChild("Humanoid") and guy:FindFirstChild("HumanoidRootPart") and guy ~= chr and magn > (guy:FindFirstChild("HumanoidRootPart").Position - partoz.Position).magnitude and guy:FindFirstChild("HumanoidRootPart"):FindFirstChild("alabo") == nil then
      do
		if partoz.Anchored then return end
        local humz = guy:FindFirstChild("Humanoid")
        local horp = guy:FindFirstChild("HumanoidRootPart")
        for a =1,100 do
        damageevent2:FireServer(humz, partcfr, dmg, debtime, bodyfdire, effect, grow, color, sound, pitch, volume)
        end
        knockevent:FireServer(humz)
		local db = Instance.new("StringValue")
        db.Name = "alabo"
        db.Parent = horp
        delay(debtim, function()
          db:Destroy()
        end)
      end
    end

	if guy:FindFirstChild("Stand") and guy["Stand"]:FindFirstChild("Stand Torso") and guy ~= chr and guy ~= chr[stand.Name] and magn > (guy["Stand"]:FindFirstChild("Stand Torso").Position - partoz.Position).magnitude and guy:FindFirstChild("HumanoidRootPart"):FindFirstChild("alabo") == nil then
		do 
		if partoz.Anchored then return end
        local humz = guy:FindFirstChild("Humanoid")
        local horp = guy:FindFirstChild("HumanoidRootPart")
        damageevent2:FireServer(humz, partcfr, dmg, debtime, bodyfdire, effect, grow, color, sound, pitch, volume)
		knockevent:FireServer(humz)        
		local db = Instance.new("StringValue")
        db.Name = "alabo"
        db.Parent = horp
        delay(debtim, function()
          db:Destroy()
        end)
      end
    end

  end
end
game.Lighting.TS.Changed:Connect(function()
	if game.Lighting.TS.Value == true then
	   wait()
	anchorevent:FireServer(ntorso ,false)
	anchorevent:FireServer(rightarm ,false)
	anchorevent:FireServer(leftarm ,false)
	anchorevent:FireServer(rightleg ,false)
	anchorevent:FireServer(leftleg ,false)
	anchorevent:FireServer(head ,false)
	
	elseif game.Lighting.TS.Value == false then
	anchorevent:FireServer(ntorso ,false)
	anchorevent:FireServer(rightarm ,false)
	anchorevent:FireServer(leftarm ,false)
	anchorevent:FireServer(rightleg ,false)
	anchorevent:FireServer(leftleg ,false)
	anchorevent:FireServer(head ,false)
	end
end)

if game.Lighting.TS.Value == true then
	anchorevent:FireServer(ntorso ,false)
	anchorevent:FireServer(rightarm ,false)
	anchorevent:FireServer(leftarm ,false)
	anchorevent:FireServer(rightleg ,false)
	anchorevent:FireServer(leftleg ,false)
	anchorevent:FireServer(head ,false)
end

berserkclientevent.OnClientEvent:connect(function()
	game.Lighting.Ambient = Color3.fromRGB(0, 0, 122)
	game.Lighting.Berserk.Enabled = true
	human.WalkSpeed = 30
	human:SetStateEnabled(3, false)
	wait(0.1)
	human.WalkSpeed = 30
	human:SetStateEnabled(3, true)
	game.Lighting.Ambient = Color3.fromRGB(150, 150, 150)
	game.Lighting.Berserk.Enabled = false
end)

local deathevent = replicatedstorage.Death
human.HealthChanged:connect(function()
	if human.Health < 1 then
		human:SetStateEnabled(3, false)
		human:SetStateEnabled(15, false)
		   disabled.Value = true
		deathevent:FireServer(false)
	end
end)

knockclientevent.OnClientEvent:connect(function(enemyplr)
	if chr.Block.Value == false then return end
	knockedevent:FireServer()
	human:SetStateEnabled(3, false)
	wait(1.25)
	if human.Health >= 1 then
	getupevent:FireServer()
	human:SetStateEnabled(3, true)
	end
end)