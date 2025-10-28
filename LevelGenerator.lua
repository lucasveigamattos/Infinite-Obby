local levelPositioner = require(game.ServerScriptService.LevelPositioner)

local levelGenerator = {
lastGenerated = nil,
currentLevels = {},
oldLevels = {}
}

function getRandomLevel(): Model
local levels = game.ReplicatedStorage:GetChildren()
local levelNumber = math.random(1, #levels)
local levelName = "Level" .. levelNumber

return game.ReplicatedStorage:FindFirstChild(levelName)
end

function generate()
local level = getRandomLevel():Clone()
level.Parent = game.Workspace

levelPositioner.position(level, levelGenerator.lastGenerated)
levelGenerator.lastGenerated = level
end

function levelGenerator.generate(numberToGenerate: number)
levelGenerator.oldLevels = levelGenerator.currentLevels
levelGenerator.currentLevels = {}

for levelNumber = 1, numberToGenerate, 1 do
generate()

if levelNumber == numberToGenerate then
local generateNewLevelsScript = game.ServerScriptService.LevelScripts.GenerateNewLevels:Clone()

generateNewLevelsScript.Parent = levelGenerator.lastGenerated.Beginning
generateNewLevelsScript.Enabled = true
end

levelGenerator.currentLevels[levelNumber] = levelGenerator.lastGenerated
end
end

function levelGenerator.init()
levelGenerator.lastGenerated = nil
levelGenerator.currentLevels = {}
levelGenerator.oldLevels = {}
end

return levelGenerator
