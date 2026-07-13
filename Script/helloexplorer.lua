local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local VALID_KEY = "DEX_H4LL0_2026"

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
local C_PURPLE = Color3.fromRGB(140, 80, 200)

-- Theme presets
local THEMES = {
    {
        name = "Dark", icon = "🌑",
        bg = Color3.fromRGB(36,36,36),
        dark = Color3.fromRGB(28,28,28),
        header = Color3.fromRGB(42,42,42),
        border = Color3.fromRGB(58,58,58),
        accent = Color3.fromRGB(0,120,215),
        select = Color3.fromRGB(51,102,153),
    },
    {
        name = "Horror", icon = "💀",
        bg = Color3.fromRGB(20,0,0),
        dark = Color3.fromRGB(10,0,0),
        header = Color3.fromRGB(30,0,0),
        border = Color3.fromRGB(80,0,0),
        accent = Color3.fromRGB(180,0,0),
        select = Color3.fromRGB(100,0,0),
    },
    {
        name = "Blue", icon = "🌊",
        bg = Color3.fromRGB(10,20,40),
        dark = Color3.fromRGB(5,10,25),
        header = Color3.fromRGB(15,25,50),
        border = Color3.fromRGB(30,60,100),
        accent = Color3.fromRGB(0,140,255),
        select = Color3.fromRGB(20,70,130),
    },
    {
        name = "Green", icon = "🌿",
        bg = Color3.fromRGB(10,25,15),
        dark = Color3.fromRGB(5,15,8),
        header = Color3.fromRGB(15,35,20),
        border = Color3.fromRGB(30,80,40),
        accent = Color3.fromRGB(0,180,80),
        select = Color3.fromRGB(20,80,40),
    },
    {
        name = "Purple", icon = "💜",
        bg = Color3.fromRGB(25,15,40),
        dark = Color3.fromRGB(15,8,28),
        header = Color3.fromRGB(35,20,55),
        border = Color3.fromRGB(80,40,120),
        accent = Color3.fromRGB(160,80,255),
        select = Color3.fromRGB(80,40,130),
    },
    {
        name = "Light", icon = "☀️",
        bg = Color3.fromRGB(240,240,240),
        dark = Color3.fromRGB(220,220,220),
        header = Color3.fromRGB(200,200,200),
        border = Color3.fromRGB(180,180,180),
        accent = Color3.fromRGB(0,100,200),
        select = Color3.fromRGB(150,190,240),
    },
}

local currentTheme = THEMES[1]

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

local function makeDot(parent, color, xOff)
    local d = Instance.new("TextButton")
    d.Size = UDim2.new(0, 10, 0, 10)
    d.Position = UDim2.new(0, xOff, 0.5, -5)
    d.BackgroundColor3 = color
    d.Text = ""
    d.BorderSizePixel = 0
    d.Parent = parent
    Instance.new("UICorner", d).CornerRadius = UDim.new(1, 0)
    return d
end

local keyCloseBtn = makeDot(keyTitleBar, Color3.fromRGB(220,60,60), 8)
makeDot(keyTitleBar, Color3.fromRGB(220,160,0), 22)
makeDot(keyTitleBar, Color3.fromRGB(40,180,60), 36)

local keyTitleLabel = Instance.new("TextLabel")
keyTitleLabel.Size = UDim2.new(1, -60, 1, 0)
keyTitleLabel.Position = UDim2.new(0, 54, 0, 0)
keyTitleLabel.BackgroundTransparency = 1
keyTitleLabel.Text = "🔍 Dex Explorer — Key Required"
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
keySubLabel.Text = "Enter key to access Dex Explorer"
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
keyInput.PlaceholderColor3 = Color3.fromRGB(80,80,80)
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
            Position = UDim2.new(orig.X.Scale, orig.X.Offset+8, orig.Y.Scale, orig.Y.Offset)
        }):Play()
        task.wait(0.04)
        TweenService:Create(keyFrame, TweenInfo.new(0.04), {
            Position = UDim2.new(orig.X.Scale, orig.X.Offset-8, orig.Y.Scale, orig.Y.Offset)
        }):Play()
        task.wait(0.04)
    end
    TweenService:Create(keyFrame, TweenInfo.new(0.04), {Position = orig}):Play()
end

-- ══════════════════════════════
--         DEX EXPLORER
-- ══════════════════════════════

local function loadDex()

local currentKeybind = Enum.KeyCode.RightBracket
local isOpen = true
local selectionBox = nil
local currentTransformObj = nil
local currentTargetPlayer = nil
local copiedObject = nil
local contextTarget = nil
local currentScriptObj = nil
local selectedRow = nil
local nodeOrder = 0

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DexExplorer"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- All theme-affected elements list
local themedElements = {}

local function applyTheme(theme)
    currentTheme = theme
    C_BG = theme.bg
    C_DARKER = theme.dark
    C_HEADER = theme.header
    C_BORDER = theme.border
    C_BLUE = theme.accent
    C_SELECT = theme.select
    C_HOVER = Color3.new(
        math.min(theme.bg.R + 0.08, 1),
        math.min(theme.bg.G + 0.08, 1),
        math.min(theme.bg.B + 0.08, 1)
    )
    for _, el in ipairs(themedElements) do
        pcall(function()
            if el.type == "bg" then el.obj.BackgroundColor3 = theme.bg end
            if el.type == "dark" then el.obj.BackgroundColor3 = theme.dark end
            if el.type == "header" then el.obj.BackgroundColor3 = theme.header end
            if el.type == "border" then el.obj.Color = theme.border end
            if el.type == "accent" then el.obj.BackgroundColor3 = theme.accent end
            if el.type == "stroke_accent" then el.obj.Color = theme.accent end
        end)
    end
end

local function reg(obj, t)
    table.insert(themedElements, {obj=obj, type=t})
    return obj
end

-- Mini button
local miniBtn = Instance.new("TextButton")
miniBtn.Size = UDim2.new(0, 40, 0, 40)
miniBtn.Position = UDim2.new(0, 10, 0.5, -20)
miniBtn.BackgroundColor3 = C_DARKER
miniBtn.Text = "🔍"
miniBtn.TextSize = 18
miniBtn.Font = Enum.Font.GothamBold
miniBtn.BorderSizePixel = 0
miniBtn.Visible = false
miniBtn.Parent = screenGui
Instance.new("UICorner", miniBtn).CornerRadius = UDim.new(0, 8)
reg(miniBtn, "dark")

local miniBorder = Instance.new("UIStroke")
miniBorder.Color = C_BORDER
miniBorder.Thickness = 1
miniBorder.Parent = miniBtn
reg(miniBorder, "border")

-- Main frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 760, 0, 540)
mainFrame.Position = UDim2.new(0.5, -380, 0.5, -270)
mainFrame.BackgroundColor3 = C_BG
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 4)
reg(mainFrame, "bg")

local mainBorder = Instance.new("UIStroke")
mainBorder.Color = C_BORDER
mainBorder.Thickness = 1
mainBorder.Parent = mainFrame
reg(mainBorder, "border")

-- Title bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 28)
titleBar.BackgroundColor3 = C_DARKER
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame
reg(titleBar, "dark")

local titleSep = Instance.new("Frame")
titleSep.Size = UDim2.new(1, 0, 0, 1)
titleSep.Position = UDim2.new(0, 0, 1, 0)
titleSep.BackgroundColor3 = C_BORDER
titleSep.BorderSizePixel = 0
titleSep.Parent = titleBar
reg(titleSep, "border")

local closeWinBtn = makeDot(titleBar, Color3.fromRGB(220,60,60), 8)
local minWinBtn = makeDot(titleBar, Color3.fromRGB(220,160,0), 22)
local maxWinBtn = makeDot(titleBar, Color3.fromRGB(40,180,60), 36)

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -100, 1, 0)
titleLabel.Position = UDim2.new(0.5, -100, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "🔍 Dex Explorer — H4ll0 W0rld"
titleLabel.TextColor3 = C_DIM
titleLabel.TextSize = 12
titleLabel.Font = Enum.Font.Gotham
titleLabel.TextXAlignment = Enum.TextXAlignment.Center
titleLabel.Parent = titleBar

local settingsBtn = Instance.new("TextButton")
settingsBtn.Size = UDim2.new(0, 26, 0, 20)
settingsBtn.Position = UDim2.new(1, -30, 0.5, -10)
settingsBtn.BackgroundColor3 = C_DARKER
settingsBtn.Text = "⚙️"
settingsBtn.TextSize = 12
settingsBtn.Font = Enum.Font.Gotham
settingsBtn.BorderSizePixel = 0
settingsBtn.Parent = titleBar
Instance.new("UICorner", settingsBtn).CornerRadius = UDim.new(0, 3)
reg(settingsBtn, "dark")

-- Toolbar
local toolbar = Instance.new("Frame")
toolbar.Size = UDim2.new(1, 0, 0, 28)
toolbar.Position = UDim2.new(0, 0, 0, 29)
toolbar.BackgroundColor3 = C_HEADER
toolbar.BorderSizePixel = 0
toolbar.Parent = mainFrame
reg(toolbar, "header")

local toolbarSep = Instance.new("Frame")
toolbarSep.Size = UDim2.new(1, 0, 0, 1)
toolbarSep.Position = UDim2.new(0, 0, 1, 0)
toolbarSep.BackgroundColor3 = C_BORDER
toolbarSep.BorderSizePixel = 0
toolbarSep.Parent = toolbar
reg(toolbarSep, "border")

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
    reg(btn, "header")
    btn.MouseEnter:Connect(function() btn.BackgroundColor3 = C_HOVER end)
    btn.MouseLeave:Connect(function() btn.BackgroundColor3 = C_HEADER end)
    return btn
end

local refreshBtn = makeToolBtn("↺ Refresh", 6, 70)

local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(0, 160, 0, 20)
searchBox.Position = UDim2.new(1, -168, 0.5, -10)
searchBox.BackgroundColor3 = C_INPUT
searchBox.Text = ""
searchBox.PlaceholderText = "🔍 Search..."
searchBox.PlaceholderColor3 = Color3.fromRGB(80,80,80)
searchBox.TextColor3 = C_TEXT
searchBox.TextSize = 11
searchBox.Font = Enum.Font.Gotham
searchBox.BorderSizePixel = 0
searchBox.ClearTextOnFocus = false
searchBox.Parent = toolbar
Instance.new("UICorner", searchBox).CornerRadius = UDim.new(0, 3)

local sb = Instance.new("UIStroke")
sb.Color = C_BORDER
sb.Thickness = 1
sb.Parent = searchBox
reg(sb, "border")

-- Content area
local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1, 0, 1, -58)
contentArea.Position = UDim2.new(0, 0, 0, 58)
contentArea.BackgroundTransparency = 1
contentArea.Parent = mainFrame

-- Left panel
local leftPanel = Instance.new("Frame")
leftPanel.Size = UDim2.new(0, 260, 1, 0)
leftPanel.BackgroundColor3 = C_DARKER
leftPanel.BorderSizePixel = 0
leftPanel.Parent = contentArea
reg(leftPanel, "dark")

local leftHeader = Instance.new("Frame")
leftHeader.Size = UDim2.new(1, 0, 0, 22)
leftHeader.BackgroundColor3 = C_HEADER
leftHeader.BorderSizePixel = 0
leftHeader.Parent = leftPanel
reg(leftHeader, "header")

local leftHeaderLbl = Instance.new("TextLabel")
leftHeaderLbl.Size = UDim2.new(1, -10, 1, 0)
leftHeaderLbl.Position = UDim2.new(0, 8, 0, 0)
leftHeaderLbl.BackgroundTransparency = 1
leftHeaderLbl.Text = "Explorer"
leftHeaderLbl.TextColor3 = C_DIM
leftHeaderLbl.TextSize = 11
leftHeaderLbl.Font = Enum.Font.GothamBold
leftHeaderLbl.TextXAlignment = Enum.TextXAlignment.Left
leftHeaderLbl.Parent = leftHeader

local lhSep = Instance.new("Frame")
lhSep.Size = UDim2.new(1, 0, 0, 1)
lhSep.Position = UDim2.new(0, 0, 1, 0)
lhSep.BackgroundColor3 = C_BORDER
lhSep.BorderSizePixel = 0
lhSep.Parent = leftHeader
reg(lhSep, "border")

local explorerScroll = Instance.new("ScrollingFrame")
explorerScroll.Size = UDim2.new(1, 0, 1, -23)
explorerScroll.Position = UDim2.new(0, 0, 0, 23)
explorerScroll.BackgroundTransparency = 1
explorerScroll.BorderSizePixel = 0
explorerScroll.ScrollBarThickness = 5
explorerScroll.ScrollBarImageColor3 = Color3.fromRGB(80,80,80)
explorerScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
explorerScroll.Parent = leftPanel

local explorerLayout = Instance.new("UIListLayout")
explorerLayout.SortOrder = Enum.SortOrder.LayoutOrder
explorerLayout.Padding = UDim.new(0, 0)
explorerLayout.Parent = explorerScroll

explorerLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    explorerScroll.CanvasSize = UDim2.new(0, 0, 0, explorerLayout.AbsoluteContentSize.Y)
end)

local divider = Instance.new("Frame")
divider.Size = UDim2.new(0, 1, 1, 0)
divider.Position = UDim2.new(0, 260, 0, 0)
divider.BackgroundColor3 = C_BORDER
divider.BorderSizePixel = 0
divider.Parent = contentArea
reg(divider, "border")

-- Right panel
local rightPanel = Instance.new("Frame")
rightPanel.Size = UDim2.new(1, -262, 1, 0)
rightPanel.Position = UDim2.new(0, 262, 0, 0)
rightPanel.BackgroundColor3 = C_DARKER
rightPanel.BorderSizePixel = 0
rightPanel.Parent = contentArea
reg(rightPanel, "dark")

local rightHeader = Instance.new("Frame")
rightHeader.Size = UDim2.new(1, 0, 0, 22)
rightHeader.BackgroundColor3 = C_HEADER
rightHeader.BorderSizePixel = 0
rightHeader.Parent = rightPanel
reg(rightHeader, "header")

local rightHeaderLbl = Instance.new("TextLabel")
rightHeaderLbl.Size = UDim2.new(1, -10, 1, 0)
rightHeaderLbl.Position = UDim2.new(0, 8, 0, 0)
rightHeaderLbl.BackgroundTransparency = 1
rightHeaderLbl.Text = "Properties"
rightHeaderLbl.TextColor3 = C_DIM
rightHeaderLbl.TextSize = 11
rightHeaderLbl.Font = Enum.Font.GothamBold
rightHeaderLbl.TextXAlignment = Enum.TextXAlignment.Left
rightHeaderLbl.Parent = rightHeader

local rhSep = Instance.new("Frame")
rhSep.Size = UDim2.new(1, 0, 0, 1)
rhSep.Position = UDim2.new(0, 0, 1, 0)
rhSep.BackgroundColor3 = C_BORDER
rhSep.BorderSizePixel = 0
rhSep.Parent = rightHeader
reg(rhSep, "border")

local colHeader = Instance.new("Frame")
colHeader.Size = UDim2.new(1, 0, 0, 20)
colHeader.Position = UDim2.new(0, 0, 0, 23)
colHeader.BackgroundColor3 = C_BG
colHeader.BorderSizePixel = 0
colHeader.Parent = rightPanel
reg(colHeader, "bg")

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

local colMid = Instance.new("Frame")
colMid.Size = UDim2.new(0, 1, 1, 0)
colMid.Position = UDim2.new(0.5, 0, 0, 0)
colMid.BackgroundColor3 = C_BORDER
colMid.BorderSizePixel = 0
colMid.Parent = colHeader
reg(colMid, "border")

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

local chSep = Instance.new("Frame")
chSep.Size = UDim2.new(1, 0, 0, 1)
chSep.Position = UDim2.new(0, 0, 1, 0)
chSep.BackgroundColor3 = C_BORDER
chSep.BorderSizePixel = 0
chSep.Parent = colHeader
reg(chSep, "border")

local propScroll = Instance.new("ScrollingFrame")
propScroll.Size = UDim2.new(1, 0, 0.6, -44)
propScroll.Position = UDim2.new(0, 0, 0, 44)
propScroll.BackgroundTransparency = 1
propScroll.BorderSizePixel = 0
propScroll.ScrollBarThickness = 5
propScroll.ScrollBarImageColor3 = Color3.fromRGB(80,80,80)
propScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
propScroll.Parent = rightPanel

local propLayout = Instance.new("UIListLayout")
propLayout.SortOrder = Enum.SortOrder.LayoutOrder
propLayout.Padding = UDim.new(0, 0)
propLayout.Parent = propScroll

propLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    propScroll.CanvasSize = UDim2.new(0, 0, 0, propLayout.AbsoluteContentSize.Y)
end)

-- Backpack panel
local backpackDiv = Instance.new("Frame")
backpackDiv.Size = UDim2.new(1, 0, 0, 1)
backpackDiv.Position = UDim2.new(0, 0, 0.6, 0)
backpackDiv.BackgroundColor3 = C_BORDER
backpackDiv.BorderSizePixel = 0
backpackDiv.Parent = rightPanel
reg(backpackDiv, "border")

local backpackPanel = Instance.new("Frame")
backpackPanel.Size = UDim2.new(1, 0, 0.4, -1)
backpackPanel.Position = UDim2.new(0, 0, 0.6, 1)
backpackPanel.BackgroundColor3 = C_DARKER
backpackPanel.BorderSizePixel = 0
backpackPanel.Parent = rightPanel
reg(backpackPanel, "dark")

local bpHeader = Instance.new("Frame")
bpHeader.Size = UDim2.new(1, 0, 0, 24)
bpHeader.BackgroundColor3 = C_HEADER
bpHeader.BorderSizePixel = 0
bpHeader.Parent = backpackPanel
reg(bpHeader, "header")

local bpHeaderSep = Instance.new("Frame")
bpHeaderSep.Size = UDim2.new(1, 0, 0, 1)
bpHeaderSep.Position = UDim2.new(0, 0, 1, 0)
bpHeaderSep.BackgroundColor3 = C_BORDER
bpHeaderSep.BorderSizePixel = 0
bpHeaderSep.Parent = bpHeader
reg(bpHeaderSep, "border")

local bpHeaderLbl = Instance.new("TextLabel")
bpHeaderLbl.Size = UDim2.new(0.6, 0, 1, 0)
bpHeaderLbl.Position = UDim2.new(0, 8, 0, 0)
bpHeaderLbl.BackgroundTransparency = 1
bpHeaderLbl.Text = "🎒 Backpack"
bpHeaderLbl.TextColor3 = C_TEXT
bpHeaderLbl.TextSize = 11
bpHeaderLbl.Font = Enum.Font.GothamBold
bpHeaderLbl.TextXAlignment = Enum.TextXAlignment.Left
bpHeaderLbl.Parent = bpHeader

local bpTargetLabel = Instance.new("TextLabel")
bpTargetLabel.Size = UDim2.new(0.4, -8, 1, 0)
bpTargetLabel.Position = UDim2.new(0.6, 0, 0, 0)
bpTargetLabel.BackgroundTransparency = 1
bpTargetLabel.Text = "Target: —"
bpTargetLabel.TextColor3 = C_DIM
bpTargetLabel.TextSize = 10
bpTargetLabel.Font = Enum.Font.Gotham
bpTargetLabel.TextXAlignment = Enum.TextXAlignment.Right
bpTargetLabel.Parent = bpHeader

local toolInputRow = Instance.new("Frame")
toolInputRow.Size = UDim2.new(1, 0, 0, 28)
toolInputRow.Position = UDim2.new(0, 0, 0, 25)
toolInputRow.BackgroundColor3 = C_BG
toolInputRow.BorderSizePixel = 0
toolInputRow.Parent = backpackPanel
reg(toolInputRow, "bg")

local toolNameBox = Instance.new("TextBox")
toolNameBox.Size = UDim2.new(1, -140, 0, 20)
toolNameBox.Position = UDim2.new(0, 6, 0.5, -10)
toolNameBox.BackgroundColor3 = C_INPUT
toolNameBox.Text = ""
toolNameBox.PlaceholderText = "Tool name..."
toolNameBox.PlaceholderColor3 = Color3.fromRGB(70,70,70)
toolNameBox.TextColor3 = C_TEXT
toolNameBox.TextSize = 11
toolNameBox.Font = Enum.Font.Gotham
toolNameBox.BorderSizePixel = 0
toolNameBox.ClearTextOnFocus = false
toolNameBox.Parent = toolInputRow
Instance.new("UICorner", toolNameBox).CornerRadius = UDim.new(0, 3)

local tnBorder = Instance.new("UIStroke")
tnBorder.Color = C_BORDER
tnBorder.Thickness = 1
tnBorder.Parent = toolNameBox
reg(tnBorder, "border")

local giveToolBtn = Instance.new("TextButton")
giveToolBtn.Size = UDim2.new(0, 62, 0, 20)
giveToolBtn.Position = UDim2.new(1, -130, 0.5, -10)
giveToolBtn.BackgroundColor3 = Color3.fromRGB(40,80,40)
giveToolBtn.Text = "+ Give"
giveToolBtn.TextColor3 = C_GREEN
giveToolBtn.TextSize = 11
giveToolBtn.Font = Enum.Font.GothamBold
giveToolBtn.BorderSizePixel = 0
giveToolBtn.Parent = toolInputRow
Instance.new("UICorner", giveToolBtn).CornerRadius = UDim.new(0, 3)

local clearBpBtn = Instance.new("TextButton")
clearBpBtn.Size = UDim2.new(0, 58, 0, 20)
clearBpBtn.Position = UDim2.new(1, -66, 0.5, -10)
clearBpBtn.BackgroundColor3 = Color3.fromRGB(70,30,30)
clearBpBtn.Text = "🗑 Clear"
clearBpBtn.TextColor3 = C_RED
clearBpBtn.TextSize = 11
clearBpBtn.Font = Enum.Font.GothamBold
clearBpBtn.BorderSizePixel = 0
clearBpBtn.Parent = toolInputRow
Instance.new("UICorner", clearBpBtn).CornerRadius = UDim.new(0, 3)

local toolScroll = Instance.new("ScrollingFrame")
toolScroll.Size = UDim2.new(1, 0, 1, -54)
toolScroll.Position = UDim2.new(0, 0, 0, 54)
toolScroll.BackgroundTransparency = 1
toolScroll.BorderSizePixel = 0
toolScroll.ScrollBarThickness = 4
toolScroll.ScrollBarImageColor3 = Color3.fromRGB(80,80,80)
toolScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
toolScroll.Parent = backpackPanel

local toolLayout = Instance.new("UIListLayout")
toolLayout.SortOrder = Enum.SortOrder.LayoutOrder
toolLayout.Padding = UDim.new(0, 0)
toolLayout.Parent = toolScroll

toolLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    toolScroll.CanvasSize = UDim2.new(0, 0, 0, toolLayout.AbsoluteContentSize.Y)
end)

-- ══════════════════════════════
--     SETTINGS PANEL (FIXED)
-- ══════════════════════════════

local settingsPanel = Instance.new("Frame")
settingsPanel.Size = UDim2.new(0, 280, 0, 420)
settingsPanel.Position = UDim2.new(1, -290, 0, 30)
settingsPanel.BackgroundColor3 = C_DARKER
settingsPanel.BorderSizePixel = 0
settingsPanel.Visible = false
settingsPanel.ZIndex = 10
settingsPanel.Parent = mainFrame
Instance.new("UICorner", settingsPanel).CornerRadius = UDim.new(0, 6)
reg(settingsPanel, "dark")

local spBorder = Instance.new("UIStroke")
spBorder.Color = C_BORDER
spBorder.Thickness = 1
spBorder.Parent = settingsPanel
reg(spBorder, "border")

-- Settings title
local spTitleBar = Instance.new("Frame")
spTitleBar.Size = UDim2.new(1, 0, 0, 32)
spTitleBar.BackgroundColor3 = C_HEADER
spTitleBar.BorderSizePixel = 0
spTitleBar.ZIndex = 11
spTitleBar.Parent = settingsPanel
Instance.new("UICorner", spTitleBar).CornerRadius = UDim.new(0, 6)
reg(spTitleBar, "header")

local spTitleLbl = Instance.new("TextLabel")
spTitleLbl.Size = UDim2.new(1, -40, 1, 0)
spTitleLbl.Position = UDim2.new(0, 10, 0, 0)
spTitleLbl.BackgroundTransparency = 1
spTitleLbl.Text = "⚙️ Settings"
spTitleLbl.TextColor3 = C_TEXT
spTitleLbl.TextSize = 13
spTitleLbl.Font = Enum.Font.GothamBold
spTitleLbl.TextXAlignment = Enum.TextXAlignment.Left
spTitleLbl.ZIndex = 12
spTitleLbl.Parent = spTitleBar

local spCloseBtn = Instance.new("TextButton")
spCloseBtn.Size = UDim2.new(0, 22, 0, 22)
spCloseBtn.Position = UDim2.new(1, -26, 0.5, -11)
spCloseBtn.BackgroundColor3 = Color3.fromRGB(80,30,30)
spCloseBtn.Text = "✕"
spCloseBtn.TextColor3 = C_WHITE
spCloseBtn.TextSize = 11
spCloseBtn.Font = Enum.Font.GothamBold
spCloseBtn.BorderSizePixel = 0
spCloseBtn.ZIndex = 12
spCloseBtn.Parent = spTitleBar
Instance.new("UICorner", spCloseBtn).CornerRadius = UDim.new(0, 3)

spCloseBtn.MouseButton1Click:Connect(function()
    settingsPanel.Visible = false
end)

local spScroll = Instance.new("ScrollingFrame")
spScroll.Size = UDim2.new(1, 0, 1, -34)
spScroll.Position = UDim2.new(0, 0, 0, 34)
spScroll.BackgroundTransparency = 1
spScroll.BorderSizePixel = 0
spScroll.ScrollBarThickness = 4
spScroll.ScrollBarImageColor3 = Color3.fromRGB(80,80,80)
spScroll.ZIndex = 11
spScroll.Parent = settingsPanel

local spLayout = Instance.new("UIListLayout")
spLayout.SortOrder = Enum.SortOrder.LayoutOrder
spLayout.Padding = UDim.new(0, 0)
spLayout.Parent = spScroll

spLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    spScroll.CanvasSize = UDim2.new(0, 0, 0, spLayout.AbsoluteContentSize.Y + 8)
end)

local function makeSpSection(title, order)
    local sec = Instance.new("Frame")
    sec.Size = UDim2.new(1, 0, 0, 28)
    sec.BackgroundColor3 = C_BG
    sec.BorderSizePixel = 0
    sec.LayoutOrder = order
    sec.ZIndex = 12
    sec.Parent = spScroll
    reg(sec, "bg")

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -16, 1, 0)
    lbl.Position = UDim2.new(0, 8, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = title
    lbl.TextColor3 = C_BLUE
    lbl.TextSize = 11
    lbl.Font = Enum.Font.GothamBold
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 13
    lbl.Parent = sec

    local sepLine = Instance.new("Frame")
    sepLine.Size = UDim2.new(1, -16, 0, 1)
    sepLine.Position = UDim2.new(0, 8, 1, -1)
    sepLine.BackgroundColor3 = C_BORDER
    sepLine.BorderSizePixel = 0
    sepLine.ZIndex = 13
    sepLine.Parent = sec
    reg(sepLine, "border")
end

-- KEYBIND SECTION
makeSpSection("⌨️ Keybind", 1)

local keybindRow = Instance.new("Frame")
keybindRow.Size = UDim2.new(1, 0, 0, 44)
keybindRow.BackgroundColor3 = C_DARKER
keybindRow.BorderSizePixel = 0
keybindRow.LayoutOrder = 2
keybindRow.ZIndex = 12
keybindRow.Parent = spScroll
reg(keybindRow, "dark")

local kbLabel = Instance.new("TextLabel")
kbLabel.Size = UDim2.new(1, -16, 0, 18)
kbLabel.Position = UDim2.new(0, 8, 0, 4)
kbLabel.BackgroundTransparency = 1
kbLabel.Text = "Toggle Dex Explorer:"
kbLabel.TextColor3 = C_TEXT
kbLabel.TextSize = 11
kbLabel.Font = Enum.Font.Gotham
kbLabel.TextXAlignment = Enum.TextXAlignment.Left
kbLabel.ZIndex = 13
kbLabel.Parent = keybindRow

local keybindBtn = Instance.new("TextButton")
keybindBtn.Size = UDim2.new(1, -16, 0, 20)
keybindBtn.Position = UDim2.new(0, 8, 0, 20)
keybindBtn.BackgroundColor3 = C_BG
keybindBtn.Text = "[ ] ] — Click to change"
keybindBtn.TextColor3 = C_BLUE
keybindBtn.TextSize = 11
keybindBtn.Font = Enum.Font.GothamBold
keybindBtn.BorderSizePixel = 0
keybindBtn.ZIndex = 13
keybindBtn.Parent = keybindRow
Instance.new("UICorner", keybindBtn).CornerRadius = UDim.new(0, 3)
reg(keybindBtn, "bg")

local kbBorder = Instance.new("UIStroke")
kbBorder.Color = C_BORDER
kbBorder.Thickness = 1
kbBorder.Parent = keybindBtn
reg(kbBorder, "border")

-- THEME SECTION
makeSpSection("🎨 Theme", 3)

local themeGrid = Instance.new("Frame")
themeGrid.Size = UDim2.new(1, 0, 0, 140)
themeGrid.BackgroundColor3 = C_DARKER
themeGrid.BorderSizePixel = 0
themeGrid.LayoutOrder = 4
themeGrid.ZIndex = 12
themeGrid.Parent = spScroll
reg(themeGrid, "dark")

local themeGridLayout = Instance.new("UIGridLayout")
themeGridLayout.CellSize = UDim2.new(0, 82, 0, 60)
themeGridLayout.CellPadding = UDim2.new(0, 4, 0, 4)
themeGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
themeGridLayout.Parent = themeGrid

local themeGridPad = Instance.new("UIPadding")
themeGridPad.PaddingAll = UDim.new(0, 6)
themeGridPad.Parent = themeGrid

for i, theme in ipairs(THEMES) do
    local tb = Instance.new("TextButton")
    tb.Size = UDim2.new(0, 82, 0, 60)
    tb.BackgroundColor3 = theme.bg
    tb.Text = ""
    tb.BorderSizePixel = 0
    tb.LayoutOrder = i
    tb.ZIndex = 13
    tb.Parent = themeGrid
    Instance.new("UICorner", tb).CornerRadius = UDim.new(0, 6)

    local tbBorder = Instance.new("UIStroke")
    tbBorder.Color = theme.border
    tbBorder.Thickness = 1
    tbBorder.Parent = tb

    local tbIcon = Instance.new("TextLabel")
    tbIcon.Size = UDim2.new(1, 0, 0, 28)
    tbIcon.Position = UDim2.new(0, 0, 0, 6)
    tbIcon.BackgroundTransparency = 1
    tbIcon.Text = theme.icon
    tbIcon.TextSize = 20
    tbIcon.Font = Enum.Font.Gotham
    tbIcon.ZIndex = 14
    tbIcon.Parent = tb

    local tbName = Instance.new("TextLabel")
    tbName.Size = UDim2.new(1, 0, 0, 16)
    tbName.Position = UDim2.new(0, 0, 1, -20)
    tbName.BackgroundTransparency = 1
    tbName.Text = theme.name
    tbName.TextColor3 = Color3.fromRGB(200,200,200)
    tbName.TextSize = 10
    tbName.Font = Enum.Font.GothamBold
    tbName.ZIndex = 14
    tbName.Parent = tb

    local checkMark = Instance.new("TextLabel")
    checkMark.Size = UDim2.new(0, 16, 0, 16)
    checkMark.Position = UDim2.new(1, -18, 0, 2)
    checkMark.BackgroundTransparency = 1
    checkMark.Text = "✓"
    checkMark.TextColor3 = C_GREEN
    checkMark.TextSize = 12
    checkMark.Font = Enum.Font.GothamBold
    checkMark.ZIndex = 14
    checkMark.Visible = (i == 1)
    checkMark.Parent = tb

    tb.MouseButton1Click:Connect(function()
        applyTheme(theme)
        for _, btn in pairs(themeGrid:GetChildren()) do
            if btn:IsA("TextButton") then
                local cm = btn:FindFirstChildWhichIsA("TextLabel")
                if cm and cm.Text == "✓" then cm.Visible = false end
            end
        end
        checkMark.Visible = true
        tbBorder.Thickness = 2
        tbBorder.Color = C_GREEN
        task.wait(0.3)
        tbBorder.Color = theme.border
        tbBorder.Thickness = 1
    end)

    tb.MouseEnter:Connect(function()
        TweenService:Create(tb, TweenInfo.new(0.15), {
            BackgroundColor3 = Color3.new(
                math.min(theme.bg.R + 0.05, 1),
                math.min(theme.bg.G + 0.05, 1),
                math.min(theme.bg.B + 0.05, 1)
            )
        }):Play()
    end)
    tb.MouseLeave:Connect(function()
        TweenService:Create(tb, TweenInfo.new(0.15), {BackgroundColor3 = theme.bg}):Play()
    end)
end

-- EXPLORER OPTIONS SECTION
makeSpSection("🌍 Explorer", 5)

local explorerOptsRow = Instance.new("Frame")
explorerOptsRow.Size = UDim2.new(1, 0, 0, 56)
explorerOptsRow.BackgroundColor3 = C_DARKER
explorerOptsRow.BorderSizePixel = 0
explorerOptsRow.LayoutOrder = 6
explorerOptsRow.ZIndex = 12
explorerOptsRow.Parent = spScroll
reg(explorerOptsRow, "dark")

local function makeSpToggle(parent, text, yPos, order, default, callback)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, 0, 0, 26)
    row.Position = UDim2.new(0, 0, 0, yPos)
    row.BackgroundTransparency = 1
    row.BorderSizePixel = 0
    row.ZIndex = 13
    row.Parent = parent

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(0.65, 0, 1, 0)
    lbl.Position = UDim2.new(0, 8, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = C_TEXT
    lbl.TextSize = 11
    lbl.Font = Enum.Font.Gotham
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 14
    lbl.Parent = row

    local tog = Instance.new("TextButton")
    tog.Size = UDim2.new(0, 46, 0, 18)
    tog.Position = UDim2.new(1, -54, 0.5, -9)
    tog.BackgroundColor3 = default and Color3.fromRGB(0,60,0) or Color3.fromRGB(60,0,0)
    tog.Text = default and "ON" or "OFF"
    tog.TextColor3 = default and C_GREEN or C_RED
    tog.TextSize = 10
    tog.Font = Enum.Font.GothamBold
    tog.BorderSizePixel = 0
    tog.ZIndex = 14
    tog.Parent = row
    Instance.new("UICorner", tog).CornerRadius = UDim.new(0, 3)

    local state = default
    tog.MouseButton1Click:Connect(function()
        state = not state
        if state then
            tog.Text = "ON"
            tog.TextColor3 = C_GREEN
            TweenService:Create(tog, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(0,60,0)}):Play()
        else
            tog.Text = "OFF"
            tog.TextColor3 = C_RED
            TweenService:Create(tog, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(60,0,0)}):Play()
        end
        if callback then callback(state) end
    end)
    return tog
end

makeSpToggle(explorerOptsRow, "Show Class Names", 0, 6, true, function(v) end)
makeSpToggle(explorerOptsRow, "Auto Refresh on Open", 28, 7, false, function(v) end)

-- ABOUT SECTION
makeSpSection("ℹ️ About", 7)

local aboutRow = Instance.new("Frame")
aboutRow.Size = UDim2.new(1, 0, 0, 60)
aboutRow.BackgroundColor3 = C_DARKER
aboutRow.BorderSizePixel = 0
aboutRow.LayoutOrder = 8
aboutRow.ZIndex = 12
aboutRow.Parent = spScroll
reg(aboutRow, "dark")

local aboutText = Instance.new("TextLabel")
aboutText.Size = UDim2.new(1, -16, 1, 0)
aboutText.Position = UDim2.new(0, 8, 0, 0)
aboutText.BackgroundTransparency = 1
aboutText.Text = "🔍 Dex Explorer\n💀 H4ll0 W0rld\nKey: DEX_H4LL0_2026"
aboutText.TextColor3 = C_DIM
aboutText.TextSize = 10
aboutText.Font = Enum.Font.Gotham
aboutText.TextXAlignment = Enum.TextXAlignment.Left
aboutText.TextYAlignment = Enum.TextYAlignment.Center
aboutText.TextWrapped = true
aboutText.ZIndex = 13
aboutText.Parent = aboutRow

-- ══════════════════════════════
--     TRANSFORM PANEL
-- ══════════════════════════════

local transformPanel = Instance.new("Frame")
transformPanel.Size = UDim2.new(0, 280, 0, 0)
transformPanel.Position = UDim2.new(0, 10, 0, 60)
transformPanel.BackgroundColor3 = C_DARKER
transformPanel.BorderSizePixel = 0
transformPanel.Visible = false
transformPanel.ZIndex = 15
transformPanel.ClipsDescendants = true
transformPanel.Parent = screenGui
Instance.new("UICorner", transformPanel).CornerRadius = UDim.new(0, 4)
reg(transformPanel, "dark")

local tpBorder = Instance.new("UIStroke")
tpBorder.Color = C_BLUE
tpBorder.Thickness = 1
tpBorder.Parent = transformPanel
reg(tpBorder, "stroke_accent")

local tpLayout = Instance.new("UIListLayout")
tpLayout.SortOrder = Enum.SortOrder.LayoutOrder
tpLayout.Padding = UDim.new(0, 0)
tpLayout.Parent = transformPanel

tpLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    transformPanel.Size = UDim2.new(0, 280, 0, tpLayout.AbsoluteContentSize.Y)
end)

-- Transform title
local tpTitleBar = Instance.new("Frame")
tpTitleBar.Size = UDim2.new(1, 0, 0, 26)
tpTitleBar.BackgroundColor3 = C_HEADER
tpTitleBar.BorderSizePixel = 0
tpTitleBar.LayoutOrder = 0
tpTitleBar.ZIndex = 16
tpTitleBar.Parent = transformPanel
reg(tpTitleBar, "header")

local tpTitle = Instance.new("TextLabel")
tpTitle.Size = UDim2.new(1, -40, 1, 0)
tpTitle.Position = UDim2.new(0, 8, 0, 0)
tpTitle.BackgroundTransparency = 1
tpTitle.Text = "🛠️ Transform"
tpTitle.TextColor3 = C_TEXT
tpTitle.TextSize = 12
tpTitle.Font = Enum.Font.GothamBold
tpTitle.TextXAlignment = Enum.TextXAlignment.Left
tpTitle.ZIndex = 17
tpTitle.Parent = tpTitleBar

local tpCloseBtn = Instance.new("TextButton")
tpCloseBtn.Size = UDim2.new(0, 20, 0, 20)
tpCloseBtn.Position = UDim2.new(1, -24, 0.5, -10)
tpCloseBtn.BackgroundColor3 = Color3.fromRGB(80,30,30)
tpCloseBtn.Text = "✕"
tpCloseBtn.TextColor3 = C_WHITE
tpCloseBtn.TextSize = 11
tpCloseBtn.Font = Enum.Font.GothamBold
tpCloseBtn.BorderSizePixel = 0
tpCloseBtn.ZIndex = 17
tpCloseBtn.Parent = tpTitleBar
Instance.new("UICorner", tpCloseBtn).CornerRadius = UDim.new(0, 3)

tpCloseBtn.MouseButton1Click:Connect(function()
    transformPanel.Visible = false
    if selectionBox then selectionBox:Destroy(); selectionBox = nil end
end)

local function makeTpSectionHeader(text, order)
    local h = Instance.new("Frame")
    h.Size = UDim2.new(1, 0, 0, 20)
    h.BackgroundColor3 = C_HEADER
    h.BorderSizePixel = 0
    h.LayoutOrder = order
    h.ZIndex = 16
    h.Parent = transformPanel
    reg(h, "header")

    local hl = Instance.new("TextLabel")
    hl.Size = UDim2.new(1, -10, 1, 0)
    hl.Position = UDim2.new(0, 8, 0, 0)
    hl.BackgroundTransparency = 1
    hl.Text = text
    hl.TextColor3 = C_BLUE
    hl.TextSize = 11
    hl.Font = Enum.Font.GothamBold
    hl.TextXAlignment = Enum.TextXAlignment.Left
    hl.ZIndex = 17
    hl.Parent = h
end

local posXBox, posYBox, posZBox
local sizeXBox, sizeYBox, sizeZBox
local rotXBox, rotYBox, rotZBox

local function makeXYZRow(label, order, setter)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, 0, 0, 26)
    row.BackgroundColor3 = C_DARKER
    row.BorderSizePixel = 0
    row.LayoutOrder = order
    row.ZIndex = 16
    row.Parent = transformPanel
    reg(row, "dark")

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(0, 18, 1, 0)
    lbl.Position = UDim2.new(0, 6, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = label
    lbl.TextColor3 = label == "X" and Color3.fromRGB(255,80,80)
        or label == "Y" and Color3.fromRGB(80,255,80)
        or Color3.fromRGB(80,120,255)
    lbl.TextSize = 12
    lbl.Font = Enum.Font.GothamBold
    lbl.ZIndex = 17
    lbl.Parent = row

    local box = Instance.new("TextBox")
    box.Size = UDim2.new(1, -80, 0, 18)
    box.Position = UDim2.new(0, 26, 0.5, -9)
    box.BackgroundColor3 = C_INPUT
    box.Text = "0"
    box.TextColor3 = C_TEXT
    box.TextSize = 11
    box.Font = Enum.Font.Gotham
    box.BorderSizePixel = 0
    box.ClearTextOnFocus = false
    box.ZIndex = 17
    box.Parent = row
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 3)

    local boxBorder = Instance.new("UIStroke")
    boxBorder.Color = C_BORDER
    boxBorder.Thickness = 1
    boxBorder.Parent = box
    reg(boxBorder, "border")

    local decBtn = Instance.new("TextButton")
    decBtn.Size = UDim2.new(0, 22, 0, 18)
    decBtn.Position = UDim2.new(1, -48, 0.5, -9)
    decBtn.BackgroundColor3 = C_HEADER
    decBtn.Text = "−"
    decBtn.TextColor3 = C_TEXT
    decBtn.TextSize = 14
    decBtn.Font = Enum.Font.GothamBold
    decBtn.BorderSizePixel = 0
    decBtn.ZIndex = 17
    decBtn.Parent = row
    Instance.new("UICorner", decBtn).CornerRadius = UDim.new(0, 3)
    reg(decBtn, "header")

    local incBtn = Instance.new("TextButton")
    incBtn.Size = UDim2.new(0, 22, 0, 18)
    incBtn.Position = UDim2.new(1, -24, 0.5, -9)
    incBtn.BackgroundColor3 = C_HEADER
    incBtn.Text = "+"
    incBtn.TextColor3 = C_TEXT
    incBtn.TextSize = 14
    incBtn.Font = Enum.Font.GothamBold
    incBtn.BorderSizePixel = 0
    incBtn.ZIndex = 17
    incBtn.Parent = row
    Instance.new("UICorner", incBtn).CornerRadius = UDim.new(0, 3)
    reg(incBtn, "header")

    local function apply()
        if not currentTransformObj then return end
        local n = tonumber(box.Text)
        if n then pcall(function() setter(currentTransformObj, n) end) end
    end

    box.FocusLost:Connect(function(enter) if enter then apply() end end)
    decBtn.MouseButton1Click:Connect(function()
        box.Text = tostring((tonumber(box.Text) or 0) - 1)
        apply()
    end)
    incBtn.MouseButton1Click:Connect(function()
        box.Text = tostring((tonumber(box.Text) or 0) + 1)
        apply()
    end)

    return box
end

makeTpSectionHeader("📐 Position", 1)
posXBox = makeXYZRow("X", 2, function(obj, v) obj.Position = Vector3.new(v, obj.Position.Y, obj.Position.Z) end)
posYBox = makeXYZRow("Y", 3, function(obj, v) obj.Position = Vector3.new(obj.Position.X, v, obj.Position.Z) end)
posZBox = makeXYZRow("Z", 4, function(obj, v) obj.Position = Vector3.new(obj.Position.X, obj.Position.Y, v) end)

makeTpSectionHeader("📦 Size", 5)
sizeXBox = makeXYZRow("X", 6, function(obj, v) obj.Size = Vector3.new(math.max(0.05,v), obj.Size.Y, obj.Size.Z) end)
sizeYBox = makeXYZRow("Y", 7, function(obj, v) obj.Size = Vector3.new(obj.Size.X, math.max(0.05,v), obj.Size.Z) end)
sizeZBox = makeXYZRow("Z", 8, function(obj, v) obj.Size = Vector3.new(obj.Size.X, obj.Size.Y, math.max(0.05,v)) end)

makeTpSectionHeader("🔄 Rotation", 9)
rotXBox = makeXYZRow("X", 10, function(obj, v)
    obj.CFrame = CFrame.new(obj.Position) * CFrame.Angles(math.rad(v), math.rad(obj.Orientation.Y), math.rad(obj.Orientation.Z))
end)
rotYBox = makeXYZRow("Y", 11, function(obj, v)
    obj.CFrame = CFrame.new(obj.Position) * CFrame.Angles(math.rad(obj.Orientation.X), math.rad(v), math.rad(obj.Orientation.Z))
end)
rotZBox = makeXYZRow("Z", 12, function(obj, v)
    obj.CFrame = CFrame.new(obj.Position) * CFrame.Angles(math.rad(obj.Orientation.X), math.rad(obj.Orientation.Y), math.rad(v))
end)

-- Props toggles
makeTpSectionHeader("⚙️ Properties", 13)

local tpToggleUpdaters = {}

local function makeTpToggle(text, order, getter, setter)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, 0, 0, 24)
    row.BackgroundColor3 = C_DARKER
    row.BorderSizePixel = 0
    row.LayoutOrder = order
    row.ZIndex = 16
    row.Parent = transformPanel
    reg(row, "dark")

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(0.65, 0, 1, 0)
    lbl.Position = UDim2.new(0, 8, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = C_TEXT
    lbl.TextSize = 11
    lbl.Font = Enum.Font.Gotham
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 17
    lbl.Parent = row

    local tog = Instance.new("TextButton")
    tog.Size = UDim2.new(0, 46, 0, 16)
    tog.Position = UDim2.new(1, -52, 0.5, -8)
    tog.BackgroundColor3 = Color3.fromRGB(60,0,0)
    tog.Text = "OFF"
    tog.TextColor3 = C_RED
    tog.TextSize = 10
    tog.Font = Enum.Font.GothamBold
    tog.BorderSizePixel = 0
    tog.ZIndex = 17
    tog.Parent = row
    Instance.new("UICorner", tog).CornerRadius = UDim.new(0, 3)

    local function updateTog()
        if not currentTransformObj then return end
        local ok, val = pcall(getter, currentTransformObj)
        if ok then
            if val then
                tog.Text = "ON"; tog.TextColor3 = C_GREEN
                TweenService:Create(tog, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(0,60,0)}):Play()
            else
                tog.Text = "OFF"; tog.TextColor3 = C_RED
                TweenService:Create(tog, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(60,0,0)}):Play()
            end
        end
    end

    tog.MouseButton1Click:Connect(function()
        if not currentTransformObj then return end
        local ok, val = pcall(getter, currentTransformObj)
        if ok then
            pcall(setter, currentTransformObj, not val)
            updateTog()
        end
    end)

    return updateTog
end

local updateAnchor = makeTpToggle("Anchored", 14,
    function(o) return o.Anchored end, function(o, v) o.Anchored = v end)
local updateCollide = makeTpToggle("CanCollide", 15,
    function(o) return o.CanCollide end, function(o, v) o.CanCollide = v end)
local updateCast = makeTpToggle("CastShadow", 16,
    function(o) return o.CastShadow end, function(o, v) o.CastShadow = v end)

-- Apply button
local applyRow = Instance.new("Frame")
applyRow.Size = UDim2.new(1, 0, 0, 28)
applyRow.BackgroundColor3 = C_DARKER
applyRow.BorderSizePixel = 0
applyRow.LayoutOrder = 17
applyRow.ZIndex = 16
applyRow.Parent = transformPanel
reg(applyRow, "dark")

local applyBtn = Instance.new("TextButton")
applyBtn.Size = UDim2.new(1, -12, 0, 20)
applyBtn.Position = UDim2.new(0, 6, 0.5, -10)
applyBtn.BackgroundColor3 = C_BLUE
applyBtn.Text = "✅ Apply All"
applyBtn.TextColor3 = C_WHITE
applyBtn.TextSize = 12
applyBtn.Font = Enum.Font.GothamBold
applyBtn.BorderSizePixel = 0
applyBtn.ZIndex = 17
applyBtn.Parent = applyRow
Instance.new("UICorner", applyBtn).CornerRadius = UDim.new(0, 3)
reg(applyBtn, "accent")

local function loadTransformValues(obj)
    if not obj then return end
    currentTransformObj = obj
    pcall(function()
        posXBox.Text = string.format("%.2f", obj.Position.X)
        posYBox.Text = string.format("%.2f", obj.Position.Y)
        posZBox.Text = string.format("%.2f", obj.Position.Z)
        sizeXBox.Text = string.format("%.2f", obj.Size.X)
        sizeYBox.Text = string.format("%.2f", obj.Size.Y)
        sizeZBox.Text = string.format("%.2f", obj.Size.Z)
        rotXBox.Text = string.format("%.2f", obj.Orientation.X)
        rotYBox.Text = string.format("%.2f", obj.Orientation.Y)
        rotZBox.Text = string.format("%.2f", obj.Orientation.Z)
    end)
    updateAnchor(); updateCollide(); updateCast()

    if selectionBox then selectionBox:Destroy() end
    selectionBox = Instance.new("SelectionBox")
    selectionBox.Adornee = obj
    selectionBox.Color3 = C_BLUE
    selectionBox.LineThickness = 0.05
    selectionBox.SurfaceTransparency = 0.8
    selectionBox.SurfaceColor3 = C_BLUE
    selectionBox.Parent = workspace

    transformPanel.Visible = true
end

applyBtn.MouseButton1Click:Connect(function()
    if not currentTransformObj then return end
    local px = tonumber(posXBox.Text) or 0
    local py = tonumber(posYBox.Text) or 0
    local pz = tonumber(posZBox.Text) or 0
    local sx = math.max(0.05, tonumber(sizeXBox.Text) or 0.05)
    local sy = math.max(0.05, tonumber(sizeYBox.Text) or 0.05)
    local sz = math.max(0.05, tonumber(sizeZBox.Text) or 0.05)
    local rx = tonumber(rotXBox.Text) or 0
    local ry = tonumber(rotYBox.Text) or 0
    local rz = tonumber(rotZBox.Text) or 0
    pcall(function()
        currentTransformObj.CFrame = CFrame.new(px, py, pz)
            * CFrame.Angles(math.rad(rx), math.rad(ry), math.rad(rz))
        currentTransformObj.Size = Vector3.new(sx, sy, sz)
    end)
    applyBtn.Text = "✅ Applied!"
    task.wait(1)
    applyBtn.Text = "✅ Apply All"
end)

-- ══════════════════════════════
--     SCRIPT EDITOR
-- ══════════════════════════════

local scriptEditor = Instance.new("Frame")
scriptEditor.Size = UDim2.new(0, 540, 0, 420)
scriptEditor.Position = UDim2.new(0.5, -270, 0.5, -210)
scriptEditor.BackgroundColor3 = Color3.fromRGB(28,28,28)
scriptEditor.BorderSizePixel = 0
scriptEditor.Visible = false
scriptEditor.ZIndex = 25
scriptEditor.Active = true
scriptEditor.Draggable = true
scriptEditor.Parent = screenGui
Instance.new("UICorner", scriptEditor).CornerRadius = UDim.new(0, 4)

local seBorder = Instance.new("UIStroke")
seBorder.Color = C_BORDER
seBorder.Thickness = 1
seBorder.Parent = scriptEditor

local seTitleBar = Instance.new("Frame")
seTitleBar.Size = UDim2.new(1, 0, 0, 28)
seTitleBar.BackgroundColor3 = Color3.fromRGB(18,18,18)
seTitleBar.BorderSizePixel = 0
seTitleBar.ZIndex = 26
seTitleBar.Parent = scriptEditor

local seTitleLbl = Instance.new("TextLabel")
seTitleLbl.Size = UDim2.new(1, -160, 1, 0)
seTitleLbl.Position = UDim2.new(0, 32, 0, 0)
seTitleLbl.BackgroundTransparency = 1
seTitleLbl.Text = "📜 Script Editor"
seTitleLbl.TextColor3 = C_DIM
seTitleLbl.TextSize = 12
seTitleLbl.Font = Enum.Font.Gotham
seTitleLbl.TextXAlignment = Enum.TextXAlignment.Left
seTitleLbl.ZIndex = 27
seTitleLbl.Parent = seTitleBar

local seTitleIcon = Instance.new("TextLabel")
seTitleIcon.Size = UDim2.new(0, 22, 1, 0)
seTitleIcon.Position = UDim2.new(0, 8, 0, 0)
seTitleIcon.BackgroundTransparency = 1
seTitleIcon.Text = "📜"
seTitleIcon.TextSize = 13
seTitleIcon.Font = Enum.Font.Gotham
seTitleIcon.ZIndex = 27
seTitleIcon.Parent = seTitleBar

-- Editor buttons
local seRunBtn = Instance.new("TextButton")
seRunBtn.Size = UDim2.new(0, 52, 0, 20)
seRunBtn.Position = UDim2.new(1, -118, 0.5, -10)
seRunBtn.BackgroundColor3 = Color3.fromRGB(30,70,30)
seRunBtn.Text = "▶ Run"
seRunBtn.TextColor3 = C_GREEN
seRunBtn.TextSize = 11
seRunBtn.Font = Enum.Font.GothamBold
seRunBtn.BorderSizePixel = 0
seRunBtn.ZIndex = 27
seRunBtn.Parent = seTitleBar
Instance.new("UICorner", seRunBtn).CornerRadius = UDim.new(0, 3)

local seSaveBtn = Instance.new("TextButton")
seSaveBtn.Size = UDim2.new(0, 52, 0, 20)
seSaveBtn.Position = UDim2.new(1, -62, 0.5, -10)
seSaveBtn.BackgroundColor3 = Color3.fromRGB(25,45,75)
seSaveBtn.Text = "💾 Save"
seSaveBtn.TextColor3 = C_BLUE
seSaveBtn.TextSize = 11
seSaveBtn.Font = Enum.Font.GothamBold
seSaveBtn.BorderSizePixel = 0
seSaveBtn.ZIndex = 27
seSaveBtn.Parent = seTitleBar
Instance.new("UICorner", seSaveBtn).CornerRadius = UDim.new(0, 3)

local seCloseBtn = makeDot(seTitleBar, Color3.fromRGB(220,60,60), 8)

local seTitleSep = Instance.new("Frame")
seTitleSep.Size = UDim2.new(1, 0, 0, 1)
seTitleSep.Position = UDim2.new(0, 0, 1, 0)
seTitleSep.BackgroundColor3 = C_BORDER
seTitleSep.BorderSizePixel = 0
seTitleSep.ZIndex = 26
seTitleSep.Parent = seTitleBar

-- Line numbers
local seLinePanel = Instance.new("Frame")
seLinePanel.Size = UDim2.new(0, 36, 1, -52)
seLinePanel.Position = UDim2.new(0, 0, 0, 29)
seLinePanel.BackgroundColor3 = Color3.fromRGB(22,22,22)
seLinePanel.BorderSizePixel = 0
seLinePanel.ZIndex = 26
seLinePanel.ClipsDescendants = true
seLinePanel.Parent = scriptEditor

local seLineScroll = Instance.new("ScrollingFrame")
seLineScroll.Size = UDim2.new(1, 0, 1, 0)
seLineScroll.BackgroundTransparency = 1
seLineScroll.BorderSizePixel = 0
seLineScroll.ScrollBarThickness = 0
seLineScroll.ZIndex = 27
seLineScroll.Parent = seLinePanel

local seLineLayout = Instance.new("UIListLayout")
seLineLayout.SortOrder = Enum.SortOrder.LayoutOrder
seLineLayout.Padding = UDim.new(0, 0)
seLineLayout.Parent = seLineScroll

-- Code area
local seCodeScroll = Instance.new("ScrollingFrame")
seCodeScroll.Size = UDim2.new(1, -38, 1, -52)
seCodeScroll.Position = UDim2.new(0, 38, 0, 29)
seCodeScroll.BackgroundColor3 = Color3.fromRGB(24,24,24)
seCodeScroll.BorderSizePixel = 0
seCodeScroll.ScrollBarThickness = 5
seCodeScroll.ScrollBarImageColor3 = Color3.fromRGB(80,80,80)
seCodeScroll.ZIndex = 26
seCodeScroll.Parent = scriptEditor

local seCodeBox = Instance.new("TextBox")
seCodeBox.Size = UDim2.new(1, -8, 1, -8)
seCodeBox.Position = UDim2.new(0, 4, 0, 4)
seCodeBox.BackgroundTransparency = 1
seCodeBox.Text = ""
seCodeBox.TextColor3 = Color3.fromRGB(210,210,210)
seCodeBox.TextSize = 12
seCodeBox.Font = Enum.Font.Code
seCodeBox.MultiLine = true
seCodeBox.TextXAlignment = Enum.TextXAlignment.Left
seCodeBox.TextYAlignment = Enum.TextYAlignment.Top
seCodeBox.ClearTextOnFocus = false
seCodeBox.BorderSizePixel = 0
seCodeBox.ZIndex = 27
seCodeBox.Parent = seCodeScroll

-- Status bar
local seStatusBar = Instance.new("Frame")
seStatusBar.Size = UDim2.new(1, 0, 0, 22)
seStatusBar.Position = UDim2.new(0, 0, 1, -22)
seStatusBar.BackgroundColor3 = Color3.fromRGB(18,18,18)
seStatusBar.BorderSizePixel = 0
seStatusBar.ZIndex = 26
seStatusBar.Parent = scriptEditor

local seStatusLbl = Instance.new("TextLabel")
seStatusLbl.Size = UDim2.new(1, -10, 1, 0)
seStatusLbl.Position = UDim2.new(0, 8, 0, 0)
seStatusLbl.BackgroundTransparency = 1
seStatusLbl.Text = "Ready"
seStatusLbl.TextColor3 = C_DIM
seStatusLbl.TextSize = 10
seStatusLbl.Font = Enum.Font.Gotham
seStatusLbl.TextXAlignment = Enum.TextXAlignment.Left
seStatusLbl.ZIndex = 27
seStatusLbl.Parent = seStatusBar

local function updateLineNumbers(text)
    for _, v in pairs(seLineScroll:GetChildren()) do
        if not v:IsA("UIListLayout") then v:Destroy() end
    end
    local lines = 1
    for _ in text:gmatch("\n") do lines += 1 end
    for i = 1, math.max(lines, 1) do
        local lbl = Instance.new("TextLabel")
        lbl.Size = UDim2.new(1, -4, 0, 16)
        lbl.BackgroundTransparency = 1
        lbl.Text = tostring(i)
        lbl.TextColor3 = Color3.fromRGB(70,70,70)
        lbl.TextSize = 11
        lbl.Font = Enum.Font.Code
        lbl.TextXAlignment = Enum.TextXAlignment.Right
        lbl.LayoutOrder = i
        lbl.ZIndex = 28
        lbl.Parent = seLineScroll
    end
    seLineScroll.CanvasSize = UDim2.new(0, 0, 0, lines*16+4)
    seCodeScroll.CanvasSize = UDim2.new(0, 0, 0, math.max(lines*16+20, 400))
end

local function openScriptEditor(scriptObj)
    currentScriptObj = scriptObj
    seTitleLbl.Text = "📜 " .. scriptObj.Name .. " [" .. scriptObj.ClassName .. "]"
    local ok, src = pcall(function() return scriptObj.Source end)
    if ok and src and src ~= "" then
        seCodeBox.Text = src
        updateLineNumbers(src)
        seStatusLbl.Text = "Loaded: " .. scriptObj.Name .. " • " .. #src .. " chars"
    else
        seCodeBox.Text = "-- Source not accessible\n-- This script may be protected"
        updateLineNumbers(seCodeBox.Text)
        seStatusLbl.Text = "⚠️ Source read-only or protected"
    end
    scriptEditor.Visible = true
end

seCodeBox:GetPropertyChangedSignal("Text"):Connect(function()
    updateLineNumbers(seCodeBox.Text)
    seLineScroll.CanvasPosition = Vector2.new(0, seCodeScroll.CanvasPosition.Y)
end)

seCodeScroll:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
    seLineScroll.CanvasPosition = Vector2.new(0, seCodeScroll.CanvasPosition.Y)
end)

seRunBtn.MouseButton1Click:Connect(function()
    seStatusLbl.Text = "⏳ Running..."
    local ok, err = pcall(function() loadstring(seCodeBox.Text)() end)
    if ok then
        seStatusLbl.Text = "✅ Ran successfully"
        seRunBtn.Text = "✅"
    else
        seStatusLbl.Text = "❌ " .. tostring(err):sub(1,60)
        seRunBtn.Text = "❌"
    end
    task.wait(2)
    seRunBtn.Text = "▶ Run"
end)

seSaveBtn.MouseButton1Click:Connect(function()
    if not currentScriptObj then return end
    local ok, err = pcall(function() currentScriptObj.Source = seCodeBox.Text end)
    if ok then
        seStatusLbl.Text = "💾 Saved!"
        seSaveBtn.Text = "✅"
    else
        seStatusLbl.Text = "❌ Can't save: " .. tostring(err):sub(1,40)
    end
    task.wait(1.5)
    seSaveBtn.Text = "💾 Save"
end)

seCloseBtn.MouseButton1Click:Connect(function()
    scriptEditor.Visible = false
end)

-- ══════════════════════════════
--     CONTEXT MENU
-- ══════════════════════════════

local contextMenu = Instance.new("Frame")
contextMenu.Size = UDim2.new(0, 175, 0, 0)
contextMenu.BackgroundColor3 = C_DARKER
contextMenu.BorderSizePixel = 0
contextMenu.Visible = false
contextMenu.ZIndex = 30
contextMenu.ClipsDescendants = false
contextMenu.Parent = screenGui
Instance.new("UICorner", contextMenu).CornerRadius = UDim.new(0, 4)
reg(contextMenu, "dark")

local cmBorder = Instance.new("UIStroke")
cmBorder.Color = C_BORDER
cmBorder.Thickness = 1
cmBorder.Parent = contextMenu
reg(cmBorder, "border")

local cmLayout = Instance.new("UIListLayout")
cmLayout.SortOrder = Enum.SortOrder.LayoutOrder
cmLayout.Padding = UDim.new(0, 0)
cmLayout.Parent = contextMenu

local function closeCM()
    TweenService:Create(contextMenu, TweenInfo.new(0.1), {
        Size = UDim2.new(0, 175, 0, 0)
    }):Play()
    task.wait(0.1)
    contextMenu.Visible = false
    contextTarget = nil
end

local function makeCMSep(order)
    local sep = Instance.new("Frame")
    sep.Size = UDim2.new(1, -16, 0, 1)
    sep.BackgroundColor3 = C_BORDER
    sep.BorderSizePixel = 0
    sep.LayoutOrder = order
    sep.ZIndex = 31
    sep.Parent = contextMenu
    local pad = Instance.new("UIPadding")
    pad.PaddingLeft = UDim.new(0, 8)
    pad.PaddingRight = UDim.new(0, 8)
    pad.Parent = sep
    reg(sep, "border")
end

local function makeCMBtn(label, icon, color, order, shortcut, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 26)
    btn.BackgroundColor3 = C_DARKER
    btn.Text = ""
    btn.BorderSizePixel = 0
    btn.LayoutOrder = order
    btn.ZIndex = 31
    btn.Parent = contextMenu
    reg(btn, "dark")

    local iconLbl = Instance.new("TextLabel")
    iconLbl.Size = UDim2.new(0, 22, 1, 0)
    iconLbl.Position = UDim2.new(0, 5, 0, 0)
    iconLbl.BackgroundTransparency = 1
    iconLbl.Text = icon
    iconLbl.TextSize = 11
    iconLbl.Font = Enum.Font.Gotham
    iconLbl.ZIndex = 32
    iconLbl.Parent = btn

    local textLbl = Instance.new("TextLabel")
    textLbl.Size = UDim2.new(1, -60, 1, 0)
    textLbl.Position = UDim2.new(0, 27, 0, 0)
    textLbl.BackgroundTransparency = 1
    textLbl.Text = label
    textLbl.TextColor3 = color or C_TEXT
    textLbl.TextSize = 11
    textLbl.Font = Enum.Font.Gotham
    textLbl.TextXAlignment = Enum.TextXAlignment.Left
    textLbl.ZIndex = 32
    textLbl.Parent = btn

    if shortcut then
        local scLbl = Instance.new("TextLabel")
        scLbl.Size = UDim2.new(0, 40, 1, 0)
        scLbl.Position = UDim2.new(1, -44, 0, 0)
        scLbl.BackgroundTransparency = 1
        scLbl.Text = shortcut
        scLbl.TextColor3 = C_DIM
        scLbl.TextSize = 9
        scLbl.Font = Enum.Font.Gotham
        scLbl.TextXAlignment = Enum.TextXAlignment.Right
        scLbl.ZIndex = 32
        scLbl.Parent = btn
    end

    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = C_SELECT
        textLbl.TextColor3 = C_WHITE
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = C_DARKER
        textLbl.TextColor3 = color or C_TEXT
    end)
    btn.MouseButton1Click:Connect(function()
        closeCM()
        if callback then callback() end
    end)
    return btn
end

local function showRenamePopup(obj)
    local rGui = Instance.new("Frame")
    rGui.Size = UDim2.new(0, 260, 0, 90)
    rGui.Position = UDim2.new(0.5, -130, 0.5, -45)
    rGui.BackgroundColor3 = C_DARKER
    rGui.BorderSizePixel = 0
    rGui.ZIndex = 40
    rGui.Parent = screenGui
    Instance.new("UICorner", rGui).CornerRadius = UDim.new(0, 4)
    reg(rGui, "dark")

    local rBorder = Instance.new("UIStroke")
    rBorder.Color = C_BLUE
    rBorder.Thickness = 1
    rBorder.Parent = rGui
    reg(rBorder, "stroke_accent")

    local rHdr = Instance.new("Frame")
    rHdr.Size = UDim2.new(1, 0, 0, 26)
    rHdr.BackgroundColor3 = C_HEADER
    rHdr.BorderSizePixel = 0
    rHdr.ZIndex = 41
    rHdr.Parent = rGui
    Instance.new("UICorner", rHdr).CornerRadius = UDim.new(0, 4)
    reg(rHdr, "header")

    local rHdrLbl = Instance.new("TextLabel")
    rHdrLbl.Size = UDim2.new(1, -10, 1, 0)
    rHdrLbl.Position = UDim2.new(0, 8, 0, 0)
    rHdrLbl.BackgroundTransparency = 1
    rHdrLbl.Text = "✏️ Rename: " .. obj.Name
    rHdrLbl.TextColor3 = C_TEXT
    rHdrLbl.TextSize = 11
    rHdrLbl.Font = Enum.Font.GothamBold
    rHdrLbl.TextXAlignment = Enum.TextXAlignment.Left
    rHdrLbl.ZIndex = 42
    rHdrLbl.Parent = rHdr

    local rInput = Instance.new("TextBox")
    rInput.Size = UDim2.new(1, -16, 0, 26)
    rInput.Position = UDim2.new(0, 8, 0, 30)
    rInput.BackgroundColor3 = C_INPUT
    rInput.Text = obj.Name
    rInput.TextColor3 = C_TEXT
    rInput.TextSize = 12
    rInput.Font = Enum.Font.Gotham
    rInput.BorderSizePixel = 0
    rInput.ClearTextOnFocus = false
    rInput.ZIndex = 41
    rInput.Parent = rGui
    Instance.new("UICorner", rInput).CornerRadius = UDim.new(0, 3)

    local rOk = Instance.new("TextButton")
    rOk.Size = UDim2.new(0.5, -12, 0, 20)
    rOk.Position = UDim2.new(0, 8, 1, -24)
    rOk.BackgroundColor3 = C_BLUE
    rOk.Text = "✅ OK"
    rOk.TextColor3 = C_WHITE
    rOk.TextSize = 11
    rOk.Font = Enum.Font.GothamBold
    rOk.BorderSizePixel = 0
    rOk.ZIndex = 41
    rOk.Parent = rGui
    Instance.new("UICorner", rOk).CornerRadius = UDim.new(0, 3)
    reg(rOk, "accent")

    local rCancel = Instance.new("TextButton")
    rCancel.Size = UDim2.new(0.5, -12, 0, 20)
    rCancel.Position = UDim2.new(0.5, 4, 1, -24)
    rCancel.BackgroundColor3 = Color3.fromRGB(70,30,30)
    rCancel.Text = "❌ Cancel"
    rCancel.TextColor3 = C_RED
    rCancel.TextSize = 11
    rCancel.Font = Enum.Font.GothamBold
    rCancel.BorderSizePixel = 0
    rCancel.ZIndex = 41
    rCancel.Parent = rGui
    Instance.new("UICorner", rCancel).CornerRadius = UDim.new(0, 3)

    local function doRename()
        pcall(function() obj.Name = rInput.Text end)
        rGui:Destroy()
    end
    rOk.MouseButton1Click:Connect(doRename)
    rCancel.MouseButton1Click:Connect(function() rGui:Destroy() end)
    rInput.FocusLost:Connect(function(enter) if enter then doRename() end end)
end

local function buildContextMenu(obj, posX, posY)
    for _, v in pairs(contextMenu:GetChildren()) do
        if not v:IsA("UIListLayout") then v:Destroy() end
    end

    contextTarget = obj
    local isTool = obj:IsA("Tool")
    local isBasePart = obj:IsA("BasePart")
    local isPlayer = obj:IsA("Player")
    local isScript = obj:IsA("Script") or obj:IsA("LocalScript") or obj:IsA("ModuleScript")
    local order = 0

    -- Header
    local header = Instance.new("Frame")
    header.Size = UDim2.new(1, 0, 0, 22)
    header.BackgroundColor3 = C_HEADER
    header.BorderSizePixel = 0
    header.LayoutOrder = order
    header.ZIndex = 31
    header.Parent = contextMenu
    Instance.new("UICorner", header).CornerRadius = UDim.new(0, 4)
    reg(header, "header")

    local hLbl = Instance.new("TextLabel")
    hLbl.Size = UDim2.new(1, -10, 1, 0)
    hLbl.Position = UDim2.new(0, 8, 0, 0)
    hLbl.BackgroundTransparency = 1
    hLbl.Text = obj.ClassName .. " — " .. obj.Name
    hLbl.TextColor3 = C_DIM
    hLbl.TextSize = 10
    hLbl.Font = Enum.Font.GothamBold
    hLbl.TextXAlignment = Enum.TextXAlignment.Left
    hLbl.TextTruncate = Enum.TextTruncate.AtEnd
    hLbl.ZIndex = 32
    hLbl.Parent = header
    order += 1

    -- General
    makeCMBtn("Copy", "📋", C_TEXT, order, "Ctrl+C", function()
        copiedObject = obj
    end) order += 1

    makeCMBtn("Paste Into", "📄", C_TEXT, order, "Ctrl+V", function()
        if copiedObject then
            local clone = copiedObject:Clone()
            clone.Parent = obj
        end
    end) order += 1

    makeCMBtn("Duplicate", "🔁", C_TEXT, order, "Ctrl+D", function()
        local clone = obj:Clone()
        clone.Name = obj.Name .. "_Copy"
        clone.Parent = obj.Parent
    end) order += 1

    makeCMBtn("Cut", "✂️", C_TEXT, order, "Ctrl+X", function()
        copiedObject = obj
        obj.Parent = nil
    end) order += 1

    makeCMSep(order) order += 1

    makeCMBtn("Rename", "✏️", C_TEXT, order, "F2", function()
        showRenamePopup(obj)
    end) order += 1

    makeCMBtn("Select Children", "📂", C_TEXT, order, nil, function()
        rightHeaderLbl.Text = "Properties — " .. obj.Name .. " (" .. #obj:GetChildren() .. " children)"
    end) order += 1

    makeCMSep(order) order += 1

    makeCMBtn("Copy Name", "🔤", C_TEXT, order, nil, function()
        setclipboard(obj.Name)
    end) order += 1

    makeCMBtn("Copy ClassName", "📌", C_TEXT, order, nil, function()
        setclipboard(obj.ClassName)
    end) order += 1

    makeCMBtn("Copy Full Path", "📍", C_TEXT, order, nil, function()
        local path = obj.Name
        local cur = obj.Parent
        while cur and cur ~= game do
            path = cur.Name .. "." .. path
            cur = cur.Parent
        end
        setclipboard("game." .. path)
    end) order += 1

    -- Tool
    if isTool then
        makeCMSep(order) order += 1
        makeCMBtn("Copy Tool ID", "🆔", C_BLUE, order, nil, function()
            local handle = obj:FindFirstChild("Handle")
            if handle then
                local mesh = handle:FindFirstChildOfClass("SpecialMesh")
                if mesh and mesh.MeshId ~= "" then setclipboard(mesh.MeshId); return end
            end
            setclipboard(obj.Name)
        end) order += 1
        makeCMBtn("Give to Me", "🎁", C_GREEN, order, nil, function()
            local myBp = player:FindFirstChild("Backpack")
            if myBp then obj:Clone().Parent = myBp end
        end) order += 1
        makeCMBtn("Equip Tool", "🤲", C_GREEN, order, nil, function()
            local myChar = player.Character
            if myChar then obj:Clone().Parent = myChar end
        end) order += 1
    end

    -- BasePart
    if isBasePart then
        makeCMSep(order) order += 1
        makeCMBtn("Move / Size / Rotate", "🛠️", C_BLUE, order, nil, function()
            loadTransformValues(obj)
        end) order += 1
        makeCMBtn("Select Object", "🔲", C_BLUE, order, nil, function()
            if selectionBox then selectionBox:Destroy() end
            selectionBox = Instance.new("SelectionBox")
            selectionBox.Adornee = obj
            selectionBox.Color3 = C_BLUE
            selectionBox.LineThickness = 0.05
            selectionBox.SurfaceTransparency = 0.8
            selectionBox.SurfaceColor3 = C_BLUE
            selectionBox.Parent = workspace
            task.delay(10, function()
                if selectionBox then selectionBox:Destroy(); selectionBox = nil end
            end)
        end) order += 1
        makeCMBtn("Deselect", "❌", C_DIM, order, nil, function()
            if selectionBox then selectionBox:Destroy(); selectionBox = nil end
        end) order += 1
        makeCMBtn("Teleport Here", "🌀", C_PURPLE, order, nil, function()
            local myChar = player.Character
            local hrp = myChar and myChar:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.CFrame = obj.CFrame + Vector3.new(0, 5, 0) end
        end) order += 1
        makeCMBtn("Copy Position", "📐", C_PURPLE, order, nil, function()
            local p = obj.Position
            setclipboard(string.format("Vector3.new(%.2f, %.2f, %.2f)", p.X, p.Y, p.Z))
        end) order += 1
    end

    -- Script
    if isScript then
        makeCMSep(order) order += 1
        makeCMBtn("Open Script", "📝", C_GREEN, order, nil, function()
            openScriptEditor(obj)
        end) order += 1
        makeCMBtn("Run Script", "▶", C_GREEN, order, nil, function()
            local ok, src = pcall(function() return obj.Source end)
            if ok then pcall(function() loadstring(src)() end) end
        end) order += 1
        makeCMBtn("Copy Source", "📋", C_TEXT, order, nil, function()
            local ok, src = pcall(function() return obj.Source end)
            if ok then setclipboard(src) end
        end) order += 1
    end

    -- Player
    if isPlayer then
        makeCMSep(order) order += 1
        makeCMBtn("View Backpack", "🎒", C_PURPLE, order, nil, function()
            refreshBackpack(obj)
        end) order += 1
        makeCMBtn("Copy UserId", "🆔", C_BLUE, order, nil, function()
            setclipboard(tostring(obj.UserId))
        end) order += 1
    end

    makeCMSep(order) order += 1
    makeCMBtn("Delete", "🗑️", C_RED, order, "Del", function()
        obj:Destroy()
        clearProps()
        rightHeaderLbl.Text = "Properties"
    end) order += 1

    local totalH = 22 + (order * 26)
    contextMenu.Size = UDim2.new(0, 0, 0, 0)
    contextMenu.Visible = true

    local screenSize = workspace.CurrentCamera.ViewportSize
    local x = math.min(posX, screenSize.X - 180)
    local y = math.min(posY, screenSize.Y - totalH - 10)
    contextMenu.Position = UDim2.new(0, x, 0, y)

    TweenService:Create(contextMenu, TweenInfo.new(0.15, Enum.EasingStyle.Quart), {
        Size = UDim2.new(0, 175, 0, totalH)
    }):Play()
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        if contextMenu.Visible then closeCM() end
    end
end)

-- ══════════════════════════════
--     BACKPACK FUNCTIONS
-- ══════════════════════════════

function refreshBackpack(targetPlayer)
    for _, v in pairs(toolScroll:GetChildren()) do
        if not v:IsA("UIListLayout") then v:Destroy() end
    end
    if not targetPlayer then return end
    currentTargetPlayer = targetPlayer
    bpTargetLabel.Text = "Target: " .. targetPlayer.Name

    local backpack = targetPlayer:FindFirstChild("Backpack")
    local char = targetPlayer.Character
    local tools = {}

    if backpack then
        for _, t in pairs(backpack:GetChildren()) do
            if t:IsA("Tool") then table.insert(tools, {t, "Backpack"}) end
        end
    end
    if char then
        for _, t in pairs(char:GetChildren()) do
            if t:IsA("Tool") then table.insert(tools, {t, "Equipped"}) end
        end
    end

    if #tools == 0 then
        local emptyLbl = Instance.new("TextLabel")
        emptyLbl.Size = UDim2.new(1, 0, 0, 30)
        emptyLbl.BackgroundTransparency = 1
        emptyLbl.Text = "No tools in backpack"
        emptyLbl.TextColor3 = C_DIM
        emptyLbl.TextSize = 11
        emptyLbl.Font = Enum.Font.Gotham
        emptyLbl.Parent = toolScroll
        return
    end

    for i, data in ipairs(tools) do
        local tool, location = data[1], data[2]
        local row = Instance.new("Frame")
        row.Size = UDim2.new(1, 0, 0, 26)
        row.BackgroundColor3 = i%2==0 and C_DARKER or Color3.fromRGB(30,30,30)
        row.BorderSizePixel = 0
        row.LayoutOrder = i
        row.Parent = toolScroll

        local rowSep = Instance.new("Frame")
        rowSep.Size = UDim2.new(1, 0, 0, 1)
        rowSep.Position = UDim2.new(0, 0, 1, -1)
        rowSep.BackgroundColor3 = Color3.fromRGB(40,40,40)
        rowSep.BorderSizePixel = 0
        rowSep.Parent = row

        local tIcon = Instance.new("TextLabel")
        tIcon.Size = UDim2.new(0, 20, 1, 0)
        tIcon.Position = UDim2.new(0, 6, 0, 0)
        tIcon.BackgroundTransparency = 1
        tIcon.Text = "🔧"
        tIcon.TextSize = 12
        tIcon.Font = Enum.Font.Gotham
        tIcon.Parent = row

        local tName = Instance.new("TextLabel")
        tName.Size = UDim2.new(1, -160, 1, 0)
        tName.Position = UDim2.new(0, 28, 0, 0)
        tName.BackgroundTransparency = 1
        tName.Text = tool.Name
        tName.TextColor3 = C_TEXT
        tName.TextSize = 11
        tName.Font = Enum.Font.Gotham
        tName.TextXAlignment = Enum.TextXAlignment.Left
        tName.TextTruncate = Enum.TextTruncate.AtEnd
        tName.Parent = row

        local locBadge = Instance.new("TextLabel")
        locBadge.Size = UDim2.new(0, 58, 0, 16)
        locBadge.Position = UDim2.new(1, -132, 0.5, -8)
        locBadge.BackgroundColor3 = location=="Equipped" and Color3.fromRGB(40,70,40) or Color3.fromRGB(30,40,70)
        locBadge.Text = location
        locBadge.TextColor3 = location=="Equipped" and C_GREEN or C_BLUE
        locBadge.TextSize = 9
        locBadge.Font = Enum.Font.GothamBold
        locBadge.BorderSizePixel = 0
        locBadge.Parent = row
        Instance.new("UICorner", locBadge).CornerRadius = UDim.new(0, 3)

        local takeBtn = Instance.new("TextButton")
        takeBtn.Size = UDim2.new(0, 44, 0, 18)
        takeBtn.Position = UDim2.new(1, -66, 0.5, -9)
        takeBtn.BackgroundColor3 = Color3.fromRGB(50,80,30)
        takeBtn.Text = "Take"
        takeBtn.TextColor3 = C_GREEN
        takeBtn.TextSize = 10
        takeBtn.Font = Enum.Font.GothamBold
        takeBtn.BorderSizePixel = 0
        takeBtn.Parent = row
        Instance.new("UICorner", takeBtn).CornerRadius = UDim.new(0, 3)

        local removeBtn = Instance.new("TextButton")
        removeBtn.Size = UDim2.new(0, 50, 0, 18)
        removeBtn.Position = UDim2.new(1, -6, 0.5, -9)
        removeBtn.AnchorPoint = Vector2.new(1, 0)
        removeBtn.BackgroundColor3 = Color3.fromRGB(70,30,30)
        removeBtn.Text = "Remove"
        removeBtn.TextColor3 = C_RED
        removeBtn.TextSize = 10
        removeBtn.Font = Enum.Font.GothamBold
        removeBtn.BorderSizePixel = 0
        removeBtn.Parent = row
        Instance.new("UICorner", removeBtn).CornerRadius = UDim.new(0, 3)

        row.MouseButton2Click:Connect(function()
            local mp = UserInputService:GetMouseLocation()
            buildContextMenu(tool, mp.X, mp.Y)
        end)

        takeBtn.MouseButton1Click:Connect(function()
            local myBp = player:FindFirstChild("Backpack")
            if myBp then
                tool:Clone().Parent = myBp
                takeBtn.Text = "✅"
                task.wait(1)
                takeBtn.Text = "Take"
            end
        end)
        removeBtn.MouseButton1Click:Connect(function()
            tool:Destroy()
            refreshBackpack(targetPlayer)
        end)
        row.MouseEnter:Connect(function() row.BackgroundColor3 = C_HOVER end)
        row.MouseLeave:Connect(function()
            row.BackgroundColor3 = i%2==0 and C_DARKER or Color3.fromRGB(30,30,30)
        end)
    end
end

giveToolBtn.MouseButton1Click:Connect(function()
    if not currentTargetPlayer then return end
    local toolName = toolNameBox.Text
    if toolName == "" then return end
    local myChar = player.Character
    local myBp = player:FindFirstChild("Backpack")
    local targetBp = currentTargetPlayer:FindFirstChild("Backpack")
    if not targetBp then return end
    local found = nil
    if myChar then found = myChar:FindFirstChild(toolName) end
    if not found and myBp then found = myBp:FindFirstChild(toolName) end
    if found and found:IsA("Tool") then
        found:Clone().Parent = targetBp
        giveToolBtn.Text = "✅"
        task.wait(1)
        giveToolBtn.Text = "+ Give"
        refreshBackpack(currentTargetPlayer)
    else
        giveToolBtn.Text = "❌"
        task.wait(1)
        giveToolBtn.Text = "+ Give"
    end
end)

clearBpBtn.MouseButton1Click:Connect(function()
    if not currentTargetPlayer then return end
    local bp = currentTargetPlayer:FindFirstChild("Backpack")
    if bp then
        for _, t in pairs(bp:GetChildren()) do
            if t:IsA("Tool") then t:Destroy() end
        end
    end
    refreshBackpack(currentTargetPlayer)
end)

-- ══════════════════════════════
--       PROPERTY VIEWER
-- ══════════════════════════════

function clearProps()
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
    reg(row, "header")

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
    if type(val) == "boolean" then return val and C_GREEN or C_RED end
    if type(val) == "number" then return Color3.fromRGB(100,180,255) end
    if type(val) == "string" then return Color3.fromRGB(180,220,130) end
    return Color3.fromRGB(200,160,255)
end

local function formatValue(val)
    if type(val) == "boolean" then return val and "true" or "false" end
    if type(val) == "number" then return string.format("%.3f", val) end
    if typeof(val) == "Vector3" then return string.format("%.2f, %.2f, %.2f", val.X, val.Y, val.Z) end
    if typeof(val) == "Vector2" then return string.format("%.2f, %.2f", val.X, val.Y) end
    if typeof(val) == "Color3" then return string.format("[%d, %d, %d]", val.R*255, val.G*255, val.B*255) end
    if typeof(val) == "CFrame" then
        local p = val.Position
        return string.format("%.2f, %.2f, %.2f", p.X, p.Y, p.Z)
    end
    if typeof(val) == "UDim2" then
        return string.format("{%.0f,%.0f},{%.0f,%.0f}", val.X.Scale, val.X.Offset, val.Y.Scale, val.Y.Offset)
    end
    if typeof(val) == "EnumItem" then return tostring(val) end
    if typeof(val) == "BrickColor" then return tostring(val) end
    return tostring(val)
end

local function addPropRow(name, val, order)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, 0, 0, 22)
    row.BackgroundColor3 = order%2==0 and C_DARKER or Color3.new(
        C_DARKER.R - 0.02, C_DARKER.G - 0.02, C_DARKER.B - 0.02
    )
    row.BorderSizePixel = 0
    row.LayoutOrder = order
    row.Parent = propScroll

    local sepLine = Instance.new("Frame")
    sepLine.Size = UDim2.new(1, 0, 0, 1)
    sepLine.Position = UDim2.new(0, 0, 1, -1)
    sepLine.BackgroundColor3 = Color3.fromRGB(40,40,40)
    sepLine.BorderSizePixel = 0
    sepLine.Parent = row

    local nameLbl = Instance.new("TextLabel")
    nameLbl.Size = UDim2.new(0.5, -2, 1, 0)
    nameLbl.Position = UDim2.new(0, 14, 0, 0)
    nameLbl.BackgroundTransparency = 1
    nameLbl.Text = name
    nameLbl.TextColor3 = C_TEXT
    nameLbl.TextSize = 11
    nameLbl.Font = Enum.Font.Gotham
    nameLbl.TextXAlignment = Enum.TextXAlignment.Left
    nameLbl.TextTruncate = Enum.TextTruncate.AtEnd
    nameLbl.Parent = row

    local midDiv = Instance.new("Frame")
    midDiv.Size = UDim2.new(0, 1, 0.7, 0)
    midDiv.Position = UDim2.new(0.5, 0, 0.15, 0)
    midDiv.BackgroundColor3 = C_BORDER
    midDiv.BorderSizePixel = 0
    midDiv.Parent = row

    local valBox = Instance.new("TextBox")
    valBox.Size = UDim2.new(0.5, -8, 1, -2)
    valBox.Position = UDim2.new(0.5, 4, 0, 1)
    valBox.BackgroundColor3 = Color3.fromRGB(26,26,26)
    valBox.Text = formatValue(val)
    valBox.TextColor3 = getValueColor(val)
    valBox.TextSize = 11
    valBox.Font = Enum.Font.Gotham
    valBox.BorderSizePixel = 0
    valBox.ClearTextOnFocus = false
    valBox.TextXAlignment = Enum.TextXAlignment.Left
    valBox.Parent = row
    Instance.new("UICorner", valBox).CornerRadius = UDim.new(0, 2)

    if typeof(val) == "Color3" then
        local sw = Instance.new("Frame")
        sw.Size = UDim2.new(0, 14, 0, 14)
        sw.Position = UDim2.new(1, -18, 0.5, -7)
        sw.BackgroundColor3 = val
        sw.BorderSizePixel = 0
        sw.Parent = row
        Instance.new("UICorner", sw).CornerRadius = UDim.new(0, 2)
        local sws = Instance.new("UIStroke")
        sws.Color = C_BORDER
        sws.Thickness = 1
        sws.Parent = sw
    end

    if type(val) == "boolean" then
        local dot = Instance.new("Frame")
        dot.Size = UDim2.new(0, 10, 0, 10)
        dot.Position = UDim2.new(0.5, 6, 0.5, -5)
        dot.BackgroundColor3 = val and C_GREEN or C_RED
        dot.BorderSizePixel = 0
        dot.Parent = row
        Instance.new("UICorner", dot).CornerRadius = UDim.new(0, 2)
    end

    row.MouseEnter:Connect(function() row.BackgroundColor3 = C_HOVER end)
    row.MouseLeave:Connect(function()
        row.BackgroundColor3 = order%2==0 and C_DARKER or Color3.new(
            C_DARKER.R - 0.02, C_DARKER.G - 0.02, C_DARKER.B - 0.02
        )
    end)
end

local PROPERTY_CATEGORIES = {
    {name="Data", props={"Name","ClassName","Archivable"}},
    {name="Appearance", props={
        "BackgroundColor3","BackgroundTransparency","BorderColor3","BorderSizePixel",
        "TextColor3","TextTransparency","Color","BrickColor","Material",
        "Reflectance","Transparency","CastShadow",
    }},
    {name="Behavior", props={
        "Active","Draggable","Visible","Enabled","CanCollide",
        "CanTouch","CanQuery","Anchored","Massless","Locked","Disabled",
    }},
    {name="Transform", props={
        "Position","Rotation","Orientation","CFrame","Size","Scale",
        "Velocity","AssemblyLinearVelocity","AssemblyAngularVelocity",
    }},
    {name="Layout", props={
        "Size","Position","AnchorPoint","SizeConstraint","AutomaticSize",
        "ZIndex","LayoutOrder","ClipsDescendants",
    }},
    {name="Text", props={
        "Text","TextSize","Font","TextXAlignment","TextYAlignment",
        "TextWrapped","TextScaled","TextTruncate","RichText","LineHeight",
    }},
    {name="Image", props={
        "Image","ImageColor3","ImageTransparency","ScaleType",
    }},
    {name="Humanoid", props={
        "Health","MaxHealth","WalkSpeed","JumpPower","JumpHeight",
        "HipHeight","AutoJumpEnabled","AutoRotate","BreakJointsOnDeath",
    }},
    {name="Sound", props={
        "SoundId","Volume","PlaybackSpeed","Looped","IsPlaying","TimePosition",
    }},
    {name="Player", props={
        "UserId","DisplayName","Team","TeamColor",
        "CameraMode","AutoJumpEnabled","AccountAge","MembershipType",
    }},
    {name="Script", props={
        "Disabled","RunContext",
    }},
}

local function showProperties(obj)
    clearProps()
    rightHeaderLbl.Text = "Properties — " .. obj.Name .. " [" .. obj.ClassName .. "]"
    local order = 0
    for _, cat in ipairs(PROPERTY_CATEGORIES) do
        local catProps = {}
        for _, prop in ipairs(cat.props) do
            local ok, val = pcall(function() return obj[prop] end)
            if ok and val ~= nil then table.insert(catProps, {prop, val}) end
        end
        if #catProps > 0 then
            addCategory(cat.name, order); order += 1
            for _, pv in ipairs(catProps) do
                addPropRow(pv[1], pv[2], order); order += 1
            end
        end
    end
end

-- ══════════════════════════════
--       EXPLORER TREE
-- ══════════════════════════════

local function getIcon(obj)
    local icons = {
        Workspace="🌍",Part="🧱",MeshPart="🧊",Model="📦",
        Script="📜",LocalScript="📄",ModuleScript="📋",
        RemoteEvent="📡",RemoteFunction="📡",BindableEvent="📨",
        Folder="📁",Frame="🖼",ScreenGui="🖥",SurfaceGui="🪟",
        TextLabel="🔤",TextButton="🔘",TextBox="✏️",
        ImageLabel="🖼",ImageButton="🖼",
        Sound="🔊",SoundService="🎵",
        Humanoid="🚶",HumanoidRootPart="⬛",
        Camera="📷",Lighting="💡",
        ReplicatedStorage="💾",ServerScriptService="⚙️",
        StarterGui="🎮",StarterPack="🎒",StarterPlayer="👤",
        Players="👥",Player="👤",Backpack="🎒",Tool="🔧",
        NumberValue="🔢",StringValue="📝",
        BoolValue="✅",IntValue="🔢",
        SelectionBox="🔲",SpawnLocation="🚩",
        PointLight="💡",SpotLight="🔦",
    }
    return icons[obj.ClassName] or "📌"
end

local function updateCanvasSize()
    task.wait()
    explorerScroll.CanvasSize = UDim2.new(0, 0, 0, explorerLayout.AbsoluteContentSize.Y)
end

local function attachRowEvents(row, obj, nameLbl, arrowLbl, hasChildren, childContainer)
    row.MouseButton1Click:Connect(function()
        if selectedRow then selectedRow.BackgroundColor3 = C_DARKER end
        row.BackgroundColor3 = C_SELECT
        nameLbl.TextColor3 = C_WHITE
        selectedRow = row
        showProperties(obj)

        if obj:IsA("Player") or obj:IsA("Backpack") then
            local targetPl = obj:IsA("Player") and obj or (obj.Parent and obj.Parent:IsA("Player") and obj.Parent or nil)
            if targetPl then refreshBackpack(targetPl) end
        end

        if hasChildren then
            local expanded = (arrowLbl.Text == "▼")
            expanded = not expanded
            arrowLbl.Text = expanded and "▼" or "▶"
            childContainer.Visible = expanded

            if expanded and #childContainer:GetChildren() <= 1 then
                local children = {}
                pcall(function()
                    for _, child in ipairs(obj:GetChildren()) do
                        table.insert(children, child)
                    end
                end)

                for _, child in ipairs(children) do
                    nodeOrder += 1
                    local myOrder2 = nodeOrder
                    local hasChildren2 = #child:GetChildren() > 0

                    local depth2 = 1
                    local cur = obj
                    while cur and cur ~= game do depth2 += 1; cur = cur.Parent end

                    local row2 = Instance.new("TextButton")
                    row2.Size = UDim2.new(1, 0, 0, 20)
                    row2.BackgroundColor3 = C_DARKER
                    row2.Text = ""
                    row2.BorderSizePixel = 0
                    row2.LayoutOrder = myOrder2
                    row2.Parent = childContainer

                    for i = 1, depth2 do
                        local line = Instance.new("Frame")
                        line.Size = UDim2.new(0, 1, 1, 0)
                        line.Position = UDim2.new(0, (i-1)*16+8, 0, 0)
                        line.BackgroundColor3 = Color3.fromRGB(50,50,50)
                        line.BorderSizePixel = 0
                        line.Parent = row2
                    end

                    local arr2 = Instance.new("TextLabel")
                    arr2.Size = UDim2.new(0, 14, 1, 0)
                    arr2.Position = UDim2.new(0, depth2*16+2, 0, 0)
                    arr2.BackgroundTransparency = 1
                    arr2.Text = hasChildren2 and "▶" or ""
                    arr2.TextColor3 = C_DIM
                    arr2.TextSize = 8
                    arr2.Font = Enum.Font.Gotham
                    arr2.Parent = row2

                    local ico2 = Instance.new("TextLabel")
                    ico2.Size = UDim2.new(0, 16, 1, 0)
                    ico2.Position = UDim2.new(0, depth2*16+16, 0, 0)
                    ico2.BackgroundTransparency = 1
                    ico2.Text = getIcon(child)
                    ico2.TextSize = 11
                    ico2.Font = Enum.Font.GothamBold
                    ico2.Parent = row2

                    local name2 = Instance.new("TextLabel")
                    name2.Size = UDim2.new(1, -(depth2*16+34), 1, 0)
                    name2.Position = UDim2.new(0, depth2*16+34, 0, 0)
                    name2.BackgroundTransparency = 1
                    name2.Text = child.Name
                    name2.TextColor3 = C_TEXT
                    name2.TextSize = 11
                    name2.Font = Enum.Font.Gotham
                    name2.TextXAlignment = Enum.TextXAlignment.Left
                    name2.TextTruncate = Enum.TextTruncate.AtEnd
                    name2.Parent = row2

                    local cc2 = Instance.new("Frame")
                    cc2.Size = UDim2.new(1, 0, 0, 0)
                    cc2.BackgroundTransparency = 1
                    cc2.BorderSizePixel = 0
                    cc2.Visible = false
                    cc2.LayoutOrder = myOrder2 + 0.5
                    cc2.Parent = childContainer

                    local cl2 = Instance.new("UIListLayout")
                    cl2.SortOrder = Enum.SortOrder.LayoutOrder
                    cl2.Padding = UDim.new(0, 0)
                    cl2.Parent = cc2

                    cl2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                        cc2.Size = UDim2.new(1, 0, 0, cl2.AbsoluteContentSize.Y)
                        updateCanvasSize()
                    end)

                    attachRowEvents(row2, child, name2, arr2, hasChildren2, cc2)
                end
            end
            updateCanvasSize()
        end
    end)

    row.MouseButton2Click:Connect(function()
        local mp = UserInputService:GetMouseLocation()
        buildContextMenu(obj, mp.X, mp.Y)
    end)

    local holdConn
    row.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            holdConn = task.delay(0.5, function()
                local pos = input.Position
                buildContextMenu(obj, pos.X, pos.Y)
            end)
        end
    end)
    row.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            if holdConn then task.cancel(holdConn); holdConn = nil end
        end
    end)

    row.MouseEnter:Connect(function()
        if row ~= selectedRow then row.BackgroundColor3 = C_HOVER end
    end)
    row.MouseLeave:Connect(function()
        if row ~= selectedRow then row.BackgroundColor3 = C_DARKER end
    end)
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

    local sepLine = Instance.new("Frame")
    sepLine.Size = UDim2.new(1, 0, 0, 1)
    sepLine.Position = UDim2.new(0, 0, 1, -1)
    sepLine.BackgroundColor3 = Color3.fromRGB(40,40,40)
    sepLine.BorderSizePixel = 0
    sepLine.Parent = row

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

    attachRowEvents(row, service, nameLbl, arrowLbl, true, childContainer)
end

local function refreshExplorer()
    for _, v in pairs(explorerScroll:GetChildren()) do
        if not v:IsA("UIListLayout") then v:Destroy() end
    end
    clearProps()
    rightHeaderLbl.Text = "Properties"
    selectedRow = nil
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
        pcall(function() buildRootNode(s[1], s[2]) end)
    end

    updateCanvasSize()
end

refreshExplorer()
refreshBtn.MouseButton1Click:Connect(refreshExplorer)

searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local q = searchBox.Text:lower()
    if q == "" then refreshExplorer() return end
    for _, v in pairs(explorerScroll:GetDescendants()) do
        if v:IsA("TextLabel") and v.Text ~= "" and v.Text ~= "▶" and v.Text ~= "▼" then
            if v.Text:lower():find(q) then
                v.TextColor3 = C_YELLOW
            end
        end
    end
end)

-- ══════════════════════════════
--       WINDOW CONTROLS
-- ══════════════════════════════

settingsBtn.MouseButton1Click:Connect(function()
    settingsPanel.Visible = not settingsPanel.Visible
end)

closeWinBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    miniBtn.Visible = true
    isOpen = false
    settingsPanel.Visible = false
end)

miniBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = true
    miniBtn.Visible = false
    isOpen = true
end)

local minimized = false
minWinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {
        Size = minimized and UDim2.new(0, 760, 0, 28) or UDim2.new(0, 760, 0, 540)
    }):Play()
    if minimized then settingsPanel.Visible = false end
end)

local fullscreen = false
maxWinBtn.MouseButton1Click:Connect(function()
    fullscreen = not fullscreen
    TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {
        Size = fullscreen and UDim2.new(1, -10, 1, -10) or UDim2.new(0, 760, 0, 540),
        Position = fullscreen and UDim2.new(0, 5, 0, 5) or UDim2.new(0.5, -380, 0.5, -270)
    }):Play()
end)

-- Keybind
local settingKeybind = false
keybindBtn.MouseButton1Click:Connect(function()
    settingKeybind = true
    keybindBtn.Text = "[ Press any key... ]"
    keybindBtn.TextColor3 = C_YELLOW
end)

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if settingKeybind then
        if input.UserInputType == Enum.UserInputType.Keyboard then
            currentKeybind = input.KeyCode
            settingKeybind = false
            local kbName = tostring(input.KeyCode):gsub("Enum.KeyCode.", "")
            keybindBtn.Text = "[ " .. kbName .. " ]"
            keybindBtn.TextColor3 = C_BLUE
        end
        return
    end
    if input.KeyCode == currentKeybind then
        if isOpen then
            mainFrame.Visible = false
            miniBtn.Visible = true
            isOpen = false
            settingsPanel.Visible = false
        else
            mainFrame.Visible = true
            miniBtn.Visible = false
            isOpen = true
        end
    end
end)

print("🔍 Dex Explorer loaded! Key: ] | Right-click for context menu")
end

-- ══════════════════════════════
--       KEY VERIFY
-- ══════════════════════════════

local function verifyKey(input)
    if input == VALID_KEY then
        keyStatusLabel.TextColor3 = C_GREEN
        keyStatusLabel.Text = "✅ Key verified! Loading..."
        TweenService:Create(verifyBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0,100,0)}):Play()
        task.wait(0.8)
        TweenService:Create(keyFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
            Size = UDim2.new(0,0,0,0),
            Position = UDim2.new(0.5,0,0.5,0)
        }):Play()
        task.wait(0.3)
        keyGui:Destroy()
        loadDex()
    else
        keyStatusLabel.TextColor3 = C_RED
        keyStatusLabel.Text = "❌ Incorrect key."
        TweenService:Create(verifyBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(120,0,0)}):Play()
        task.wait(0.2)
        TweenService:Create(verifyBtn, TweenInfo.new(0.2), {BackgroundColor3 = C_BLUE}):Play()
        shakeFrame()
    end
end

verifyBtn.MouseButton1Click:Connect(function() verifyKey(keyInput.Text) end)
keyInput.FocusLost:Connect(function(enter) if enter then verifyKey(keyInput.Text) end end)
keyCloseBtn.MouseButton1Click:Connect(function() keyGui:Destroy() end)
