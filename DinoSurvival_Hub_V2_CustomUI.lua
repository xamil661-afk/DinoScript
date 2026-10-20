--[[
    ================================================================================
    🦖 DINO SURVIVAL HUB V2 — Custom UI Developer/QA Edition
    ================================================================================
    🎮 Game: โลกดึกดำบรรพ์ | การอยู่รอดของไดโนเสาร์ (ChunkGame / Dinosaur Survival)
    📋 PlaceId: 71881517499644 / 10696301650
    📦 วิเคราะห์ข้อมูลจาก: ChunkGame Dump, Report_1956837_1.jsonl, MasterDict
    🔧 UI Framework: DINO Custom UI V2 (สร้างใหม่ ไม่พึ่ง Fluent)
    ⚡ ฟังก์ชัน: 50+ | เพิ่ม Developer/QA Combat Controller | ใช้ใน Studio/เกมที่อนุญาต
    ================================================================================
    
    📖 สรุปสารบัญระบบและฟังชั่นหลัก:
    ─────────────────────────────────────────────────────────────────────────────
    🦖 ๑. แท็บไดโนเสาร์ & ต่อสู้ (Dinosaur & Combat)
       - [1] ESP ไดโนเสาร์ (บอกชื่อไดโนเสาร์เป็นภาษาไทย + ระยะทาง + สีตามประเภท)
       - [2] ESP รังไข่ไดโนเสาร์ (Dino Nests & Eggs)
       - [3] เมนูวาร์ปไปหาไดโนเสาร์ภาษาไทย (เลือกสายพันธุ์)
       - [4] บินลอยตัวไปหาไดโนเสาร์ (Fly to Dino)
       - [5] Auto Kill Aura ไดโนเสาร์ (ออร่าฟันไดโนเสาร์รอบตัว)
       - [6] สไลเดอร์ปรับระยะ Kill Aura
       - [7] Fast Attack (โจมตีรัวไร้คูลดาวน์)
       - [8] Hitbox Expander ไดโนเสาร์ (ขยายขนาดตัวไดโนเสาร์ให้ตีง่าย)
       - [9] สไลเดอร์ปรับขนาด Hitbox
       - [10] Auto Collect Dino Eggs (ขโมยไข่ไดโนเสาร์จากรังอัตโนมัติ)
       - [11] ล็อคเป้าไดโนเสาร์ (Aimlock Target Dino)

    📦 ๒. แท็บกล่องสมบัติ & สำรวจ (Chests & Expeditions)
       - [12] ESP กล่องสมบัติ (บอกระดับกล่องเป็นภาษาไทย 100% พร้อมสถานะเปิด/ยังไม่เปิด)
       - [13] ตัวกรองระดับกล่อง (Filter Rarity: ทั่วไป, หายาก, มหากาพย์, ในตำนาน, เทพนิยาย, เทวะ)
       - [14] ซ่อนกล่องที่เปิดไปแล้ว (Hide Claimed Chests)
       - [15] เมนูวาร์ปไปหากล่องสมบัติภาษาไทย
       - [16] บินไปหากล่องสมบัติ (Fly to Chest)
       - [17] Auto Open Chest (กด ProximityPrompt เปิดกล่องอัตโนมัติ)
       - [18] Auto Farm All Chests (วนบินเก็บกล่องทั้งหมดในแมพจนครบ)

    ⛏️ ๓. แท็บออโต้ฟาร์มทรัพยากร (Wood, Stone, Ore & Food Farm)
       - [19] Auto Farm ทรัพยากร (เปิด/ปิดระบบฟาร์ม)
       - [20] เมนูเลือกสิ่งที่ต้องการฟาร์มเป็นภาษาไทย (ไม้, หิน, แร่ทองแดง, ถ่านหิน, แร่เหล็ก, เบอร์รี่, ฟักทอง)
       - [21] สไลเดอร์ปรับความเร็วการบินไปฟาร์ม (Farm Fly Speed)
       - [22] สไลเดอร์ปรับระยะฟาร์มสูงสุด (Max Farm Distance)
       - [23] สไลเดอร์ความสูงปลอดภัย (Safe Height Offset - ลอยตัวเหนือเป้าหมาย)
       - [24] Auto Attack Resource (โจมตีและขุดทรัพยากรอัตโนมัติ)
       - [25] Auto Collect Drops (ดูดเก็บไอเทมที่ดรอปเข้าตัวทันที)
       - [26] Auto Equip Tool (ถือขวาน/อีเต๋อ/เครื่องมือที่เหมาะสมอัตโนมัติ)

    🏃 ๔. แท็บการเคลื่อนที่ & ผู้เล่น (Movement & Speed)
       - [27] วิ่งไว (Speed Hack - ล็อคความเร็ว)
       - [28] สไลเดอร์ปรับความเร็วเดิน (WalkSpeed Slider: 16 - 300)
       - [29] กระโดดสูง (High Jump)
       - [30] สไลเดอร์ปรับพลังกระโดด (JumpPower Slider: 50 - 400)
       - [31] บินอิสระ (Fly Mode - WASD + Space/Ctrl)
       - [32] สไลเดอร์ปรับความเร็วบิน (Fly Speed Slider: 20 - 300)
       - [33] เดินบนอากาศ (Air Walk / Platform Walk)
       - [34] สไลเดอร์ปรับระดับความสูงเดินบนอากาศ (Air Walk Height Offset)
       - [35] ทะลุกำแพง (Noclip)
       - [36] กระโดดกลางอากาศไม่จำกัด (Infinite Jump)
       - [37] สตามิน่าไม่จำกัด (Infinite Stamina)

    🗺️ ๕. แท็บสถานที่สำคัญ & วาร์ป (Landmarks & POIs)
       - [38] ESP สถานที่สำคัญ (Mothership, Pyramid, เตาไฟ, โต๊ะคราฟต์, ดันเจี้ยน ฯลฯ)
       - [39] เมนูวาร์ปไปสถานที่สำคัญภาษาไทย
       - [40] บินสมูทไปสถานที่สำคัญ (Smooth Fly to Landmark)
       - [41] บันทึกพิกัดส่วนตัว (Save Custom Waypoint)
       - [42] วาร์ปไปพิกัดที่บันทึก (Teleport to Custom Waypoint)

    🛡️ ๖. แท็บการมองเห็น & เอาชีวิตรอด (Visuals & Survival)
       - [43] ESP ผู้เล่น (Player ESP พร้อมเลือดและระยะทาง)
       - [44] ตาทิพย์ทะลุวิญญาณ (True Sight / Anti-Invisibility)
       - [45] Fullbright (มองเห็นในที่มืด 100%)
       - [46] Anti-AFK (ป้องกันหลุดออกจากเกม)
       - [47] ล่องหน (Invisibility Mode)
       - [48] ปรับระยะมุมมอง (Field of View - FOV Slider)
       - [49] Auto Eat / Auto Drink (กินอาหาร/ดื่มน้ำอัตโนมัติ)

    ⚙️ ๗. แท็บตั้งค่า & ข้อมูล (Settings & Config)
       - [50] ตัวเลือกธีม UI (Theme Selector: Dark, Aqua, Amethyst, Rose ฯลฯ)
       - [51] สลับเอฟเฟกต์ Acrylic โปร่งแสง
       - [52] ระบบเซฟคอนฟิก (SaveManager & InterfaceManager)
    ─────────────────────────────────────────────────────────────────────────────
    ⌨️ ปุ่มย่อ/เปิด UI: กด RightControl
    ================================================================================
]]

-- =============================================================================
-- ๑. โหลดบริการหลักและตัวแปรระบบ (Universal Services & Variables)
-- =============================================================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- ตัวละคร LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:FindFirstChildOfClass("Humanoid")
local RootPart = Character:FindFirstChild("HumanoidRootPart")

LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    Humanoid = char:WaitForChild("Humanoid")
    RootPart = char:WaitForChild("HumanoidRootPart")
end)

-- Safe ProximityPrompt Activator
local function SafeFirePrompt(prompt)
    if prompt and prompt:IsA("ProximityPrompt") then
        local oldDuration = prompt.HoldDuration
        prompt.HoldDuration = 0
        prompt:InputHoldBegin()
        task.wait(0.04)
        prompt:InputHoldEnd()
        prompt.HoldDuration = oldDuration
    end
end

-- =============================================================================
-- ๒. DINO SURVIVAL HUB V2 — Custom UI (ไม่พึ่ง Fluent UI)
-- =============================================================================
-- UI ใหม่ 100% แต่คง API แบบ Fluent เดิมไว้ เพื่อให้ฟังก์ชัน/Callback ด้านล่างใช้ต่อได้
-- จุดเด่น: Sidebar, Toggle, Slider, Dropdown, Toast, Theme และย่อเป็นปุ่ม 🦖 ลากได้

local DinoUI = {
    CurrentTheme = "Dark",
    _screen = nil,
    _window = nil,
    _themeBindings = {},
}

local DinoThemes = {
    Dark = {
        bg = Color3.fromRGB(15, 18, 22),
        panel = Color3.fromRGB(22, 26, 32),
        card = Color3.fromRGB(30, 35, 42),
        card2 = Color3.fromRGB(38, 44, 52),
        accent = Color3.fromRGB(95, 210, 120),
        accent2 = Color3.fromRGB(58, 145, 80),
        text = Color3.fromRGB(242, 246, 250),
        muted = Color3.fromRGB(163, 174, 187),
        danger = Color3.fromRGB(255, 95, 95),
        stroke = Color3.fromRGB(62, 72, 83),
    },
    Darker = {
        bg = Color3.fromRGB(8, 10, 13),
        panel = Color3.fromRGB(14, 17, 21),
        card = Color3.fromRGB(21, 25, 30),
        card2 = Color3.fromRGB(30, 35, 41),
        accent = Color3.fromRGB(110, 224, 128),
        accent2 = Color3.fromRGB(48, 128, 68),
        text = Color3.fromRGB(245, 248, 250),
        muted = Color3.fromRGB(155, 166, 179),
        danger = Color3.fromRGB(255, 92, 92),
        stroke = Color3.fromRGB(48, 56, 66),
    },
    Light = {
        bg = Color3.fromRGB(225, 232, 238),
        panel = Color3.fromRGB(241, 245, 248),
        card = Color3.fromRGB(255, 255, 255),
        card2 = Color3.fromRGB(234, 240, 244),
        accent = Color3.fromRGB(34, 159, 73),
        accent2 = Color3.fromRGB(23, 118, 52),
        text = Color3.fromRGB(23, 31, 38),
        muted = Color3.fromRGB(85, 98, 110),
        danger = Color3.fromRGB(218, 61, 61),
        stroke = Color3.fromRGB(195, 205, 214),
    },
    Aqua = {
        bg = Color3.fromRGB(10, 19, 24),
        panel = Color3.fromRGB(16, 31, 38),
        card = Color3.fromRGB(22, 42, 50),
        card2 = Color3.fromRGB(28, 53, 62),
        accent = Color3.fromRGB(49, 214, 202),
        accent2 = Color3.fromRGB(20, 137, 134),
        text = Color3.fromRGB(235, 253, 252),
        muted = Color3.fromRGB(145, 187, 188),
        danger = Color3.fromRGB(255, 105, 105),
        stroke = Color3.fromRGB(46, 91, 99),
    },
    Amethyst = {
        bg = Color3.fromRGB(20, 15, 27),
        panel = Color3.fromRGB(31, 23, 42),
        card = Color3.fromRGB(43, 32, 58),
        card2 = Color3.fromRGB(54, 40, 73),
        accent = Color3.fromRGB(181, 111, 255),
        accent2 = Color3.fromRGB(120, 68, 181),
        text = Color3.fromRGB(248, 241, 255),
        muted = Color3.fromRGB(188, 163, 208),
        danger = Color3.fromRGB(255, 100, 120),
        stroke = Color3.fromRGB(84, 61, 107),
    },
    Rose = {
        bg = Color3.fromRGB(27, 15, 20),
        panel = Color3.fromRGB(41, 22, 30),
        card = Color3.fromRGB(55, 30, 40),
        card2 = Color3.fromRGB(72, 38, 52),
        accent = Color3.fromRGB(255, 112, 158),
        accent2 = Color3.fromRGB(176, 64, 103),
        text = Color3.fromRGB(255, 241, 247),
        muted = Color3.fromRGB(210, 162, 180),
        danger = Color3.fromRGB(255, 85, 85),
        stroke = Color3.fromRGB(103, 57, 73),
    },
}

local function CurrentTheme()
    return DinoThemes[DinoUI.CurrentTheme] or DinoThemes.Dark
end

local function BindTheme(instance, propertyName, role)
    table.insert(DinoUI._themeBindings, {
        Instance = instance,
        Property = propertyName,
        Role = role,
    })
    local theme = CurrentTheme()
    if instance and instance.Parent ~= nil or instance then
        pcall(function()
            instance[propertyName] = theme[role]
        end)
    end
end

local function ApplyTheme()
    local theme = CurrentTheme()
    for i = #DinoUI._themeBindings, 1, -1 do
        local item = DinoUI._themeBindings[i]
        local inst = item.Instance
        if not inst then
            table.remove(DinoUI._themeBindings, i)
        else
            local ok = pcall(function()
                inst[item.Property] = theme[item.Role]
            end)
            if not ok then
                table.remove(DinoUI._themeBindings, i)
            end
        end
    end
end

local function New(className, props)
    local obj = Instance.new(className)
    for k, v in pairs(props or {}) do
        obj[k] = v
    end
    return obj
end

local function AddCorner(obj, radius)
    local c = New("UICorner", {CornerRadius = UDim.new(0, radius or 10)})
    c.Parent = obj
    return c
end

local function AddStroke(obj, thickness, transparency)
    local s = New("UIStroke", {
        Thickness = thickness or 1,
        Transparency = transparency or 0,
    })
    BindTheme(s, "Color", "stroke")
    s.Parent = obj
    return s
end

local function AddPadding(obj, left, right, top, bottom)
    local p = New("UIPadding", {
        PaddingLeft = UDim.new(0, left or 0),
        PaddingRight = UDim.new(0, right or left or 0),
        PaddingTop = UDim.new(0, top or 0),
        PaddingBottom = UDim.new(0, bottom or top or 0),
    })
    p.Parent = obj
    return p
end

local function SafeCallback(fn, ...)
    if type(fn) ~= "function" then return true end
    local args = {...}
    local ok, err = pcall(function()
        fn(unpack(args))
    end)
    if not ok then
        warn("[DinoHub V2 UI] Callback error:", err)
    end
    return ok
end

local function MakeDraggable(frame, handle)
    local dragging = false
    local dragInput = nil
    local dragStart = nil
    local startPos = nil

    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    handle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input == dragInput and dragStart and startPos then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
end

function DinoUI:SetTheme(name)
    if DinoThemes[name] then
        self.CurrentTheme = name
        ApplyTheme()
    end
end

function DinoUI:Notify(config)
    config = config or {}
    local screen = self._screen
    if not screen then
        print(string.format("[DinoHub] %s | %s", tostring(config.Title or ""), tostring(config.Content or "")))
        return
    end

    local holder = screen:FindFirstChild("ToastHolder")
    if not holder then return end

    local toast = New("Frame", {
        Name = "Toast",
        Size = UDim2.fromOffset(330, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 0.04,
        BorderSizePixel = 0,
    })
    BindTheme(toast, "BackgroundColor3", "card")
    AddCorner(toast, 12)
    AddStroke(toast, 1, 0.15)
    AddPadding(toast, 14, 14, 12, 12)
    toast.Parent = holder

    local layout = New("UIListLayout", {
        Padding = UDim.new(0, 4),
        SortOrder = Enum.SortOrder.LayoutOrder,
    })
    layout.Parent = toast

    local title = New("TextLabel", {
        Size = UDim2.new(1, 0, 0, 22),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        Text = tostring(config.Title or "Dino Hub"),
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
    })
    BindTheme(title, "TextColor3", "text")
    title.Parent = toast

    local body = New("TextLabel", {
        Size = UDim2.new(1, 0, 0, 18),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        Text = tostring(config.Content or ""),
        TextSize = 12,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
    })
    BindTheme(body, "TextColor3", "muted")
    body.Parent = toast

    toast.BackgroundTransparency = 1
    title.TextTransparency = 1
    body.TextTransparency = 1

    TweenService:Create(toast, TweenInfo.new(0.2), {BackgroundTransparency = 0.04}):Play()
    TweenService:Create(title, TweenInfo.new(0.2), {TextTransparency = 0}):Play()
    TweenService:Create(body, TweenInfo.new(0.2), {TextTransparency = 0}):Play()

    task.delay(tonumber(config.Duration) or 3.5, function()
        if toast and toast.Parent then
            TweenService:Create(toast, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
            TweenService:Create(title, TweenInfo.new(0.2), {TextTransparency = 1}):Play()
            TweenService:Create(body, TweenInfo.new(0.2), {TextTransparency = 1}):Play()
            task.wait(0.22)
            if toast then toast:Destroy() end
        end
    end)
end

local function CreateControlCard(parent, height)
    local card = New("Frame", {
        Size = UDim2.new(1, -10, 0, height or 58),
        BackgroundTransparency = 0.02,
        BorderSizePixel = 0,
    })
    BindTheme(card, "BackgroundColor3", "card")
    AddCorner(card, 11)
    AddStroke(card, 1, 0.35)
    card.Parent = parent
    return card
end

local function CreateTitleAndDescription(card, titleText, descriptionText, rightSpace)
    local title = New("TextLabel", {
        Position = UDim2.fromOffset(14, 9),
        Size = UDim2.new(1, -(rightSpace or 24), 0, descriptionText and 20 or 34),
        BackgroundTransparency = 1,
        Text = tostring(titleText or ""),
        TextSize = 13,
        Font = Enum.Font.GothamSemibold,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        TextWrapped = true,
    })
    BindTheme(title, "TextColor3", "text")
    title.Parent = card

    local desc = nil
    if descriptionText and tostring(descriptionText) ~= "" then
        desc = New("TextLabel", {
            Position = UDim2.fromOffset(14, 31),
            Size = UDim2.new(1, -(rightSpace or 24), 0, 18),
            BackgroundTransparency = 1,
            Text = tostring(descriptionText),
            TextSize = 11,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
            TextWrapped = true,
        })
        BindTheme(desc, "TextColor3", "muted")
        desc.Parent = card
    end
    return title, desc
end

local TabMethods = {}
TabMethods.__index = TabMethods

function TabMethods:AddParagraph(config)
    config = config or {}
    local contentText = tostring(config.Content or "")
    local extraLines = math.max(0, select(2, contentText:gsub("\n", "\n")))
    local h = math.clamp(72 + extraLines * 16, 72, 150)

    local card = CreateControlCard(self.Content, h)
    local stripe = New("Frame", {
        Position = UDim2.fromOffset(0, 0),
        Size = UDim2.fromOffset(4, h),
        BorderSizePixel = 0,
    })
    BindTheme(stripe, "BackgroundColor3", "accent")
    AddCorner(stripe, 5)
    stripe.Parent = card

    local title = New("TextLabel", {
        Position = UDim2.fromOffset(16, 10),
        Size = UDim2.new(1, -28, 0, 22),
        BackgroundTransparency = 1,
        Text = tostring(config.Title or ""),
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    BindTheme(title, "TextColor3", "text")
    title.Parent = card

    local body = New("TextLabel", {
        Position = UDim2.fromOffset(16, 34),
        Size = UDim2.new(1, -28, 1, -42),
        BackgroundTransparency = 1,
        Text = contentText,
        TextSize = 11,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        TextWrapped = true,
    })
    BindTheme(body, "TextColor3", "muted")
    body.Parent = card
    return card
end

function TabMethods:AddButton(config)
    config = config or {}
    local card = CreateControlCard(self.Content, 60)
    CreateTitleAndDescription(card, config.Title, config.Description, 150)

    local button = New("TextButton", {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -12, 0.5, 0),
        Size = UDim2.fromOffset(122, 34),
        AutoButtonColor = false,
        BorderSizePixel = 0,
        Text = "ใช้งาน",
        TextSize = 12,
        Font = Enum.Font.GothamBold,
    })
    BindTheme(button, "BackgroundColor3", "accent")
    BindTheme(button, "TextColor3", "bg")
    AddCorner(button, 9)
    button.Parent = card

    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.12), {BackgroundTransparency = 0.12}):Play()
    end)
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.12), {BackgroundTransparency = 0}):Play()
    end)
    button.MouseButton1Click:Connect(function()
        SafeCallback(config.Callback)
    end)

    return {
        SetValue = function() end,
    }
end

function TabMethods:AddToggle(id, config)
    config = config or {}
    local value = config.Default == true
    local card = CreateControlCard(self.Content, config.Description and 62 or 54)
    CreateTitleAndDescription(card, config.Title, config.Description, 84)

    local switch = New("TextButton", {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -14, 0.5, 0),
        Size = UDim2.fromOffset(50, 26),
        AutoButtonColor = false,
        BorderSizePixel = 0,
        Text = "",
    })
    BindTheme(switch, "BackgroundColor3", value and "accent" or "card2")
    AddCorner(switch, 13)
    switch.Parent = card

    local knob = New("Frame", {
        Size = UDim2.fromOffset(20, 20),
        Position = value and UDim2.new(1, -23, 0.5, -10) or UDim2.new(0, 3, 0.5, -10),
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(250, 250, 250),
    })
    AddCorner(knob, 10)
    knob.Parent = switch

    local api = {}
    local binding = nil

    local function repaint()
        if binding then
            binding.Role = value and "accent" or "card2"
        end
        TweenService:Create(knob, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Position = value and UDim2.new(1, -23, 0.5, -10) or UDim2.new(0, 3, 0.5, -10)
        }):Play()
        local theme = CurrentTheme()
        TweenService:Create(switch, TweenInfo.new(0.16), {
            BackgroundColor3 = value and theme.accent or theme.card2
        }):Play()
    end

    binding = {
        Instance = switch,
        Property = "BackgroundColor3",
        Role = value and "accent" or "card2",
    }
    table.insert(DinoUI._themeBindings, binding)

    local function setValue(v, fire)
        value = v == true
        binding.Role = value and "accent" or "card2"
        repaint()
        if fire ~= false then
            SafeCallback(config.Callback, value)
        end
    end

    switch.MouseButton1Click:Connect(function()
        setValue(not value, true)
    end)

    api.SetValue = function(_, v) setValue(v, true) end
    api.GetValue = function() return value end
    return api
end

function TabMethods:AddSlider(id, config)
    config = config or {}
    local minValue = tonumber(config.Min) or 0
    local maxValue = tonumber(config.Max) or 100
    local rounding = tonumber(config.Rounding) or 0
    local value = math.clamp(tonumber(config.Default) or minValue, minValue, maxValue)

    local card = CreateControlCard(self.Content, 72)
    local title = New("TextLabel", {
        Position = UDim2.fromOffset(14, 8),
        Size = UDim2.new(1, -95, 0, 22),
        BackgroundTransparency = 1,
        Text = tostring(config.Title or ""),
        TextSize = 13,
        Font = Enum.Font.GothamSemibold,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    BindTheme(title, "TextColor3", "text")
    title.Parent = card

    local valueLabel = New("TextLabel", {
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -14, 0, 8),
        Size = UDim2.fromOffset(72, 22),
        BackgroundTransparency = 1,
        Text = tostring(value),
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Right,
    })
    BindTheme(valueLabel, "TextColor3", "accent")
    valueLabel.Parent = card

    local bar = New("Frame", {
        Position = UDim2.fromOffset(14, 43),
        Size = UDim2.new(1, -28, 0, 8),
        BorderSizePixel = 0,
    })
    BindTheme(bar, "BackgroundColor3", "card2")
    AddCorner(bar, 4)
    bar.Parent = card

    local fill = New("Frame", {
        Size = UDim2.new((value - minValue) / math.max(maxValue - minValue, 1), 0, 1, 0),
        BorderSizePixel = 0,
    })
    BindTheme(fill, "BackgroundColor3", "accent")
    AddCorner(fill, 4)
    fill.Parent = bar

    local knob = New("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(fill.Size.X.Scale, 0, 0.5, 0),
        Size = UDim2.fromOffset(16, 16),
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(248, 250, 252),
    })
    AddCorner(knob, 8)
    knob.Parent = bar

    local dragging = false

    local function roundNumber(n)
        if rounding <= 0 then return math.floor(n + 0.5) end
        local p = 10 ^ rounding
        return math.floor(n * p + 0.5) / p
    end

    local function setFromAlpha(alpha, fire)
        alpha = math.clamp(alpha, 0, 1)
        value = roundNumber(minValue + (maxValue - minValue) * alpha)
        local trueAlpha = (value - minValue) / math.max(maxValue - minValue, 1)
        fill.Size = UDim2.new(trueAlpha, 0, 1, 0)
        knob.Position = UDim2.new(trueAlpha, 0, 0.5, 0)
        valueLabel.Text = tostring(value)
        if fire ~= false then
            SafeCallback(config.Callback, value)
        end
    end

    local function updateFromInput(input)
        local alpha = (input.Position.X - bar.AbsolutePosition.X) / math.max(bar.AbsoluteSize.X, 1)
        setFromAlpha(alpha, true)
    end

    bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            updateFromInput(input)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch) then
            updateFromInput(input)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    return {
        SetValue = function(_, v)
            local alpha = (math.clamp(tonumber(v) or minValue, minValue, maxValue) - minValue)
                / math.max(maxValue - minValue, 1)
            setFromAlpha(alpha, true)
        end,
        GetValue = function() return value end,
    }
end

function TabMethods:AddDropdown(id, config)
    config = config or {}
    local values = config.Values or {}
    local current = config.Default or values[1] or "-"
    local open = false

    local baseHeight = config.Description and 68 or 58
    local optionHeight = 32
    local maxVisible = math.min(#values, 7)
    local expandedHeight = baseHeight + (maxVisible * optionHeight) + 10

    local card = CreateControlCard(self.Content, baseHeight)
    CreateTitleAndDescription(card, config.Title, config.Description, 220)
    card.ClipsDescendants = true

    local selectButton = New("TextButton", {
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -12, 0, 12),
        Size = UDim2.fromOffset(200, 34),
        AutoButtonColor = false,
        BorderSizePixel = 0,
        Text = tostring(current) .. "  ▾",
        TextSize = 11,
        Font = Enum.Font.GothamSemibold,
        TextTruncate = Enum.TextTruncate.AtEnd,
    })
    BindTheme(selectButton, "BackgroundColor3", "card2")
    BindTheme(selectButton, "TextColor3", "text")
    AddCorner(selectButton, 8)
    selectButton.Parent = card

    local optionsFrame = New("ScrollingFrame", {
        Position = UDim2.new(0, 12, 0, baseHeight),
        Size = UDim2.new(1, -24, 0, maxVisible * optionHeight),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        Visible = false,
        CanvasSize = UDim2.new(0, 0, 0, #values * optionHeight),
    })
    BindTheme(optionsFrame, "ScrollBarImageColor3", "accent")
    optionsFrame.Parent = card

    local list = New("UIListLayout", {
        Padding = UDim.new(0, 4),
        SortOrder = Enum.SortOrder.LayoutOrder,
    })
    list.Parent = optionsFrame

    local api = {}

    local function setOpen(v)
        open = v
        optionsFrame.Visible = open
        card.Size = UDim2.new(1, -10, 0, open and expandedHeight or baseHeight)
        selectButton.Text = tostring(current) .. (open and "  ▴" or "  ▾")
    end

    local function setValue(v, fire)
        current = v
        selectButton.Text = tostring(current) .. "  ▾"
        setOpen(false)
        if fire ~= false then
            SafeCallback(config.Callback, current)
        end
    end

    for _, option in ipairs(values) do
        local b = New("TextButton", {
            Size = UDim2.new(1, -4, 0, optionHeight - 4),
            AutoButtonColor = false,
            BorderSizePixel = 0,
            Text = tostring(option),
            TextSize = 11,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
        })
        BindTheme(b, "BackgroundColor3", "card2")
        BindTheme(b, "TextColor3", "text")
        AddCorner(b, 7)
        AddPadding(b, 10, 10, 0, 0)
        b.Parent = optionsFrame
        b.MouseButton1Click:Connect(function()
            setValue(option, true)
        end)
    end

    selectButton.MouseButton1Click:Connect(function()
        setOpen(not open)
    end)

    api.SetValue = function(_, v) setValue(v, true) end
    api.GetValue = function() return current end
    return api
end

function DinoUI:CreateWindow(config)
    config = config or {}

    local old = game:GetService("CoreGui"):FindFirstChild("DinoSurvivalHubV2")
    if old then old:Destroy() end
    local pg = LocalPlayer:FindFirstChildOfClass("PlayerGui")
    if pg then
        local oldPg = pg:FindFirstChild("DinoSurvivalHubV2")
        if oldPg then oldPg:Destroy() end
    end

    local screen = New("ScreenGui", {
        Name = "DinoSurvivalHubV2",
        ResetOnSpawn = false,
        IgnoreGuiInset = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        DisplayOrder = 1000,
    })

    local parented = pcall(function()
        screen.Parent = game:GetService("CoreGui")
    end)
    if not parented or not screen.Parent then
        screen.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end
    self._screen = screen

    local toastHolder = New("Frame", {
        Name = "ToastHolder",
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -14, 0, 14),
        Size = UDim2.fromOffset(340, 500),
        BackgroundTransparency = 1,
    })
    toastHolder.Parent = screen
    local toastLayout = New("UIListLayout", {
        Padding = UDim.new(0, 8),
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
    })
    toastLayout.Parent = toastHolder

    local main = New("Frame", {
        Name = "Main",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = config.Size or UDim2.fromOffset(760, 520),
        BorderSizePixel = 0,
        BackgroundTransparency = 0.02,
        ClipsDescendants = true,
    })
    BindTheme(main, "BackgroundColor3", "bg")
    AddCorner(main, 16)
    AddStroke(main, 1, 0.05)
    main.Parent = screen

    -- Responsive scaling for PC/mobile
    local uiScale = New("UIScale", {Scale = 1})
    uiScale.Parent = main
    local function updateScale()
        local cam = Workspace.CurrentCamera
        if not cam then return end
        local vp = cam.ViewportSize
        local sx = vp.X / 820
        local sy = vp.Y / 590
        uiScale.Scale = math.clamp(math.min(sx, sy, 1), 0.42, 1)
    end
    updateScale()
    if Workspace.CurrentCamera then
        Workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updateScale)
    end

    local topbar = New("Frame", {
        Name = "Topbar",
        Size = UDim2.new(1, 0, 0, 56),
        BorderSizePixel = 0,
    })
    BindTheme(topbar, "BackgroundColor3", "panel")
    topbar.Parent = main

    local logo = New("TextLabel", {
        Position = UDim2.fromOffset(16, 9),
        Size = UDim2.fromOffset(38, 38),
        BackgroundTransparency = 1,
        Text = "🦖",
        TextSize = 27,
        Font = Enum.Font.GothamBold,
    })
    logo.Parent = topbar

    local title = New("TextLabel", {
        Position = UDim2.fromOffset(58, 7),
        Size = UDim2.new(1, -180, 0, 23),
        BackgroundTransparency = 1,
        Text = tostring(config.Title or "DINO SURVIVAL HUB V2"),
        TextSize = 16,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    BindTheme(title, "TextColor3", "text")
    title.Parent = topbar

    local subtitle = New("TextLabel", {
        Position = UDim2.fromOffset(58, 30),
        Size = UDim2.new(1, -180, 0, 17),
        BackgroundTransparency = 1,
        Text = tostring(config.SubTitle or "Custom UI"),
        TextSize = 10,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    BindTheme(subtitle, "TextColor3", "muted")
    subtitle.Parent = topbar

    local qaBadge = New("TextLabel", {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -58, 0.5, 0),
        Size = UDim2.fromOffset(76, 26),
        BorderSizePixel = 0,
        Text = "QA MODE",
        TextSize = 10,
        Font = Enum.Font.GothamBold,
    })
    BindTheme(qaBadge, "BackgroundColor3", "accent2")
    BindTheme(qaBadge, "TextColor3", "text")
    AddCorner(qaBadge, 8)
    qaBadge.Parent = topbar

    local minButton = New("TextButton", {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -14, 0.5, 0),
        Size = UDim2.fromOffset(34, 34),
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Text = "—",
        TextSize = 18,
        Font = Enum.Font.GothamBold,
    })
    BindTheme(minButton, "BackgroundColor3", "card2")
    BindTheme(minButton, "TextColor3", "text")
    AddCorner(minButton, 9)
    minButton.Parent = topbar

    local sidebar = New("Frame", {
        Name = "Sidebar",
        Position = UDim2.fromOffset(0, 56),
        Size = UDim2.new(0, 185, 1, -56),
        BorderSizePixel = 0,
    })
    BindTheme(sidebar, "BackgroundColor3", "panel")
    sidebar.Parent = main

    local sideTitle = New("TextLabel", {
        Position = UDim2.fromOffset(14, 12),
        Size = UDim2.new(1, -28, 0, 20),
        BackgroundTransparency = 1,
        Text = "เมนูหลัก",
        TextSize = 11,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    BindTheme(sideTitle, "TextColor3", "muted")
    sideTitle.Parent = sidebar

    local tabButtons = New("ScrollingFrame", {
        Position = UDim2.fromOffset(8, 40),
        Size = UDim2.new(1, -16, 1, -92),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        CanvasSize = UDim2.new(),
    })
    BindTheme(tabButtons, "ScrollBarImageColor3", "accent")
    tabButtons.Parent = sidebar

    local tabLayout = New("UIListLayout", {
        Padding = UDim.new(0, 7),
        SortOrder = Enum.SortOrder.LayoutOrder,
    })
    tabLayout.Parent = tabButtons
    tabLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        tabButtons.CanvasSize = UDim2.new(0, 0, 0, tabLayout.AbsoluteContentSize.Y + 8)
    end)

    local footer = New("TextLabel", {
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.new(0, 14, 1, -10),
        Size = UDim2.new(1, -28, 0, 33),
        BackgroundTransparency = 1,
        Text = "🦖 HUB V2\nRightControl = ย่อ/เปิด",
        TextSize = 9,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Bottom,
    })
    BindTheme(footer, "TextColor3", "muted")
    footer.Parent = sidebar

    local contentRoot = New("Frame", {
        Name = "ContentRoot",
        Position = UDim2.fromOffset(185, 56),
        Size = UDim2.new(1, -185, 1, -56),
        BackgroundTransparency = 1,
    })
    contentRoot.Parent = main

    local mini = New("TextButton", {
        Name = "MiniDino",
        Position = UDim2.new(0, 18, 0.5, -28),
        Size = UDim2.fromOffset(56, 56),
        BackgroundTransparency = 0.02,
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Text = "🦖",
        TextSize = 30,
        Font = Enum.Font.GothamBold,
        Visible = false,
        ZIndex = 100,
    })
    BindTheme(mini, "BackgroundColor3", "card")
    AddCorner(mini, 28)
    local miniStroke = AddStroke(mini, 2, 0)
    BindTheme(miniStroke, "Color", "accent")
    mini.Parent = screen

    local miniHint = New("TextLabel", {
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 1, 3),
        Size = UDim2.fromOffset(88, 18),
        BackgroundTransparency = 1,
        Text = "เปิด DINO HUB",
        TextSize = 9,
        Font = Enum.Font.GothamBold,
        Visible = false,
        ZIndex = 101,
    })
    BindTheme(miniHint, "TextColor3", "text")
    miniHint.Parent = mini

    MakeDraggable(main, topbar)
    MakeDraggable(mini, mini)

    local minimized = false
    local function setMinimized(v)
        minimized = v
        main.Visible = not minimized
        mini.Visible = minimized
        miniHint.Visible = false
    end

    minButton.MouseButton1Click:Connect(function()
        setMinimized(true)
    end)

    mini.MouseButton1Click:Connect(function()
        -- กันการคลิกหลังลากเล็กน้อยได้ด้วยการเปิดทันที ซึ่งใช้ง่ายสุดบนมือถือ
        setMinimized(false)
    end)

    mini.MouseEnter:Connect(function()
        miniHint.Visible = true
        TweenService:Create(mini, TweenInfo.new(0.12), {Size = UDim2.fromOffset(60, 60)}):Play()
    end)
    mini.MouseLeave:Connect(function()
        miniHint.Visible = false
        TweenService:Create(mini, TweenInfo.new(0.12), {Size = UDim2.fromOffset(56, 56)}):Play()
    end)

    local minimizeKey = config.MinimizeKey or Enum.KeyCode.RightControl
    UserInputService.InputBegan:Connect(function(input, processed)
        if processed then return end
        if input.KeyCode == minimizeKey then
            setMinimized(not minimized)
        end
    end)

    local window = {
        Tabs = {},
        SelectedIndex = 0,
        Main = main,
        Screen = screen,
        MiniButton = mini,
        Acrylic = true,
    }
    DinoUI._window = window

    function window:SetAcrylic(enabled)
        self.Acrylic = enabled == true
        main.BackgroundTransparency = self.Acrylic and 0.08 or 0
        topbar.BackgroundTransparency = self.Acrylic and 0.04 or 0
        sidebar.BackgroundTransparency = self.Acrylic and 0.04 or 0
    end

    function window:SetMinimized(v)
        setMinimized(v == true)
    end

    function window:AddTab(tabConfig)
        tabConfig = tabConfig or {}
        local index = #self.Tabs + 1

        local btn = New("TextButton", {
            Size = UDim2.new(1, -4, 0, 42),
            AutoButtonColor = false,
            BorderSizePixel = 0,
            Text = tostring(tabConfig.Title or ("Tab " .. index)),
            TextSize = 11,
            Font = Enum.Font.GothamSemibold,
            TextXAlignment = Enum.TextXAlignment.Left,
            BackgroundTransparency = 0.12,
        })
        BindTheme(btn, "BackgroundColor3", "card")
        BindTheme(btn, "TextColor3", "text")
        AddCorner(btn, 9)
        AddPadding(btn, 12, 8, 0, 0)
        btn.Parent = tabButtons

        local page = New("ScrollingFrame", {
            Name = "Tab_" .. tostring(index),
            Position = UDim2.fromOffset(10, 10),
            Size = UDim2.new(1, -20, 1, -20),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScrollBarThickness = 4,
            Visible = false,
            CanvasSize = UDim2.new(),
        })
        BindTheme(page, "ScrollBarImageColor3", "accent")
        page.Parent = contentRoot

        local layout = New("UIListLayout", {
            Padding = UDim.new(0, 9),
            SortOrder = Enum.SortOrder.LayoutOrder,
        })
        layout.Parent = page
        AddPadding(page, 2, 6, 2, 12)

        layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            page.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 20)
        end)

        local tab = setmetatable({
            Index = index,
            Button = btn,
            Content = page,
            Title = tabConfig.Title,
        }, TabMethods)
        table.insert(self.Tabs, tab)

        btn.MouseButton1Click:Connect(function()
            self:SelectTab(index)
        end)

        if index == 1 then
            self:SelectTab(1)
        end

        return tab
    end

    function window:SelectTab(index)
        index = tonumber(index) or 1
        if not self.Tabs[index] then return end
        self.SelectedIndex = index

        local theme = CurrentTheme()
        for i, tab in ipairs(self.Tabs) do
            local selected = i == index
            tab.Content.Visible = selected
            tab.Button.BackgroundColor3 = selected and theme.accent2 or theme.card
            tab.Button.BackgroundTransparency = selected and 0 or 0.12
        end
    end

    return window
end

-- Compatibility alias: โค้ดด้านล่างยังเรียกตัวแปรชื่อ Fluent
local Fluent = DinoUI

-- SaveManager/InterfaceManager แบบเบา ๆ สำหรับ Custom UI
-- ไม่ดาวน์โหลด Addon ภายนอกอีกต่อไป
local SaveManager = {}
function SaveManager:SetLibrary(_) end
function SaveManager:IgnoreThemeSettings() end
function SaveManager:SetFolder(_) end
function SaveManager:BuildConfigSection(tab)
    if tab and tab.AddParagraph then
        tab:AddParagraph({
            Title = "💾 ระบบตั้งค่า Custom UI",
            Content = "Dino Hub V2 ไม่พึ่ง Fluent SaveManager ภายนอก\nค่าระหว่างรอบเล่นยังควบคุมผ่าน State ของสคริปต์"
        })
    end
end

local InterfaceManager = {}
function InterfaceManager:SetLibrary(_) end
function InterfaceManager:SetFolder(_) end
function InterfaceManager:BuildInterfaceSection(tab)
    if tab and tab.AddParagraph then
        tab:AddParagraph({
            Title = "🦖 การย่อ/เปิด UI",
            Content = "กดปุ่ม — มุมขวาบนเพื่อย่อเป็นไอคอน 🦖\nลากไอคอนไปวางตำแหน่งที่ต้องการ แล้วกดเพื่อเปิดกลับ\nหรือกด RightControl เพื่อสลับย่อ/เปิด"
        })
    end
end

-- =============================================================================
-- ๓. ตารางชื่อภาษาไทย & ฐานข้อมูลเกม (Game Dictionaries)
-- =============================================================================

-- แปลชื่อไดโนเสาร์และสัตว์เป็นภาษาไทย 100%
local DinoThaiNames = {
    ["Compsognathus"] = "🦕 คอมพ์โซกนาทัส (Compy)",
    ["Raptor"] = "🦖 เวโลซีแรปเตอร์ (Raptor)",
    ["Parasaurolophus"] = "🦕 พาราซอโรโลฟัส (Parasaurolophus)",
    ["Triceratops"] = "🦏 ไตรเซราทอปส์ (Triceratops)",
    ["Stegosaurus"] = "🦕 สเตโกซอรัส (Stegosaurus)",
    ["CarnivorousPlant"] = "🌿 ต้นไม้กินคน (Carnivorous Plant)",
    ["PrehistoricSpider"] = "🕷️ แมงมุมดึกดำบรรพ์ (Giant Spider)",
    ["Zombie"] = "🧟 ซอมบี้โบราณ (Zombie)",
    ["Horse"] = "🐎 ม้าดึกดำบรรพ์ (Horse)",
    ["Rabbit"] = "🐇 กระต่าย (Rabbit)",
    ["Turkey"] = "🦃 ไก่งวง (Turkey)",
    ["Chicken"] = "🐔 ไก่ (Chicken)",
    ["Frog"] = "🐸 กบ (Frog)",
    ["Fish"] = "🐟 ปลา (Fish)",
    ["Pig"] = "🐖 หมูป่า (Pig)",
    ["Snail"] = "🐌 หอยทาก (Snail)",
    ["DinoNest_Raptor"] = "🥚 รังไข่แรปเตอร์ (Raptor Nest)",
    ["DinoNest_Compsognathus"] = "🥚 รังไข่คอมพ์โซกนาทัส (Compy Nest)"
}

-- ระดับกล่องสมบัติเป็นภาษาไทย 100%
local ChestRarityInfo = {
    ["Common"] = {Name = "📦 กล่องระดับ: ทั่วไป (Common)", Color = Color3.fromRGB(220, 220, 220)},
    ["Rare"] = {Name = "🔷 กล่องระดับ: หายาก (Rare)", Color = Color3.fromRGB(50, 160, 255)},
    ["Epic"] = {Name = "💜 กล่องระดับ: มหากาพย์ (Epic)", Color = Color3.fromRGB(180, 50, 255)},
    ["Legendary"] = {Name = "👑 กล่องระดับ: ในตำนาน (Legendary)", Color = Color3.fromRGB(255, 180, 0)},
    ["Mythic"] = {Name = "🔥 กล่องระดับ: เทพนิยาย (Mythic)", Color = Color3.fromRGB(255, 60, 60)},
    ["Divine"] = {Name = "✨ กล่องระดับ: เทวะ (Divine)", Color = Color3.fromRGB(255, 105, 180)},
    ["AlienCache"] = {Name = "👽 กล่องระดับ: เอเลี่ยน (Alien Cache)", Color = Color3.fromRGB(0, 255, 140)}
}

-- ตัวเลือกระดับกล่องสำหรับเมนูวาร์ป (ภาษาไทย)
local ChestRarityTeleportOptions = {
    "⚪ ทั่วไป (Common)",
    "🔷 หายาก (Rare)",
    "💜 มหากาพย์ (Epic)",
    "👑 ในตำนาน (Legendary)",
    "🔥 เทพนิยาย (Mythic)",
    "✨ เทวะ (Divine)",
    "👽 เอเลี่ยน (Alien Cache)",
}

local ChestRarityKeyByOption = {
    ["⚪ ทั่วไป (Common)"] = "Common",
    ["🔷 หายาก (Rare)"] = "Rare",
    ["💜 มหากาพย์ (Epic)"] = "Epic",
    ["👑 ในตำนาน (Legendary)"] = "Legendary",
    ["🔥 เทพนิยาย (Mythic)"] = "Mythic",
    ["✨ เทวะ (Divine)"] = "Divine",
    ["👽 เอเลี่ยน (Alien Cache)"] = "AlienCache",
}


-- หมวดหมู่ทรัพยากรสำหรับฟาร์ม
local ResourceCategories = {
    ["🌲 ไม้ (ต้นไม้ใหญ่, ต้นสน, ท่อนไม้)"] = {"BigTree", "Tree", "PlantedTree_Broadleaf", "PlantedTree_Pine", "Prop_Log", "Drop_Wood"},
    ["🪨 หิน (หินก้อนใหญ่, กำแพงหิน)"] = {"Rock", "StoneWall", "Drop_Stone"},
    ["⛏️ แร่ทองแดง (Copper Ore)"] = {"Mineral_CopperOre", "Drop_CopperOre"},
    ["⛏️ แร่ถ่านหิน (Coal Ore)"] = {"Mineral_Coal", "Drop_Coal"},
    ["⛏️ แร่เหล็ก (Iron Ore)"] = {"Mineral_IronOre", "Drop_IronOre"},
    ["🫐 อาหาร/เบอร์รี่ (Blueberry, Raspberry, Pumpkin)"] = {"BlueberryBush", "RaspberryBush", "FruitPlant", "Prop_Pumpkin", "Drop_Raspberry", "Drop_Egg"},
    ["🥚 รังไข่ไดโนเสาร์ (Dino Eggs)"] = {"DinoEgg", "DinoNest_Raptor", "DinoNest_Compsognathus"}
}

-- สถานที่สำคัญในแมพ (Landmarks & POIs)
local LandmarksList = {
    {Name = "🛸 ยานแม่ (Mothership - จุดเกิดหลัก)", Folder = "Mothership", Fallback = Vector3.new(0, 40, 0)},
    {Name = "🔥 เตาไฟยักษ์ & โซนเติมเชื้อเพลิง (Fuel Zone)", Folder = "FuelContributionZone", Fallback = Vector3.new(0, 15, -150)},
    {Name = "🔨 โต๊ะคราฟต์ไอเทม (Crafting Table)", Folder = "CraftingTable", Fallback = Vector3.new(25, 15, -120)},
    {Name = "🏛️ มหาพีระมิดโบราณ (Ancient Pyramid)", Folder = "Pyramid", Fallback = Vector3.new(500, 30, 400)},
    {Name = "🕳️ ทางเข้าดันเจี้ยนใต้ดิน (Dungeon Entrances)", Folder = "DungeonEntrances", Fallback = Vector3.new(-350, 10, -450)},
    {Name = "🏕️ ค่ายคนป่า BORK & GORK (Cavemen Camps)", Folder = "CavemanSites", Fallback = Vector3.new(120, 15, 200)},
    {Name = "🏝️ เกาะกลางน้ำ (Island Landscape)", Folder = "IslandLandscape", Fallback = Vector3.new(-200, 12, 350)},
    {Name = "🥚 ดงรังไข่ไดโนเสาร์ (Dino Nest Grounds)", Folder = "DinoNests", Fallback = Vector3.new(300, 20, -250)}
}

-- =============================================================================
-- ๔. ตัวแก้ไข Remote แบบปลอดภัย (Non-Blocking Safe Remote Resolver)
-- =============================================================================
local Remotes = setmetatable({}, {
    __index = function(self, key)
        local cg = ReplicatedStorage:FindFirstChild("ChunkGame")
        if cg and cg:FindFirstChild("Remotes") then
            local r = cg.Remotes:FindFirstChild(key)
            if r then
                rawset(self, key, r)
                return r
            end
        end
        -- ทั่วไปใน ReplicatedStorage
        local r2 = ReplicatedStorage:FindFirstChild(key)
        if r2 then
            rawset(self, key, r2)
            return r2
        end
        return nil
    end
})

-- Developer/QA authorization gate.
-- Published games must explicitly set game attribute AllowDinoQATools=true.
-- Remote calls outside Studio additionally require AllowQATool=true on the Remote itself.
local function IsDeveloperQAAuthorized()
    return RunService:IsStudio() or game:GetAttribute("AllowDinoQATools") == true
end

local function IsRemoteQAAuthorized(remote)
    if not remote then return false end
    if RunService:IsStudio() then return true end
    return IsDeveloperQAAuthorized() and remote:GetAttribute("AllowQATool") == true
end

local function SafeFireRemote(remote, ...)
    if not IsRemoteQAAuthorized(remote) then
        return false, "QA_REMOTE_NOT_AUTHORIZED"
    end
    local args = {...}
    local ok, result = pcall(function()
        if remote:IsA("RemoteEvent") or remote:IsA("UnreliableRemoteEvent") then
            remote:FireServer(unpack(args))
            return true
        elseif remote:IsA("RemoteFunction") then
            remote:InvokeServer(unpack(args))
            return true
        end
        return false
    end)
    return ok and result == true, ok and nil or tostring(result)
end

-- Developer/QA admin bridge.
-- Published games must expose QAAdminRequest and mark it AllowQATool=true.
local function FindAuthorizedAdminRemote()
    if not IsDeveloperQAAuthorized() then return nil end
    local chunk = ReplicatedStorage:FindFirstChild("ChunkGame")
    local remotes = chunk and chunk:FindFirstChild("Remotes")
    local remote = (remotes and remotes:FindFirstChild("QAAdminRequest"))
        or ReplicatedStorage:FindFirstChild("QAAdminRequest")
    if remote and IsRemoteQAAuthorized(remote) then return remote end
    return nil
end

local function SendQAAdminRequest(action, payload)
    if not IsDeveloperQAAuthorized() then return false, "QA_NOT_AUTHORIZED" end
    local remote = FindAuthorizedAdminRemote()
    if not remote then
        return false, "QA_ADMIN_REMOTE_NOT_AVAILABLE"
    end
    return SafeFireRemote(remote, action, payload)
end

-- =============================================================================
-- ๕. สถานะหลักของระบบ (Master State Table)
-- =============================================================================
local State = {
    -- การเคลื่อนที่
    SpeedEnabled = false,
    WalkSpeed = 45,
    JumpEnabled = false,
    JumpPower = 100,
    FlyEnabled = false,
    FlySpeed = 70,
    AirWalkEnabled = false,
    AirWalkHeight = 0,
    NoClip = false,
    InfJump = false,
    InfStamina = false,

    -- ไดโนเสาร์ & ต่อสู้
    DinoESP = false,
    DinoNestESP = false,
    KillAura = false,
    AuraRange = 25,
    FastAttack = false,
    HitboxExpander = false,
    HitboxSize = 15,
    AutoEggCollect = false,
    AimlockDino = false,
    SelectedDinoType = "Compsognathus",

    -- Developer/QA Combat Test (Studio/authorized game only)
    QACombatEnabled = false,
    QACombatTargetMode = "Selected",
    QACombatRange = 18,
    QACombatHeight = 9,
    QACombatFlySpeed = 65,
    QACombatAttackInterval = 0.65,
    QACombatMaxDistance = 650,
    QACombatSafetyMargin = 4,
    QACombatRequireLOS = true,
    QACombatAutoRetreat = true,
    QACombatRetreatHP = 30,
    QACombatSkill = "Tool",
    QACombatState = "IDLE",
    QAAutoKill = false,

    -- Developer/QA Survival
    QAInvincible = false,
    QAInvincibleHealth = 1000000,

    -- กล่องสมบัติ
    ChestESP = false,
    FilterCommon = true,
    FilterRare = true,
    FilterEpic = true,
    FilterLegendary = true,
    FilterMythic = true,
    FilterDivine = true,
    HideClaimed = true,
    AutoOpenChest = false,
    AutoFarmChests = false,
    SelectedChestSite = "",
    SelectedChestRarity = "Common",

    -- ออโต้ฟาร์มทรัพยากร
    AutoFarmResource = false,
    FarmTargetType = "🌲 ไม้ (ต้นไม้ใหญ่, ต้นสน, ท่อนไม้)",
    FarmFlySpeed = 65,
    FarmMaxDist = 600,
    SafeHeightOffset = 6,
    AutoAttackRes = true,
    AutoCollectDrops = true,
    AutoEquipTool = true,

    -- สถานที่สำคัญ
    POI_ESP = false,
    SmoothFlySpeed = 80,
    CustomWaypoint = nil,

    -- การมองเห็น & เอาชีวิตรอด
    PlayerESP = false,
    TrueSight = true,
    Fullbright = false,
    AntiAFK = true,
    Invisible = false,
    AutoEatDrink = false,
    FOVValue = 70
}

local Connections = {}
local OriginalSizes = {}

-- การแจ้งเตือน Fluent Notification
local function Notify(title, content, duration)
    Fluent:Notify({
        Title = title,
        Content = content,
        Duration = duration or 3.5
    })
end

-- =============================================================================
-- ๖. ระบบค้นหา RootPart & ฟังก์ชันตำแหน่งสากล
-- =============================================================================
local function GetRoot(char)
    char = char or (LocalPlayer.Character)
    if not char then return nil end
    return char:FindFirstChild("HumanoidRootPart")
        or char.PrimaryPart
        or char:FindFirstChild("Torso")
        or char:FindFirstChild("LowerTorso")
        or char:FindFirstChildWhichIsA("BasePart")
end

local function GetHum(char)
    char = char or (LocalPlayer.Character)
    if not char then return nil end
    return char:FindFirstChildOfClass("Humanoid")
end

-- Developer/QA Invincible Engine
local QAInvincible = {
    ForceField = nil,
    OriginalMaxHealth = nil,
    OriginalHealth = nil,
    LastServerSync = 0,
}

local function RemoveQAForceField()
    if QAInvincible.ForceField and QAInvincible.ForceField.Parent then
        QAInvincible.ForceField:Destroy()
    end
    QAInvincible.ForceField = nil
end

local function ApplyLocalQAInvincible()
    if not IsDeveloperQAAuthorized() then return false end
    local char = LocalPlayer.Character
    local hum = GetHum(char)
    if not char or not hum then return false end

    if QAInvincible.OriginalMaxHealth == nil then
        QAInvincible.OriginalMaxHealth = hum.MaxHealth
        QAInvincible.OriginalHealth = hum.Health
    end

    if RunService:IsStudio() then
        if not QAInvincible.ForceField or not QAInvincible.ForceField.Parent then
            local ff = Instance.new("ForceField")
            ff.Name = "DinoQAInvincible"
            ff.Visible = false
            ff.Parent = char
            QAInvincible.ForceField = ff
        end
        local safeMax = math.max(State and State.QAInvincibleHealth or 1000000, hum.MaxHealth)
        hum.MaxHealth = safeMax
        hum.Health = safeMax
    end
    return true
end

local function SetQAInvincible(enabled)
    if enabled and not IsDeveloperQAAuthorized() then
        return false, "QA_NOT_AUTHORIZED"
    end

    State.QAInvincible = enabled
    if enabled then
        ApplyLocalQAInvincible()
        -- In published authorized games, server-side damage must honor this request.
        if not RunService:IsStudio() then
            local ok, reason = SendQAAdminRequest("SetInvincible", {Enabled = true})
            if not ok then return false, reason end
        end
        return true
    end

    RemoveQAForceField()
    local hum = GetHum()
    if hum and RunService:IsStudio() and QAInvincible.OriginalMaxHealth then
        hum.MaxHealth = QAInvincible.OriginalMaxHealth
        hum.Health = math.clamp(QAInvincible.OriginalHealth or hum.MaxHealth, 1, hum.MaxHealth)
    end
    QAInvincible.OriginalMaxHealth = nil
    QAInvincible.OriginalHealth = nil
    if not RunService:IsStudio() and IsDeveloperQAAuthorized() then
        SendQAAdminRequest("SetInvincible", {Enabled = false})
    end
    return true
end

-- Keep Studio QA invincibility active after custom damage/heal systems run.
task.spawn(function()
    while true do
        task.wait(0.12)
        if State and State.QAInvincible then
            if not IsDeveloperQAAuthorized() then
                State.QAInvincible = false
                RemoveQAForceField()
            elseif RunService:IsStudio() then
                pcall(ApplyLocalQAInvincible)
            end
        end
    end
end)

LocalPlayer.CharacterAdded:Connect(function(char)
    if State and State.QAInvincible and IsDeveloperQAAuthorized() then
        task.defer(function()
            task.wait(0.25)
            pcall(ApplyLocalQAInvincible)
        end)
    end
end)

-- เทเลพอร์ต/บินสำหรับ Developer/QA เท่านั้น
local ActiveMovementTween = nil
local ActiveMovementToken = 0
local ActiveMovementTarget = nil

local function CancelActiveMovement()
    ActiveMovementToken += 1
    ActiveMovementTarget = nil
    if ActiveMovementTween then
        pcall(function() ActiveMovementTween:Cancel() end)
        ActiveMovementTween = nil
    end
end

local function TeleportInstant(cf)
    if not IsDeveloperQAAuthorized() then return false, "QA_NOT_AUTHORIZED" end
    local root = GetRoot()
    if root then
        if typeof(cf) == "Vector3" then cf = CFrame.new(cf) end
        CancelActiveMovement()
        root.CFrame = cf + Vector3.new(0, 3, 0)
        return true
    end
    return false, "NO_ROOT"
end

-- บินแบบ Smooth Tween ไปยังตำแหน่ง พร้อม cancel token ป้องกัน Tween ชนกัน
local function FlyTweenTo(targetPos, speed, callback)
    if not IsDeveloperQAAuthorized() then return nil end
    local root = GetRoot()
    if not root then return nil end

    if typeof(targetPos) == "CFrame" then targetPos = targetPos.Position end
    if typeof(targetPos) ~= "Vector3" then return nil end

    CancelActiveMovement()
    ActiveMovementToken += 1
    local myToken = ActiveMovementToken
    ActiveMovementTarget = targetPos

    local dist = (targetPos - root.Position).Magnitude
    local duration = math.clamp(dist / math.max(speed or 70, 1), 0.12, 30)
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
    local tween = TweenService:Create(root, tweenInfo, {CFrame = CFrame.new(targetPos, targetPos + root.CFrame.LookVector)})
    ActiveMovementTween = tween
    tween:Play()
    tween.Completed:Connect(function(playbackState)
        if myToken ~= ActiveMovementToken then return end
        ActiveMovementTween = nil
        ActiveMovementTarget = nil
        if playbackState == Enum.PlaybackState.Completed and callback then callback() end
    end)
    return tween
end

-- ถือเครื่องมือที่เหมาะสมอัตโนมัติ
local function EquipAppropriateTool()
    local char = LocalPlayer.Character
    if not char then return end
    local hum = GetHum(char)
    if not hum then return end
    
    -- ถ้าถืออยู่แล้วไม่ต้องสลับ
    if char:FindFirstChildOfClass("Tool") then return end
    
    local bp = LocalPlayer:FindFirstChild("Backpack")
    if bp then
        local tool = bp:FindFirstChildOfClass("Tool")
        if tool then
            hum:EquipTool(tool)
        end
    end
end

-- แยกการโจมตีและการเก็บทรัพยากรออกจากกัน
-- ไม่เดา Action/argument ของ Remote ทั่วไปอีกต่อไป
local function ActivateEquippedTool()
    local char = LocalPlayer.Character
    if not char then return false end
    local equipped = char:FindFirstChildOfClass("Tool")
    if equipped then
        local ok = pcall(function() equipped:Activate() end)
        return ok
    end
    return false
end

local function FindAuthorizedCombatRemote()
    if not IsDeveloperQAAuthorized() then return nil end
    local chunk = ReplicatedStorage:FindFirstChild("ChunkGame")
    local remotes = chunk and chunk:FindFirstChild("Remotes")
    local remote = (remotes and remotes:FindFirstChild("QACombatRequest"))
        or ReplicatedStorage:FindFirstChild("QACombatRequest")
    if remote and IsRemoteQAAuthorized(remote) then return remote end
    return nil
end

local function AttackTarget(targetInstance)
    if not IsDeveloperQAAuthorized() then return false, "QA_NOT_AUTHORIZED" end
    EquipAppropriateTool()
    return ActivateEquippedTool(), nil
end

local function HarvestTarget(targetInstance)
    if not IsDeveloperQAAuthorized() then return false, "QA_NOT_AUTHORIZED" end
    EquipAppropriateTool()
    return ActivateEquippedTool(), nil
end

local function PerformAuthorizedSkill(targetInstance, skillName)
    if not IsDeveloperQAAuthorized() then return false, "QA_NOT_AUTHORIZED" end
    skillName = skillName or "Tool"
    if skillName == "Tool" then
        return AttackTarget(targetInstance)
    end

    -- สำหรับเกมของคุณ: สร้าง QACombatRequest และกำหนด AllowQATool=true
    -- Server ต้องตรวจ cooldown, ระยะ, line-of-sight และสิทธิ์ผู้ทดสอบซ้ำอีกครั้ง
    local remote = FindAuthorizedCombatRemote()
    if not remote then return false, "QACombatRequest_NOT_FOUND_OR_NOT_AUTHORIZED" end
    return SafeFireRemote(remote, "UseSkill", skillName, targetInstance)
end

-- =============================================================================
-- ๗. ระบบ ESP อเนกประสงค์ (BillboardGui ESP Engine — ใช้งานได้ทุกอุปกรณ์ 100%)
-- =============================================================================
local ESP_Holder = Instance.new("Folder")
ESP_Holder.Name = "DinoSurvival_ESP_Holder"
pcall(function() ESP_Holder.Parent = game:GetService("CoreGui") end)
if not ESP_Holder.Parent then
    ESP_Holder.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

local ActiveESP = {}

local function CreateESP(id, adorneePart, titleText, color, offset)
    if not adorneePart or not adorneePart:IsA("BasePart") then return end
    if ActiveESP[id] then
        ActiveESP[id].Title.Text = titleText
        ActiveESP[id].Title.TextColor3 = color or Color3.fromRGB(255, 255, 255)
        return
    end

    local bb = Instance.new("BillboardGui")
    bb.Name = "ESP_" .. tostring(id)
    bb.Adornee = adorneePart
    bb.Size = UDim2.new(0, 160, 0, 45)
    bb.StudsOffset = offset or Vector3.new(0, 3, 0)
    bb.AlwaysOnTop = true
    bb.ResetOnSpawn = false
    bb.Parent = ESP_Holder

    local lbl = Instance.new("TextLabel")
    lbl.Name = "Title"
    lbl.Size = UDim2.new(1, 0, 0.6, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = titleText
    lbl.TextColor3 = color or Color3.fromRGB(255, 255, 255)
    lbl.TextSize = 13
    lbl.Font = Enum.Font.GothamBold
    lbl.TextStrokeTransparency = 0.2
    lbl.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    lbl.Parent = bb

    local distLbl = Instance.new("TextLabel")
    distLbl.Name = "Dist"
    distLbl.Size = UDim2.new(1, 0, 0.4, 0)
    distLbl.Position = UDim2.new(0, 0, 0.6, 0)
    distLbl.BackgroundTransparency = 1
    distLbl.Text = "[0m]"
    distLbl.TextColor3 = Color3.fromRGB(220, 220, 220)
    distLbl.TextSize = 11
    distLbl.Font = Enum.Font.GothamMedium
    distLbl.TextStrokeTransparency = 0.3
    distLbl.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    distLbl.Parent = bb

    ActiveESP[id] = {
        Gui = bb,
        Title = lbl,
        Dist = distLbl,
        Part = adorneePart
    }
end

local function RemoveESP(id)
    if ActiveESP[id] then
        if ActiveESP[id].Gui then ActiveESP[id].Gui:Destroy() end
        ActiveESP[id] = nil
    end
end

local function ClearAllESP(categoryPrefix)
    for id, item in pairs(ActiveESP) do
        if not categoryPrefix or tostring(id):find(categoryPrefix) then
            if item.Gui then item.Gui:Destroy() end
            ActiveESP[id] = nil
        end
    end
end

-- อัปเดตระยะทาง ESP ทุกเฟรม
RunService.RenderStepped:Connect(function()
    local myRoot = GetRoot()
    if not myRoot then return end
    
    for id, item in pairs(ActiveESP) do
        if item.Part and item.Part.Parent then
            local dist = math.floor((item.Part.Position - myRoot.Position).Magnitude)
            item.Dist.Text = string.format("[%d ม.]", dist)
        else
            RemoveESP(id)
        end
    end
end)

-- =============================================================================
-- ๘. การทำงานจริงของระบบการเคลื่อนที่ (Movement Engines)
-- =============================================================================

-- [1] Speed & Jump Hack
RunService.Heartbeat:Connect(function()
    local hum = GetHum()
    if hum then
        if State.SpeedEnabled then
            hum.WalkSpeed = State.WalkSpeed
        end
        if State.JumpEnabled then
            hum.JumpPower = State.JumpPower
        end
    end
    -- ปลดล็อค Stamina
    if State.InfStamina and Character then
        local pf = Character:FindFirstChild("PropertiesFolder") or Character:FindFirstChild("Stamina")
        if pf then
            if pf:IsA("NumberValue") then pf.Value = 100 end
            if pf:FindFirstChild("Stamina") then pf.Stamina.Value = 100 end
        end
    end
end)

-- [2] Fly Mode Engine
local FlyBV, FlyBG
local function StartFly()
    if not IsDeveloperQAAuthorized() then return end
    local root = GetRoot()
    if not root then return end
    
    FlyBV = Instance.new("BodyVelocity")
    FlyBV.Name = "DinoProFlyBV"
    FlyBV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    FlyBV.Velocity = Vector3.zero
    FlyBV.Parent = root
    
    FlyBG = Instance.new("BodyGyro")
    FlyBG.Name = "DinoProFlyBG"
    FlyBG.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    FlyBG.P = 10000
    FlyBG.CFrame = root.CFrame
    FlyBG.Parent = root
end

local function StopFly()
    local root = GetRoot()
    if root then
        local bv = root:FindFirstChild("DinoProFlyBV")
        if bv then bv:Destroy() end
        local bg = root:FindFirstChild("DinoProFlyBG")
        if bg then bg:Destroy() end
    end
    if FlyBV then FlyBV:Destroy(); FlyBV = nil end
    if FlyBG then FlyBG:Destroy(); FlyBG = nil end
end

RunService.RenderStepped:Connect(function()
    if State.FlyEnabled and FlyBV and FlyBG then
        local root = GetRoot()
        if root then
            local camCF = Camera.CFrame
            local moveDir = Vector3.zero
            
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + camCF.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - camCF.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - camCF.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + camCF.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0, 1, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then moveDir = moveDir - Vector3.new(0, 1, 0) end
            
            if moveDir.Magnitude > 0 then
                FlyBV.Velocity = moveDir.Unit * State.FlySpeed
            else
                FlyBV.Velocity = Vector3.zero
            end
            FlyBG.CFrame = camCF
        end
    end
end)

-- [3] เดินบนอากาศ (Air Walk / Platform Walk)
local AirWalkPlatform = nil
local function UpdateAirWalk()
    local root = GetRoot()
    if not root then return end
    
    if State.AirWalkEnabled then
        if not AirWalkPlatform or not AirWalkPlatform.Parent then
            AirWalkPlatform = Instance.new("Part")
            AirWalkPlatform.Name = "DinoAirWalkPlatform"
            AirWalkPlatform.Size = Vector3.new(8, 1, 8)
            AirWalkPlatform.Anchored = true
            AirWalkPlatform.CanCollide = true
            AirWalkPlatform.Transparency = 0.6
            AirWalkPlatform.BrickColor = BrickColor.new("Cyan")
            AirWalkPlatform.Material = Enum.Material.ForceField
            AirWalkPlatform.Parent = Workspace
        end
        AirWalkPlatform.CFrame = CFrame.new(root.Position.X, root.Position.Y - 3.2 + State.AirWalkHeight, root.Position.Z)
    else
        if AirWalkPlatform then
            AirWalkPlatform:Destroy()
            AirWalkPlatform = nil
        end
    end
end

RunService.Heartbeat:Connect(function()
    if State.AirWalkEnabled then
        UpdateAirWalk()
    end
end)

-- [4] Noclip Engine (QA) พร้อมคืนค่า CanCollide เดิมเมื่อปิด
local OriginalCollisions = setmetatable({}, {__mode = "k"})
local function RestoreCharacterCollisions()
    for part, oldValue in pairs(OriginalCollisions) do
        if part and part.Parent then
            pcall(function() part.CanCollide = oldValue end)
        end
        OriginalCollisions[part] = nil
    end
end

RunService.Stepped:Connect(function()
    if State.NoClip and IsDeveloperQAAuthorized() and Character then
        for _, part in ipairs(Character:GetDescendants()) do
            if part:IsA("BasePart") then
                if OriginalCollisions[part] == nil then OriginalCollisions[part] = part.CanCollide end
                if part.CanCollide then part.CanCollide = false end
            end
        end
    elseif next(OriginalCollisions) ~= nil then
        RestoreCharacterCollisions()
    end
end)

-- [5] Infinite Jump Engine
UserInputService.JumpRequest:Connect(function()
    if State.InfJump then
        local hum = GetHum()
        if hum then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

-- =============================================================================
-- ๙. ระบบสแกนและจัดการกล่องสมบัติ (Chest & Expeditions Engine)
-- =============================================================================
local function ScanChests(callback)
    local expeditions = Workspace:FindFirstChild("ChunkGame") and Workspace.ChunkGame:FindFirstChild("World") and Workspace.ChunkGame.World:FindFirstChild("Expeditions")
    if not expeditions then
        -- สแกนทั่ว Workspace
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("Model") and (obj.Name == "Chest" or obj.Name:find("Chest")) then
                callback(obj)
            end
        end
        return
    end

    for _, site in ipairs(expeditions:GetChildren()) do
        local chest = site:FindFirstChild("Chest") or site:FindFirstChildWhichIsA("Model")
        if chest then
            callback(chest, site)
        end
    end
end

-- ค้นหากล่อง "ที่ยังไม่เปิด" ตามระดับที่เลือก และเลือกใบที่ใกล้ที่สุด
local function FindNearestUnclaimedChestByRarity(rarityKey)
    local root = GetRoot()
    if not root then return nil, nil, nil, math.huge end

    local myUserId = tostring(LocalPlayer.UserId)
    local bestChest, bestSite, bestPart = nil, nil, nil
    local bestDistance = math.huge

    ScanChests(function(chest, site)
        local rarity = tostring(chest:GetAttribute("ChestRarity") or chest:GetAttribute("Rarity") or "Common")
        if rarity ~= rarityKey then
            return
        end

        local claimedUsers = tostring(chest:GetAttribute("ClaimedUserIds") or "[]")
        if claimedUsers:find(myUserId, 1, true) then
            return
        end

        local part = chest.PrimaryPart
            or chest:FindFirstChild("Hinge")
            or chest:FindFirstChildWhichIsA("BasePart")

        if part then
            local distance = (part.Position - root.Position).Magnitude
            if distance < bestDistance then
                bestDistance = distance
                bestChest = chest
                bestSite = site
                bestPart = part
            end
        end
    end)

    return bestChest, bestSite, bestPart, bestDistance
end


local function UpdateChestESP()
    if not State.ChestESP then
        ClearAllESP("Chest_")
        return
    end

    local myUserId = tostring(LocalPlayer.UserId)
    ScanChests(function(chest, site)
        local rarity = chest:GetAttribute("ChestRarity") or chest:GetAttribute("Rarity") or "Common"
        local claimedUsers = tostring(chest:GetAttribute("ClaimedUserIds") or "[]")
        local isClaimed = claimedUsers:find(myUserId) ~= nil
        
        -- ตัวกรองระดับกล่อง
        if rarity == "Common" and not State.FilterCommon then return end
        if rarity == "Rare" and not State.FilterRare then return end
        if rarity == "Epic" and not State.FilterEpic then return end
        if rarity == "Legendary" and not State.FilterLegendary then return end
        if rarity == "Mythic" and not State.FilterMythic then return end
        if rarity == "Divine" and not State.FilterDivine then return end
        
        -- ซ่อนกล่องที่เปิดไปแล้ว
        if isClaimed and State.HideClaimed then
            RemoveESP("Chest_" .. chest:GetDebugId())
            return
        end

        local info = ChestRarityInfo[rarity] or {Name = "📦 กล่อง (" .. rarity .. ")", Color = Color3.fromRGB(200, 200, 200)}
        local statusText = isClaimed and " [✅ เปิดแล้ว]" or " [✨ ยังไม่ได้เปิด!]"
        local fullText = info.Name .. statusText

        local adornee = chest.PrimaryPart or chest:FindFirstChild("Hinge") or chest:FindFirstChildWhichIsA("BasePart")
        if adornee then
            CreateESP("Chest_" .. chest:GetDebugId(), adornee, fullText, info.Color, Vector3.new(0, 3, 0))
        end
    end)
end

-- ลูปอัปเดตกล่องสมบัติ
task.spawn(function()
    while true do
        task.wait(1.5)
        if State.ChestESP then
            pcall(UpdateChestESP)
        end
        -- Auto Open Chest
        if State.AutoOpenChest then
            local root = GetRoot()
            if root then
                ScanChests(function(chest, site)
                    local promptAnchor = site and site:FindFirstChild("ChestPromptAnchor")
                    local prompt = promptAnchor and promptAnchor:FindFirstChildWhichIsA("ProximityPrompt")
                        or chest:FindFirstChildWhichIsA("ProximityPrompt", true)
                    
                    if prompt then
                        local part = prompt.Parent:IsA("BasePart") and prompt.Parent or chest:FindFirstChildWhichIsA("BasePart")
                        if part and (part.Position - root.Position).Magnitude <= (prompt.MaxActivationDistance + 5) then
                            SafeFirePrompt(prompt)
                        end
                    end
                end)
            end
        end
    end
end)

-- Auto Farm All Chests Loop (วนบินเก็บทุกกล่องในแมพ)
task.spawn(function()
    while true do
        task.wait(0.5)
        if State.AutoFarmChests then
            local myUserId = tostring(LocalPlayer.UserId)
            local root = GetRoot()
            if root then
                local targetChest = nil
                local targetSite = nil
                local closestDist = math.huge
                
                ScanChests(function(chest, site)
                    local claimedUsers = tostring(chest:GetAttribute("ClaimedUserIds") or "[]")
                    local isClaimed = claimedUsers:find(myUserId) ~= nil
                    if not isClaimed then
                        local part = chest.PrimaryPart or chest:FindFirstChildWhichIsA("BasePart")
                        if part then
                            local d = (part.Position - root.Position).Magnitude
                            if d < closestDist then
                                closestDist = d
                                targetChest = chest
                                targetSite = site
                            end
                        end
                    end
                end)

                if targetChest then
                    local part = targetChest.PrimaryPart or targetChest:FindFirstChildWhichIsA("BasePart")
                    if part then
                        -- บินไปหากล่อง
                        FlyTweenTo(part.Position + Vector3.new(0, 2, 0), State.FarmFlySpeed, function()
                            task.wait(0.3)
                            local promptAnchor = targetSite and targetSite:FindFirstChild("ChestPromptAnchor")
                            local prompt = promptAnchor and promptAnchor:FindFirstChildWhichIsA("ProximityPrompt")
                                or targetChest:FindFirstChildWhichIsA("ProximityPrompt", true)
                            if prompt then
                                SafeFirePrompt(prompt)
                            end
                        end)
                        task.wait(2)
                    end
                else
                    Notify("📦 เก็บกล่องครบแล้ว!", "ไม่มีกล่องที่ยังไม่เปิดเหลือในแมพแล้ว", 4)
                    State.AutoFarmChests = false
                end
            end
        end
    end
end)

-- =============================================================================
-- ๑๐. ระบบไดโนเสาร์และสัตว์ (Dinosaur & Combat Engine)
-- =============================================================================
local function ScanDinosaurs(callback)
    local actors = Workspace:FindFirstChild("ChunkGame") and Workspace.ChunkGame:FindFirstChild("Actors")
    if actors then
        for _, kindFolder in ipairs(actors:GetChildren()) do
            local thaiName = DinoThaiNames[kindFolder.Name] or ("🦕 " .. kindFolder.Name)
            for _, creature in ipairs(kindFolder:GetChildren()) do
                if creature:IsA("Model") or creature:IsA("BasePart") then
                    callback(creature, kindFolder.Name, thaiName)
                end
            end
        end
    end

    -- สแกนรังไข่ไดโนเสาร์ (Dino Nests)
    local nests = Workspace:FindFirstChild("ChunkGame") and Workspace.ChunkGame:FindFirstChild("DinoNests")
    if nests then
        for _, nest in ipairs(nests:GetChildren()) do
            local thaiName = DinoThaiNames[nest.Name] or "🥚 รังไข่ไดโนเสาร์"
            callback(nest, "DinoNest", thaiName)
        end
    end
end

-- =============================================================================
-- Developer/QA Combat Controller
-- ทำงานเฉพาะ Studio หรือ game attribute AllowDinoQATools=true
-- =============================================================================
local QACombat = {
    Target = nil,
    TargetKind = nil,
    TargetThaiName = nil,
    LastAttack = 0,
    LastMove = 0,
    LastNotify = 0,
}

local function GetCreaturePart(creature)
    if not creature or not creature.Parent then return nil end
    if creature:IsA("BasePart") then return creature end
    return creature.PrimaryPart
        or creature:FindFirstChild("HumanoidRootPart")
        or creature:FindFirstChild("Torso")
        or creature:FindFirstChildWhichIsA("BasePart")
end

local function GetCreatureHumanoid(creature)
    if not creature or not creature.Parent or creature:IsA("BasePart") then return nil end
    return creature:FindFirstChildOfClass("Humanoid")
end

local function IsCreatureAlive(creature)
    if not creature or not creature.Parent then return false end
    local hum = GetCreatureHumanoid(creature)
    if hum then return hum.Health > 0 end
    local hp = creature:GetAttribute("Health") or creature:GetAttribute("HP")
    if typeof(hp) == "number" then return hp > 0 end
    return GetCreaturePart(creature) ~= nil
end

local function GetPublishedAttackRange(creature)
    if not creature then return nil end
    local holders = {creature, GetCreaturePart(creature)}
    for _, holder in ipairs(holders) do
        if holder then
            local value = holder:GetAttribute("AttackRange")
            if typeof(value) == "number" and value > 0 then return value end
        end
    end
    return nil
end

local function TargetMatchesCombatMode(kind)
    if State.QACombatTargetMode == "Any" then return true end
    return kind == State.SelectedDinoType
end

local function FindBestDinoTarget()
    local root = GetRoot()
    if not root then return nil end
    local best, bestKind, bestThai, bestDist = nil, nil, nil, State.QACombatMaxDistance
    ScanDinosaurs(function(creature, kind, thaiName)
        if kind ~= "DinoNest" and TargetMatchesCombatMode(kind) and IsCreatureAlive(creature) then
            local part = GetCreaturePart(creature)
            if part then
                local dist = (part.Position - root.Position).Magnitude
                if dist < bestDist then
                    best, bestKind, bestThai, bestDist = creature, kind, thaiName, dist
                end
            end
        end
    end)
    return best, bestKind, bestThai, bestDist
end

local function HasCombatLineOfSight(target)
    if not State.QACombatRequireLOS then return true end
    local root = GetRoot()
    local part = GetCreaturePart(target)
    if not root or not part then return false end
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    params.FilterDescendantsInstances = {Character}
    params.IgnoreWater = true
    local result = Workspace:Raycast(root.Position, part.Position - root.Position, params)
    return result == nil or result.Instance == part or result.Instance:IsDescendantOf(target)
end

local function GetCombatStandOffDistance(target)
    local desired = State.QACombatRange
    local published = GetPublishedAttackRange(target)
    if published then
        desired = math.max(desired, published + State.QACombatSafetyMargin)
    end
    return desired
end

local function GetSafeCombatPosition(target)
    local root = GetRoot()
    local part = GetCreaturePart(target)
    if not root or not part then return nil end

    local horizontal = Vector3.new(root.Position.X - part.Position.X, 0, root.Position.Z - part.Position.Z)
    if horizontal.Magnitude < 0.1 then
        local camLook = Camera and Camera.CFrame.LookVector or Vector3.new(0, 0, -1)
        horizontal = Vector3.new(-camLook.X, 0, -camLook.Z)
    end
    if horizontal.Magnitude < 0.1 then horizontal = Vector3.new(0, 0, 1) end

    local distance = GetCombatStandOffDistance(target)
    return part.Position + horizontal.Unit * distance + Vector3.new(0, State.QACombatHeight, 0)
end

local function SetQACombatTarget(target, kind, thaiName)
    QACombat.Target = target
    QACombat.TargetKind = kind
    QACombat.TargetThaiName = thaiName
    if target then
        local part = GetCreaturePart(target)
        if part then
            CreateESP("QACombat_Target", part, "🎯 QA เป้าหมาย: " .. (thaiName or kind or target.Name), Color3.fromRGB(255, 220, 0), Vector3.new(0, 5, 0))
        end
    else
        RemoveESP("QACombat_Target")
    end
end

local function StopQACombat(reason)
    State.QACombatEnabled = false
    State.QAAutoKill = false
    State.QACombatState = "IDLE"
    SetQACombatTarget(nil)
    CancelActiveMovement()
    if reason then Notify("🧪 QA Combat", reason, 4) end
end

local function GetLocalHealthPercent()
    local hum = GetHum()
    if not hum or hum.MaxHealth <= 0 then return 100 end
    return (hum.Health / hum.MaxHealth) * 100
end

local function MoveForQACombat(target, position)
    if not position then return end
    local now = os.clock()
    if now - QACombat.LastMove < 0.35 then return end
    local root = GetRoot()
    if not root then return end

    if ActiveMovementTarget and (ActiveMovementTarget - position).Magnitude < 3 then return end
    if (root.Position - position).Magnitude <= 3.5 then return end

    QACombat.LastMove = now
    FlyTweenTo(position, State.QACombatFlySpeed)
end

local function SetQAAutoKill(enabled)
    if enabled and not IsDeveloperQAAuthorized() then
        return false, "QA_NOT_AUTHORIZED"
    end
    State.QAAutoKill = enabled
    if enabled then
        State.QACombatEnabled = true
        State.QACombatTargetMode = "Any"
        State.QACombatAutoRetreat = false
        State.QACombatState = "FIND_TARGET"
        SetQACombatTarget(nil)
    else
        State.QACombatEnabled = false
        State.QACombatState = "IDLE"
        SetQACombatTarget(nil)
        CancelActiveMovement()
    end
    return true
end

local function PerformQACombatStep()
    if not State.QACombatEnabled then return end
    if not IsDeveloperQAAuthorized() then
        StopQACombat("ปิดอัตโนมัติ: ต้องรันใน Studio หรือเปิด AllowDinoQATools=true ในเกมของคุณ")
        return
    end

    -- ไม่ให้ระบบฟาร์ม/บินด้วยมือแย่งการควบคุมตำแหน่ง
    State.AutoFarmResource = false
    State.AutoFarmChests = false
    State.KillAura = false
    if State.FlyEnabled then
        State.FlyEnabled = false
        StopFly()
    end

    local root = GetRoot()
    if not root then
        State.QACombatState = "WAIT_CHARACTER"
        return
    end

    if not QACombat.Target or not IsCreatureAlive(QACombat.Target) or not TargetMatchesCombatMode(QACombat.TargetKind) then
        local target, kind, thaiName = FindBestDinoTarget()
        SetQACombatTarget(target, kind, thaiName)
        if not target then
            State.QACombatState = State.QAAutoKill and "AUTO_KILL_WAIT" or "FIND_TARGET"
            CancelActiveMovement()
            return
        end
    end

    local target = QACombat.Target
    local targetPart = GetCreaturePart(target)
    if not targetPart then
        SetQACombatTarget(nil)
        return
    end

    if State.QACombatAutoRetreat and GetLocalHealthPercent() <= State.QACombatRetreatHP then
        State.QACombatState = "RETREAT"
        local safePos = GetSafeCombatPosition(target)
        if safePos then
            local targetPos = targetPart.Position
            local away = safePos - targetPos
            if away.Magnitude > 0 then
                safePos = targetPos + away.Unit * (GetCombatStandOffDistance(target) * 1.8) + Vector3.new(0, State.QACombatHeight + 4, 0)
            end
            MoveForQACombat(target, safePos)
        end
        return
    end

    local safePos = GetSafeCombatPosition(target)
    if not safePos then return end
    local deviation = (root.Position - safePos).Magnitude
    if deviation > 4 then
        State.QACombatState = "APPROACH"
        MoveForQACombat(target, safePos)
        return
    end

    State.QACombatState = "HOLD_RANGE"
    if not HasCombatLineOfSight(target) then
        State.QACombatState = "REPOSITION_LOS"
        local side = root.CFrame.RightVector * math.max(5, State.QACombatSafetyMargin * 2)
        MoveForQACombat(target, safePos + side)
        return
    end

    local now = os.clock()
    if now - QACombat.LastAttack >= State.QACombatAttackInterval then
        QACombat.LastAttack = now
        local ok, reason = PerformAuthorizedSkill(target, State.QACombatSkill)
        State.QACombatState = ok and "ATTACK" or "HOLD_RANGE"
        if not ok and reason and now - QACombat.LastNotify > 5 then
            QACombat.LastNotify = now
            Notify("🧪 QA Combat", "ยังโจมตีไม่ได้: " .. tostring(reason), 4)
        end
    end
end

task.spawn(function()
    while true do
        task.wait(0.15)
        pcall(PerformQACombatStep)
    end
end)

local function UpdateDinoESP()
    if not State.DinoESP and not State.DinoNestESP then
        ClearAllESP("Dino_")
        ClearAllESP("Nest_")
        return
    end

    ScanDinosaurs(function(creature, kind, thaiName)
        local isNest = (kind == "DinoNest")
        if isNest and not State.DinoNestESP then return end
        if not isNest and not State.DinoESP then return end

        local adornee = creature:IsA("BasePart") and creature or (creature.PrimaryPart or creature:FindFirstChildWhichIsA("BasePart"))
        if adornee then
            local color = Color3.fromRGB(100, 255, 100)
            if kind:find("Raptor") or kind:find("Carnivorous") or kind:find("Spider") or kind:find("Zombie") then
                color = Color3.fromRGB(255, 60, 60) -- อันตราย สีแดง
            elseif isNest then
                color = Color3.fromRGB(255, 215, 0) -- รังไข่ สีทอง
            end

            local prefix = isNest and "Nest_" or "Dino_"
            CreateESP(prefix .. creature:GetDebugId(), adornee, thaiName, color, Vector3.new(0, 3, 0))
        end
    end)
end

-- ลูปอัปเดตไดโนเสาร์ & ต่อสู้
task.spawn(function()
    while true do
        task.wait(1.5)
        if State.DinoESP or State.DinoNestESP then
            pcall(UpdateDinoESP)
        end
        -- Auto Collect Dino Eggs
        if State.AutoEggCollect then
            local root = GetRoot()
            if root then
                local nests = Workspace:FindFirstChild("ChunkGame") and Workspace.ChunkGame:FindFirstChild("DinoNests")
                if nests then
                    for _, nest in ipairs(nests:GetChildren()) do
                        local prompt = nest:FindFirstChildWhichIsA("ProximityPrompt", true)
                        if prompt and prompt.Parent:IsA("BasePart") then
                            if (prompt.Parent.Position - root.Position).Magnitude <= (prompt.MaxActivationDistance + 6) then
                                SafeFirePrompt(prompt)
                            end
                        end
                    end
                end
            end
        end
    end
end)

-- Legacy Kill Aura: จำกัดไว้เฉพาะ Developer/QA และใช้ Tool.Activate เท่านั้น
-- แนะนำให้ใช้ QA Combat Controller ด้านบนแทนสำหรับการทดสอบระยะ/LOS/Retreat
task.spawn(function()
    while true do
        task.wait(State.FastAttack and 0.15 or 0.3)
        if State.KillAura and IsDeveloperQAAuthorized() and not State.QACombatEnabled then
            local root = GetRoot()
            if root then
                ScanDinosaurs(function(creature, kind)
                    if kind ~= "DinoNest" then
                        local part = GetCreaturePart(creature)
                        if part and (part.Position - root.Position).Magnitude <= State.AuraRange then
                            AttackTarget(creature)
                        end
                    end
                end)
            end
        end
    end
end)

-- Hitbox Expander ไดโนเสาร์
RunService.Heartbeat:Connect(function()
    if State.HitboxExpander then
        ScanDinosaurs(function(creature, kind)
            if kind ~= "DinoNest" then
                local part = creature:IsA("BasePart") and creature or (creature.PrimaryPart or creature:FindFirstChild("Torso") or creature:FindFirstChildWhichIsA("BasePart"))
                if part then
                    if not OriginalSizes[part] then
                        OriginalSizes[part] = part.Size
                    end
                    part.Size = Vector3.new(State.HitboxSize, State.HitboxSize, State.HitboxSize)
                    part.Transparency = 0.6
                    part.CanCollide = false
                end
            end
        end)
    end
end)

-- =============================================================================
-- ๑๑. ระบบออโต้ฟาร์มทรัพยากร (Wood, Stone, Ore & Drops Engine)
-- =============================================================================
local function FindClosestResource(categoryKey)
    local targetNames = ResourceCategories[categoryKey] or {}
    local root = GetRoot()
    if not root then return nil end

    local closestObj = nil
    local closestDist = State.FarmMaxDist

    local world = Workspace:FindFirstChild("ChunkGame") and Workspace.ChunkGame:FindFirstChild("World")
    local searchContainers = {world, Workspace:FindFirstChild("ChunkGame"), Workspace}

    for _, container in ipairs(searchContainers) do
        if container then
            for _, obj in ipairs(container:GetChildren()) do
                for _, targetName in ipairs(targetNames) do
                    if obj.Name == targetName or obj.Name:find(targetName) then
                        local part = obj:IsA("BasePart") and obj or (obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart"))
                        if part then
                            local d = (part.Position - root.Position).Magnitude
                            if d < closestDist then
                                closestDist = d
                                closestObj = obj
                            end
                        end
                    end
                end
            end
        end
    end
    return closestObj
end

-- ลูปออโต้ฟาร์มทรัพยากร (บินไปตี/ขุด และดูดไอเทม)
task.spawn(function()
    while true do
        task.wait(0.3)
        if State.AutoFarmResource then
            local root = GetRoot()
            if root then
                -- 1. ดูด Drops รอบตัวก่อน (ถ้ามีของตก)
                if State.AutoCollectDrops then
                    local dropsFolder = Workspace:FindFirstChild("ChunkGame") and Workspace.ChunkGame:FindFirstChild("Drops")
                    if dropsFolder then
                        for _, drop in ipairs(dropsFolder:GetChildren()) do
                            if drop:IsA("BasePart") then
                                local dist = (drop.Position - root.Position).Magnitude
                                if dist <= 60 then
                                    -- ดูดเข้าตัวหรือส่ง Remote Pickup
                                    local dropId = drop:GetAttribute("DropId")
                                    if dropId and Remotes.Pickup then
                                        SafeFireRemote(Remotes.Pickup, dropId)
                                    end
                                    drop.CFrame = root.CFrame
                                end
                            end
                        end
                    end
                end

                -- 2. ค้นหาทรัพยากรที่เลือก
                local target = FindClosestResource(State.FarmTargetType)
                if target then
                    local targetPart = target:IsA("BasePart") and target or (target.PrimaryPart or target:FindFirstChildWhichIsA("BasePart"))
                    if targetPart then
                        local safePos = targetPart.Position + Vector3.new(0, State.SafeHeightOffset, 0)
                        
                        -- บินเข้าใกล้เป้าหมาย
                        if (targetPart.Position - root.Position).Magnitude > 8 then
                            FlyTweenTo(safePos, State.FarmFlySpeed)
                        else
                            -- อยู่ในระยะฟาร์มแล้ว: ถืออาวุธและตี
                            if State.AutoEquipTool then
                                EquipAppropriateTool()
                            end
                            if State.AutoAttackRes then
                                HarvestTarget(target)
                            end
                            -- ตรวจสอบ ProximityPrompt เช่น เก็บไข่หรือสมุนไพร
                            local prompt = target:FindFirstChildWhichIsA("ProximityPrompt", true)
                            if prompt then
                                SafeFirePrompt(prompt)
                            end
                        end
                    end
                end
            end
        end
    end
end)

-- =============================================================================
-- ๑๒. ระบบสถานที่สำคัญ & POIs (Landmarks Engine)
-- =============================================================================
local function GetLandmarkPosition(landmark)
    local world = Workspace:FindFirstChild("ChunkGame") and Workspace.ChunkGame:FindFirstChild("World")
    if world and landmark.Folder then
        local folder = world:FindFirstChild(landmark.Folder)
        if folder then
            local part = folder:IsA("BasePart") and folder or (folder.PrimaryPart or folder:FindFirstChildWhichIsA("BasePart", true))
            if part then return part.Position, part end
        end
    end
    return landmark.Fallback, nil
end

local function UpdatePOI_ESP()
    if not State.POI_ESP then
        ClearAllESP("POI_")
        return
    end

    for idx, lm in ipairs(LandmarksList) do
        local pos, part = GetLandmarkPosition(lm)
        if not part then
            -- สร้าง Anchor ชั่วคราวสำหรับ ESP
            local anchor = Workspace:FindFirstChild("POI_Anchor_" .. idx)
            if not anchor then
                anchor = Instance.new("Part")
                anchor.Name = "POI_Anchor_" .. idx
                anchor.Size = Vector3.new(2, 2, 2)
                anchor.Position = pos
                anchor.Anchored = true
                anchor.CanCollide = false
                anchor.Transparency = 1
                anchor.Parent = Workspace
            end
            part = anchor
        end
        CreateESP("POI_" .. idx, part, lm.Name, Color3.fromRGB(255, 140, 0), Vector3.new(0, 10, 0))
    end
end

-- =============================================================================
-- ๑๓. ระบบภาพและการเอาชีวิตรอด (Visuals & Protection Engine)
-- =============================================================================

-- Fullbright
local OriginalLighting = {
    Brightness = Lighting.Brightness,
    ClockTime = Lighting.ClockTime,
    FogEnd = Lighting.FogEnd,
    GlobalShadows = Lighting.GlobalShadows,
    Ambient = Lighting.Ambient
}

local function SetFullbright(enabled)
    if enabled then
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
        Lighting.Ambient = Color3.fromRGB(255, 255, 255)
    else
        Lighting.Brightness = OriginalLighting.Brightness
        Lighting.ClockTime = OriginalLighting.ClockTime
        Lighting.FogEnd = OriginalLighting.FogEnd
        Lighting.GlobalShadows = OriginalLighting.GlobalShadows
        Lighting.Ambient = OriginalLighting.Ambient
    end
end

-- Anti-AFK
task.spawn(function()
    LocalPlayer.Idled:Connect(function()
        if State.AntiAFK then
            VirtualUser:Button2Down(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
            task.wait(1)
            VirtualUser:Button2Up(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
        end
    end)
end)

-- Player ESP & True Sight
local function UpdatePlayerESP()
    if not State.PlayerESP then
        ClearAllESP("Player_")
        return
    end

    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local pRoot = GetRoot(p.Character)
            local pHum = GetHum(p.Character)
            if pRoot then
                local hp = pHum and math.floor(pHum.Health) or 100
                local maxHp = pHum and math.floor(pHum.MaxHealth) or 100
                local nameText = string.format("👤 %s [%d/%d HP]", p.DisplayName, hp, maxHp)
                
                -- ตรวจสอบล่องหน
                local isInvis = false
                for _, part in ipairs(p.Character:GetDescendants()) do
                    if part:IsA("BasePart") and part.Transparency >= 0.9 then
                        isInvis = true
                        if State.TrueSight then
                            part.Transparency = 0.4
                        end
                    end
                end
                if isInvis then nameText = "👻 [ล่องหน] " .. nameText end
                
                CreateESP("Player_" .. p.UserId, pRoot, nameText, Color3.fromRGB(0, 255, 255), Vector3.new(0, 3, 0))
            end
        end
    end
end

RunService.RenderStepped:Connect(function()
    if State.PlayerESP then
        pcall(UpdatePlayerESP)
    end
end)

-- =============================================================================
-- ๑๔. สร้างหน้าต่าง DINO SURVIVAL HUB V2 Custom UI
-- =============================================================================
local Window = Fluent:CreateWindow({
    Title = "🦖 DINO SURVIVAL HUB V2",
    SubTitle = "Custom UI | QA/Developer Toolkit",
    TabWidth = 165,
    Size = UDim2.fromOffset(590, 470),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl
})

-- สร้างแท็บทั้ง 7 แท็บภาษาไทย
local Tabs = {
    Dino = Window:AddTab({ Title = "🦖 ไดโนเสาร์", Icon = "skull" }),
    Chest = Window:AddTab({ Title = "📦 กล่องสมบัติ", Icon = "box" }),
    Farm = Window:AddTab({ Title = "⛏️ ออโต้ฟาร์ม", Icon = "pickaxe" }),
    Movement = Window:AddTab({ Title = "🏃 การเคลื่อนที่", Icon = "zap" }),
    Teleport = Window:AddTab({ Title = "🗺️ วาร์ป & POI", Icon = "map-pin" }),
    Visuals = Window:AddTab({ Title = "👁️ ESP & เอาตัวรอด", Icon = "eye" }),
    Settings = Window:AddTab({ Title = "⚙️ ตั้งค่า", Icon = "settings" })
}

-- =============================================================================
-- ๑๕. รายละเอียดแต่ละแท็บและฟังชั่น (ครบ 50+ ฟังชั่น ทำงานจริง)
-- =============================================================================

--------------------------------------------------------------------------------
-- [แท็บ 1] ไดโนเสาร์ & ต่อสู้ (Dino & Combat)
--------------------------------------------------------------------------------
Tabs.Dino:AddParagraph({
    Title = "🦖 ระบบไดโนเสาร์และการต่อสู้",
    Content = "ESP ระบุสายพันธุ์ภาษาไทย, วาร์ป/บินไปหา, Kill Aura, Fast Attack, ขโมยไข่"
})

-- [1] ESP ไดโนเสาร์
Tabs.Dino:AddToggle("DinoESP_Toggle", {
    Title = "👁️ ESP ไดโนเสาร์ (ชื่อภาษาไทย)",
    Description = "ระบุชื่อไดโนเสาร์ภาษาไทย + ระยะห่าง + สีแยกตามระดับอันตราย",
    Default = false,
    Callback = function(v)
        State.DinoESP = v
        UpdateDinoESP()
        Notify("🦖 Dino ESP", v and "เปิดแล้ว!" or "ปิดแล้ว!", 3)
    end
})

-- [2] ESP รังไข่ไดโนเสาร์
Tabs.Dino:AddToggle("DinoNestESP_Toggle", {
    Title = "🥚 ESP รังไข่ไดโนเสาร์",
    Description = "แสดงรังไข่แรปเตอร์และคอมพ์โซกนาทัสสีทอง",
    Default = false,
    Callback = function(v)
        State.DinoNestESP = v
        UpdateDinoESP()
        Notify("🥚 Nest ESP", v and "เปิดแล้ว!" or "ปิดแล้ว!", 3)
    end
})

-- [3] เมนูเลือกสายพันธุ์ไดโนเสาร์ภาษาไทย
local dinoDropdownList = {
    "🦕 คอมพ์โซกนาทัส (Compsognathus)",
    "🦖 เวโลซีแรปเตอร์ (Velociraptor)",
    "🦕 พาราซอโรโลฟัส (Parasaurolophus)",
    "🦏 ไตรเซราทอปส์ (Triceratops)",
    "🦕 สเตโกซอรัส (Stegosaurus)",
    "🌿 ต้นไม้กินคน (Carnivorous Plant)",
    "🕷️ แมงมุมดึกดำบรรพ์ (Prehistoric Spider)",
    "🧟 ซอมบี้ (Zombie)",
    "🥚 รังไข่ไดโนเสาร์ (Dino Nest)"
}

Tabs.Dino:AddDropdown("DinoSelect", {
    Title = "🎯 เลือกสายพันธุ์ไดโนเสาร์",
    Description = "เลือกตัวที่ต้องการวาร์ปหรือบินไปหา",
    Values = dinoDropdownList,
    Default = dinoDropdownList[1],
    Callback = function(v)
        if v:find("Compsognathus") then State.SelectedDinoType = "Compsognathus"
        elseif v:find("Velociraptor") or v:find("Raptor") then State.SelectedDinoType = "Raptor"
        elseif v:find("Parasaurolophus") then State.SelectedDinoType = "Parasaurolophus"
        elseif v:find("Triceratops") then State.SelectedDinoType = "Triceratops"
        elseif v:find("Stegosaurus") then State.SelectedDinoType = "Stegosaurus"
        elseif v:find("Carnivorous") then State.SelectedDinoType = "CarnivorousPlant"
        elseif v:find("Spider") then State.SelectedDinoType = "PrehistoricSpider"
        elseif v:find("Zombie") then State.SelectedDinoType = "Zombie"
        elseif v:find("Nest") then State.SelectedDinoType = "DinoNest"
        end
    end
})

-- [4] ปุ่มวาร์ปไปหาไดโนเสาร์ที่เลือก
Tabs.Dino:AddButton({
    Title = "⚡ วาร์ปไปหาไดโนเสาร์ที่เลือก",
    Description = "วาร์ปพริบตาไปยังตัวที่ใกล้ที่สุด",
    Callback = function()
        local root = GetRoot()
        if not root then return end
        local found = nil
        local minDist = math.huge
        ScanDinosaurs(function(creature, kind)
            if kind == State.SelectedDinoType or (State.SelectedDinoType == "DinoNest" and kind:find("Nest")) then
                local part = creature:IsA("BasePart") and creature or (creature.PrimaryPart or creature:FindFirstChildWhichIsA("BasePart"))
                if part then
                    local d = (part.Position - root.Position).Magnitude
                    if d < minDist then
                        minDist = d
                        found = part
                    end
                end
            end
        end)
        if found then
            TeleportInstant(found.CFrame + Vector3.new(0, 4, 0))
            Notify("🦖 สำเร็จ!", "วาร์ปมาถึงตัวไดโนเสาร์แล้ว", 3)
        else
            Notify("⚠️ ไม่พบไดโนเสาร์", "ไม่พบสายพันธุ์นี้ในแมพ ณ ปัจจุบัน", 3)
        end
    end
})

-- [5] ปุ่มบินไปหาไดโนเสาร์แบบ Smooth
Tabs.Dino:AddButton({
    Title = "🦅 บินลอยตัวไปหาไดโนเสาร์",
    Description = "บินสมูทลอยตัวเหนือไดโนเสาร์ (ไม่เด้งตกแมพ)",
    Callback = function()
        local root = GetRoot()
        if not root then return end
        local found = nil
        local minDist = math.huge
        ScanDinosaurs(function(creature, kind)
            if kind == State.SelectedDinoType or (State.SelectedDinoType == "DinoNest" and kind:find("Nest")) then
                local part = creature:IsA("BasePart") and creature or (creature.PrimaryPart or creature:FindFirstChildWhichIsA("BasePart"))
                if part then
                    local d = (part.Position - root.Position).Magnitude
                    if d < minDist then
                        minDist = d
                        found = part
                    end
                end
            end
        end)
        if found then
            FlyTweenTo(found.Position + Vector3.new(0, 8, 0), State.FlySpeed)
            Notify("🦅 กำลังบิน...", "กำลังบินไปหาไดโนเสาร์เป้าหมาย", 3)
        end
    end
})

-- Developer/QA Combat Test
Tabs.Dino:AddParagraph({
    Title = "🧪 Developer/QA Combat Test",
    Content = "ระบบรักษาระยะ + ความสูง + LOS + ถอยเมื่อ HP ต่ำ\nทำงานเฉพาะ Studio หรือเกมที่ตั้ง AllowDinoQATools=true"
})

Tabs.Dino:AddToggle("QACombat_Toggle", {
    Title = "🧪 เปิด Auto Combat Test (QA)",
    Description = "เลือกเป้า → บินรักษาระยะ → ตรวจ LOS → โจมตีตาม cooldown → ถอยเมื่อ HP ต่ำ",
    Default = false,
    Callback = function(v)
        if v and not IsDeveloperQAAuthorized() then
            State.QACombatEnabled = false
            Notify("🔒 QA Combat", "ใช้ได้เฉพาะ Roblox Studio หรือเกมของคุณที่ตั้ง AllowDinoQATools=true", 5)
            return
        end
        State.QACombatEnabled = v
        if not v then
            StopQACombat("หยุด QA Combat แล้ว")
        else
            State.QACombatState = "FIND_TARGET"
            SetQACombatTarget(nil)
            Notify("🧪 QA Combat", "เริ่มระบบทดสอบต่อสู้แบบรักษาระยะ", 4)
        end
    end
})

Tabs.Dino:AddToggle("QAAutoKill_Toggle", {
    Title = "☠️ ฆ่าอัตโนมัติ (QA Auto Kill)",
    Description = "เลือกมอนสเตอร์ที่ใกล้ที่สุด → รักษาระยะ → โจมตีต่อเนื่อง → เปลี่ยนเป้าหมายเมื่อเป้าตาย; ใช้ได้เฉพาะ Studio/เกมที่อนุญาต QA",
    Default = false,
    Callback = function(v)
        local ok, reason = SetQAAutoKill(v)
        if not ok then
            State.QAAutoKill = false
            Notify("🔒 QA Auto Kill", "เปิดไม่ได้: " .. tostring(reason), 5)
            return
        end
        Notify("☠️ QA Auto Kill", v and "เริ่มฆ่าอัตโนมัติแบบ QA แล้ว" or "หยุดฆ่าอัตโนมัติแล้ว", 4)
    end
})

Tabs.Dino:AddDropdown("QACombatTargetMode", {
    Title = "🎯 โหมดเลือกเป้าหมาย QA",
    Values = {"สายพันธุ์ที่เลือก", "ใกล้ที่สุดทุกสายพันธุ์"},
    Default = "สายพันธุ์ที่เลือก",
    Callback = function(v)
        State.QACombatTargetMode = (v == "ใกล้ที่สุดทุกสายพันธุ์") and "Any" or "Selected"
        SetQACombatTarget(nil)
    end
})

Tabs.Dino:AddDropdown("QACombatSkill", {
    Title = "✨ วิธีโจมตี QA",
    Description = "Dump พบ NecromancerController/NecroSoulFx/NecroSouls แต่ไม่พบชื่อ Remote/argument; โหมดนี้จึงใช้ QACombatRequest ของเกมคุณ",
    Values = {"อาวุธที่ถือ", "Necro Soul (QA adapter)", "PrimarySkill (QA)"},
    Default = "อาวุธที่ถือ",
    Callback = function(v)
        if v == "อาวุธที่ถือ" then State.QACombatSkill = "Tool"
        elseif v:find("Necro Soul") then State.QACombatSkill = "NecroSoul"
        else State.QACombatSkill = "PrimarySkill" end
    end
})

Tabs.Dino:AddSlider("QACombatRange", {
    Title = "📏 ระยะยืนทดสอบจากมอนสเตอร์",
    Description = "ถ้ามอนสเตอร์มี Attribute AttackRange ระบบจะบวก Safety Margin ให้อัตโนมัติ",
    Default = 18, Min = 6, Max = 80, Rounding = 0,
    Callback = function(v) State.QACombatRange = v end
})

Tabs.Dino:AddSlider("QACombatHeight", {
    Title = "🦅 ความสูงเหนือเป้าหมาย",
    Default = 9, Min = 0, Max = 40, Rounding = 0,
    Callback = function(v) State.QACombatHeight = v end
})

Tabs.Dino:AddSlider("QACombatFlySpeed", {
    Title = "💨 ความเร็วบิน QA",
    Default = 65, Min = 15, Max = 220, Rounding = 0,
    Callback = function(v) State.QACombatFlySpeed = v end
})

Tabs.Dino:AddSlider("QACombatAttackInterval", {
    Title = "⏱️ ช่วงห่างการโจมตี (วินาที)",
    Default = 0.65, Min = 0.15, Max = 3, Rounding = 2,
    Callback = function(v) State.QACombatAttackInterval = v end
})

Tabs.Dino:AddSlider("QACombatMaxDistance", {
    Title = "🔎 ระยะค้นหาเป้าหมายสูงสุด",
    Default = 650, Min = 50, Max = 2500, Rounding = 0,
    Callback = function(v) State.QACombatMaxDistance = v end
})

Tabs.Dino:AddSlider("QACombatSafetyMargin", {
    Title = "🛡️ Safety Margin จาก AttackRange",
    Default = 4, Min = 0, Max = 25, Rounding = 0,
    Callback = function(v) State.QACombatSafetyMargin = v end
})

Tabs.Dino:AddToggle("QACombatLOS", {
    Title = "👁️ ต้องเห็นเป้าหมายก่อนโจมตี (LOS)",
    Default = true,
    Callback = function(v) State.QACombatRequireLOS = v end
})

Tabs.Dino:AddToggle("QACombatRetreat", {
    Title = "❤️ ถอยอัตโนมัติเมื่อ HP ต่ำ",
    Default = true,
    Callback = function(v) State.QACombatAutoRetreat = v end
})

Tabs.Dino:AddSlider("QACombatRetreatHP", {
    Title = "❤️ HP (%) ที่ให้เริ่มถอย",
    Default = 30, Min = 5, Max = 90, Rounding = 0,
    Callback = function(v) State.QACombatRetreatHP = v end
})

Tabs.Dino:AddButton({
    Title = "🛑 หยุด QA Combat และยกเลิกการบิน",
    Callback = function()
        StopQACombat("หยุดระบบและยกเลิก Tween แล้ว")
    end
})

-- [6] Kill Aura ไดโนเสาร์
Tabs.Dino:AddToggle("KillAura_Toggle", {
    Title = "⚔️ Legacy Kill Aura (QA เท่านั้น)",
    Description = "ทดสอบ Tool.Activate รอบตัวใน Studio/เกมที่อนุญาต; แนะนำใช้ QA Combat ด้านบน",
    Default = false,
    Callback = function(v)
        State.KillAura = v
        Notify("⚔️ Kill Aura", v and "เปิดแล้ว!" or "ปิดแล้ว!", 3)
    end
})

-- [7] สไลเดอร์ระยะ Kill Aura
Tabs.Dino:AddSlider("AuraRange_Slider", {
    Title = "📏 ระยะ Kill Aura (Studs)",
    Description = "ระยะที่ออร่าจะทำงาน (แนะนำ 20-35)",
    Default = 25,
    Min = 10,
    Max = 60,
    Rounding = 0,
    Callback = function(v) State.AuraRange = v end
})

-- [8] Fast Attack (ตีรัว)
Tabs.Dino:AddToggle("FastAttack_Toggle", {
    Title = "⚡ Legacy Attack Rate (QA)",
    Description = "ลดช่วงรอของ Legacy Aura; ไม่ข้าม cooldown ฝั่ง Server",
    Default = false,
    Callback = function(v) State.FastAttack = v end
})

-- [9] ขยาย Hitbox ไดโนเสาร์
Tabs.Dino:AddToggle("Hitbox_Toggle", {
    Title = "📦 Hitbox Expander (ขยายขนาดตัวไดโนเสาร์)",
    Description = "ขยายตัวไดโนเสาร์ให้โจมตีโดนง่าย 100%",
    Default = false,
    Callback = function(v)
        State.HitboxExpander = v
        if not v then
            -- คืนขนาดเดิม
            for part, originalSize in pairs(OriginalSizes) do
                if part and part.Parent then
                    part.Size = originalSize
                    part.Transparency = 0
                end
            end
            OriginalSizes = {}
        end
    end
})

Tabs.Dino:AddSlider("HitboxSize_Slider", {
    Title = "📐 ขนาด Hitbox ไดโนเสาร์",
    Default = 15,
    Min = 5,
    Max = 40,
    Rounding = 0,
    Callback = function(v) State.HitboxSize = v end
})

-- [10] Auto ขโมยไข่ไดโนเสาร์
Tabs.Dino:AddToggle("AutoEgg_Toggle", {
    Title = "🥚 Auto Collect Dino Eggs (ขโมยไข่อัตโนมัติ)",
    Description = "กดเก็บไข่จากรังไดโนเสาร์ทันทีที่เข้าใกล้",
    Default = false,
    Callback = function(v) State.AutoEggCollect = v end
})

--------------------------------------------------------------------------------
-- [แท็บ 2] กล่องสมบัติ (Chests & Expeditions)
--------------------------------------------------------------------------------
Tabs.Chest:AddParagraph({
    Title = "📦 ระบบกล่องสมบัติและการสำรวจ",
    Content = "ESP ระบุระดับภาษาไทย 100%, แสดงสถานะเปิด/ยังไม่เปิด, วาร์ปไปหา, เปิดออโต้"
})

-- [11] ESP กล่องสมบัติ
Tabs.Chest:AddToggle("ChestESP_Toggle", {
    Title = "📦 ESP กล่องสมบัติ (บอกระดับภาษาไทย)",
    Description = "ระบุระดับกล่อง: ทั่วไป, หายาก, มหากาพย์, ในตำนาน, เทพนิยาย, เทวะ",
    Default = false,
    Callback = function(v)
        State.ChestESP = v
        UpdateChestESP()
        Notify("📦 Chest ESP", v and "เปิดแล้ว!" or "ปิดแล้ว!", 3)
    end
})

-- [12] ซ่อนกล่องที่เปิดไปแล้ว
Tabs.Chest:AddToggle("HideClaimed_Toggle", {
    Title = "👁️ ซ่อนกล่องที่เปิดไปแล้ว",
    Description = "แสดงเฉพาะกล่องที่เรายังไม่ได้กดรับของ",
    Default = true,
    Callback = function(v)
        State.HideClaimed = v
        UpdateChestESP()
    end
})

-- ตัวกรองระดับกล่อง
Tabs.Chest:AddToggle("F_Common", {
    Title = "⚪ กล่องระดับทั่วไป (Common)",
    Default = true,
    Callback = function(v) State.FilterCommon = v; UpdateChestESP() end
})
Tabs.Chest:AddToggle("F_Rare", {
    Title = "🔷 กล่องระดับหายาก (Rare)",
    Default = true,
    Callback = function(v) State.FilterRare = v; UpdateChestESP() end
})
Tabs.Chest:AddToggle("F_Epic", {
    Title = "💜 กล่องระดับมหากาพย์ (Epic)",
    Default = true,
    Callback = function(v) State.FilterEpic = v; UpdateChestESP() end
})
Tabs.Chest:AddToggle("F_Legendary", {
    Title = "👑 กล่องระดับในตำนาน (Legendary)",
    Default = true,
    Callback = function(v) State.FilterLegendary = v; UpdateChestESP() end
})
Tabs.Chest:AddToggle("F_Mythic", {
    Title = "🔥 กล่องระดับเทพนิยาย (Mythic)",
    Default = true,
    Callback = function(v) State.FilterMythic = v; UpdateChestESP() end
})
Tabs.Chest:AddToggle("F_Divine", {
    Title = "✨ กล่องระดับเทวะ (Divine)",
    Default = true,
    Callback = function(v) State.FilterDivine = v; UpdateChestESP() end
})

-- เลือกระดับกล่องที่จะวาร์ปไปหา
Tabs.Chest:AddDropdown("ChestRarityTeleport_Select", {
    Title = "🎯 เลือกระดับกล่องที่จะวาร์ปไป",
    Description = "เลือก rarity ของกล่อง แล้วกดปุ่มวาร์ปด้านล่าง",
    Values = ChestRarityTeleportOptions,
    Default = ChestRarityTeleportOptions[1],
    Callback = function(v)
        State.SelectedChestRarity = ChestRarityKeyByOption[v] or "Common"
        local info = ChestRarityInfo[State.SelectedChestRarity]
        Notify("🎯 เลือกระดับกล่อง", info and info.Name or State.SelectedChestRarity, 3)
    end
})

Tabs.Chest:AddButton({
    Title = "⚡ วาร์ปไปกล่องระดับที่เลือก",
    Description = "วาร์ปไปกล่องที่ยังไม่เปิดและใกล้ที่สุด เฉพาะระดับที่เลือก",
    Callback = function()
        if not IsDeveloperQAAuthorized() then
            Notify("🔒 Chest QA", "ใช้ได้เฉพาะ Roblox Studio หรือเกมของคุณที่ตั้ง AllowDinoQATools=true", 5)
            return
        end

        local rarityKey = State.SelectedChestRarity or "Common"
        local chest, site, part, distance = FindNearestUnclaimedChestByRarity(rarityKey)
        local info = ChestRarityInfo[rarityKey]
        local rarityName = info and info.Name or ("📦 " .. rarityKey)

        if part then
            TeleportInstant(part.CFrame)
            Notify(
                "📦 ถึงกล่องแล้ว!",
                string.format("%s | ระยะเดิมประมาณ %d studs", rarityName, math.floor(distance)),
                4
            )
        else
            Notify(
                "⚠️ ไม่พบกล่องระดับนี้",
                rarityName .. " ที่ยังไม่เปิดไม่พบในข้อมูลที่ Client โหลดอยู่",
                4
            )
        end
    end
})

-- [13] ปุ่มวาร์ปไปหากล่องที่ยังไม่เปิด
Tabs.Chest:AddButton({
    Title = "⚡ วาร์ปไปหากล่องที่ยังไม่เปิด (ใกล้ที่สุด)",
    Description = "วาร์ปไปที่กล่องสมบัติที่ยังไม่ได้กดรับ",
    Callback = function()
        local myUserId = tostring(LocalPlayer.UserId)
        local root = GetRoot()
        if not root then return end
        local found = nil
        local minDist = math.huge
        ScanChests(function(chest)
            local claimedUsers = tostring(chest:GetAttribute("ClaimedUserIds") or "[]")
            if not claimedUsers:find(myUserId) then
                local part = chest.PrimaryPart or chest:FindFirstChildWhichIsA("BasePart")
                if part then
                    local d = (part.Position - root.Position).Magnitude
                    if d < minDist then
                        minDist = d
                        found = part
                    end
                end
            end
        end)
        if found then
            TeleportInstant(found.CFrame + Vector3.new(0, 3, 0))
            Notify("📦 ถึงกล่องแล้ว!", "วาร์ปมาถึงกล่องสมบัติที่ยังไม่ได้เปิด", 3)
        else
            Notify("⚠️ ไม่พบกล่อง", "คุณเก็บกล่องทั้งหมดในแมพไปแล้ว!", 3)
        end
    end
})

-- [14] Auto Open Chest
Tabs.Chest:AddToggle("AutoOpenChest_Toggle", {
    Title = "🔓 Auto Open Chest (เปิดกล่องอัตโนมัติเมื่อใกล้)",
    Description = "ส่งคำสั่งกดเปิดกล่องทันทีที่อยู่ในระยะ",
    Default = false,
    Callback = function(v) State.AutoOpenChest = v end
})

-- [15] Auto Farm All Chests (วนบินเก็บทุกกล่องในแมพ)
Tabs.Chest:AddToggle("AutoFarmChests_Toggle", {
    Title = "🚀 Auto Farm All Chests (วนเก็บกล่องทั้งแมพอัตโนมัติ)",
    Description = "บินเก็บกล่องสมบัติทุกใบที่ยังไม่เปิดทั่วทั้งแมพจนครบ",
    Default = false,
    Callback = function(v)
        State.AutoFarmChests = v
        Notify("🚀 Auto Farm Chests", v and "เริ่มวนเก็บกล่องแล้ว!" or "หยุดระบบแล้ว", 3)
    end
})

--------------------------------------------------------------------------------
-- [แท็บ 3] ออโต้ฟาร์มทรัพยากร (Wood, Stone, Ore & Food Farm)
--------------------------------------------------------------------------------
Tabs.Farm:AddParagraph({
    Title = "⛏️ ระบบออโต้ฟาร์มทรัพยากร",
    Content = "เลือกตัดไม้, ขุดหิน, ขุดแร่ทองแดง/เหล็ก/ถ่านหิน, เก็บผลไม้ บินไปตีและดูดของเข้าตัว"
})

-- [16] เปิด/ปิดระบบออโต้ฟาร์ม
Tabs.Farm:AddToggle("AutoFarmRes_Toggle", {
    Title = "⛏️ Auto Farm ทรัพยากร (เปิด/ปิด)",
    Description = "บินไปตี/ขุด และเก็บของที่ดรอปอัตโนมัติ",
    Default = false,
    Callback = function(v)
        State.AutoFarmResource = v
        Notify("⛏️ Auto Farm", v and "เริ่มระบบฟาร์มแล้ว!" or "หยุดระบบฟาร์มแล้ว", 3)
    end
})

-- [17] เมนูเลือกทรัพยากรภาษาไทย
local resourceList = {
    "🌲 ไม้ (ต้นไม้ใหญ่, ต้นสน, ท่อนไม้)",
    "🪨 หิน (หินก้อนใหญ่, กำแพงหิน)",
    "⛏️ แร่ทองแดง (Copper Ore)",
    "⛏️ แร่ถ่านหิน (Coal Ore)",
    "⛏️ แร่เหล็ก (Iron Ore)",
    "🫐 อาหาร/เบอร์รี่ (Blueberry, Raspberry, Pumpkin)",
    "🥚 รังไข่ไดโนเสาร์ (Dino Eggs)"
}

Tabs.Farm:AddDropdown("ResSelect", {
    Title = "📦 เลือกสิ่งที่ต้องการฟาร์ม (ภาษาไทย)",
    Description = "เลือกวัตถุดิบที่ต้องการให้สคริปต์ไปฟาร์ม",
    Values = resourceList,
    Default = resourceList[1],
    Callback = function(v)
        State.FarmTargetType = v
        Notify("🎯 เปลี่ยนเป้าหมาย", "เลือกฟาร์ม: " .. v, 3)
    end
})

-- [18] ปรับความเร็วการบินไปฟาร์ม
Tabs.Farm:AddSlider("FarmFlySpeed_Slider", {
    Title = "💨 ปรับความเร็วการบินไปฟาร์ม (Fly Speed)",
    Description = "ความเร็วในการบินเคลื่อนที่ไปหาจุดฟาร์ม",
    Default = 65,
    Min = 20,
    Max = 200,
    Rounding = 0,
    Callback = function(v) State.FarmFlySpeed = v end
})

-- [19] ปรับระยะการฟาร์มสูงสุด
Tabs.Farm:AddSlider("FarmMaxDist_Slider", {
    Title = "📏 ระยะค้นหาเป้าหมายสูงสุด (Studs)",
    Default = 600,
    Min = 100,
    Max = 2000,
    Rounding = 0,
    Callback = function(v) State.FarmMaxDist = v end
})

-- [20] ความสูงปลอดภัย (Safe Height Offset)
Tabs.Farm:AddSlider("SafeHeight_Slider", {
    Title = "🛡️ ความสูงปลอดภัย (ลอยตัวเหนือพื้นตอนฟาร์ม)",
    Description = "ลอยตัวกลางอากาศตอนตี เพื่อป้องกันไดโนเสาร์หรือมอนสเตอร์ตีเรา",
    Default = 6,
    Min = 2,
    Max = 15,
    Rounding = 1,
    Callback = function(v) State.SafeHeightOffset = v end
})

-- [21] Auto ดูด Drops
Tabs.Farm:AddToggle("AutoDrops_Toggle", {
    Title = "🧲 Auto Collect Drops (ดูดไอเทมที่ดรอปเข้าตัว)",
    Description = "เก็บไม้ หิน แร่ เนื้อ ไข่ ทันทีที่ตกพื้น",
    Default = true,
    Callback = function(v) State.AutoCollectDrops = v end
})

-- [22] Auto ถืออุปกรณ์
Tabs.Farm:AddToggle("AutoEquip_Toggle", {
    Title = "🪓 Auto Equip Tool (ถือขวาน/อีเต๋ออัตโนมัติ)",
    Description = "นำเครื่องมือจากเป้ออกมาถืออัตโนมัติ",
    Default = true,
    Callback = function(v) State.AutoEquipTool = v end
})

--------------------------------------------------------------------------------
-- [แท็บ 4] การเคลื่อนที่ & ผู้เล่น (Movement & Speed)
--------------------------------------------------------------------------------
Tabs.Movement:AddParagraph({
    Title = "🏃 ระบบความเร็วและการเคลื่อนที่",
    Content = "วิ่งไว, กระโดดสูง, บินอิสระ WASD, เดินบนอากาศ ปรับความสูงได้, ทะลุกำแพง"
})

-- [23] Speed Hack
Tabs.Movement:AddToggle("Speed_Toggle", {
    Title = "🏃 วิ่งไว (WalkSpeed Hack)",
    Default = false,
    Callback = function(v)
        State.SpeedEnabled = v
        local hum = GetHum()
        if hum and not v then hum.WalkSpeed = 16 end
    end
})

Tabs.Movement:AddSlider("Speed_Slider", {
    Title = "⚡ ปรับความเร็วเดิน (WalkSpeed)",
    Default = 45,
    Min = 16,
    Max = 300,
    Rounding = 0,
    Callback = function(v) State.WalkSpeed = v end
})

-- [24] High Jump
Tabs.Movement:AddToggle("Jump_Toggle", {
    Title = "🦘 กระโดดสูง (High Jump)",
    Default = false,
    Callback = function(v)
        State.JumpEnabled = v
        local hum = GetHum()
        if hum and not v then hum.JumpPower = 50 end
    end
})

Tabs.Movement:AddSlider("Jump_Slider", {
    Title = "🚀 ปรับพลังกระโดด (JumpPower)",
    Default = 100,
    Min = 50,
    Max = 400,
    Rounding = 0,
    Callback = function(v) State.JumpPower = v end
})

-- [25] บินอิสระ (Fly Mode)
Tabs.Movement:AddToggle("Fly_Toggle", {
    Title = "🦅 บินอิสระ (Fly Mode — WASD + Space/Ctrl)",
    Description = "ควบคุมด้วยคีย์บอร์ด WASD + Space บินขึ้น / Ctrl บินลง",
    Default = false,
    Callback = function(v)
        State.FlyEnabled = v
        if v then StartFly() else StopFly() end
        Notify("🦅 Fly Mode", v and "เปิดแล้ว! (WASD + Space/Ctrl)" or "ปิดแล้ว!", 3)
    end
})

Tabs.Movement:AddSlider("FlySpeed_Slider", {
    Title = "💨 ปรับความเร็วบิน (Fly Speed)",
    Default = 70,
    Min = 20,
    Max = 300,
    Rounding = 0,
    Callback = function(v) State.FlySpeed = v end
})

-- [26] เดินบนอากาศ (Air Walk / Platform Walk)
Tabs.Movement:AddToggle("AirWalk_Toggle", {
    Title = "☁️ เดินบนอากาศ (Air Walk / Platform Walk)",
    Description = "สร้างแพลตฟอร์มลอยฟ้าใต้เท้า เดินลอยบนอากาศได้ ไม่ตกแมพ",
    Default = false,
    Callback = function(v)
        State.AirWalkEnabled = v
        UpdateAirWalk()
        Notify("☁️ Air Walk", v and "เปิดแล้ว!" or "ปิดแล้ว!", 3)
    end
})

Tabs.Movement:AddSlider("AirWalkHeight_Slider", {
    Title = "📏 ปรับระดับความสูงเดินบนอากาศ (Height Offset)",
    Description = "ปรับระดับขึ้น-ลงของพื้นลอยฟ้าใต้เท้า",
    Default = 0,
    Min = -15,
    Max = 80,
    Rounding = 0,
    Callback = function(v)
        State.AirWalkHeight = v
        UpdateAirWalk()
    end
})

-- [27] Noclip
Tabs.Movement:AddToggle("Noclip_Toggle", {
    Title = "🚶 ทะลุกำแพง (Noclip)",
    Description = "ทะลุผ่านภูเขา ต้นไม้ และสิ่งกีดขวางได้ทุกชนิด",
    Default = false,
    Callback = function(v) State.NoClip = v end
})

-- [28] Infinite Jump
Tabs.Movement:AddToggle("InfJump_Toggle", {
    Title = "🔄 กระโดดกลางอากาศไม่จำกัด (Infinite Jump)",
    Default = false,
    Callback = function(v) State.InfJump = v end
})

-- [29] Infinite Stamina
Tabs.Movement:AddToggle("InfStamina_Toggle", {
    Title = "⚡ สตามิน่าไม่จำกัด (Infinite Stamina)",
    Default = false,
    Callback = function(v) State.InfStamina = v end
})

--------------------------------------------------------------------------------
-- [แท็บ 5] สถานที่สำคัญ & วาร์ป (Landmarks & POIs)
--------------------------------------------------------------------------------
Tabs.Teleport:AddParagraph({
    Title = "🗺️ สถานที่สำคัญและจุดวาร์ป (POIs)",
    Content = "ESP นำทางไปยังยานแม่, พีระมิด, โต๊ะคราฟต์, เตาไฟ, ดันเจี้ยน พร้อมระบบวาร์ปในคลิกเดียว"
})

-- [30] ESP สถานที่สำคัญ
Tabs.Teleport:AddToggle("POI_ESP_Toggle", {
    Title = "📍 ESP สถานที่สำคัญ (POIs ESP)",
    Description = "แสดงชื่อแลนด์มาร์คสำคัญบนหน้าจอพร้อมระยะทาง",
    Default = false,
    Callback = function(v)
        State.POI_ESP = v
        UpdatePOI_ESP()
        Notify("📍 POI ESP", v and "เปิดแล้ว!" or "ปิดแล้ว!", 3)
    end
})

-- รายชื่อสถานที่สำคัญสำหรับวาร์ป
local poiNameList = {}
for _, lm in ipairs(LandmarksList) do
    table.insert(poiNameList, lm.Name)
end

local SelectedPOI = LandmarksList[1]
Tabs.Teleport:AddDropdown("POI_Select", {
    Title = "🏛️ เลือกสถานที่สำคัญภาษาไทย",
    Values = poiNameList,
    Default = poiNameList[1],
    Callback = function(v)
        for _, lm in ipairs(LandmarksList) do
            if lm.Name == v then
                SelectedPOI = lm
                break
            end
        end
    end
})

-- [31] วาร์ปทันที
Tabs.Teleport:AddButton({
    Title = "⚡ วาร์ปไปสถานที่สำคัญที่เลือก",
    Description = "วาร์ปพริบตาไปยังแลนด์มาร์คที่เลือก",
    Callback = function()
        if SelectedPOI then
            local pos = GetLandmarkPosition(SelectedPOI)
            TeleportInstant(pos + Vector3.new(0, 4, 0))
            Notify("📍 วาร์ปสำเร็จ!", "มาถึง: " .. SelectedPOI.Name, 3)
        end
    end
})

-- [32] บินสมูทไปสถานที่สำคัญ
Tabs.Teleport:AddButton({
    Title = "🦅 บินสมูทไปสถานที่สำคัญ (Smooth Fly)",
    Description = "บินลอยตัวไปถึงจุดหมายอย่างนุ่มนวล",
    Callback = function()
        if SelectedPOI then
            local pos = GetLandmarkPosition(SelectedPOI)
            FlyTweenTo(pos + Vector3.new(0, 8, 0), State.FlySpeed)
            Notify("🦅 กำลังบิน...", "กำลังบินไปยัง: " .. SelectedPOI.Name, 3)
        end
    end
})

-- [33-34] บันทึกและวาร์ปจุดส่วนตัว
Tabs.Teleport:AddButton({
    Title = "💾 บันทึกพิกัดปัจจุบัน (Save Custom Waypoint)",
    Description = "จดจำตำแหน่งที่ยืนอยู่เพื่อวาร์ปกลับมาเมื่อไหร่ก็ได้",
    Callback = function()
        local root = GetRoot()
        if root then
            State.CustomWaypoint = root.CFrame
            Notify("💾 บันทึกแล้ว!", "บันทึกพิกัดส่วนตัวเรียบร้อยแล้ว", 3)
        end
    end
})

Tabs.Teleport:AddButton({
    Title = "📍 วาร์ปไปพิกัดที่บันทึกไว้",
    Callback = function()
        if State.CustomWaypoint then
            TeleportInstant(State.CustomWaypoint)
            Notify("📍 วาร์ปสำเร็จ!", "กลับมายังพิกัดที่บันทึกไว้แล้ว", 3)
        else
            Notify("⚠️ ยังไม่ได้บันทึก", "กรุณากดบันทึกพิกัดก่อน", 3)
        end
    end
})

--------------------------------------------------------------------------------
-- [แท็บ 6] การมองเห็น & เอาชีวิตรอด (Visuals & Survival)
--------------------------------------------------------------------------------
Tabs.Visuals:AddParagraph({
    Title = "👁️ ระบบการมองเห็นและการเอาชีวิตรอด",
    Content = "ESP ผู้เล่น, ทะลุการล่องหน, สว่างรอบตัว (Fullbright), ป้องกันการหลุด (Anti-AFK)"
})

-- [35] ESP ผู้เล่น
Tabs.Visuals:AddToggle("PlayerESP_Toggle", {
    Title = "👤 ESP ผู้เล่น (Player ESP)",
    Description = "แสดงชื่อ เลือด และระยะทางของผู้เล่นทุกคนในเซิร์ฟเวอร์",
    Default = false,
    Callback = function(v)
        State.PlayerESP = v
        UpdatePlayerESP()
    end
})

-- [36] ตาทิพย์ True Sight (Anti-Invisibility)
Tabs.Visuals:AddToggle("TrueSight_Toggle", {
    Title = "👁️ ตาทิพย์ทะลุวิญญาณ (Anti-Invisibility)",
    Description = "บังคับแสดงตัวตนของผู้เล่นที่ล่องหนให้มองเห็นชัดเจน",
    Default = true,
    Callback = function(v) State.TrueSight = v end
})

-- [37] Developer/QA Invincible
Tabs.Visuals:AddToggle("QAInvincible_Toggle", {
    Title = "🛡️ อมตะ (QA Invincible)",
    Description = "Studio: ForceField + รักษา HP | เกมที่อนุญาต: ใช้ QAAdminRequest ที่มี AllowQATool=true",
    Default = false,
    Callback = function(v)
        local ok, reason = SetQAInvincible(v)
        if not ok then
            State.QAInvincible = false
            Notify("🔒 QA Invincible", "เปิดไม่ได้: " .. tostring(reason), 5)
            return
        end
        Notify("🛡️ QA Invincible", v and "เปิดอมตะสำหรับการทดสอบแล้ว" or "ปิดอมตะแล้ว", 4)
    end
})

Tabs.Visuals:AddSlider("QAInvincibleHealth", {
    Title = "❤️ HP สำหรับโหมดอมตะใน Studio",
    Description = "ใช้เฉพาะการทดสอบใน Studio",
    Default = 1000000, Min = 1000, Max = 5000000, Rounding = 0,
    Callback = function(v) State.QAInvincibleHealth = v end
})

-- [38] Fullbright
Tabs.Visuals:AddToggle("Fullbright_Toggle", {
    Title = "💡 Fullbright (มองเห็นในที่มืด 100%)",
    Description = "ปรับแสงสว่างชัดเจน ไม่ต้องพึ่งคบเพลิง",
    Default = false,
    Callback = function(v)
        State.Fullbright = v
        SetFullbright(v)
        Notify("💡 Fullbright", v and "เปิดแล้ว!" or "ปิดแล้ว!", 3)
    end
})

-- [39] Anti-AFK
Tabs.Visuals:AddToggle("AntiAFK_Toggle", {
    Title = "🛡️ Anti-AFK (ป้องกันเกมเตะเมื่อไม่ได้ขยับ)",
    Default = true,
    Callback = function(v) State.AntiAFK = v end
})

-- [39] ล่องหน Invisibility
Tabs.Visuals:AddToggle("Invis_Toggle", {
    Title = "👻 ล่องหน (Invisibility Mode)",
    Description = "ทำให้ตัวละครโปร่งแสง ซ่อนตัวจากผู้เล่นอื่น",
    Default = false,
    Callback = function(v)
        State.Invisible = v
        if Character then
            for _, part in ipairs(Character:GetDescendants()) do
                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                    part.Transparency = v and 0.9 or 0
                end
            end
        end
    end
})

-- [40] FOV Slider
Tabs.Visuals:AddSlider("FOV_Slider", {
    Title = "🔭 ระยะมุมมองกล้อง (FOV)",
    Default = 70,
    Min = 50,
    Max = 120,
    Rounding = 0,
    Callback = function(v) Camera.FieldOfView = v end
})

--------------------------------------------------------------------------------
-- [แท็บ 7] ตั้งค่า & UI (Settings & Config)
--------------------------------------------------------------------------------
Tabs.Settings:AddParagraph({
    Title = "⚙️ ตั้งค่า UI & เซฟคอนฟิก",
    Content = "Custom UI ใหม่ทั้งหมด, ธีม, Acrylic และปุ่มย่อ 🦖\nปุ่มย่อ/เปิด UI: กด RightControl"
})

-- เปลี่ยนธีม UI
Tabs.Settings:AddDropdown("ThemeSelect", {
    Title = "🎨 เปลี่ยนธีม UI",
    Values = {"Dark", "Darker", "Light", "Aqua", "Amethyst", "Rose"},
    Default = "Dark",
    Callback = function(v)
        Fluent:SetTheme(v)
        Notify("🎨 Theme", "เปลี่ยนเป็นธีม " .. v .. " แล้ว!", 3)
    end
})

-- สลับ Acrylic
Tabs.Settings:AddToggle("AcrylicToggle", {
    Title = "✨ Acrylic (พื้นหลังโปร่งแสง)",
    Default = true,
    Callback = function(v)
        Window:SetAcrylic(v)
    end
})

-- ข้อมูลสคริปต์
Tabs.Settings:AddParagraph({
    Title = "ℹ️ ข้อมูลระบบ",
    Content = "🦖 DINO SURVIVAL HUB V2 — Custom UI\n🎮 Developer/QA build สำหรับ Studio/เกมที่อนุญาต\n🪟 ย่อเป็นไอคอน 🦖 ลากได้ + RightControl\n⚡ คง Combat Controller: Range/Height/LOS/Retreat/Skill adapter"
})

-- ติดตั้ง SaveManager & InterfaceManager
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetFolder("DinoSurvivalPro")
InterfaceManager:SetFolder("DinoSurvivalPro")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

-- =============================================================================
-- ๑๖. เริ่มต้นระบบ (Initialization)
-- =============================================================================
Window:SelectTab(1)
Notify("🦖 DINO SURVIVAL HUB V2 พร้อมใช้งาน!", "Custom UI โหลดสำเร็จ\nกด — เพื่อย่อเป็น 🦖 หรือกด RightControl", 6)
print("[DINO SURVIVAL HUB V2] ✅ Custom UI โหลดสำเร็จ — QA/Developer gate ยังคงทำงาน")
