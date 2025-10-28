local validations = require(game.ServerScriptService.Utils.Validations)

local levelPositioner = {}

function getPosition(level: Model): Vector3
local levelPivot = level:GetPivot()
return Vector3.new(levelPivot.X, levelPivot.Y, levelPivot.Z)
end

function positionToPoint(point: Part, level: Model)
local distanceLevelBeginningLevelMiddle = getPosition(level) - level.Beginning.Position

level.Beginning.CanCollide = false
level:MoveTo(point.Position + distanceLevelBeginningLevelMiddle)
level.Beginning.CanCollide = true
end

function positionFirst(level: Model)
local obbyBeginning = game.Workspace.ObbyBeginning
positionToPoint(obbyBeginning, level)
end

function levelPositioner.position(level: Model, lastLevelGenerated: Model)
if not validations.isValidModel(lastLevelGenerated) then
positionFirst(level)
return
end

positionToPoint(lastLevelGenerated.End, level)
end

return levelPositioner
