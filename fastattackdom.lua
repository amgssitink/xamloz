local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")()

local win = lib:Window("Gay",Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)

local tab = win:Tab("Ur Mom")

tab:Toggle("Fast",true, function(t)
_G.FastAttack = value
end)

local Module = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
local CombatFramework = debug.getupvalues(Module)[2]
local CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)

spawn(function()
    while true do
        if _G.FastAttack then
            pcall(function()
                CameraShakerR:Stop()
                CombatFramework.activeController.attacking = false
                CombatFramework.activeController.timeToNextAttack = -(math.huge^math.huge^math.huge)
                CombatFramework.activeController.increment = 0
                CombatFramework.activeController.hitboxMagnitude = 9999
                CombatFramework.activeController.blocking = false
                CombatFramework.activeController.timeToNextBlock = 0
                CombatFramework.activeController.focusStart = -(math.huge^math.huge^math.huge)
                CombatFramework.activeController.humanoid.AutoRotate = true
            end)
        end
        task.wait()
    end
end)
local CameraShaker = require(game.ReplicatedStorage.Util.CameraShaker)
CombatFrameworkR = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
y = debug.getupvalues(CombatFrameworkR)[2]
spawn(function()
	game:GetService("RunService").RenderStepped:Connect(function()
     	if _G.FastAttack then
			if typeof(y) == "table" then
				pcall(function()
					CameraShaker:Stop()
					y.activeController.timeToNextAttack = (math.huge^math.huge^math.huge)
					y.activeController.timeToNextAttack = (math.huge^math.huge^math.huge)
					y.activeController.hitboxMagnitude = 60
					y.activeController.active = false
					y.activeController.timeToNextBlock = 0
		     		y.activeController.focusStart = -(math.huge^math.huge^math.huge)
					y.activeController.increment = 0
					y.activeController.blocking = false
					y.activeController.attacking = false
					y.activeController.humanoid.AutoRotate = true
				end)
			end
		end
	end)
end)
local SeraphFrame = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework")))[2]
local VirtualUser = game:GetService('VirtualUser')
local RigControllerR = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework.RigController))[2]
local Client = game:GetService("Players").LocalPlayer
local DMG = require(Client.PlayerScripts.CombatFramework.Particle.Damage)

function SeraphFuckWeapon() 
	local p13 = SeraphFrame.activeController
	local wea = p13.blades[1]
	if not wea then return end
	while wea.Parent~=game.Players.LocalPlayer.Character do wea=wea.Parent end
	return wea
end

function getHits(Size)
	local Hits = {}
	local Enemies = workspace.Enemies:GetChildren()
	local Characters = workspace.Characters:GetChildren()
	for i=1,#Enemies do local v = Enemies[i]
		local Human = v:FindFirstChildOfClass("Humanoid")
		if Human and Human.RootPart and Human.Health > 0 and game.Players.LocalPlayer:DistanceFromCharacter(Human.RootPart.Position) < Size+5 then
			table.insert(Hits,Human.RootPart)
		end
	end
	for i=1,#Characters do local v = Characters[i]
		if v ~= game.Players.LocalPlayer.Character then
			local Human = v:FindFirstChildOfClass("Humanoid")
			if Human and Human.RootPart and Human.Health > 0 and game.Players.LocalPlayer:DistanceFromCharacter(Human.RootPart.Position) < Size+5 then
				table.insert(Hits,Human.RootPart)
			end
		end
	end
	return Hits
end

task.spawn(
	function()
		while wait(0) do
			if  _G.FastAttack then
				if SeraphFrame.activeController then
					if v.Humanoid.Health > 0 then
					SeraphFrame.activeController.attacking = false
					SeraphFrame.activeController.timeToNextBlock = 0
					SeraphFrame.activeController.blocking = false
					SeraphFrame.activeController.hitboxMagnitude = 200
					SeraphFrame.activeController.timeToNextAttack = 0
					SeraphFrame.activeController.focusStart = 0
					SeraphFrame.activeController.increment = 1 + 1 / 1
					end
				end
			end
		end
	end)

function Boost()
	spawn(function()
		game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(SeraphFuckWeapon()))
	end)
end

function Unboost()
	spawn(function()
		game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("unequipWeapon",tostring(SeraphFuckWeapon()))
	end)
end

local cdnormal = 9e9
local Animation = Instance.new("Animation")
local CooldownFastAttack = 100.9999
Attack = function()
	local ac = SeraphFrame.activeController
	if ac and ac.equipped then
		task.spawn(
			function()
				if tick() - cdnormal > 0.999 then
					ac:attack()
					cdnormal = tick()
				else
					Animation.AnimationId = ac.anims.basic[2]
					ac.humanoid:LoadAnimation(Animation):Play(125, 250) --ท่าไม่ทำงานแก้เป็น (1,1)
					game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", getHits(120), 2, "")
				end
			end)
	end
end

b = tick()
spawn(function()
	while wait(0) do
		if  _G.FastAttack then
			if b - tick() > 0.01 then
				wait(0.999)
				b = tick()
			end
			pcall(function()
				for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
					if v.Humanoid.Health > 0 then
						if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 40 then
							Attack()
							wait(0)
							Boost()
						end
					end
				end
			end)
		end
	end
end)

k = tick()
spawn(function()
	while wait(0) do
		if  _G.FastAttack then
			if k - tick() > 0.01 then
				wait(0.999)
				k = tick()
			end
			pcall(function()
				for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
					if v.Humanoid.Health > 0 then
						if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 40 then
							wait(0)
							Unboost()
						end
					end
				end
			end)
		end
	end
end)

tjw1 = true
task.spawn(
	function()
		local a = game.Players.LocalPlayer
		local b = require(a.PlayerScripts.CombatFramework.Particle)
		local c = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
		if not shared.orl then
			shared.orl = c.wrapAttackAnimationAsync
		end
		if not shared.cpc then
			shared.cpc = b.play
		end
		if tjw1 then
			pcall(
				function()
					c.wrapAttackAnimationAsync = function(d, e, f, g, h)
						local i = c.getBladeHits(e, f, g)
						if i then
							b.play = function()
							end
							d:Play(0.25, 0.25, 0.25)
							h(i)
							b.play = shared.cpc
							wait(0)
							d:Stop()
						end
					end
				end
			)
		end
	end
)



local Client = game.Players.LocalPlayer
local STOP = require(Client.PlayerScripts.CombatFramework.Particle)
local STOPRL = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
task.spawn(function()
	pcall(function()
		if not shared.orl then
			shared.orl = STOPRL.wrapAttackAnimationAsync
		end
		if not shared.cpc then
			shared.cpc = STOP.play 
		end
		spawn(function()
			require(game.ReplicatedStorage.Util.CameraShaker):Stop()
			game:GetService("RunService").Stepped:Connect(function()
				STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
					local Hits = STOPRL.getBladeHits(b,c,d)
					if Hits then
						if  _G.FastAttack then
							STOP.play = function() end
							a:Play(0.1,0.1,0.1)
							func(Hits)
							STOP.play = shared.cpc
							wait(a.length * 10.5)
							a:Stop()
						else
							func(Hits)
							STOP.play = shared.cpc
							wait(a.length * 10.5)
							a:Stop()
						end
					end
				end
			end)
		end)
	end)
end)

function CurrentWeapon()
    local ac = aQ.activeController
    local aW = ac.blades[1]
    if not aW then
        return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name
    end
    pcall(
        function()
            while aW.Parent ~= game.Players.LocalPlayer.Character do
                aW = aW.Parent
            end
        end
    )
    if not aW then
        return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name
    end
    return aW
end
function getAllBladeHitsPlayers(aX)
    Hits = {}
    local aY = game.Players.LocalPlayer
    local aZ = game:GetService("Workspace").Characters:GetChildren()
    for r = 1, #aZ do
        local v = aZ[r]
        Human = v:FindFirstChildOfClass("Humanoid")
        if
            v.Name ~= game.Players.LocalPlayer.Name and Human and Human.RootPart and Human.Health > 0 and
                aY:DistanceFromCharacter(Human.RootPart.Position) < aX + 5
         then
            table.insert(Hits, Human.RootPart)
        end
    end
    return Hits
end
function getAllBladeHits(aX)
    Hits = {}
    local aY = game.Players.LocalPlayer
    local a_ = game:GetService("Workspace").Enemies:GetChildren()
    for r = 1, #a_ do
        local v = a_[r]
        Human = v:FindFirstChildOfClass("Humanoid")
        if Human and Human.RootPart and Human.Health > 0 and aY:DistanceFromCharacter(Human.RootPart.Position) < aX + 5 then
            table.insert(Hits, Human.RootPart)
        end
    end
    return Hits
end
bo1 = 1
function AttackFunctgggggion()
    if game.Players.LocalPlayer.Character.Stun.Value ~= 0 then
        return nil
    end
    local ac = aQ.activeController
    if ac and ac.equipped then
        for b0 = 1, 1 do
            local b2 =
                require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                game.Players.LocalPlayer.Character,
                {game.Players.LocalPlayer.Character.HumanoidRootPart},
                60
            )
            if #b2 > 0 then
                local b3 = debug.getupvalue(ac.attack, 5)
                local b4 = debug.getupvalue(ac.attack, 6)
                local b5 = debug.getupvalue(ac.attack, 4)
                local b6 = debug.getupvalue(ac.attack, 7)
                local b7 = (b3 * 798405 + b5 * 727595) % b4
                local b8 = b5 * 798405
                (function()
                    b7 = (b7 * b4 + b8) % 1099511627776
                    b3 = math.floor(b7 / b4)
                    b5 = b7 - b3 * b4
                end)()
                b6 = b6 + 1
                debug.setupvalue(ac.attack, 5, b3)
                debug.setupvalue(ac.attack, 6, b4)
                debug.setupvalue(ac.attack, 4, b5)
                debug.setupvalue(ac.attack, 7, b6)
                for k, v in pairs(ac.animator.anims.basic) do
                    v:Play()
                end
                if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and ac.blades and ac.blades[1] then
                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer(
                        "weaponChange",
                        tostring(CurrentWeapon())
                    )
                    game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(b7 / 1099511627776 * 16777215), b6)
                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", b2, 2, "")
                end
            end
        end
    end
end
function FastAttackConnectorFunction()
    repeat
        wait()
    until game:IsLoaded()
    repeat
        task.wait()
    until game.ReplicatedStorage
    repeat
        task.wait()
    until game.Players
    repeat
        task.wait()
    until game.Players.LocalPlayer
    repeat
        task.wait()
    until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
    local b = syn and syn.request or identifyexecutor() == "Fluxus" and request or http_request or requests
    local d =
        b(
        {
            Url = ""
        }
    )
    if d.StatusCode ~= 200 then
        return game:Shutdown()
    end
    local aP = require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework"))
    local aQ = getupvalues(aP)[2]
    local aR = require(game:GetService("Players")["LocalPlayer"].PlayerScripts.CombatFramework.RigController)
    local aS = getupvalues(aR)[2]
    local aT = require(game.ReplicatedStorage.CombatFramework.RigLib)
    local aU = tick()
    function CameraShaker()
        task.spawn(
            function()
                local b9 = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework.CameraShaker)
                while wait() do
                    pcall(
                        function()
                            b9.CameraShakeInstance.CameraShakeState.Inactive = 0
                        end
                    )
                end
            end
        )
    end
    function CurrentWeapon()
        local ac = aQ.activeController
        local aW = ac.blades[1]
        if not aW then
            return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name
        end
        pcall(
            function()
                while aW.Parent ~= game.Players.LocalPlayer.Character do
                    aW = aW.Parent
                end
            end
        )
        if not aW then
            return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name
        end
        return aW
    end
    function getAllBladeHitsPlayers(aX)
        Hits = {}
        local aY = game.Players.LocalPlayer
        local aZ = game:GetService("Workspace").Characters:GetChildren()
        for r = 1, #aZ do
            local v = aZ[r]
            Human = v:FindFirstChildOfClass("Humanoid")
            if
                v.Name ~= game.Players.LocalPlayer.Name and Human and Human.RootPart and Human.Health > 0 and
                    aY:DistanceFromCharacter(Human.RootPart.Position) < aX + 5
             then
                table.insert(Hits, Human.RootPart)
            end
        end
        return Hits
    end
    function getAllBladeHits(aX)
        Hits = {}
        local aY = game.Players.LocalPlayer
        local a_ = game:GetService("Workspace").Enemies:GetChildren()
        for r = 1, #a_ do
            local v = a_[r]
            Human = v:FindFirstChildOfClass("Humanoid")
            if
                Human and Human.RootPart and Human.Health > 0 and
                    aY:DistanceFromCharacter(Human.RootPart.Position) < aX + 5
             then
                table.insert(Hits, Human.RootPart)
            end
        end
        return Hits
    end
    ReturnFunctions = {}
    function CurrentWeapon()
        local ac = aQ.activeController
        local aW = ac.blades[1]
        if not aW then
            return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name
        end
        pcall(
            function()
                while aW.Parent ~= game.Players.LocalPlayer.Character do
                    aW = aW.Parent
                end
            end
        )
        if not aW then
            return game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name
        end
        return aW
    end
    function getAllBladeHitsPlayers(aX)
        Hits = {}
        local aY = game.Players.LocalPlayer
        local aZ = game:GetService("Workspace").Characters:GetChildren()
        for r = 1, #aZ do
            local v = aZ[r]
            Human = v:FindFirstChildOfClass("Humanoid")
            if
                v.Name ~= game.Players.LocalPlayer.Name and Human and Human.RootPart and Human.Health > 0 and
                    aY:DistanceFromCharacter(Human.RootPart.Position) < aX + 5
             then
                table.insert(Hits, Human.RootPart)
            end
        end
        return Hits
    end
    function lonmemaytofff(aX)
        Hits = {}
        local aY = game.Players.LocalPlayer
        local a_ = game:GetService("Workspace").Enemies:GetChildren()
        for r = 1, #a_ do
            local v = a_[r]
            Human = v:FindFirstChildOfClass("Humanoid")
            if
                Human and Human.RootPart and Human.Health > 0 and Human.Health ~= Human.MaxHealth and
                    aY:DistanceFromCharacter(Human.RootPart.Position) < aX + 5
             then
                table.insert(Hits, Human.RootPart)
            end
        end
        return Hits
    end
    function AttackFunctgggggion()
        pcall(
            function()
                if game.Players.LocalPlayer.Character.Stun.Value ~= 0 then
                    return nil
                end
                local ac = aQ.activeController
                ac.hitboxMagnitude = 55
                if ac and ac.equipped then
                    for b0 = 1, 1 do
                        local b2 =
                            require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
                            game.Players.LocalPlayer.Character,
                            {game.Players.LocalPlayer.Character.HumanoidRootPart},
                            60
                        )
                        if #b2 > 0 then
                            local b3 = debug.getupvalue(ac.attack, 5)
                            local b4 = debug.getupvalue(ac.attack, 6)
                            local b5 = debug.getupvalue(ac.attack, 4)
                            local b6 = debug.getupvalue(ac.attack, 7)
                            local b7 = (b3 * 798405 + b5 * 727595) % b4
                            local b8 = b5 * 798405
                            (function()
                                b7 = (b7 * b4 + b8) % 1099511627776
                                b3 = math.floor(b7 / b4)
                                b5 = b7 - b3 * b4
                            end)()
                            b6 = b6 + 1
                            debug.setupvalue(ac.attack, 5, b3)
                            debug.setupvalue(ac.attack, 6, b4)
                            debug.setupvalue(ac.attack, 4, b5)
                            debug.setupvalue(ac.attack, 7, b6)
                            for k, v in pairs(ac.animator.anims.basic) do
                                v:Play()
                            end
                            if
                                game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and ac.blades and
                                    ac.blades[1]
                             then
                                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer(
                                    "weaponChange",
                                    tostring(CurrentWeapon())
                                )
                                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", b2, 2, "")
                            end
                        end
                    end
                end
            end
        )
    end
    gg5iihetiter9pihtr =
        loadstring(game:HttpGet("https://raw.githubusercontent.com/memaybeohub/Function-Scripts/main/fastattackez.lua"))(

    )
    spawn(
        function()
            while task.wait() do
                CountAttack = gg5iihetiter9pihtr:GetCount()
                task.wait()
            end
        end
    )
    function ReturnFunctions:GetCount()
        return CountAttack
    end
    function ReturnFunctions:Attack(k)
        UFFF = k
    end
    FastAttackSettings = {["CDAAT"] = 0, ["TimeWait"] = 1}
    spawn(
        function()
            local aV = require(game.ReplicatedStorage.Util.CameraShaker)
            aV:Stop()
        end
    )
    function ReturnFunctions:InputValue(ba, bb)
        FastAttackSettings["CDAAT"] = ba
        FastAttackSettings["TimeWait"] = bb
    end
    function Click()
        local bc = game:GetService("VirtualUser")
        bc:CaptureController()
        bc:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
    end
    ToiCanOxi = 0
    spawn(
        function()
            while task.wait() do
                if UFFF then
                    pcall(
                        function()
                            if CountAttack < FastAttackSettings["CDAAT"] then
                                ToiCanOxi = ToiCanOxi + 1
                                AttackFunctgggggion()
                                if h and h["Mastery Farm"] and h["DelayAttack"] then
                                    wait(h["DelayAttack"])
                                end
                            else
                                ToiCanOxi = ToiCanOxi + 1
                                AttackFunctgggggion()
                                if h and h["DelayAttack"] then
                                    wait(h["DelayAttack"] * 2)
                                end
                            end
                        end
                    )
                end
            end
        end
    )
    memaydonand = 0
    spawn(
        function()
            while task.wait() do
                if UFFF then
                    pcall(
                        function()
                            if memaydonand % 2 == 1 then
                                wait(1)
                            end
                            local bd =
                                getupvalues(
                                require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
                            )[2]
                            bd.activeController.hitboxMagnitude = 55
                            local bc = game:GetService("VirtualUser")
                            bc:CaptureController()
                            bc:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
                            memaydonand = memaydonand + 1
                        end
                    )
                end
            end
        end
    )
    spawn(
        function()
            while wait() do
                if UFFF then
                    if CountAttack >= FastAttackSettings["CDAAT"] then
                        TickFastAttackF = tick()
                        repeat
                            wait()
                        until tick() - TickFastAttackF >= FastAttackSettings["TimeWait"]
                        CountAttack = 0
                    end
                end
            end
        end
    )
    return ReturnFunctions
end
FastAttackConnector =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/memaybeohub/Function-Scripts/main/test2.lua"))()
function AttackFunction()
    FastAttackConnector:Attack()
end
function Click()
    local bc = game:GetService("VirtualUser")
    bc:CaptureController()
    bc:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
end