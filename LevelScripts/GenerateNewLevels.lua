local levelGenerator = require(game.ServerScriptService.LevelGenerator)
local levelDeleter = require(game.ServerScriptService.LevelDeleter)
local validations = require(game.ServerScriptService.Utils.Validations)

function handleNewFirstLevelBeginningTouch(object)
if not validations.isValidHumanoid(object) then
return
end

levelDeleter.delete(levelGenerator.oldLevels)
end

function handleLastLevelBeginningTouch(object)
if not validations.isValidHumanoid(object) then
return
end

levelGenerator.generate(10)
levelGenerator.currentLevels[1].Beginning.Touched:Once(handleNewFirstLevelBeginningTouch)
end

script.Parent.Touched:Once(handleLastLevelBeginningTouch)
