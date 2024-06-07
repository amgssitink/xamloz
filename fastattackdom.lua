local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")()

local win = lib:Window("Gay",Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)

local tab = win:Tab("Ur Mom")

tab:Toggle("Fast",true, function(t)
_G.FastAttack = state
end)

local yedkuy112 = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework.CameraShaker)
local VirtualUser = game:GetService('VirtualUser')
local yedhee = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)

spawn(function()
    while wait() do
        if setscriptable then
            setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
            game.Players.LocalPlayer.SimulationRadius = math.huge * math.huge, math.huge * math.huge * 1 / 0 * 1 / 0 * 1 / 0 * 1 / 0 * 1 / 0
        end
    end
end)]]
spawn(function()
	game:GetService("RunService").Stepped:Connect(function()
		pcall(function()
			local yedkuy112 = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework.CameraShaker)
			local VirtualUser = game:GetService('VirtualUser')
			local yedhee = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
            yedkuy112.CameraShakeInstance.CameraShakeState.Inactive = 0
            yedhee.activeController.hitboxMagnitude = 55
			if _G.FastAttack then
                if startATkmOb and (_G.AutoFarm or _G.autoSea2 or _G.autoSea3 or _G.BuddySword or raidiing) then
                    if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") then
                        yedhee.activeController.timeToNextAttack = 3
                    else
                        yedhee.activeController.timeToNextAttack = -(math.huge^math.huge)
                    end
                    yedhee.activeController.attacking = false
                    yedhee.activeController.increment = 3
                    if yedhee.activeController:attack() then
                        yedhee.activeController:attack()
                    end
                    yedhee.activeController.blocking = false
                    yedhee.activeController.timeToNextBlock = 0
                    game.Players.LocalPlayer.Character.Stun.Value = 0
                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                    yedhee.activeController.timeToNextAttack = 0
                    yedhee.activeController.attacking = false
                    yedhee.activeController.blocking = false
                    yedhee.activeController.timeToNextAttack = 0
                    yedhee.activeController.timeToNextBlock = 0
                    yedhee.activeController.increment = 3
                    yedhee.activeController.hitboxMagnitude = 55
                    yedhee.activeController.focusStart = 0
                    if yedhee.activeController:attack() then
                        yedhee.activeController:attack()
                    end
                    ]]
                end
			end
		end)
	end)
end)