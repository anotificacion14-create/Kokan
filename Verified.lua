local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local function aplicarVerificado(character)
	local head = character:WaitForChild("Head", 5)
	if not head then return end
	
	if head:FindFirstChild("RobloxVerifiedTag") then return end
	
	local billboard = Instance.new("BillboardGui")
	billboard.Name = "RobloxVerifiedTag"
	billboard.Size = UDim2.new(0, 150, 0, 40)
	billboard.StudsOffset = Vector3.new(0, 2.5, 0)
	billboard.AlwaysOnTop = true
	billboard.Parent = head
	
	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(1, 0, 1, 0)
	textLabel.BackgroundTransparency = 1
	textLabel.TextColor3 = Color3.fromRGB(102, 204, 255)
	textLabel.TextScaled = true
	textLabel.Font = Enum.Font.SourceSansBold
	
	-- Usando exactamente el símbolo que enviaste
	textLabel.Text = localPlayer.Name .. " "
	
	textLabel.Parent = billboard
end

localPlayer.CharacterAdded:Connect(function(character)
	aplicarVerificado(character)
end)

if localPlayer.Character then
	aplicarVerificado(localPlayer.Character)
end
