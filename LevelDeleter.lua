local levelDeleter = {}

function levelDeleter.delete(levels)
for levelNumber = 1, #levels, 1 do
levels[levelNumber]:Destroy()
end
end

return levelDeleter
