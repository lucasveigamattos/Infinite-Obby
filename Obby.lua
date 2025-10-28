local levelGenerator = require(game.ServerScriptService.LevelGenerator)
local levelDeleter = require(game.ServerScriptService.LevelDeleter)

local obby = {
inProgess = false
}

function obby.start()
obby.inProgess = true

levelGenerator.init()
levelGenerator.generate(10)
end

function obby.finish()
obby.inProgess = false

levelDeleter.delete(levelGenerator.oldLevels)
levelDeleter.delete(levelGenerator.currentLevels)
end

return obby
