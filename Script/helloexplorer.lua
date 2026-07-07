local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local VALID_KEY = "H4LL0_EXPLORER_2026"

local C_BG = Color3.fromRGB(36, 36, 36)
local C_DARK = Color3.fromRGB(46, 46, 46)
local C_DARKER = Color3.fromRGB(28, 28, 28)
local C_BLUE = Color3.fromRGB(0, 120, 215)
local C_SELECT = Color3.fromRGB(51, 102, 153)
local C_HOVER = Color3.fromRGB(55, 55, 55)
local C_TEXT = Color3.fromRGB(204, 204, 204)
local C_DIM = Color3.fromRGB(140, 140, 140)
local C_WHITE = Color3.fromRGB(255, 255, 255)
local C_BORDER = Color3.fromRGB(58, 58, 58)
local C_HEADER = Color3.fromRGB(42, 42, 42)
local C_INPUT = Color3.fromRGB(22, 22, 22)
local C_RED = Color3.fromRGB(200, 50, 50)
local C_GREEN = Color3.fromRGB(50, 180, 50)
local C_YELLOW = Color3.fromRGB(200, 160, 0)

-- ══════════════════════════════
--         KEY SYSTEM
-- ══════════════════════════════

local keyGui = Instance.new("ScreenGui")
keyGui.Name = "DexKeySystem"
keyGui.ResetOnSpawn = false
keyGui.Parent = player:WaitForChild("PlayerGui")

local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(0, 340, 0, 190)
keyFrame.Position = UDim2.new(0.5, -170, 0.5, -95)
keyFrame.BackgroundColor3 = C_BG
keyFrame.BorderSizePixel = 0
keyFrame.Active = true
keyFrame.Draggable = true
keyFrame.Parent = keyGui
Instance.new("UICorner", keyFrame).CornerRadius = UDim.new(0, 4)

local keyBorder = Instance.new("UIStroke")
keyBorder.Color = C_BORDER
keyBorder.Thickness = 1
keyBorder.Parent = keyFrame

local keyTitleBar = Instance.new("Frame")
keyTitleBar.Size = UDim2.new(1, 0, 0, 28)
keyTitleBar.BackgroundColor3 = C_DARKER
keyTitleBar.BorderSizePixel = 0
keyTitleBar.Parent = keyFrame
Instance.new("UICorner", keyTitleBar).CornerRadius = UDim.new(0, 4)

-- Window dots
local function makeDot(color, xOff)
    local d = Instance.new("Frame")
    d.Size = UDim2.new(0, 10, 0, 10)
    d.Position = UDim2.new(0, xOff, 0.5, -5)
    d.BackgroundColor3 = color
    d.BorderSizePixel = 0
    d.Parent = keyTitleBar
    Instance.new("UICorner", d).CornerRadius = UDim.new(1, 0)
    return d
end

local keyCloseBtn = makeDot(Color3.fromRGB(220, 60, 60), 8)
makeDot(Color3.fromRGB(220, 160, 0), 22)
makeDot(Color3.fromRGB(40, 180, 60), 36)

local keyTitleLabel = Instance.new("TextLabel")
keyTitleLabel.Size = UDim2.new(1, -60, 1, 0)
keyTitleLabel.Position = UDim2.new(0, 54, 0, 0)
keyTitleLabel.BackgroundTransparency = 1
keyTitleLabel.Text = "h4ll0 Explorer — Key Required"
keyTitleLabel.TextColor3 = C_DIM
keyTitleLabel.TextSize = 12
keyTitleLabel.Font = Enum.Font.Gotham
keyTitleLabel.TextXAlignment = Enum.TextXAlignment.Left
keyTitleLabel.Parent = keyTitleBar

local keySep = Instance.new("Frame")
keySep.Size = UDim2.new(1, 0, 0, 1)
keySep.Position = UDim2.new(0, 0, 0, 28)
keySep.BackgroundColor3 = C_BORDER
keySep.BorderSizePixel = 0
keySep.Parent = keyFrame

local keySubLabel = Instance.new("TextLabel")
keySubLabel.Size = UDim2.new(1, -20, 0, 18)
keySubLabel.Position = UDim2.new(0, 10, 0, 36)
keySubLabel.BackgroundTransparency = 1
keySubLabel.Text = "🔍 Enter key to access the Explorer"
keySubLabel.TextColor3 = C_DIM
keySubLabel.TextSize = 11
keySubLabel.Font = Enum.Font.Gotham
keySubLabel.TextXAlignment = Enum.TextXAlignment.Left
keySubLabel.Parent = keyFrame

local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(1, -20, 0, 30)
keyInput.Position = UDim2.new(0, 10, 0, 62)
keyInput.BackgroundColor3 = C_INPUT
keyInput.Text = ""
keyInput.PlaceholderText = "Enter key..."
keyInput.PlaceholderColor3 = Color3.fromRGB(80, 80, 80)
keyInput.TextColor3 = C_TEXT
keyInput.TextSize = 12
keyInput.Font = Enum.Font.Gotham
keyInput.BorderSizePixel = 0
keyInput.ClearTextOnFocus = false
keyInput.Parent = keyFrame
Instance.new("UICorner", keyInput).CornerRadius = UDim.new(0, 3)

local keyInputBorder = Instance.new("UIStroke")
keyInputBorder.Color = C_BORDER
keyInputBorder.Thickness = 1
keyInputBorder.Parent = keyInput

local keyStatusLabel = Instance.new("TextLabel")
keyStatusLabel.Size = UDim2.new(1, -20, 0, 16)
keyStatusLabel.Position = UDim2.new(0, 10, 0, 98)
keyStatusLabel.BackgroundTransparency = 1
keyStatusLabel.Text = ""
keyStatusLabel.TextColor3 = C_RED
keyStatusLabel.TextSize = 11
keyStatusLabel.Font = Enum.Font.Gotham
keyStatusLabel.TextXAlignment = Enum.TextXAlignment.Left
keyStatusLabel.Parent = keyFrame

local verifyBtn = Instance.new("TextButton")
verifyBtn.Size = UDim2.new(1, -20, 0, 30)
verifyBtn.Position = UDim2.new(0, 10, 0, 148)
verifyBtn.BackgroundColor3 = C_BLUE
verifyBtn.Text = "Verify Key"
verifyBtn.TextColor3 = C_WHITE
verifyBtn.TextSize = 12
verifyBtn.Font = Enum.Font.GothamBold
verifyBtn.BorderSizePixel = 0
verifyBtn.Parent = keyFrame
Instance.new("UICorner", verifyBtn).CornerRadius = UDim.new(0, 3)

local function shakeFrame()
    local orig = keyFrame.Position
    for i = 1, 3 do
        TweenService:Create(keyFrame, TweenInfo.new(0.04), {
            Position = UDim2.new(orig.X.Scale, orig.X.Offset + 8, orig.Y.Scale, orig.Y.Offset)
        }):Play()
        task.wait(0.04)
        TweenService:Create(keyFrame, TweenInfo.new(0.04), {
            Position = UDim2.new(orig.X.Scale, orig.X.Offset - 8, orig.Y.Scale, orig.Y.Offset)
        }):Play()
        task.wait(0.04)
    end
    TweenService:Create(keyFrame, TweenInfo.new(0.04), {Position = orig}):Play()
end

-- ══════════════════════════════
--         DEX EXPLORER
-- ══════════════════════════════

local function loadDex()

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DexExplorer"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 720, 0, 520)
mainFrame.Position = UDim2.new(0.5, -360, 0.5, -260)
mainFrame.BackgroundColor3 = C_BG
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 4)

local mainBorder = Instance.new("UIStroke")
mainBorder.Color = C_BORDER
mainBorder.Thickness = 1
mainBorder.Parent = mainFrame

-- ══════════════════════════════
--         TITLE BAR
-- ══════════════════════════════

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 28)
titleBar.BackgroundColor3 = C_DARKER
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleSep = Instance.new("Frame")
titleSep.Size = UDim2.new(1, 0, 0, 1)
titleSep.Position = UDim2.new(0, 0, 1, 0)
titleSep.BackgroundColor3 = C_BORDER
titleSep.BorderSizePixel = 0
titleSep.Parent = titleBar

local function makeTitleDot(color, xOff)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 10, 0, 10)
    btn.Position = UDim2.new(0, xOff, 0.5, -5)
    btn.BackgroundColor3 = color
    btn.Text = ""
    btn.BorderSizePixel = 0
    btn.Parent = titleBar
    Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 0)
    return btn
end

local closeBtn = makeTitleDot(Color3.fromRGB(220, 60, 60), 8)
local minBtn = makeTitleDot(Color3.fromRGB(220, 160, 0), 22)
local maxBtn = makeTitleDot(Color3.fromRGB(40, 180, 60), 36)

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -60, 1, 0)
titleLabel.Position = UDim2.new(0.5, -100, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Dex Explorer"
titleLabel.TextColor3 = C_DIM
titleLabel.TextSize = 12
titleLabel.Font = Enum.Font.Gotham
titleLabel.TextXAlignment = Enum.TextXAlignment.Center
titleLabel.Parent = titleBar

-- ══════════════════════════════
--         TOOLBAR
-- ══════════════════════════════

local toolbar = Instance.new("Frame")
toolbar.Size = UDim2.new(1, 0, 0, 28)
toolbar.Position = UDim2.new(0, 0, 0, 29)
toolbar.BackgroundColor3 = C_HEADER
toolbar.BorderSizePixel = 0
toolbar.Parent = mainFrame

local toolbarSep = Instance.new("Frame")
toolbarSep.Size = UDim2.new(1, 0, 0, 1)
toolbarSep.Position = UDim2.new(0, 0, 1, 0)
toolbarSep.BackgroundColor3 = C_BORDER
toolbarSep.BorderSizePixel = 0
toolbarSep.Parent = toolbar

local function makeToolBtn(text, xPos, w)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, w or 72, 0, 20)
    btn.Position = UDim2.new(0, xPos, 0.5, -10)
    btn.BackgroundColor3 = C_HEADER
    btn.Text = text
    btn.TextColor3 = C_TEXT
    btn.TextSize = 11
    btn.Font = Enum.Font.Gotham
    btn.BorderSizePixel = 0
    btn.Parent = toolbar
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 3)
    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = C_HOVER
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = C_HEADER
    end)
    return btn
end

local refreshBtn = makeToolBtn("↺ Refresh", 6, 70)

local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(0, 160, 0, 20)
searchBox.Position = UDim2.new(1, -168, 0.5, -10)
searchBox.BackgroundColor3 = C_INPUT
searchBox.Text = ""
searchBox.PlaceholderText = "🔍 Search instance..."
searchBox.PlaceholderColor3 = Color3.fromRGB(80, 80, 80)
searchBox.TextColor3 = C_TEXT
searchBox.TextSize = 11
searchBox.Font = Enum.Font.Gotham
searchBox.BorderSizePixel = 0
searchBox.ClearTextOnFocus = false
searchBox.Parent = toolbar
Instance.new("UICorner", searchBox).CornerRadius = UDim.new(0, 3)

local searchBorder = Instance.new("UIStroke")
searchBorder.Color = C_BORDER
searchBorder.Thickness = 1
searchBorder.Parent = searchBox

-- ══════════════════════════════
--         CONTENT AREA
-- ══════════════════════════════

local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1, 0, 1, -58)
contentArea.Position = UDim2.new(0, 0, 0, 58)
contentArea.BackgroundTransparency = 1
contentArea.Parent = mainFrame

-- LEFT: Explorer
local leftPanel = Instance.new("Frame")
leftPanel.Size = UDim2.new(0, 260, 1, 0)
leftPanel.BackgroundColor3 = C_DARKER
leftPanel.BorderSizePixel = 0
leftPanel.Parent = contentArea

local leftHeader = Instance.new("Frame")
leftHeader.Size = UDim2.new(1, 0, 0, 22)
leftHeader.BackgroundColor3 = C_HEADER
leftHeader.BorderSizePixel = 0
leftHeader.Parent = leftPanel

local leftHeaderLabel = Instance.new("TextLabel")
leftHeaderLabel.Size = UDim2.new(1, -10, 1, 0)
leftHeaderLabel.Position = UDim2.new(0, 8, 0, 0)
leftHeaderLabel.BackgroundTransparency = 1
leftHeaderLabel.Text = "Explorer"
leftHeaderLabel.TextColor3 = C_DIM
leftHeaderLabel.TextSize = 11
leftHeaderLabel.Font = Enum.Font.GothamBold
leftHeaderLabel.TextXAlignment = Enum.TextXAlignment.Left
leftHeaderLabel.Parent = leftHeader

local leftHeaderSep = Instance.new("Frame")
leftHeaderSep.Size = UDim2.new(1, 0, 0, 1)
leftHeaderSep.Position = UDim2.new(0, 0, 1, 0)
leftHeaderSep.BackgroundColor3 = C_BORDER
leftHeaderSep.BorderSizePixel = 0
leftHeaderSep.Parent = leftHeader

local explorerScroll = Instance.new("ScrollingFrame")
explorerScroll.Size = UDim2.new(1, 0, 1, -23)
explorerScroll.Position = UDim2.new(0, 0, 0, 23)
explorerScroll.BackgroundTransparency = 1
explorerScroll.BorderSizePixel = 0
explorerScroll.ScrollBarThickness = 5
explorerScroll.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80)
explorerScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
explorerScroll.Parent = leftPanel

local explorerLayout = Instance.new("UIListLayout")
explorerLayout.SortOrder = Enum.SortOrder.LayoutOrder
explorerLayout.Padding = UDim.new(0, 0)
explorerLayout.Parent = explorerScroll

explorerLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    explorerScroll.CanvasSize = UDim2.new(0, 0, 0, explorerLayout.AbsoluteContentSize.Y)
end)

-- Divider
local divider = Instance.new("Frame")
divider.Size = UDim2.new(0, 1, 1, 0)
divider.Position = UDim2.new(0, 260, 0, 0)
divider.BackgroundColor3 = C_BORDER
divider.BorderSizePixel = 0
divider.Parent = contentArea

-- RIGHT: Properties
local rightPanel = Instance.new("Frame")
rightPanel.Size = UDim2.new(1, -262, 1, 0)
rightPanel.Position = UDim2.new(0, 262, 0, 0)
rightPanel.BackgroundColor3 = C_DARKER
rightPanel.BorderSizePixel = 0
rightPanel.Parent = contentArea

local rightHeader = Instance.new("Frame")
rightHeader.Size = UDim2.new(1, 0, 0, 22)
rightHeader.BackgroundColor3 = C_HEADER
rightHeader.BorderSizePixel = 0
rightHeader.Parent = rightPanel

local rightHeaderLabel = Instance.new("TextLabel")
rightHeaderLabel.Size = UDim2.new(1, -10, 1, 0)
rightHeaderLabel.Position = UDim2.new(0, 8, 0, 0)
rightHeaderLabel.BackgroundTransparency = 1
rightHeaderLabel.Text = "Properties"
rightHeaderLabel.TextColor3 = C_DIM
rightHeaderLabel.TextSize = 11
rightHeaderLabel.Font = Enum.Font.GothamBold
rightHeaderLabel.TextXAlignment = Enum.TextXAlignment.Left
rightHeaderLabel.Parent = rightHeader

local rightHeaderSep = Instance.new("Frame")
rightHeaderSep.Size = UDim2.new(1, 0, 0, 1)
rightHeaderSep.Position = UDim2.new(0, 0, 1, 0)
rightHeaderSep.BackgroundColor3 = C_BORDER
rightHeaderSep.BorderSizePixel = 0
rightHeaderSep.Parent = rightHeader

-- Column headers
local colHeader = Instance.new("Frame")
colHeader.Size = UDim2.new(1, 0, 0, 20)
colHeader.Position = UDim2.new(0, 0, 0, 23)
colHeader.BackgroundColor3 = C_BG
colHeader.BorderSizePixel = 0
colHeader.Parent = rightPanel

local colProp = Instance.new("TextLabel")
colProp.Size = UDim2.new(0.5, -1, 1, 0)
colProp.Position = UDim2.new(0, 8, 0, 0)
colProp.BackgroundTransparency = 1
colProp.Text = "Property"
colProp.TextColor3 = C_DIM
colProp.TextSize = 10
colProp.Font = Enum.Font.GothamBold
colProp.TextXAlignment = Enum.TextXAlignment.Left
colProp.Parent = colHeader

local colDiv = Instance.new("Frame")
colDiv.Size = UDim2.new(0, 1, 1, 0)
colDiv.Position = UDim2.new(0.5, 0, 0, 0)
colDiv.BackgroundColor3 = C_BORDER
colDiv.BorderSizePixel = 0
colDiv.Parent = colHeader

local colVal = Instance.new("TextLabel")
colVal.Size = UDim2.new(0.5, -8, 1, 0)
colVal.Position = UDim2.new(0.5, 8, 0, 0)
colVal.BackgroundTransparency = 1
colVal.Text = "Value"
colVal.TextColor3 = C_DIM
colVal.TextSize = 10
colVal.Font = Enum.Font.GothamBold
colVal.TextXAlignment = Enum.TextXAlignment.Left
colVal.Parent = colHeader

local colHeaderSep = Instance.new("Frame")
colHeaderSep.Size = UDim2.new(1, 0, 0, 1)
colHeaderSep.Position = UDim2.new(0, 0, 1, 0)
colHeaderSep.BackgroundColor3 = C_BORDER
colHeaderSep.BorderSizePixel = 0
colHeaderSep.Parent = colHeader

local propScroll = Instance.new("ScrollingFrame")
propScroll.Size = UDim2.new(1, 0, 1, -44)
propScroll.Position = UDim2.new(0, 0, 0, 44)
propScroll.BackgroundTransparency = 1
propScroll.BorderSizePixel = 0
propScroll.ScrollBarThickness = 5
propScroll.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80)
propScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
propScroll.Parent = rightPanel

local propLayout = Instance.new("UIListLayout")
propLayout.SortOrder = Enum.SortOrder.LayoutOrder
propLayout.Padding = UDim.new(0, 0)
propLayout.Parent = propScroll

propLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    propScroll.CanvasSize = UDim2.new(0, 0, 0, propLayout.AbsoluteContentSize.Y)
end)

-- ══════════════════════════════
--       PROPERTY PANEL
-- ══════════════════════════════

local function clearProps()
    for _, v in pairs(propScroll:GetChildren()) do
        if not v:IsA("UIListLayout") then v:Destroy() end
    end
end

local function addCategory(title, order)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, 0, 0, 20)
    row.BackgroundColor3 = C_HEADER
    row.BorderSizePixel = 0
    row.LayoutOrder = order
    row.Parent = propScroll

    local sep = Instance.new("Frame")
    sep.Size = UDim2.new(1, 0, 0, 1)
    sep.Position = UDim2.new(0, 0, 1, -1)
    sep.BackgroundColor3 = C_BORDER
    sep.BorderSizePixel = 0
    sep.Parent = row

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -10, 1, 0)
    lbl.Position = UDim2.new(0, 8, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = "▾ " .. title
    lbl.TextColor3 = C_TEXT
    lbl.TextSize = 11
    lbl.Font = Enum.Font.GothamBold
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = row
end

local function getValueColor(val)
    local t = type(val)
    if t == "boolean" then return val and C_GREEN or C_RED end
    if t == "number" then return Color3.fromRGB(100, 180, 255) end
    if t == "string" then return Color3.fromRGB(180, 220, 130) end
    return Color3.fromRGB(200, 160, 255)
end

local function formatValue(val)
    if type(val) == "boolean" then return val and "true" or "false" end
    if type(val) == "number" then return string.format("%.3f", val) end
    if typeof(val) == "Vector3" then
        return string.format("%.2f, %.2f, %.2f", val.X, val.Y, val.Z)
    end
    if typeof(val) == "Vector2" then
        return string.format("%.2f, %.2f", val.X, val.Y)
    end
    if typeof(val) == "Color3" then
        return string.format("[%d, %d, %d]", val.R*255, val.G*255, val.B*255)
    end
    if typeof(val) == "CFrame" then
        local pos = val.Position
        return string.format("%.2f, %.2f, %.2f", pos.X, pos.Y, pos.Z)
    end
    if typeof(val) == "UDim2" then
        return string.format("{%.0f, %.0f}, {%.0f, %.0f}",
            val.X.Scale, val.X.Offset, val.Y.Scale, val.Y.Offset)
    end
    if typeof(val) == "EnumItem" then return tostring(val) end
    if typeof(val) == "BrickColor" then return tostring(val) end
    return tostring(val)
end

local function addPropRow(name, val, order)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, 0, 0, 22)
    row.BackgroundColor3 = order % 2 == 0 and C_DARKER or Color3.fromRGB(30, 30, 30)
    row.BorderSizePixel = 0
    row.LayoutOrder = order
    row.Parent = propScroll

    local sepLine = Instance.new("Frame")
    sepLine.Size = UDim2.new(1, 0, 0, 1)
    sepLine.Position = UDim2.new(0, 0, 1, -1)
    sepLine.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    sepLine.BorderSizePixel = 0
    sepLine.Parent = row

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(0.5, -2, 1, 0)
    nameLabel.Position = UDim2.new(0, 14, 0, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = name
    nameLabel.TextColor3 = C_TEXT
    nameLabel.TextSize = 11
    nameLabel.Font = Enum.Font.Gotham
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.TextTruncate = Enum.TextTruncate.AtEnd
    nameLabel.Parent = row

    local midDiv = Instance.new("Frame")
    midDiv.Size = UDim2.new(0, 1, 0.7, 0)
    midDiv.Position = UDim2.new(0.5, 0, 0.15, 0)
    midDiv.BackgroundColor3 = C_BORDER
    midDiv.BorderSizePixel = 0
    midDiv.Parent = row

    -- Value box (editable)
    local valBox = Instance.new("TextBox")
    valBox.Size = UDim2.new(0.5, -8, 1, -2)
    valBox.Position = UDim2.new(0.5, 4, 0, 1)
    valBox.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
    valBox.Text = formatValue(val)
    valBox.TextColor3 = getValueColor(val)
    valBox.TextSize = 11
    valBox.Font = Enum.Font.Gotham
    valBox.BorderSizePixel = 0
    valBox.ClearTextOnFocus = false
    valBox.TextXAlignment = Enum.TextXAlignment.Left
    valBox.Parent = row
    Instance.new("UICorner", valBox).CornerRadius = UDim.new(0, 2)

    -- Color swatch for Color3
    if typeof(val) == "Color3" then
        local swatch = Instance.new("Frame")
        swatch.Size = UDim2.new(0, 14, 0, 14)
        swatch.Position = UDim2.new(1, -18, 0.5, -7)
        swatch.BackgroundColor3 = val
        swatch.BorderSizePixel = 0
        swatch.Parent = row
        Instance.new("UICorner", swatch).CornerRadius = UDim.new(0, 2)
        local sw = Instance.new("UIStroke")
        sw.Color = C_BORDER
        sw.Thickness = 1
        sw.Parent = swatch
    end

    -- Bool toggle
    if type(val) == "boolean" then
        local toggle = Instance.new("Frame")
        toggle.Size = UDim2.new(0, 12, 0, 12)
        toggle.Position = UDim2.new(0.5, 6, 0.5, -6)
        toggle.BackgroundColor3 = val and C_GREEN or C_RED
        toggle.BorderSizePixel = 0
        toggle.Parent = row
        Instance.new("UICorner", toggle).CornerRadius = UDim.new(0, 2)
    end

    row.MouseEnter:Connect(function()
        row.BackgroundColor3 = C_HOVER
    end)
    row.MouseLeave:Connect(function()
        row.BackgroundColor3 = order % 2 == 0 and C_DARKER or Color3.fromRGB(30, 30, 30)
    end)
end

-- Full property list like Roblox Studio
local PROPERTY_CATEGORIES = {
    {
        name = "Appearance",
        props = {
            "BackgroundColor3", "BackgroundTransparency", "BorderColor3",
            "BorderSizePixel", "TextColor3", "TextTransparency",
            "TextStrokeColor3", "TextStrokeTransparency",
            "Color", "BrickColor", "Material", "Reflectance",
            "Transparency", "CastShadow",
        }
    },
    {
        name = "Data",
        props = {
            "Name", "ClassName", "Archivable",
        }
    },
    {
        name = "Behavior",
        props = {
            "Active", "Draggable", "Visible", "Enabled",
            "CanCollide", "CanTouch", "CanQuery",
            "Anchored", "Massless", "Locked",
            "Disabled",
        }
    },
    {
        name = "Part",
        props = {
            "Size", "Position", "CFrame", "Orientation", "Rotation",
            "Velocity", "AssemblyLinearVelocity", "AssemblyAngularVelocity",
            "Mass", "CustomPhysicalProperties",
        }
    },
    {
        name = "Transform",
        props = {
            "Position", "Rotation", "Orientation",
            "Size", "Scale",
        }
    },
    {
        name = "Layout",
        props = {
            "Size", "Position", "AnchorPoint",
            "SizeConstraint", "AutomaticSize",
            "ZIndex", "LayoutOrder",
            "ClipsDescendants",
        }
    },
    {
        name = "Text",
        props = {
            "Text", "TextSize", "Font", "FontFace",
            "TextXAlignment", "TextYAlignment",
            "TextWrapped", "TextScaled",
            "TextTruncate", "RichText",
            "LineHeight", "MaxVisibleGraphemes",
        }
    },
    {
        name = "Image",
        props = {
            "Image", "ImageColor3", "ImageTransparency",
            "ImageRectOffset", "ImageRectSize",
            "ScaleType", "SliceCenter", "TileSize",
        }
    },
    {
        name = "Humanoid",
        props = {
            "Health", "MaxHealth", "WalkSpeed", "JumpPower",
            "JumpHeight", "HipHeight", "AutoJumpEnabled",
            "AutoRotate", "BreakJointsOnDeath",
            "DisplayDistanceType", "HealthDisplayDistance",
            "NameDisplayDistance", "NameOcclusion",
        }
    },
    {
        name = "Sound",
        props = {
            "SoundId", "Volume", "PlaybackSpeed",
            "Looped", "IsPlaying", "TimePosition",
        }
    },
    {
        name = "Light",
        props = {
            "Brightness", "Color", "Enabled",
            "Shadows", "Range", "Angle",
        }
    },
    {
        name = "Script",
        props = {
            "Disabled", "RunContext",
        }
    },
}

local function showProperties(obj)
    clearProps()
    rightHeaderLabel.Text = "Properties — " .. obj.Name .. " [" .. obj.ClassName .. "]"

    local order = 0

    for _, cat in ipairs(PROPERTY_CATEGORIES) do
        local hasAny = false
        local catProps = {}

        for _, prop in ipairs(cat.props) do
            local ok, val = pcall(function() return obj[prop] end)
            if ok and val ~= nil then
                hasAny = true
                table.insert(catProps, {prop, val})
            end
        end

        if hasAny then
            addCategory(cat.name, order) order += 1
            for _, pv in ipairs(catProps) do
                addPropRow(pv[1], pv[2], order) order += 1
            end
        end
    end

    -- Catch-all for other props
    local knownProps = {}
    for _, cat in ipairs(PROPERTY_CATEGORIES) do
        for _, p in ipairs(cat.props) do knownProps[p] = true end
    end

    local extraCat = false
    for prop, _ in pairs({
        Parent = true, AbsolutePosition = true, AbsoluteSize = true,
        AbsoluteRotation = true, ContentSize = true,
    }) do
        local ok, val = pcall(function() return obj[prop] end)
        if ok and val ~= nil and not knownProps[prop] then
            if not extraCat then
                addCategory("Read-only", order) order += 1
                extraCat = true
            end
            addPropRow(prop, val, order) order += 1
        end
    end
end

-- ══════════════════════════════
--       EXPLORER TREE
-- ══════════════════════════════

local selectedRow = nil
local nodeOrder = 0

local function getIcon(obj)
    local icons = {
        Workspace = "🌍", Part = "🧱", MeshPart = "🧊", Model = "📦",
        Script = "📜", LocalScript = "📄", ModuleScript = "📋",
        RemoteEvent = "📡", RemoteFunction = "📡", BindableEvent = "📨",
        Folder = "📁", Frame = "🖼", ScreenGui = "🖥",
        SurfaceGui = "🪟", BillboardGui = "🪧",
        TextLabel = "🔤", TextButton = "🔘", TextBox = "✏️",
        ImageLabel = "🖼", ImageButton = "🖼",
        Sound = "🔊", SoundService = "🎵",
        Humanoid = "🚶", HumanoidRootPart = "⬛",
        Camera = "📷", Lighting = "💡",
        ReplicatedStorage = "💾", ServerStorage = "🗄️",
        ServerScriptService = "⚙️", StarterGui = "🎮",
        StarterPack = "🎒", StarterPlayer = "👤",
        Players = "👥", Player = "👤",
        Animation = "🎬", AnimationController = "🎮",
        Accessory = "🎩", Tool = "🔧",
        SelectionBox = "🔲", SelectionSphere = "🔵",
        SpawnLocation = "🚩", Seat = "💺",
        WeldConstraint = "🔗", Motor6D = "⚙️",
        PointLight = "💡", SpotLight = "🔦",
        NumberValue = "🔢", StringValue = "📝",
        BoolValue = "✅", Vector3Value = "📐",
        IntValue = "🔢", ObjectValue = "📦",
    }
    return icons[obj.ClassName] or "📌"
end

local function updateCanvasSize()
    task.wait()
    explorerScroll.CanvasSize = UDim2.new(0, 0, 0, explorerLayout.AbsoluteContentSize.Y)
end

local function buildTree(parent, container, depth)
    local children = {}
    pcall(function()
        for _, child in ipairs(parent:GetChildren()) do
            table.insert(children, child)
        end
    end)

    table.sort(children, function(a, b) return a.Name < b.Name end)

    for _, obj in ipairs(children) do
        nodeOrder += 1
        local myOrder = nodeOrder

        local hasChildren = #obj:GetChildren() > 0

        local row = Instance.new("TextButton")
        row.Size = UDim2.new(1, 0, 0, 20)
        row.BackgroundColor3 = C_DARKER
        row.Text = ""
        row.BorderSizePixel = 0
        row.LayoutOrder = myOrder
        row.Parent = container

        -- Indent lines
        for i = 1, depth do
            local line = Instance.new("Frame")
            line.Size = UDim2.new(0, 1, 1, 0)
            line.Position = UDim2.new(0, (i-1)*16 + 8, 0, 0)
            line.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
            line.BorderSizePixel = 0
            line.Parent = row
        end

        local arrowBtn = Instance.new("TextLabel")
        arrowBtn.Size = UDim2.new(0, 14, 1, 0)
        arrowBtn.Position = UDim2.new(0, depth*16 + 2, 0, 0)
        arrowBtn.BackgroundTransparency = 1
        arrowBtn.Text = hasChildren and "▶" or ""
        arrowBtn.TextColor3 = C_DIM
        arrowBtn.TextSize = 8
        arrowBtn.Font = Enum.Font.Gotham
        arrowBtn.Parent = row

        local iconLbl = Instance.new("TextLabel")
        iconLbl.Size = UDim2.new(0, 16, 1, 0)
        iconLbl.Position = UDim2.new(0, depth*16 + 16, 0, 0)
        iconLbl.BackgroundTransparency = 1
        iconLbl.Text = getIcon(obj)
        iconLbl.TextSize = 11
        iconLbl.Font = Enum.Font.GothamBold
        iconLbl.Parent = row

        local nameLbl = Instance.new("TextLabel")
        nameLbl.Size = UDim2.new(1, -(depth*16 + 34), 1, 0)
        nameLbl.Position = UDim2.new(0, depth*16 + 34, 0, 0)
        nameLbl.BackgroundTransparency = 1
        nameLbl.Text = obj.Name
        nameLbl.TextColor3 = C_TEXT
        nameLbl.TextSize = 12
        nameLbl.Font = Enum.Font.Gotham
        nameLbl.TextXAlignment = Enum.TextXAlignment.Left
        nameLbl.TextTruncate = Enum.TextTruncate.AtEnd
        nameLbl.Parent = row

        local childContainer = Instance.new("Frame")
        childContainer.Size = UDim2.new(1, 0, 0, 0)
        childContainer.BackgroundTransparency = 1
        childContainer.BorderSizePixel = 0
        childContainer.Visible = false
        childContainer.LayoutOrder = myOrder + 0.5
        childContainer.Parent = container

        local childLayout = Instance.new("UIListLayout")
        childLayout.SortOrder = Enum.SortOrder.LayoutOrder
        childLayout.Padding = UDim.new(0, 0)
        childLayout.Parent = childContainer

        childLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            childContainer.Size = UDim2.new(1, 0, 0, childLayout.AbsoluteContentSize.Y)
            updateCanvasSize()
        end)

        local expanded = false

        row.MouseButton1Click:Connect(function()
            -- Deselect old
            if selectedRow then
                selectedRow.BackgroundColor3 = C_DARKER
                local old = selectedRow:FindFirstChild("NameLbl")
                if old then old.TextColor3 = C_TEXT end
            end
            row.BackgroundColor3 = C_SELECT
            nameLbl.TextColor3 = C_WHITE
            selectedRow = row

            showProperties(obj)

            if hasChildren then
                expanded = not expanded
                arrowBtn.Text = expanded and "▼" or "▶"
                childContainer.Visible = expanded
                if expanded and #childContainer:GetChildren() <= 1 then
                    buildTree(obj, childContainer, depth + 1)
                end
                updateCanvasSize()
            end
        end)

        row.MouseEnter:Connect(function()
            if row ~= selectedRow then
                row.BackgroundColor3 = C_HOVER
            end
        end)
        row.MouseLeave:Connect(function()
            if row ~= selectedRow then
                row.BackgroundColor3 = C_DARKER
            end
        end)
    end

    updateCanvasSize()
end

local function buildRootNode(service, label)
    nodeOrder += 1
    local myOrder = nodeOrder

    local row = Instance.new("TextButton")
    row.Size = UDim2.new(1, 0, 0, 22)
    row.BackgroundColor3 = C_DARKER
    row.Text = ""
    row.BorderSizePixel = 0
    row.LayoutOrder = myOrder
    row.Parent = explorerScroll

    local sep = Instance.new("Frame")
    sep.Size = UDim2.new(1, 0, 0, 1)
    sep.Position = UDim2.new(0, 0, 1, -1)
    sep.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    sep.BorderSizePixel = 0
    sep.Parent = row

    local arrowLbl = Instance.new("TextLabel")
    arrowLbl.Size = UDim2.new(0, 14, 1, 0)
    arrowLbl.Position = UDim2.new(0, 4, 0, 0)
    arrowLbl.BackgroundTransparency = 1
    arrowLbl.Text = "▶"
    arrowLbl.TextColor3 = C_DIM
    arrowLbl.TextSize = 8
    arrowLbl.Font = Enum.Font.Gotham
    arrowLbl.Parent = row

    local iconLbl = Instance.new("TextLabel")
    iconLbl.Size = UDim2.new(0, 18, 1, 0)
    iconLbl.Position = UDim2.new(0, 18, 0, 0)
    iconLbl.BackgroundTransparency = 1
    iconLbl.Text = getIcon(service)
    iconLbl.TextSize = 12
    iconLbl.Font = Enum.Font.GothamBold
    iconLbl.Parent = row

    local nameLbl = Instance.new("TextLabel")
    nameLbl.Size = UDim2.new(1, -38, 1, 0)
    nameLbl.Position = UDim2.new(0, 38, 0, 0)
    nameLbl.BackgroundTransparency = 1
    nameLbl.Text = label or service.Name
    nameLbl.TextColor3 = C_TEXT
    nameLbl.TextSize = 12
    nameLbl.Font = Enum.Font.GothamBold
    nameLbl.TextXAlignment = Enum.TextXAlignment.Left
    nameLbl.Parent = row

    local childContainer = Instance.new("Frame")
    childContainer.Size = UDim2.new(1, 0, 0, 0)
    childContainer.BackgroundTransparency = 1
    childContainer.BorderSizePixel = 0
    childContainer.Visible = false
    childContainer.LayoutOrder = myOrder + 0.5
    childContainer.Parent = explorerScroll

    local childLayout = Instance.new("UIListLayout")
    childLayout.SortOrder = Enum.SortOrder.LayoutOrder
    childLayout.Padding = UDim.new(0, 0)
    childLayout.Parent = childContainer

    childLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        childContainer.Size = UDim2.new(1, 0, 0, childLayout.AbsoluteContentSize.Y)
        updateCanvasSize()
    end)

    local expanded = false

    row.MouseButton1Click:Connect(function()
        if selectedRow then selectedRow.BackgroundColor3 = C_DARKER end
        row.BackgroundColor3 = C_SELECT
        nameLbl.TextColor3 = C_WHITE
        selectedRow = row
        showProperties(service)

        expanded = not expanded
        arrowLbl.Text = expanded and "▼" or "▶"
        childContainer.Visible = expanded
        if expanded and #childContainer:GetChildren() <= 1 then
            buildTree(service, childContainer, 1)
        end
        updateCanvasSize()
    end)

    row.MouseEnter:Connect(function()
        if row ~= selectedRow then row.BackgroundColor3 = C_HOVER end
    end)
    row.MouseLeave:Connect(function()
        if row ~= selectedRow then row.BackgroundColor3 = C_DARKER end
    end)
end

local function refreshExplorer()
    for _, v in pairs(explorerScroll:GetChildren()) do
        if not v:IsA("UIListLayout") then v:Destroy() end
    end
    clearProps()
    rightHeaderLabel.Text = "Properties"
    nodeOrder = 0

    local services = {
        {game:GetService("Workspace"), "Workspace"},
        {game:GetService("Players"), "Players"},
        {game:GetService("Lighting"), "Lighting"},
        {game:GetService("ReplicatedStorage"), "ReplicatedStorage"},
        {game:GetService("ServerScriptService"), "ServerScriptService"},
        {game:GetService("StarterGui"), "StarterGui"},
        {game:GetService("StarterPack"), "StarterPack"},
        {game:GetService("StarterPlayer"), "StarterPlayer"},
        {game:GetService("SoundService"), "SoundService"},
        {game:GetService("Teams"), "Teams"},
    }

    for _, s in ipairs(services) do
        pcall(function()
            buildRootNode(s[1], s[2])
        end)
    end

    updateCanvasSize()
end

refreshExplorer()

-- Toolbar
refreshBtn.MouseButton1Click:Connect(function()
    refreshExplorer()
end)

-- Search
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local q = searchBox.Text:lower()
    if q == "" then
        refreshExplorer()
        return
    end
    -- Basic search highlight
    for _, v in pairs(explorerScroll:GetDescendants()) do
        if v:IsA("TextButton") then
            local nlbl = v:FindFirstChildWhichIsA("TextLabel")
            if nlbl and nlbl.Text:lower():find(q) then
                nlbl.TextColor3 = C_YELLOW
            end
        end
    end
end)

-- Window controls
local minimized = false
minBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {
        Size = minimized and UDim2.new(0, 720, 0, 28) or UDim2.new(0, 720, 0, 520)
    }):Play()
end)

closeBtn.MouseButton1Click:Connect(function()
    TweenService:Create(mainFrame, TweenInfo.new(0.2), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()
    task.wait(0.2)
    screenGui:Destroy()
end)

local fullscreen = false
maxBtn.MouseButton1Click:Connect(function()
    fullscreen = not fullscreen
    TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {
        Size = fullscreen and UDim2.new(1, -10, 1, -10) or UDim2.new(0, 720, 0, 520),
        Position = fullscreen and UDim2.new(0, 5, 0, 5) or UDim2.new(0.5, -360, 0.5, -260)
    }):Play()
end)

print("🔍 Dex Explorer loaded!")
end

-- ══════════════════════════════
--       KEY VERIFY
-- ══════════════════════════════

local function verifyKey(input)
    if input == VALID_KEY then
        keyStatusLabel.TextColor3 = C_GREEN
        keyStatusLabel.Text = "✅ Key verified! Loading Dex..."
        TweenService:Create(verifyBtn, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(0, 100, 0)
        }):Play()
        task.wait(0.8)
        TweenService:Create(keyFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }):Play()
        task.wait(0.3)
        keyGui:Destroy()
        loadDex()
    else
        keyStatusLabel.TextColor3 = C_RED
        keyStatusLabel.Text = "❌ Incorrect key."
        TweenService:Create(verifyBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(120, 0, 0)}):Play()
        task.wait(0.2)
        TweenService:Create(verifyBtn, TweenInfo.new(0.2), {BackgroundColor3 = C_BLUE}):Play()
        shakeFrame()
    end
end

verifyBtn.MouseButton1Click:Connect(function() verifyKey(keyInput.Text) end)
keyInput.FocusLost:Connect(function(enter) if enter then verifyKey(keyInput.Text) end end)
keyCloseBtn.MouseButton1Click:Connect(function() keyGui:Destroy() end)
