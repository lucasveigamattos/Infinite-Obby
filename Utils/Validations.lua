local validations = {}

function validations.isValidInstance(object)
return object ~= nil and typeof(object) == "Instance"
end

function validations.isValidHumanoid(object)
return validations.isValidInstance(object) and object.Parent:FindFirstChild("Humanoid")
end

function validations.isValidModel(object)
return validations.isValidInstance(object) and object:IsA("Model")
end

return validations
