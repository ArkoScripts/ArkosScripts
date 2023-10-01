-- Create the ScreenGui
local Loading = Instance.new("ScreenGui")
Loading.Name = "Egorikusa"
Loading.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Loading.DisplayOrder = 999999999
Loading.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create the MainFrame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 42, 54) -- Dark theme
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(-0.125, 0, -0.125, 0)
MainFrame.Size = UDim2.new(1.25, 0, 1.25, 0)
MainFrame.Parent = Loading

-- Create the Square
local Square = Instance.new("Frame")
Square.Name = "Square"
Square.BackgroundColor3 = Color3.fromRGB(68, 71, 90) -- Lighter dark theme
Square.Position = UDim2.new(0.4, 0, 0.4, 0)
Square.Size = UDim2.new(0.2, 0, 0.21, 0) -- Increased size to accommodate captcha image
Square.BorderSizePixel = 2
Square.BorderColor3 = Color3.fromRGB(0, 0, 0)
Square.Parent = MainFrame

local Discord = Instance.new("TextLabel")
Discord.Name = "Discord"
Discord.BackgroundColor3 = Color3.fromRGB(12, 44, 190)
Discord.Position = UDim2.new(0.4, 0, 0.7, 0)
Discord.Size = UDim2.new(0.2, 0, 0.1, 0)
Discord.BorderSizePixel = 2
Discord.BorderColor3 = Color3.fromRGB(0, 0, 0)
Discord.Parent = MainFrame
Discord.Font = Enum.Font.Gotham
Discord.Text = "STAFF DISCORD SERVER: discord.gg/vtwbvEyMNA"
Discord.TextColor3 = Color3.fromRGB(248, 248, 242) -- Light color for contrast
Discord.TextScaled = true
Discord.TextSize = 8

x = math.random(1, 100)
y = math.random(1, 100)
-- Create the ImageLabel for the Captcha image
local ImageSpace = Instance.new("TextLabel")
ImageSpace.Name = "ImageSpace"
ImageSpace.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageSpace.BackgroundTransparency = 1.0
ImageSpace.Size = UDim2.new(1, 0, 0.65, 0) -- Adjusted size to accommodate captcha image
ImageSpace.Text = "Solve this to prove that you are not a robot: " .. x .. " + " .. y -- Concatenating x and y values
ImageSpace.TextColor3 = Color3.fromRGB(248, 248, 242) -- Light color for contrast
ImageSpace.TextScaled = true
ImageSpace.TextSize = 8
ImageSpace.Parent = Square

z = x+y
print(z)

-- Create the TextBox for the Captcha input
local CaptchaInput = Instance.new("TextBox")
CaptchaInput.Name = "CaptchaInput"
CaptchaInput.BackgroundColor3 = Color3.fromRGB(68, 71, 90)
CaptchaInput.Position = UDim2.new(0, 0, 0.9, 0) -- Position it below the TextBox
CaptchaInput.Size = UDim2.new(1, 0, 0.1, 0) -- Same size as TextBox
CaptchaInput.Font = Enum.Font.Gotham
CaptchaInput.Text = "Enter Answer"
CaptchaInput.TextColor3 = Color3.fromRGB(248, 248, 242) -- Light color for contrast
CaptchaInput.TextScaled = true
CaptchaInput.TextSize = 14
CaptchaInput.TextWrapped = true
CaptchaInput.Parent = Square

-- Function to show the glowing text
local function ShowGlowingText()
    local GlowingText = Instance.new("TextLabel")
    GlowingText.Name = "GlowingText"
    GlowingText.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Green color
    GlowingText.BackgroundTransparency = 0
    GlowingText.Size = UDim2.new(0.5, 0, 0.1, 0)
    GlowingText.Position = UDim2.new(0.25, 0, 0.9, 0)
    GlowingText.Font = Enum.Font.Gotham
    GlowingText.Text = "CAPTCHA SUCCESS! But u have to wait until script loads (approximately 1 minute)"
    GlowingText.TextColor3 = Color3.fromRGB(255, 255, 255) -- White color
    GlowingText.TextScaled = true
    GlowingText.TextSize = 14
    GlowingText.TextWrapped = true
    GlowingText.Parent = Loading

    wait(10) -- Wait for 1 second
    GlowingText:Destroy() -- Remove the glowing text
end

local function ShowFailedText()
    local GlowingText = Instance.new("TextLabel")
    GlowingText.Name = "GlowingText"
    GlowingText.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red color
    GlowingText.BackgroundTransparency = 0
    GlowingText.Size = UDim2.new(0.5, 0, 0.1, 0)
    GlowingText.Position = UDim2.new(0.25, 0, 0.9, 0)
    GlowingText.Font = Enum.Font.Gotham
    GlowingText.Text = "CAPTCHA FAILED. Please try again, if u have problems with it please contact devs!"
    GlowingText.TextColor3 = Color3.fromRGB(255, 255, 255) -- White color
    GlowingText.TextScaled = true
    GlowingText.TextSize = 14
    GlowingText.TextWrapped = true
    GlowingText.Parent = Loading

    wait(10) -- Wait for 1 second
    GlowingText:Destroy() -- Remove the glowing text
end
-- Event handler for when the user presses enter
CaptchaInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local answer = tonumber(CaptchaInput.Text)
        if answer == z then
            ShowGlowingText()
        else
            ShowFailedText()
        end
    end
end)
