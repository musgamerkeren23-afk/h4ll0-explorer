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

local keyCloseBtn = makeDot(keyTitleBar, Color3.fromRGB(220, 60, 60), 8)
makeDot(keyTitleBar, Color3.fromRGB(220, 160, 0), 22)
makeDot(keyTitleBar, Color3.fromRGB(40, 180, 60), 36)

local keyTitleLabel = Instance.new("TextLabel")
keyTitleLabel.Size = UDim2.new(1, -60, 1, 0)
keyTitleLabel.Position = UDim2.new(0, 54, 0, 0)
keyTitleLabel.BackgroundTransparency = 1
keyTitleLabel.Text = "Dex Explorer — Key Required"
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
keySubLabel.Text = "🔍 Enter key to access Dex Explorer"
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

local currentKeybind = Enum.KeyCode.RightBracket
local isOpen = true
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DexExplorer"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- ══════════════════════════════
--     MINI BUTTON (saat close)
-- ══════════════════════════════

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

local miniBorder = Instance.new("UIStroke")
miniBorder.Color = C_BORDER
miniBorder.Thickness = 1
miniBorder.Parent = miniBtn

-- ══════════════════════════════
--         MAIN FRAME
-- ══════════════════════════════

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

local closeWinBtn = makeDot(titleBar, Color3.fromRGB(220, 60, 60), 8)
local minWinBtn = makeDot(titleBar, Color3.fromRGB(220, 160, 0), 22)
local maxWinBtn = makeDot(titleBar, Color3.fromRGB(40, 180, 60), 36)

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -100, 1, 0)
titleLabel.Position = UDim2.new(0.5, -100, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Dex Explorer — H4ll0 W0rld"
titleLabel.TextColor3 = C_DIM
titleLabel.TextSize = 12
titleLabel.Font = Enum.Font.Gotham
titleLabel.TextXAlignment = Enum.TextXAlignment.Center
titleLabel.Parent = titleBar

-- Settings button in title bar
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
searchBox.PlaceholderColor3 = Color3.fromRGB(80, 80, 80)
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

local divider = Instance.new("Frame")
divider.Size = UDim2.new(0, 1, 1, 0)
divider.Position = UDim2.new(0, 260, 0, 0)
divider.BackgroundColor3 = C_BORDER
divider.BorderSizePixel = 0
divider.Parent = contentArea

-- RIGHT: Properties + Backpack panel
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

local colMid = Instance.new("Frame")
colMid.Size = UDim2.new(0, 1, 1, 0)
colMid.Position = UDim2.new(0.5, 0, 0, 0)
colMid.BackgroundColor3 = C_BORDER
colMid.BorderSizePixel = 0
colMid.Parent = colHeader

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

-- Properties scroll (main panel, resizable)
local propScroll = Instance.new("ScrollingFrame")
propScroll.Size = UDim2.new(1, 0, 0.6, -44)
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
--     BACKPACK PANEL
-- ══════════════════════════════

local backpackDiv = Instance.new("Frame")
backpackDiv.Size = UDim2.new(1, 0, 0, 1)
backpackDiv.Position = UDim2.new(0, 0, 0.6, 0)
backpackDiv.BackgroundColor3 = C_BORDER
backpackDiv.BorderSizePixel = 0
backpackDiv.Parent = rightPanel

local backpackPanel = Instance.new("Frame")
backpackPanel.Size = UDim2.new(1, 0, 0.4, -1)
backpackPanel.Position = UDim2.new(0, 0, 0.6, 1)
backpackPanel.BackgroundColor3 = C_DARKER
backpackPanel.BorderSizePixel = 0
backpackPanel.Parent = rightPanel

local bpHeader = Instance.new("Frame")
bpHeader.Size = UDim2.new(1, 0, 0, 24)
bpHeader.BackgroundColor3 = Color3.fromRGB(35, 30, 50)
bpHeader.BorderSizePixel = 0
bpHeader.Parent = backpackPanel

local bpHeaderSep = Instance.new("Frame")
bpHeaderSep.Size = UDim2.new(1, 0, 0, 1)
bpHeaderSep.Position = UDim2.new(0, 0, 1, 0)
bpHeaderSep.BackgroundColor3 = C_BORDER
bpHeaderSep.BorderSizePixel = 0
bpHeaderSep.Parent = bpHeader

local bpHeaderLbl = Instance.new("TextLabel")
bpHeaderLbl.Size = UDim2.new(0.6, 0, 1, 0)
bpHeaderLbl.Position = UDim2.new(0, 8, 0, 0)
bpHeaderLbl.BackgroundTransparency = 1
bpHeaderLbl.Text = "🎒 Backpack"
bpHeaderLbl.TextColor3 = Color3.fromRGB(180, 150, 255)
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

-- Tool input row
local toolInputRow = Instance.new("Frame")
toolInputRow.Size = UDim2.new(1, 0, 0, 28)
toolInputRow.Position = UDim2.new(0, 0, 0, 25)
toolInputRow.BackgroundColor3 = C_BG
toolInputRow.BorderSizePixel = 0
toolInputRow.Parent = backpackPanel

local toolNameBox = Instance.new("TextBox")
toolNameBox.Size = UDim2.new(1, -140, 0, 20)
toolNameBox.Position = UDim2.new(0, 6, 0.5, -10)
toolNameBox.BackgroundColor3 = C_INPUT
toolNameBox.Text = ""
toolNameBox.PlaceholderText = "Tool name / AssetId..."
toolNameBox.PlaceholderColor3 = Color3.fromRGB(70, 70, 70)
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

local giveToolBtn = Instance.new("TextButton")
giveToolBtn.Size = UDim2.new(0, 62, 0, 20)
giveToolBtn.Position = UDim2.new(1, -130, 0.5, -10)
giveToolBtn.BackgroundColor3 = Color3.fromRGB(40, 80, 40)
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
clearBpBtn.BackgroundColor3 = Color3.fromRGB(70, 30, 30)
clearBpBtn.Text = "🗑 Clear"
clearBpBtn.TextColor3 = C_RED
clearBpBtn.TextSize = 11
clearBpBtn.Font = Enum.Font.GothamBold
clearBpBtn.BorderSizePixel = 0
clearBpBtn.Parent = toolInputRow
Instance.new("UICorner", clearBpBtn).CornerRadius = UDim.new(0, 3)

-- Tool list scroll
local toolScroll = Instance.new("ScrollingFrame")
toolScroll.Size = UDim2.new(1, 0, 1, -54)
toolScroll.Position = UDim2.new(0, 0, 0, 54)
toolScroll.BackgroundTransparency = 1
toolScroll.BorderSizePixel = 0
toolScroll.ScrollBarThickness = 4
toolScroll.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80)
toolScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
toolScroll.Parent = backpackPanel

local toolLayout = Instance.new("UIListLayout")
toolLayout.SortOrder = Enum.SortOrder.LayoutOrder
toolLayout.Padding = UDim.new(0, 0)
toolLayout.Parent = toolScroll

toolLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    toolScroll.CanvasSize = UDim2.new(0, 0, 0, toolLayout.AbsoluteContentSize.Y)
end)

local currentTargetPlayer = nil

-- ══════════════════════════════
--     BACKPACK FUNCTIONS
-- ══════════════════════════════

local function refreshBackpack(targetPlayer)
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
        row.BackgroundColor3 = i % 2 == 0 and C_DARKER or Color3.fromRGB(30, 30, 30)
        row.BorderSizePixel = 0
        row.LayoutOrder = i
        row.Parent = toolScroll

        local rowSep = Instance.new("Frame")
        rowSep.Size = UDim2.new(1, 0, 0, 1)
        rowSep.Position = UDim2.new(0, 0, 1, -1)
        rowSep.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        rowSep.BorderSizePixel = 0
        rowSep.Parent = row

        local toolIcon = Instance.new("TextLabel")
        toolIcon.Size = UDim2.new(0, 20, 1, 0)
        toolIcon.Position = UDim2.new(0, 6, 0, 0)
        toolIcon.BackgroundTransparency = 1
        toolIcon.Text = "🔧"
        toolIcon.TextSize = 12
        toolIcon.Font = Enum.Font.Gotham
        toolIcon.Parent = row

        local toolNameLbl = Instance.new("TextLabel")
        toolNameLbl.Size = UDim2.new(1, -160, 1, 0)
        toolNameLbl.Position = UDim2.new(0, 28, 0, 0)
        toolNameLbl.BackgroundTransparency = 1
        toolNameLbl.Text = tool.Name
        toolNameLbl.TextColor3 = C_TEXT
        toolNameLbl.TextSize = 11
        toolNameLbl.Font = Enum.Font.Gotham
        toolNameLbl.TextXAlignment = Enum.TextXAlignment.Left
        toolNameLbl.TextTruncate = Enum.TextTruncate.AtEnd
        toolNameLbl.Parent = row

        -- Location badge
        local locBadge = Instance.new("TextLabel")
        locBadge.Size = UDim2.new(0, 60, 0, 16)
        locBadge.Position = UDim2.new(1, -132, 0.5, -8)
        locBadge.BackgroundColor3 = location == "Equipped"
            and Color3.fromRGB(40, 70, 40)
            or Color3.fromRGB(30, 40, 70)
        locBadge.Text = location
        locBadge.TextColor3 = location == "Equipped" and C_GREEN or C_BLUE
        locBadge.TextSize = 9
        locBadge.Font = Enum.Font.GothamBold
        locBadge.BorderSizePixel = 0
        locBadge.Parent = row
        Instance.new("UICorner", locBadge).CornerRadius = UDim.new(0, 3)

        -- Take button
        local takeBtn = Instance.new("TextButton")
        takeBtn.Size = UDim2.new(0, 50, 0, 18)
        takeBtn.Position = UDim2.new(1, -66, 0.5, -9)
        takeBtn.BackgroundColor3 = Color3.fromRGB(50, 80, 30)
        takeBtn.Text = "Take"
        takeBtn.TextColor3 = C_GREEN
        takeBtn.TextSize = 10
        takeBtn.Font = Enum.Font.GothamBold
        takeBtn.BorderSizePixel = 0
        takeBtn.Parent = row
        Instance.new("UICorner", takeBtn).CornerRadius = UDim.new(0, 3)

        -- Remove button
        local removeBtn = Instance.new("TextButton")
        removeBtn.Size = UDim2.new(0, 50, 0, 18)
        removeBtn.Position = UDim2.new(1, -10, 0.5, -9)
        removeBtn.AnchorPoint = Vector2.new(1, 0)
        removeBtn.BackgroundColor3 = Color3.fromRGB(70, 30, 30)
        removeBtn.Text = "Remove"
        removeBtn.TextColor3 = C_RED
        removeBtn.TextSize = 10
        removeBtn.Font = Enum.Font.GothamBold
        removeBtn.BorderSizePixel = 0
        removeBtn.Parent = row
        Instance.new("UICorner", removeBtn).CornerRadius = UDim.new(0, 3)

        -- Take = clone tool ke backpack kita
        takeBtn.MouseButton1Click:Connect(function()
            local myBackpack = player:FindFirstChild("Backpack")
            if myBackpack then
                local clone = tool:Clone()
                clone.Parent = myBackpack
                takeBtn.Text = "✅"
                task.wait(1)
                takeBtn.Text = "Take"
            end
        end)

        -- Remove = hapus tool dari backpack target
        removeBtn.MouseButton1Click:Connect(function()
            tool:Destroy()
            refreshBackpack(targetPlayer)
        end)

        row.MouseEnter:Connect(function()
            row.BackgroundColor3 = C_HOVER
        end)
        row.MouseLeave:Connect(function()
            row.BackgroundColor3 = i % 2 == 0 and C_DARKER or Color3.fromRGB(30, 30, 30)
        end)
    end
end

-- Give tool ke target player
giveToolBtn.MouseButton1Click:Connect(function()
    if not currentTargetPlayer then return end
    local toolName = toolNameBox.Text
    if toolName == "" then return end

    local myChar = player.Character
    local myBackpack = player:FindFirstChild("Backpack")
    local targetBackpack = currentTargetPlayer:FindFirstChild("Backpack")
    if not targetBackpack then return end

    -- Cari dari char atau backpack kita
    local found = nil
    if myChar then
        found = myChar:FindFirstChild(toolName) or myChar:FindFirstChildWhichIsA("Tool")
    end
    if not found and myBackpack then
        found = myBackpack:FindFirstChild(toolName)
    end

    if found and found:IsA("Tool") then
        local clone = found:Clone()
        clone.Parent = targetBackpack
        giveToolBtn.Text = "✅"
        task.wait(1)
        giveToolBtn.Text = "+ Give"
        refreshBackpack(currentTargetPlayer)
    else
        giveToolBtn.BackgroundColor3 = Color3.fromRGB(80, 30, 30)
        giveToolBtn.Text = "❌"
        task.wait(1)
        giveToolBtn.BackgroundColor3 = Color3.fromRGB(40, 80, 40)
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
    if type(val) == "boolean" then return val and C_GREEN or C_RED end
    if type(val) == "number" then return Color3.fromRGB(100, 180, 255) end
    if type(val) == "string" then return Color3.fromRGB(180, 220, 130) end
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
        local p = val.Position
        return string.format("%.2f, %.2f, %.2f", p.X, p.Y, p.Z)
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
        row.BackgroundColor3 = order % 2 == 0 and C_DARKER or Color3.fromRGB(30, 30, 30)
    end)
end

local PROPERTY_CATEGORIES = {
    {name="Data", props={"Name","ClassName","Archivable"}},
    {name="Appearance", props={
        "BackgroundColor3","BackgroundTransparency","BorderColor3","BorderSizePixel",
        "TextColor3","TextTransparency","TextStrokeColor3","TextStrokeTransparency",
        "Color","BrickColor","Material","Reflectance","Transparency","CastShadow",
    }},
    {name="Behavior", props={
        "Active","Draggable","Visible","Enabled","CanCollide","CanTouch",
        "CanQuery","Anchored","Massless","Locked","Disabled",
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
}

local function showProperties(obj)
    clearProps()
    rightHeaderLbl.Text = "Properties — " .. obj.Name .. " [" .. obj.ClassName .. "]"

    local order = 0
    for _, cat in ipairs(PROPERTY_CATEGORIES) do
        local catProps = {}
        for _, prop in ipairs(cat.props) do
            local ok, val = pcall(function() return obj[prop] end)
            if ok and val ~= nil then
                table.insert(catProps, {prop, val})
            end
        end
        if #catProps > 0 then
            addCategory(cat.name, order) order += 1
            for _, pv in ipairs(catProps) do
                addPropRow(pv[1], pv[2], order) order += 1
            end
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
        Workspace="🌍",Part="🧱",MeshPart="🧊",Model="📦",
        Script="📜",LocalScript="📄",ModuleScript="📋",
        RemoteEvent="📡",RemoteFunction="📡",
        Folder="📁",Frame="🖼",ScreenGui="🖥",
        TextLabel="🔤",TextButton="🔘",TextBox="✏️",
        ImageLabel="🖼",ImageButton="🖼",
        Sound="🔊",Humanoid="🚶",HumanoidRootPart="⬛",
        Camera="📷",Lighting="💡",
        ReplicatedStorage="💾",ServerScriptService="⚙️",
        StarterGui="🎮",StarterPack="🎒",StarterPlayer="👤",
        Players="👥",Player="👤",
        Backpack="🎒",Tool="🔧",
        NumberValue="🔢",StringValue="📝",
        BoolValue="✅",IntValue="🔢",
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

        for i = 1, depth do
            local line = Instance.new("Frame")
            line.Size = UDim2.new(0, 1, 1, 0)
            line.Position = UDim2.new(0, (i-1)*16 + 8, 0, 0)
            line.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            line.BorderSizePixel = 0
            line.Parent = row
        end

        local arrowLbl = Instance.new("TextLabel")
        arrowLbl.Size = UDim2.new(0, 14, 1, 0)
        arrowLbl.Position = UDim2.new(0, depth*16 + 2, 0, 0)
        arrowLbl.BackgroundTransparency = 1
        arrowLbl.Text = hasChildren and "▶" or ""
        arrowLbl.TextColor3 = C_DIM
        arrowLbl.TextSize = 8
        arrowLbl.Font = Enum.Font.Gotham
        arrowLbl.Parent = row

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
        nameLbl.TextSize = 11
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
            if selectedRow then selectedRow.BackgroundColor3 = C_DARKER end
            row.BackgroundColor3 = C_SELECT
            nameLbl.TextColor3 = C_WHITE
            selectedRow = row

            showProperties(obj)

            -- If player, show backpack
            if obj:IsA("Player") then
                refreshBackpack(obj)
            elseif obj:IsA("Backpack") then
                local parentPlayer = obj.Parent
                if parentPlayer and parentPlayer:IsA("Player") then
                    refreshBackpack(parentPlayer)
                end
            end

            if hasChildren then
                expanded = not expanded
                arrowLbl.Text = expanded and "▼" or "▶"
                childContainer.Visible = expanded
                if expanded and #childContainer:GetChildren() <= 1 then
                    buildTree(obj, childContainer, depth + 1)
                end
                updateCanvasSize()
            end
        end)

        row.MouseEnter:Connect(function()
            if row ~= selectedRow then row.BackgroundColor3 = C_HOVER end
        end)
        row.MouseLeave:Connect(function()
            if row ~= selectedRow then row.BackgroundColor3 = C_DARKER end
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

    local sepLine = Instance.new("Frame")
    sepLine.Size = UDim2.new(1, 0, 0, 1)
    sepLine.Position = UDim2.new(0, 0, 1, -1)
    sepLine.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
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

    local expanded = false

    row.MouseButton1Click:Connect(function()
        if selectedRow then selectedRow.BackgroundColor3 = C_DARKER end
        row.BackgroundColor3 = C_SELECT
        nameLbl.TextColor3 = C_WHITE
        selectedRow = row
        showProperties(service)

        if service:IsA("Player") then refreshBackpack(service) end

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
    rightHeaderLbl.Text = "Properties"
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
        if v:IsA("TextButton") then
            local nl = v:FindFirstChildWhichIsA("TextLabel")
            if nl and nl.Text:lower():find(q) then
                nl.TextColor3 = C_YELLOW
            end
        end
    end
end)

-- ══════════════════════════════
--       SETTINGS PANEL
-- ══════════════════════════════

local settingsPanel = Instance.new("Frame")
settingsPanel.Size = UDim2.new(0, 260, 0, 200)
settingsPanel.Position = UDim2.new(1, -270, 0, 28)
settingsPanel.BackgroundColor3 = C_DARKER
settingsPanel.BorderSizePixel = 0
settingsPanel.Visible = false
settingsPanel.ZIndex = 10
settingsPanel.Parent = mainFrame
Instance.new("UICorner", settingsPanel).CornerRadius = UDim.new(0, 4)

local spBorder = Instance.new("UIStroke")
spBorder.Color = C_BORDER
spBorder.Thickness = 1
spBorder.Parent = settingsPanel

local spHeader = Instance.new("TextLabel")
spHeader.Size = UDim2.new(1, -10, 0, 28)
spHeader.Position = UDim2.new(0, 8, 0, 0)
spHeader.BackgroundTransparency = 1
spHeader.Text = "⚙️ Settings"
spHeader.TextColor3 = C_TEXT
spHeader.TextSize = 12
spHeader.Font = Enum.Font.GothamBold
spHeader.TextXAlignment = Enum.TextXAlignment.Left
spHeader.Parent = settingsPanel

local spSep = Instance.new("Frame")
spSep.Size = UDim2.new(1, 0, 0, 1)
spSep.Position = UDim2.new(0, 0, 0, 28)
spSep.BackgroundColor3 = C_BORDER
spSep.BorderSizePixel = 0
spSep.Parent = settingsPanel

local keybindLabel = Instance.new("TextLabel")
keybindLabel.Size = UDim2.new(1, -10, 0, 20)
keybindLabel.Position = UDim2.new(0, 8, 0, 36)
keybindLabel.BackgroundTransparency = 1
keybindLabel.Text = "Toggle Keybind:"
keybindLabel.TextColor3 = C_DIM
keybindLabel.TextSize = 11
keybindLabel.Font = Enum.Font.Gotham
keybindLabel.TextXAlignment = Enum.TextXAlignment.Left
keybindLabel.Parent = settingsPanel

local keybindBtn = Instance.new("TextButton")
keybindBtn.Size = UDim2.new(1, -16, 0, 28)
keybindBtn.Position = UDim2.new(0, 8, 0, 58)
keybindBtn.BackgroundColor3 = C_BG
keybindBtn.Text = "[ " .. tostring(currentKeybind):gsub("Enum.KeyCode.", "") .. " ]"
keybindBtn.TextColor3 = C_BLUE
keybindBtn.TextSize = 12
keybindBtn.Font = Enum.Font.GothamBold
keybindBtn.BorderSizePixel = 0
keybindBtn.Parent = settingsPanel
Instance.new("UICorner", keybindBtn).CornerRadius = UDim.new(0, 3)

local kbBorder = Instance.new("UIStroke")
kbBorder.Color = C_BORDER
kbBorder.Thickness = 1
kbBorder.Parent = keybindBtn

local keybindStatus = Instance.new("TextLabel")
keybindStatus.Size = UDim2.new(1, -10, 0, 16)
keybindStatus.Position = UDim2.new(0, 8, 0, 90)
keybindStatus.BackgroundTransparency = 1
keybindStatus.Text = "Click button then press any key"
keybindStatus.TextColor3 = C_DIM
keybindStatus.TextSize = 10
keybindStatus.Font = Enum.Font.Gotham
keybindStatus.TextXAlignment = Enum.TextXAlignment.Left
keybindStatus.Parent = settingsPanel

local spSep2 = Instance.new("Frame")
spSep2.Size = UDim2.new(1, -16, 0, 1)
spSep2.Position = UDim2.new(0, 8, 0, 114)
spSep2.BackgroundColor3 = C_BORDER
spSep2.BorderSizePixel = 0
spSep2.Parent = settingsPanel

local themeLabel = Instance.new("TextLabel")
themeLabel.Size = UDim2.new(1, -10, 0, 20)
themeLabel.Position = UDim2.new(0, 8, 0, 122)
themeLabel.BackgroundTransparency = 1
themeLabel.Text = "Theme:"
themeLabel.TextColor3 = C_DIM
themeLabel.TextSize = 11
themeLabel.Font = Enum.Font.Gotham
themeLabel.TextXAlignment = Enum.TextXAlignment.Left
themeLabel.Parent = settingsPanel

local themeRow = Instance.new("Frame")
themeRow.Size = UDim2.new(1, -16, 0, 28)
themeRow.Position = UDim2.new(0, 8, 0, 144)
themeRow.BackgroundTransparency = 1
themeRow.Parent = settingsPanel

local themes = {
    {name="Dark", bg=Color3.fromRGB(36,36,36)},
    {name="Horror", bg=Color3.fromRGB(20,0,0)},
    {name="Blue", bg=Color3.fromRGB(10,20,36)},
}

for i, theme in ipairs(themes) do
    local tb = Instance.new("TextButton")
    tb.Size = UDim2.new(0, 72, 1, 0)
    tb.Position = UDim2.new(0, (i-1)*78, 0, 0)
    tb.BackgroundColor3 = theme.bg
    tb.Text = theme.name
    tb.TextColor3 = C_TEXT
    tb.TextSize = 11
    tb.Font = Enum.Font.GothamBold
    tb.BorderSizePixel = 0
    tb.Parent = themeRow
    Instance.new("UICorner", tb).CornerRadius = UDim.new(0, 3)

    local tbs = Instance.new("UIStroke")
    tbs.Color = C_BORDER
    tbs.Thickness = 1
    tbs.Parent = tb

    tb.MouseButton1Click:Connect(function()
        mainFrame.BackgroundColor3 = theme.bg
        leftPanel.BackgroundColor3 = Color3.fromRGB(theme.bg.R*255 - 8, theme.bg.G*255, theme.bg.B*255)
        rightPanel.BackgroundColor3 = Color3.fromRGB(theme.bg.R*255 - 8, theme.bg.G*255, theme.bg.B*255)
    end)
end

-- Keybind setter
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
            keybindBtn.Text = "[ " .. tostring(input.KeyCode):gsub("Enum.KeyCode.", "") .. " ]"
            keybindBtn.TextColor3 = C_BLUE
        end
        return
    end

    -- Toggle open/close
    if input.KeyCode == currentKeybind then
        if isOpen then
            mainFrame.Visible = false
            miniBtn.Visible = true
            isOpen = false
        else
            mainFrame.Visible = true
            miniBtn.Visible = false
            isOpen = true
        end
    end
end)

settingsBtn.MouseButton1Click:Connect(function()
    settingsPanel.Visible = not settingsPanel.Visible
end)

-- ══════════════════════════════
--       WINDOW CONTROLS
-- ══════════════════════════════

-- Close = hide + show mini btn
closeWinBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    miniBtn.Visible = true
    isOpen = false
end)

-- Mini button = reopen
miniBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = true
    miniBtn.Visible = false
    isOpen = true
end)

-- Minimize = shrink to titlebar only
local minimized = false
minWinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {
        Size = minimized and UDim2.new(0, 760, 0, 28) or UDim2.new(0, 760, 0, 540)
    }):Play()
end)

-- Maximize
local fullscreen = false
maxWinBtn.MouseButton1Click:Connect(function()
    fullscreen = not fullscreen
    TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {
        Size = fullscreen and UDim2.new(1, -10, 1, -10) or UDim2.new(0, 760, 0, 540),
        Position = fullscreen and UDim2.new(0, 5, 0, 5) or UDim2.new(0.5, -380, 0.5, -270)
    }):Play()
end)

print("🔍 Dex Explorer loaded! Keybind: ]")
end

-- ══════════════════════════════
--       KEY VERIFY
-- ══════════════════════════════

local function verifyKey(input)
    if input == VALID_KEY then
        keyStatusLabel.TextColor3 = C_GREEN
        keyStatusLabel.Text = "✅ Key verified! Loading Dex..."
        TweenService:Create(verifyBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 100, 0)}):Play()
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
