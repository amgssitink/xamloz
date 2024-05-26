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
local SuperFastMode = true
local plr = game.Players.LocalPlayer
local CbFw = debug.getupvalues(require(plr.PlayerScripts.CombatFramework))
local CbFw2 = CbFw[2]

function GetCurrentBlade() 
    local p13 = CbFw2.activeController
    local ret = p13.blades[1]
    if not ret then return end
    while ret.Parent~=game.Players.LocalPlayer.Character do ret=ret.Parent end
    return ret
end
function AttackNoCD() 
    local AC = CbFw2.activeController
    for i = 1, 1 do 
        local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
            plr.Character,
            {plr.Character.HumanoidRootPart},
            60
        )
        local cac = {}
        local hash = {}
        for k, v in pairs(bladehit) do
            if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                table.insert(cac, v.Parent.HumanoidRootPart)
                hash[v.Parent] = true
            end
        end
        bladehit = cac
        if #bladehit > 0 then
            local u8 = debug.getupvalue(AC.attack, 5)
            local u9 = debug.getupvalue(AC.attack, 6)
            local u7 = debug.getupvalue(AC.attack, 4)
            local u10 = debug.getupvalue(AC.attack, 7)
            local u12 = (u8 * 798405 + u7 * 727595) % u9
            local u13 = u7 * 798405
            (function()
                u12 = (u12 * u9 + u13) % 1099511627776
                u8 = math.floor(u12 / u9)
                u7 = u12 - u8 * u9
            end)()
            u10 = u10 + 1
            debug.setupvalue(AC.attack, 5, u8)
            debug.setupvalue(AC.attack, 6, u9)
            debug.setupvalue(AC.attack, 4, u7)
            debug.setupvalue(AC.attack, 7, u10)
            pcall(function()
                for k, v in pairs(AC.animator.anims.basic) do
                    v:Play()
                end                  
            end)
            if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then 
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
                game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "") 
            end
        end
    end
end
local cac
if SuperFastMode then 
	cac=task.wait
else
	cac=wait
end
while cac() do 
	AttackNoCD()
end