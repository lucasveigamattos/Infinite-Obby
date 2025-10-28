local obby = require(game.ServerScriptService.Obby)
local validations = require(game.ServerScriptService.Utils.Validations)

function stratNewObby(object: Model)
if not validations.isValidHumanoid(object) or obby.inProgess then
return
end

obby.start()
end

function diedResponse()
obby.finish()
end

function characterAddedResponse(character: Model)
character:FindFirstChild("Humanoid").Died:Connect(diedResponse)
end

function playerAddededResponse(player: Player)
player.CharacterAdded:Connect(characterAddedResponse)
end

game.Workspace.SpawnLocation.Touched:Connect(stratNewObby)
game.Players.PlayerAdded:Connect(playerAddededResponse)
