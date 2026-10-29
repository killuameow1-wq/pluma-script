-- Pluma UI v19.3.18 combined | Military Army Tycoon | Delta
if not game:IsLoaded() then game.Loaded:Wait() end
task.wait(1)
getgenv().Pluma = {}

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local VirtualUser = game:GetService("VirtualUser")
local VIM = game:GetService("VirtualInputManager")

local player = Players.LocalPlayer
if not player then return end

for _, name in ipairs({"PlumaTest","PlumaUI","PlumaUIv9","PlumaUIv10","PlumaUIv11","PlumaUIv12","PlumaUIv13","PlumaUIv14","PlumaUIv15","PlumaUIv16","PlumaUIv17","PlumaUIv18","PlumaLite","PlumaV19","PlumaV193","PlumaV1931","PlumaV1932","PlumaV1933","PlumaV1934","PlumaV1935","PlumaV1936","PlumaV1937","PlumaV1938","PlumaV1939","PlumaV19310","PlumaV19311","PlumaV19312","PlumaV19313","PlumaV19314","PlumaV19315","PlumaV19316","PlumaV19317","PlumaV19318"}) do
    local old = player.PlayerGui:FindFirstChild(name)
    if old then old:Destroy() end
end

local plumaGui = Instance.new("ScreenGui")
plumaGui.Name = "PlumaUI"
plumaGui.ResetOnSpawn = false
plumaGui.IgnoreGuiInset = true
plumaGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
plumaGui.DisplayOrder = 999
plumaGui.Parent = player.PlayerGui

local Config = {
    aimOn=false, wallCheck=true, smartTargets=true, autoPriority=true, aimMemory=true,
    torsoFallback=true, adaptiveSmooth=true, triggerBot=false, autoReload=false, aimVehicles=false,
    aimPreset="fast",
    boxEsp=false, lineEsp=false, nickEsp=false, hpBar=true, adminEsp=true,
    botEsp=true, tracer=false, chams=false, distEsp=false, lootEsp=false, teamCheck=true, zoneEsp=false,
    fullbright=false, noFog=false, noclip=false,
    autoBuy=false, autoQuest=false, fastInteract=false,
    autoClicker=false, autoCollect=false, autoRebirth=false, autoEquipBest=false,
    lootBaseRadius=250, lootDrawRadius=400, autoOpenShop=true,
    antiRagdoll=false, antiAfk=false, antiKick=true, autoRejoin=false, webhookUrl=""
}

local C = {
    bg=Color3.fromRGB(18,18,26), side=Color3.fromRGB(24,24,34), card=Color3.fromRGB(32,32,44),
    accent=Color3.fromRGB(150,100,255), accent2=Color3.fromRGB(0,210,180),
    text=Color3.fromRGB(235,235,245), sub=Color3.fromRGB(130,130,150),
    btn=Color3.fromRGB(40,40,54), btnHov=Color3.fromRGB(56,56,72), danger=Color3.fromRGB(230,70,70),
    toggleOn=Color3.fromRGB(150,100,255), zoneNear=Color3.fromRGB(100,255,150), zoneFar=Color3.fromRGB(100,180,255),
    xp=Color3.fromRGB(255,200,0), purple=Color3.fromRGB(180,100,255), green=Color3.fromRGB(100,255,120),
    red=Color3.fromRGB(255,50,50), bot=Color3.fromRGB(100,200,255),
    hpGood=Color3.fromRGB(100,255,120), hpMid=Color3.fromRGB(255,200,0), hpBad=Color3.fromRGB(255,80,80),
    loot=Color3.fromRGB(255,215,0)
}

local function toast(title, desc)
    local t = Instance.new("Frame"); t.Size = UDim2.new(0,240,0,56); t.Position = UDim2.new(1,-260,0,50)
    t.BackgroundColor3 = C.side; t.BorderSizePixel = 0; t.Parent = plumaGui
    local tc = Instance.new("UICorner"); tc.CornerRadius = UDim.new(0,8); tc.Parent = t
    local ts = Instance.new("UIStroke"); ts.Color = C.accent; ts.Thickness = 1; ts.Parent = t
    local tl = Instance.new("TextLabel"); tl.Size = UDim2.new(1,-16,0,20); tl.Position = UDim2.new(0,8,0,6); tl.BackgroundTransparency = 1; tl.Text = title; tl.TextColor3 = C.accent; tl.TextSize = 12; tl.Font = Enum.Font.GothamBold; tl.TextXAlignment = Enum.TextXAlignment.Left; tl.Parent = t
    local td = Instance.new("TextLabel"); td.Size = UDim2.new(1,-16,0,24); td.Position = UDim2.new(0,8,0,26); td.BackgroundTransparency = 1; td.Text = desc; td.TextColor3 = C.text; td.TextSize = 10; td.Font = Enum.Font.Gotham; td.TextXAlignment = Enum.TextXAlignment.Left; td.TextWrapped = true; td.Parent = t
    task.delay(3.5, function() t:Destroy() end)
end

local fab = Instance.new("TextButton"); fab.Size = UDim2.new(0,52,0,52); fab.Position = UDim2.new(0,20,0,120)
fab.BackgroundColor3 = C.accent; fab.Text = "◆"; fab.TextColor3 = C.text; fab.TextSize = 22; fab.Font = Enum.Font.GothamBold; fab.AutoButtonColor = false; fab.Visible = false; fab.Parent = plumaGui
local fc = Instance.new("UICorner"); fc.CornerRadius = UDim.new(1,0); fc.Parent = fab

local watermark = Instance.new("Frame"); watermark.Size = UDim2.new(0,200,0,26); watermark.Position = UDim2.new(1,-220,0,16); watermark.BackgroundColor3 = C.side; watermark.BorderSizePixel = 0; watermark.Parent = plumaGui
local wmc = Instance.new("UICorner"); wmc.CornerRadius = UDim.new(0,7); wmc.Parent = watermark
local wms = Instance.new("UIStroke"); wms.Color = C.accent; wms.Thickness = 1; wms.Transparency = 0.5; wms.Parent = watermark
local wmLabel = Instance.new("TextLabel"); wmLabel.Size = UDim2.new(1,-12,1,0); wmLabel.Position = UDim2.new(0,8,0,0); wmLabel.BackgroundTransparency = 1; wmLabel.Text = "Pluma v19.3.18"; wmLabel.TextColor3 = C.text; wmLabel.TextSize = 10; wmLabel.Font = Enum.Font.GothamBold; wmLabel.TextXAlignment = Enum.TextXAlignment.Left; wmLabel.Parent = watermark

local main = Instance.new("Frame"); main.Size = UDim2.new(0,470,0,440); main.Position = UDim2.new(0,60,0,60); main.BackgroundColor3 = C.bg; main.BorderSizePixel = 0; main.Active = true; main.ClipsDescendants = true; main.Parent = plumaGui
local mc = Instance.new("UICorner"); mc.CornerRadius = UDim.new(0,16); mc.Parent = main
local ms = Instance.new("UIStroke"); ms.Color = C.side; ms.Thickness = 1.5; ms.Parent = main

task.spawn(function()
    while main.Parent do
        local vp = Workspace.CurrentCamera and Workspace.CurrentCamera.ViewportSize or Vector2.new(800,600)
        if vp.X < 520 then local s = vp.X/500; main.Size = UDim2.new(0, math.floor(470*s), 0, math.floor(440*s)) end
        task.wait(1)
    end
end)

local header = Instance.new("Frame"); header.Size = UDim2.new(1,0,0,48); header.BackgroundColor3 = C.side; header.BorderSizePixel = 0; header.Parent = main
local hc = Instance.new("UICorner"); hc.CornerRadius = UDim.new(0,16); hc.Parent = header
local hFix = Instance.new("Frame"); hFix.Size = UDim2.new(1,0,0,16); hFix.Position = UDim2.new(0,0,1,-16); hFix.BackgroundColor3 = C.side; hFix.BorderSizePixel = 0; hFix.Parent = header
local hTitle = Instance.new("TextLabel"); hTitle.Size = UDim2.new(0,120,1,0); hTitle.Position = UDim2.new(0,20,0,0); hTitle.BackgroundTransparency = 1; hTitle.Text = "PLUMA v19.3.18"; hTitle.TextColor3 = C.text; hTitle.TextSize = 15; hTitle.Font = Enum.Font.GothamBold; hTitle.TextXAlignment = Enum.TextXAlignment.Left; hTitle.Parent = header

local searchBox = Instance.new("Frame"); searchBox.Size = UDim2.new(0,160,0,28); searchBox.Position = UDim2.new(0,160,0.5,-14); searchBox.BackgroundColor3 = C.card; searchBox.BorderSizePixel = 0; searchBox.Parent = header
local sbc = Instance.new("UICorner"); sbc.CornerRadius = UDim.new(0,7); sbc.Parent = searchBox
local searchInput = Instance.new("TextBox"); searchInput.Size = UDim2.new(1,-16,1,0); searchInput.Position = UDim2.new(0,8,0,0); searchInput.BackgroundTransparency = 1; searchInput.PlaceholderText = "поиск..."; searchInput.PlaceholderColor3 = C.sub; searchInput.Text = ""; searchInput.TextColor3 = C.text; searchInput.TextSize = 11; searchInput.Font = Enum.Font.Gotham; searchInput.TextXAlignment = Enum.TextXAlignment.Left; searchInput.ClearTextOnFocus = false; searchInput.Parent = searchBox

local closeBtn = Instance.new("TextButton"); closeBtn.Size = UDim2.new(0,28,0,28); closeBtn.Position = UDim2.new(1,-38,0.5,-14); closeBtn.BackgroundColor3 = C.card; closeBtn.Text = "✕"; closeBtn.TextColor3 = C.text; closeBtn.TextSize = 14; closeBtn.Font = Enum.Font.GothamBold; closeBtn.AutoButtonColor = false; closeBtn.Parent = header
local cc = Instance.new("UICorner"); cc.CornerRadius = UDim.new(0,7); cc.Parent = closeBtn

local sidebar = Instance.new("ScrollingFrame")
sidebar.Size = UDim2.new(0,90,1,-48); sidebar.Position = UDim2.new(0,0,0,48); sidebar.BackgroundColor3 = C.side; sidebar.BorderSizePixel = 0
sidebar.ScrollBarThickness = 0; sidebar.CanvasSize = UDim2.new(0,0,0,0); sidebar.AutomaticCanvasSize = Enum.AutomaticSize.Y
sidebar.ScrollingDirection = Enum.ScrollingDirection.Y; sidebar.Parent = main
local sideLayout = Instance.new("UIListLayout"); sideLayout.Padding = UDim.new(0,4); sideLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center; sideLayout.SortOrder = Enum.SortOrder.LayoutOrder; sideLayout.Parent = sidebar
local sidePadding = Instance.new("UIPadding"); sidePadding.PaddingTop = UDim.new(0,10); sidePadding.PaddingBottom = UDim.new(0,10); sidePadding.Parent = sidebar

local tabButtons, pages = {}, {}
local function switchTab(name)
    for tn, btn in pairs(tabButtons) do
        btn.BackgroundColor3 = (tn == name) and C.accent or Color3.fromRGB(0,0,0,0)
        btn.TextColor3 = (tn == name) and C.text or C.sub
    end
    for pn, page in pairs(pages) do page.Visible = (pn == name) end
    local btn = tabButtons[name]
    if btn and sidebar then sidebar.CanvasPosition = Vector2.new(0, math.max(0, btn.AbsolutePosition.Y - sidebar.AbsolutePosition.Y - 40)) end
end

local function createTab(name, icon, displayName, order)
    local btn = Instance.new("TextButton"); btn.Size = UDim2.new(0,74,0,44); btn.BackgroundColor3 = Color3.fromRGB(0,0,0,0); btn.Text = icon .. "\n" .. displayName; btn.TextColor3 = C.sub; btn.TextSize = 9; btn.Font = Enum.Font.GothamMedium; btn.AutoButtonColor = false; btn.LayoutOrder = order; btn.Parent = sidebar
    local bc = Instance.new("UICorner"); bc.CornerRadius = UDim.new(0,8); bc.Parent = btn
    btn.MouseButton1Click:Connect(function() switchTab(name) end)
    tabButtons[name] = btn
end

local content = Instance.new("Frame"); content.Size = UDim2.new(1,-100,1,-84); content.Position = UDim2.new(0,96,0,54); content.BackgroundTransparency = 1; content.Parent = main

local function createPage(name)
    local scroll = Instance.new("ScrollingFrame"); scroll.Size = UDim2.new(1,0,1,0); scroll.BackgroundTransparency = 1; scroll.ScrollBarThickness = 3; scroll.ScrollBarImageColor3 = C.accent; scroll.CanvasSize = UDim2.new(0,0,0,0); scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y; scroll.Visible = false; scroll.Parent = content
    local l = Instance.new("UIListLayout"); l.Padding = UDim.new(0,6); l.SortOrder = Enum.SortOrder.LayoutOrder; l.Parent = scroll
    pages[name] = scroll
    return scroll
end

local statusBar = Instance.new("Frame"); statusBar.Size = UDim2.new(1,-20,0,26); statusBar.Position = UDim2.new(0,10,1,-34); statusBar.BackgroundColor3 = C.side; statusBar.BorderSizePixel = 0; statusBar.Parent = main
local sbc2 = Instance.new("UICorner"); sbc2.CornerRadius = UDim.new(0,7); sbc2.Parent = statusBar
local dot = Instance.new("Frame"); dot.Size = UDim2.new(0,6,0,6); dot.Position = UDim2.new(0,12,0.5,-3); dot.BackgroundColor3 = C.accent; dot.BorderSizePixel = 0; dot.Parent = statusBar
local dc = Instance.new("UICorner"); dc.CornerRadius = UDim.new(1,0); dc.Parent = dot
local st = Instance.new("TextLabel"); st.Size = UDim2.new(1,-34,1,0); st.Position = UDim2.new(0,26,0,0); st.BackgroundTransparency = 1; st.Text = "готов"; st.TextColor3 = C.sub; st.TextSize = 10; st.Font = Enum.Font.Gotham; st.TextXAlignment = Enum.TextXAlignment.Left; st.Parent = statusBar
local function setStatus(txt, err) st.Text = txt; dot.BackgroundColor3 = err and C.danger or C.accent end

local function draggable(frame, handle)
    local dragging, dragInput, dragStart, startPos
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true; dragStart = input.Position; startPos = frame.Position
            input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
        end
    end)
    handle.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end end)
    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset+delta.X, startPos.Y.Scale, startPos.Y.Offset+delta.Y)
        end
    end)
end
draggable(main, header); draggable(fab, fab); draggable(watermark, watermark)

local function addSection(parent, text, order)
    local lbl = Instance.new("TextLabel"); lbl.Size = UDim2.new(1,0,0,16); lbl.BackgroundTransparency = 1; lbl.Text = text; lbl.TextColor3 = C.accent; lbl.TextSize = 9; lbl.Font = Enum.Font.GothamBold; lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.LayoutOrder = order; lbl.Parent = parent
end

local toggleWidgets = {}
local function makeToggle(parent, key, icon, text, order, cb)
    local btn = Instance.new("TextButton"); btn.Size = UDim2.new(1,0,0,36); btn.BackgroundColor3 = C.card; btn.Text = ""; btn.AutoButtonColor = false; btn.LayoutOrder = order; btn.Parent = parent
    local bc = Instance.new("UICorner"); bc.CornerRadius = UDim.new(0,10); bc.Parent = btn
    local ic = Instance.new("TextLabel"); ic.Size = UDim2.new(0,22,0,22); ic.Position = UDim2.new(0,8,0.5,-11); ic.BackgroundColor3 = C.btn; ic.Text = icon; ic.TextColor3 = C.accent; ic.TextSize = 12; ic.Font = Enum.Font.GothamBold; ic.Parent = btn
    local icc = Instance.new("UICorner"); icc.CornerRadius = UDim.new(1,0); icc.Parent = ic
    local lbl = Instance.new("TextLabel"); lbl.Size = UDim2.new(1,-84,1,0); lbl.Position = UDim2.new(0,38,0,0); lbl.BackgroundTransparency = 1; lbl.Text = text; lbl.TextColor3 = C.text; lbl.TextSize = 11; lbl.Font = Enum.Font.GothamMedium; lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.Parent = btn
    local track = Instance.new("Frame"); track.Size = UDim2.new(0,30,0,16); track.Position = UDim2.new(1,-42,0.5,-8); track.BackgroundColor3 = C.btnHov; track.BorderSizePixel = 0; track.Parent = btn
    local tc = Instance.new("UICorner"); tc.CornerRadius = UDim.new(1,0); tc.Parent = track
    local knob = Instance.new("Frame"); knob.Size = UDim2.new(0,12,0,12); knob.Position = UDim2.new(0,2,0.5,-6); knob.BackgroundColor3 = C.text; knob.BorderSizePixel = 0; knob.Parent = track
    local kc = Instance.new("UICorner"); kc.CornerRadius = UDim.new(1,0); kc.Parent = knob
    local state = Config[key] or false
    local function refresh()
        track.BackgroundColor3 = state and C.toggleOn or C.btnHov
        knob.Position = state and UDim2.new(1,-14,0.5,-6) or UDim2.new(0,2,0.5,-6)
    end
    refresh()
    btn.MouseButton1Click:Connect(function() state = not state; Config[key] = state; refresh(); if cb then cb(state) end end)
    btn:SetAttribute("SearchText", text:lower())
    toggleWidgets[key] = {btn=btn, set=function(v) state=v; Config[key]=v; refresh(); if cb then cb(v) end end}
    return btn
end

local function makeAction(parent, icon, text, order, cb)
    local btn = Instance.new("TextButton"); btn.Size = UDim2.new(1,0,0,36); btn.BackgroundColor3 = C.card; btn.Text = ""; btn.AutoButtonColor = false; btn.LayoutOrder = order; btn.Parent = parent
    local bc = Instance.new("UICorner"); bc.CornerRadius = UDim.new(0,10); bc.Parent = btn
    local ic = Instance.new("TextLabel"); ic.Size = UDim2.new(0,22,0,22); ic.Position = UDim2.new(0,8,0.5,-11); ic.BackgroundColor3 = C.btn; ic.Text = icon; ic.TextColor3 = C.accent; ic.TextSize = 12; ic.Font = Enum.Font.GothamBold; ic.Parent = btn
    local icc = Instance.new("UICorner"); icc.CornerRadius = UDim.new(1,0); icc.Parent = ic
    local lbl = Instance.new("TextLabel"); lbl.Size = UDim2.new(1,-46,1,0); lbl.Position = UDim2.new(0,38,0,0); lbl.BackgroundTransparency = 1; lbl.Text = text; lbl.TextColor3 = C.text; lbl.TextSize = 11; lbl.Font = Enum.Font.GothamMedium; lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.Parent = btn
    btn.MouseEnter:Connect(function() btn.BackgroundColor3 = C.btnHov end)
    btn.MouseLeave:Connect(function() btn.BackgroundColor3 = C.card end)
    btn.MouseButton1Click:Connect(cb)
    btn:SetAttribute("SearchText", text:lower())
    return btn
end

local function makeInput(parent, text, placeholder, order, cb)
    local wrap = Instance.new("Frame"); wrap.Size = UDim2.new(1,0,0,42); wrap.BackgroundColor3 = C.card; wrap.BorderSizePixel = 0; wrap.LayoutOrder = order; wrap.Parent = parent
    local wc = Instance.new("UICorner"); wc.CornerRadius = UDim.new(0,10); wc.Parent = wrap
    local lbl = Instance.new("TextLabel"); lbl.Size = UDim2.new(1,-16,0,16); lbl.Position = UDim2.new(0,8,0,4); lbl.BackgroundTransparency = 1; lbl.Text = text; lbl.TextColor3 = C.sub; lbl.TextSize = 10; lbl.Font = Enum.Font.Gotham; lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.Parent = wrap
    local input = Instance.new("TextBox"); input.Size = UDim2.new(1,-16,0,18); input.Position = UDim2.new(0,8,0,20); input.BackgroundTransparency = 1; input.PlaceholderText = placeholder; input.PlaceholderColor3 = C.sub; input.Text = ""; input.TextColor3 = C.text; input.TextSize = 11; input.Font = Enum.Font.Gotham; input.TextXAlignment = Enum.TextXAlignment.Left; input.ClearTextOnFocus = false; input.Parent = wrap
    input.FocusLost:Connect(function() cb(input.Text) end)
    return wrap
end

searchInput:GetPropertyChangedSignal("Text"):Connect(function()
    local q = searchInput.Text:lower()
    for _, page in pairs(pages) do
        for _, child in ipairs(page:GetChildren()) do
            if child:IsA("TextButton") then
                local s = child:GetAttribute("SearchText") or ""
                child.Visible = (q == "") or s:find(q,1,true) ~= nil
            end
        end
    end
end)

local basePos = nil
task.spawn(function()
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart", 10)
    if hrp then basePos = hrp.Position end
end)

local function getBasePos()
    if basePos then return basePos end
    local char = player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if hrp then basePos = hrp.Position end
    return basePos
end

local function SafeTeleport(targetCFrame, character)
    if not character then return false end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end
    pcall(function() hrp.AssemblyLinearVelocity = Vector3.zero; hrp.AssemblyAngularVelocity = Vector3.zero end)
    local offset = Vector3.new(math.random(-3,3), 3, math.random(-3,3))
    local finalPos = targetCFrame.Position + offset
    local bp = Instance.new("BodyPosition"); bp.MaxForce = Vector3.new(1e6,1e6,1e6); bp.Position = finalPos; bp.P = 10000; bp.D = 500; bp.Parent = hrp
    local t0 = tick()
    while (hrp.Position - finalPos).Magnitude > 5 and tick() - t0 < 2 do task.wait(0.05) end
    bp:Destroy()
    pcall(function() hrp.CFrame = CFrame.new(finalPos) end)
    return true
end

local zoneCache = {list={}, time=0}
local function getZones()
    if tick() - zoneCache.time < 2 and #zoneCache.list > 0 then return zoneCache.list end
    local zones = {}
    local bp = getBasePos()
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("BasePart") or obj:IsA("Model") then
            local n = obj.Name:lower()
            if n:find("flag") or n:find("zone") or n:find("capture") or n:find("outpost") or n:find("point") or n:find("base") or n:find("spawn") then
                local pos
                if obj:IsA("BasePart") then pos = obj.Position
                elseif obj.PrimaryPart then pos = obj.PrimaryPart.Position
                else local p = obj:FindFirstChildWhichIsA("BasePart"); if p then pos = p.Position end end
                if pos then
                    local isBase = false
                    if bp and (pos - bp).Magnitude < 50 then isBase = true end
                    if not isBase then table.insert(zones, {obj=obj, pos=pos, name=obj.Name}) end
                end
            end
        end
    end
    zoneCache.list = zones; zoneCache.time = tick()
    return zones
end

local zoneFolder = Instance.new("Folder"); zoneFolder.Name = "PlumaZoneESP"; zoneFolder.Parent = Workspace
local function clearZoneESP() for _, v in ipairs(zoneFolder:GetChildren()) do v:Destroy() end end
local function refreshZoneESP()
    clearZoneESP()
    if not Config.zoneEsp then return end
    local char = player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    for _, z in ipairs(getZones()) do
        local dist = math.floor((z.pos - hrp.Position).Magnitude)
        if dist <= 1000 then
            local ad = z.obj:IsA("BasePart") and z.obj or (z.obj.PrimaryPart or z.obj:FindFirstChildWhichIsA("BasePart"))
            if ad then
                local bill = Instance.new("BillboardGui"); bill.Size = UDim2.new(0,140,0,32); bill.StudsOffset = Vector3.new(0,8,0); bill.Adornee = ad; bill.AlwaysOnTop = true; bill.Parent = zoneFolder
                local bg = Instance.new("Frame"); bg.Size = UDim2.new(1,0,1,0); bg.BackgroundColor3 = C.bg; bg.BackgroundTransparency = 0.2; bg.BorderSizePixel = 0; bg.Parent = bill
                local bgc = Instance.new("UICorner"); bgc.CornerRadius = UDim.new(0,6); bgc.Parent = bg
                local nl = Instance.new("TextLabel"); nl.Size = UDim2.new(1,0,0.55,0); nl.BackgroundTransparency = 1; nl.Text = z.name; nl.TextColor3 = dist < 120 and C.zoneNear or C.zoneFar; nl.TextSize = 10; nl.Font = Enum.Font.GothamBold; nl.Parent = bill
                local il = Instance.new("TextLabel"); il.Size = UDim2.new(1,0,0.45,0); il.Position = UDim2.new(0,0,0.55,0); il.BackgroundTransparency = 1; il.Text = dist .. " studs"; il.TextColor3 = C.sub; il.TextSize = 9; il.Font = Enum.Font.Gotham; il.Parent = bill
            end
        end
    end
end

local espDrawings, adminHighlights, chamHighlights, botESP, lootESP = {}, {}, {}, {}, {}
local espMissing = {}
local lootCache = {models={}, time=0}
local zoneRefreshTimer = 0

local function isAdmin(plr)
    if plr == player then return false end
    local name = plr.Name:lower()
    if name:find("admin") or name:find("owner") or name:find("mod") or name:find("creator") then return true end
    local aa = plr:GetAttribute("Admin") or plr:GetAttribute("IsAdmin") or plr:GetAttribute("Owner")
    if aa == true then return true end
    local ok, rank = pcall(function() return plr:GetRankInGroup(0) end)
    if ok and rank and rank >= 250 then return true end
    return false
end

local function isSameTeam(plr)
    if not Config.teamCheck then return false end
    if player.Team and plr.Team and player.Team == plr.Team then return true end
    return false
end

local function getXP(plr)
    local stats = plr:FindFirstChild("leaderstats")
    if stats then
        for _, v in ipairs(stats:GetChildren()) do
            local n = v.Name:lower()
            if n == "level" or n == "xp" or n == "lvl" then return v.Name .. ": " .. tostring(v.Value) end
        end
    end
end

local function getHPColor(ratio)
    if ratio > 0.5 then return C.hpGood elseif ratio > 0.25 then return C.hpMid else return C.hpBad end
end

local function createESP(plr)
    if plr == player or espDrawings[plr] then return end
    if isSameTeam(plr) then return end
    local char = plr.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Head")
    if not hrp then return end
    local admin = isAdmin(plr)
    local data = {isAdmin=admin}
    local box = Drawing.new("Square"); box.Thickness = admin and 2 or 1; box.Color = admin and C.red or C.purple; box.Filled = false; box.Visible = false
    data.box = box
    local hpBg = Drawing.new("Square"); hpBg.Thickness = 0; hpBg.Color = Color3.fromRGB(30,30,40); hpBg.Filled = true; hpBg.Visible = false
    local hpFill = Drawing.new("Square"); hpFill.Thickness = 0; hpFill.Color = C.hpGood; hpFill.Filled = true; hpFill.Visible = false
    data.hpBg = hpBg; data.hpFill = hpFill
    local lineTo = Drawing.new("Line"); lineTo.Thickness = 1.5; lineTo.Color = C.purple; lineTo.Visible = false; data.lineToPlayer = lineTo
    local tracer = Drawing.new("Line"); tracer.Thickness = 1.2; tracer.Color = Color3.fromRGB(255,160,60); tracer.Visible = false; data.tracer = tracer
    local nickBill = Instance.new("BillboardGui"); nickBill.Size = UDim2.new(0,150,0,16); nickBill.StudsOffset = Vector3.new(0,3.8,0); nickBill.Adornee = hrp; nickBill.AlwaysOnTop = true; nickBill.Enabled = false; nickBill.Parent = plumaGui
    local nl = Instance.new("TextLabel"); nl.Size = UDim2.new(1,0,1,0); nl.BackgroundTransparency = 1; nl.Text = (admin and "[ADMIN] " or "") .. plr.Name; nl.TextColor3 = admin and C.red or C.green; nl.TextSize = 10; nl.Font = Enum.Font.GothamBold; nl.TextStrokeTransparency = 0.5; nl.Parent = nickBill
    data.nickBill = nickBill
    local xpBill = Instance.new("BillboardGui"); xpBill.Size = UDim2.new(0,160,0,16); xpBill.StudsOffset = Vector3.new(0,2.8,0); xpBill.Adornee = hrp; xpBill.AlwaysOnTop = true; xpBill.Enabled = false; xpBill.Parent = plumaGui
    local xpLbl = Instance.new("TextLabel"); xpLbl.Size = UDim2.new(1,0,1,0); xpLbl.BackgroundTransparency = 1; xpLbl.Text = ""; xpLbl.TextColor3 = C.xp; xpLbl.TextSize = 10; xpLbl.Font = Enum.Font.GothamBold; xpLbl.Parent = xpBill
    data.xpBill = xpBill; data.xpLbl = xpLbl
    local distBill = Instance.new("BillboardGui"); distBill.Size = UDim2.new(0,100,0,14); distBill.StudsOffset = Vector3.new(0,4.6,0); distBill.Adornee = hrp; distBill.AlwaysOnTop = true; distBill.Enabled = false; distBill.Parent = plumaGui
    local distLbl = Instance.new("TextLabel"); distLbl.Size = UDim2.new(1,0,1,0); distLbl.BackgroundTransparency = 1; distLbl.Text = ""; distLbl.TextColor3 = C.sub; distLbl.TextSize = 9; distLbl.Font = Enum.Font.GothamBold; distLbl.Parent = distBill
    data.distBill = distBill; data.distLbl = distLbl
    if admin and Config.adminEsp then
        local hl = Instance.new("Highlight"); hl.FillColor = C.red; hl.FillTransparency = 0.5; hl.OutlineColor = C.red; hl.OutlineTransparency = 0; hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop; hl.Adornee = char; hl.Parent = char; adminHighlights[plr] = hl
    end
    if Config.chams then
        local h = Instance.new("Highlight"); h.FillColor = C.purple; h.FillTransparency = 0.6; h.OutlineColor = C.purple; h.OutlineTransparency = 0; h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop; h.Adornee = char; h.Parent = char; chamHighlights[plr] = h
    end
    espDrawings[plr] = data
    espMissing[plr] = nil
end

local function destroyESP(plr)
    local d = espDrawings[plr]
    if not d then return end
    if d.box then d.box:Remove() end
    if d.lineToPlayer then d.lineToPlayer:Remove() end
    if d.tracer then d.tracer:Remove() end
    if d.hpBg then d.hpBg:Remove() end
    if d.hpFill then d.hpFill:Remove() end
    if d.nickBill then d.nickBill:Destroy() end
    if d.xpBill then d.xpBill:Destroy() end
    if d.distBill then d.distBill:Destroy() end
    espDrawings[plr] = nil
    espMissing[plr] = nil
end

local function clearPlayerESP()
    for plr, _ in pairs(espDrawings) do destroyESP(plr) end
    table.clear(espDrawings); table.clear(espMissing)
    for _, h in pairs(adminHighlights) do if h and h.Parent then h:Destroy() end end
    for _, h in pairs(chamHighlights) do if h and h.Parent then h:Destroy() end end
    table.clear(adminHighlights); table.clear(chamHighlights)
end

local function clearBotESP()
    for _, d in pairs(botESP) do
        if d.box then d.box:Remove() end
        if d.hpBg then d.hpBg:Remove() end
        if d.hpFill then d.hpFill:Remove() end
        if d.nick then d.nick:Destroy() end
    end
    table.clear(botESP)
end

local function clearLootESP()
    for _, d in pairs(lootESP) do
        if d.box then d.box:Remove() end
        if d.line then d.line:Remove() end
        if d.nick then d.nick:Destroy() end
        if d.dist then d.dist:Destroy() end
    end
    table.clear(lootESP)
end

local function createBotESP(model)
    if botESP[model] then return end
    local head = model:FindFirstChild("Head"); local hrp = model:FindFirstChild("HumanoidRootPart")
    if not head or not hrp then return end
    local box = Drawing.new("Square"); box.Thickness = 1; box.Color = C.bot; box.Filled = false; box.Visible = false
    local hpBg = Drawing.new("Square"); hpBg.Thickness = 0; hpBg.Color = Color3.fromRGB(30,30,40); hpBg.Filled = true; hpBg.Visible = false
    local hpFill = Drawing.new("Square"); hpFill.Thickness = 0; hpFill.Color = C.hpGood; hpFill.Filled = true; hpFill.Visible = false
    local nickBill = Instance.new("BillboardGui"); nickBill.Size = UDim2.new(0,120,0,14); nickBill.StudsOffset = Vector3.new(0,3.5,0); nickBill.Adornee = head; nickBill.AlwaysOnTop = true; nickBill.Parent = plumaGui
    local nl = Instance.new("TextLabel"); nl.Size = UDim2.new(1,0,1,0); nl.BackgroundTransparency = 1; nl.Text = "[BOT] " .. model.Name; nl.TextColor3 = C.bot; nl.TextSize = 10; nl.Font = Enum.Font.GothamBold; nl.TextStrokeTransparency = 0.4; nl.Parent = nickBill
    botESP[model] = {box=box, hpBg=hpBg, hpFill=hpFill, nick=nickBill, head=head}
end

local function createLootESP(model, part)
    if lootESP[model] then return end
    local box = Drawing.new("Square"); box.Thickness = 2; box.Color = C.loot; box.Filled = false; box.Visible = false
    local line = Drawing.new("Line"); line.Thickness = 1.5; line.Color = C.loot; line.Visible = false
    
    local nickBill = Instance.new("BillboardGui"); nickBill.Size = UDim2.new(0,160,0,20); nickBill.StudsOffset = Vector3.new(0,2.5,0); nickBill.Adornee = part; nickBill.AlwaysOnTop = true; nickBill.Parent = plumaGui
    local nl = Instance.new("TextLabel"); nl.Size = UDim2.new(1,0,1,0); nl.BackgroundTransparency = 1; nl.Text = "★ " .. model.Name; nl.TextColor3 = C.loot; nl.TextSize = 12; nl.Font = Enum.Font.GothamBold; nl.TextStrokeTransparency = 0.4; nl.Parent = nickBill
    
    local distBill = Instance.new("BillboardGui"); distBill.Size = UDim2.new(0,100,0,14); distBill.StudsOffset = Vector3.new(0,1.5,0); distBill.Adornee = part; distBill.AlwaysOnTop = true; distBill.Parent = plumaGui
    local distLbl = Instance.new("TextLabel"); distLbl.Size = UDim2.new(1,0,1,0); distLbl.BackgroundTransparency = 1; distLbl.Text = ""; distLbl.TextColor3 = C.text; distLbl.TextSize = 10; distLbl.Font = Enum.Font.GothamBold; distLbl.Parent = distBill
    
    lootESP[model] = {box=box, line=line, nick=nickBill, dist=distBill, distLbl=distLbl, part=part}
end

local function hideAllPlayerDrawings(data)
    if data.box then data.box.Visible = false end
    if data.lineToPlayer then data.lineToPlayer.Visible = false end
    if data.tracer then data.tracer.Visible = false end
    if data.hpBg then data.hpBg.Visible = false end
    if data.hpFill then data.hpFill.Visible = false end
    if data.nickBill then data.nickBill.Enabled = false end
    if data.xpBill then data.xpBill.Enabled = false end
    if data.distBill then data.distBill.Enabled = false end
end

local function isLootValid(name, obj)
    local n = string.lower(name or "")
    -- Жесткий блэклист
    local exactBad = {"electricbox", "hitbox", "gunmodel", "door", "wall", "floor", "gate", "button"}
    for _, b in ipairs(exactBad) do if string.find(n, b, 1, true) then return false end end
    
    -- Вайтлист (ищем вхождение)
    local exactGood = {"militarybox", "militarycrate", "matchbox", "ammo", "crate", "clickerdropper"}
    for _, g in ipairs(exactGood) do if string.find(n, g, 1, true) then return true end end
    
    return false
end

local function updateLootCache(myHrp)
    if not myHrp then return end
    local newList = {}
    local bp = getBasePos()
    
    local map = Workspace:FindFirstChild("Map")
    local tycoons = map and map:FindFirstChild("Tycoons")
    local scanRoot = tycoons or map or Workspace
    
    for _, obj in ipairs(scanRoot:GetDescendants()) do
        if obj:IsA("BasePart") or obj:IsA("MeshPart") or obj:IsA("Model") or obj:IsA("UnionOperation") then
            if isLootValid(obj.Name, obj) then
                local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
                if part then
                    local dist = (part.Position - myHrp.Position).Magnitude
                    if dist <= (Config.lootDrawRadius or 400) then
                        local onMyBase = false
                        if bp and (part.Position - bp).Magnitude < (Config.lootBaseRadius or 250) then onMyBase = true end
                        if not onMyBase then
                            table.insert(newList, {model=obj, part=part, dist=dist})
                        end
                    end
                end
            end
        end
    end
    lootCache.models = newList
    lootCache.time = tick()
end

local function updateESP()
    local cam = Workspace.CurrentCamera
    if not cam then return end
    local myHrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    local bp = getBasePos()
    
    if tick() - zoneRefreshTimer > 1.0 then
        zoneRefreshTimer = tick()
        task.spawn(refreshZoneESP)
    end

    for plr, data in pairs(espDrawings) do
        if plr.Parent == nil then destroyESP(plr); continue end
        local char = plr.Character
        local head = char and char:FindFirstChild("Head")
        local torso = char and (char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso") or char:FindFirstChild("HumanoidRootPart"))
        local hrp = char and (char:FindFirstChild("HumanoidRootPart") or torso)
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if not (char and hrp and head) then
            espMissing[plr] = (espMissing[plr] or 0) + 1
            if espMissing[plr] > 120 then destroyESP(plr) end
            hideAllPlayerDrawings(data)
            continue
        end
        espMissing[plr] = nil
        local distToMe = myHrp and (hrp.Position - myHrp.Position).Magnitude or 0
        if distToMe > 2000 then
            hideAllPlayerDrawings(data)
            continue
        end
        if data.nickBill then
            if data.nickBill.Adornee ~= head then data.nickBill.Adornee = head end
            data.nickBill.Enabled = Config.nickEsp
        end
        if data.xpBill then
            if data.xpBill.Adornee ~= head then data.xpBill.Adornee = head end
            data.xpBill.Enabled = true
            data.xpLbl.Text = getXP(plr) or ""
        end
        if data.distBill then
            if data.distBill.Adornee ~= head then data.distBill.Adornee = head end
            data.distBill.Enabled = Config.distEsp
            data.distLbl.Text = string.format("%d m", math.floor(distToMe))
        end
        local tt, on1 = cam:WorldToViewportPoint(head.Position)
        local bb, on2 = cam:WorldToViewportPoint(hrp.Position)
        local onScreen = on1 and on2 and tt.Z > 0 and bb.Z > 0
        if data.box then
            if Config.boxEsp and onScreen then
                local h = bb.Y - tt.Y; local w = math.max(h * 0.6, 8)
                data.box.Size = Vector2.new(w,h); data.box.Position = Vector2.new(tt.X - w/2, tt.Y); data.box.Visible = true
            else data.box.Visible = false end
        end
        if Config.hpBar and hum and onScreen then
            local h = bb.Y - tt.Y; local w = math.max(h * 0.6, 8)
            local bx = tt.X - w/2 - 7; local by = tt.Y
            local ratio = math.clamp(hum.Health / math.max(hum.MaxHealth,1), 0, 1)
            data.hpBg.Size = Vector2.new(4,h); data.hpBg.Position = Vector2.new(bx,by); data.hpBg.Visible = true
            local fh = h * ratio
            data.hpFill.Size = Vector2.new(4,fh); data.hpFill.Position = Vector2.new(bx, by + (h-fh)); data.hpFill.Color = getHPColor(ratio); data.hpFill.Visible = true
        else
            if data.hpBg then data.hpBg.Visible = false end
            if data.hpFill then data.hpFill.Visible = false end
        end
        if data.lineToPlayer and Config.lineEsp then
            local tS, tOn = cam:WorldToViewportPoint(hrp.Position)
            if tOn and tS.Z > 0 then
                data.lineToPlayer.From = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)
                data.lineToPlayer.To = Vector2.new(tS.X, tS.Y)
                data.lineToPlayer.Visible = true
            else data.lineToPlayer.Visible = false end
        elseif data.lineToPlayer then data.lineToPlayer.Visible = false end
        if data.tracer and Config.tracer then
            local tS, tOn = cam:WorldToViewportPoint(hrp.Position)
            if tOn and tS.Z > 0 then
                data.tracer.From = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y)
                data.tracer.To = Vector2.new(tS.X, tS.Y)
                data.tracer.Visible = true
            else data.tracer.Visible = false end
        elseif data.tracer then data.tracer.Visible = false end
    end

    if Config.botEsp then
        for _, obj in ipairs(Workspace:GetChildren()) do
            if obj:IsA("Model") and not obj:FindFirstChildOfClass("Player") then
                local hum = obj:FindFirstChildOfClass("Humanoid"); local head = obj:FindFirstChild("Head"); local hrp = obj:FindFirstChild("HumanoidRootPart")
                local isPlr = false
                for _, plr in ipairs(Players:GetPlayers()) do if plr.Character == obj then isPlr = true; break end end
                if hum and head and hrp and not isPlr and hum.Health > 0 then
                    createBotESP(obj)
                    local d = botESP[obj]
                    if d then
                        local tt, on1 = cam:WorldToViewportPoint(head.Position + Vector3.new(0,0.5,0))
                        local bb, on2 = cam:WorldToViewportPoint(hrp.Position - Vector3.new(0,3,0))
                        if on1 and on2 and tt.Z > 0 and bb.Z > 0 then
                            local h = bb.Y - tt.Y; local w = math.max(h * 0.6, 8)
                            d.box.Size = Vector2.new(w,h); d.box.Position = Vector2.new(tt.X - w/2, tt.Y); d.box.Visible = true
                            local ratio = math.clamp(hum.Health / math.max(hum.MaxHealth,1), 0, 1)
                            local bx = tt.X - w/2 - 7
                            d.hpBg.Size = Vector2.new(4,h); d.hpBg.Position = Vector2.new(bx,tt.Y); d.hpBg.Visible = true
                            local fh = h * ratio
                            d.hpFill.Size = Vector2.new(4,fh); d.hpFill.Position = Vector2.new(bx, tt.Y + (h-fh)); d.hpFill.Color = getHPColor(ratio); d.hpFill.Visible = true
                            if d.head and d.nick.Adornee ~= d.head then d.nick.Adornee = d.head end
                            d.nick.Enabled = true
                        else d.box.Visible = false; d.hpBg.Visible = false; d.hpFill.Visible = false; d.nick.Enabled = false end
                    end
                end
            end
        end
        for m, d in pairs(botESP) do
            if not m.Parent then
                if d.box then d.box:Remove() end
                if d.hpBg then d.hpBg:Remove() end
                if d.hpFill then d.hpFill:Remove() end
                if d.nick then d.nick:Destroy() end
                botESP[m] = nil
            end
        end
    elseif next(botESP) then clearBotESP() end

    if Config.lootEsp then
        if tick() - lootCache.time > 2.0 then
            task.spawn(function() updateLootCache(myHrp) end)
            lootCache.time = tick()
        end
        
        local validModels = {}
        for _, item in ipairs(lootCache.models) do
            local obj = item.model
            if obj and obj.Parent then
                validModels[obj] = true
                if not lootESP[obj] then createLootESP(obj, item.part) end
                local d = lootESP[obj]
                if d and d.part then
                    local sp, on = cam:WorldToViewportPoint(d.part.Position)
                    if on and sp.Z > 0 then
                        local sz = math.clamp(1500/sp.Z, 15, 100)
                        d.box.Size = Vector2.new(sz,sz); d.box.Position = Vector2.new(sp.X - sz/2, sp.Y - sz/2); d.box.Visible = true
                        d.line.From = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y); d.line.To = Vector2.new(sp.X, sp.Y); d.line.Visible = true
                        d.nick.Enabled = true
                        d.dist.Enabled = true
                        d.distLbl.Text = math.floor(item.dist) .. " studs"
                    else 
                        d.box.Visible = false; d.line.Visible = false
                        d.nick.Enabled = false; d.dist.Enabled = false 
                    end
                end
            end
        end
        
        for obj, d in pairs(lootESP) do
            if not obj.Parent or not validModels[obj] then
                if d.box then d.box:Remove() end
                if d.line then d.line:Remove() end
                if d.nick then d.nick:Destroy() end
                if d.dist then d.dist:Destroy() end
                lootESP[obj] = nil
            end
        end
    elseif next(lootESP) then clearLootESP() end
end

RunService.RenderStepped:Connect(function() pcall(updateESP) end)

local aimRunning = true
local aimSmoothBase = 0.18
local aimPrediction = 0.15
local aimPriority = "closest"
local fovRadius = 150
local aimPresets = {
    fast   = {smooth = 0.18, clampMin = 0.15, clampMax = 0.92, predScale = 1.0},
    medium = {smooth = 0.30, clampMin = 0.10, clampMax = 0.80, predScale = 1.0},
    smooth = {smooth = 0.45, clampMin = 0.06, clampMax = 0.70, predScale = 1.1},
}
local aimPreset = Config.aimPreset or "fast"
local function applyPreset(name)
    local p = aimPresets[name] or aimPresets.fast
    aimPreset = name
    aimSmoothBase = p.smooth
    Config.aimPreset = name
end
applyPreset(aimPreset)

local fovCircle = Drawing.new("Circle")
fovCircle.Thickness = 1; fovCircle.Color = C.purple; fovCircle.Transparency = 0.6; fovCircle.NumSides = 60; fovCircle.Visible = false
fovCircle.Position = Vector2.new(Workspace.CurrentCamera.ViewportSize.X/2, Workspace.CurrentCamera.ViewportSize.Y/2)
local aimMemoryTarget = nil
local aimMemoryUntil = 0
local cachedTargets = {list={}, time=0}
local currentTarget = nil
local fpsEstimate = 60

local function pointInFireZone(pos)
    local cam = Workspace.CurrentCamera
    if not cam then return false end
    local vp = cam.ViewportSize
    return pos.X >= vp.X * 0.5 and pos.Y >= vp.Y * 0.3
end

local function detectFire()
    local ok, res = pcall(function()
        if UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then return true end
        local touches = UIS:GetTouches()
        if touches and #touches > 0 then
            for _, t in ipairs(touches) do
                local gui = player.PlayerGui:GetGuiObjectsAtPosition(t.Position.X, t.Position.Y)
                local hitUI = false
                for _, obj in ipairs(gui) do if obj:IsDescendantOf(plumaGui) then hitUI = true; break end end
                if not hitUI and pointInFireZone(t.Position) then return true end
            end
        end
        local char = player.Character
        local tool = char and char:FindFirstChildOfClass("Tool")
        if tool then if tool:GetAttribute("Activated") == true or tool:GetAttribute("Firing") == true then return true end end
        return false
    end)
    return ok and res or false
end

local function hasLineOfSight(targetPos, model)
    if not Config.wallCheck then return true end
    local cam = Workspace.CurrentCamera
    if not cam then return true end
    local ok, result = pcall(function()
        local rp = RaycastParams.new(); rp.FilterType = Enum.RaycastFilterType.Exclude; rp.FilterDescendantsInstances = {player.Character}
        return Workspace:Raycast(cam.CFrame.Position, (targetPos - cam.CFrame.Position), rp)
    end)
    if not ok then return true end
    if result == nil then return true end
    if model and result.Instance:IsDescendantOf(model) then return true end
    return false
end

local function getHeadOf(model) return model:FindFirstChild("Head") end
local function getTorsoOf(model) return model:FindFirstChild("UpperTorso") or model:FindFirstChild("Torso") end
local function getHumOf(model) return model:FindFirstChildOfClass("Humanoid") end
local function isPlayerCharacter(model)
    for _, plr in ipairs(Players:GetPlayers()) do if plr.Character == model then return true end end
    return false
end

local function collectTargets()
    if tick() - cachedTargets.time < 0.08 then return cachedTargets.list end
    local targets = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= player and not isSameTeam(plr) then
            local char = plr.Character
            if char then
                local head = getHeadOf(char); local hum = getHumOf(char)
                if head and hum and hum.Health > 0 then table.insert(targets, {model=char, head=head, torso=getTorsoOf(char), hum=hum, isPlayer=true}) end
            end
        end
    end
    for _, obj in ipairs(Workspace:GetChildren()) do
        if obj:IsA("Model") and not isPlayerCharacter(obj) then
            local hum = getHumOf(obj); local head = getHeadOf(obj)
            if hum and head and hum.Health > 0 then
                local isVeh = obj:FindFirstChild("VehicleSeat") ~= nil or obj.Name:lower():find("vehicle") or obj.Name:lower():find("car") or obj.Name:lower():find("tank")
                if (not isVeh) or Config.aimVehicles then table.insert(targets, {model=obj, head=head, torso=getTorsoOf(obj), hum=hum, isPlayer=false}) end
            end
        end
    end
    cachedTargets.list = targets; cachedTargets.time = tick()
    return targets
end

local function dynamicFov(wd)
    local base = fovRadius
    if wd < 30 then return base * 1.6 elseif wd < 80 then return base * 1.2 elseif wd > 200 then return base * 0.6 else return base end
end

local function threatScore(t, cam)
    local wd = (t.head.Position - cam.CFrame.Position).Magnitude
    local hp = t.hum.Health or 100
    local base
    if aimPriority == "lowestHP" then base = hp elseif aimPriority == "highestThreat" then base = wd * (hp/100) else base = wd end
    if Config.smartTargets then
        local myHrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if myHrp then
            local toMe = (myHrp.Position - t.head.Position).Unit
            if t.head.CFrame.LookVector:Dot(toMe) > 0.3 then base = base * 0.7 end
            local hrp = t.model:FindFirstChild("HumanoidRootPart")
            local vel = hrp and hrp.AssemblyLinearVelocity or Vector3.zero
            if vel.Magnitude > 4 and vel.Unit:Dot(toMe) > 0.3 then base = base * 0.85 end
        end
    end
    if t.isPlayer then base = base * 0.85 end
    return base
end

local function autoPriorityTick()
    if not Config.autoPriority then return end
    local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    local ratio = hum and (hum.Health / math.max(hum.MaxHealth,1)) or 1
    aimPriority = ratio < 0.35 and "highestThreat" or "closest"
end

local function targetValid(t)
    if not t then return false end
    local m = t.model
    if not m or not m.Parent then return false end
    local head = getHeadOf(m); local hum = getHumOf(m)
    if not head or not hum or hum.Health <= 0 then return false end
    local cam = Workspace.CurrentCamera
    if not cam then return false end
    local sp, on = cam:WorldToViewportPoint(head.Position)
    if not on or sp.Z <= 0 then return false end
    local wd = (head.Position - cam.CFrame.Position).Magnitude
    local cursor = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)
    if UIS.MouseEnabled then local mouse = player:GetMouse(); cursor = Vector2.new(mouse.X, mouse.Y) end
    if (Vector2.new(sp.X,sp.Y) - cursor).Magnitude > dynamicFov(wd) * 1.6 then return false end
    return true
end

local function pickBest()
    local cam = Workspace.CurrentCamera
    if not cam then return nil end
    local cursor = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)
    if UIS.MouseEnabled then local mouse = player:GetMouse(); cursor = Vector2.new(mouse.X, mouse.Y) end
    local best, bestScore = nil, math.huge
    for _, t in ipairs(collectTargets()) do
        local sp, on = cam:WorldToViewportPoint(t.head.Position)
        if on and sp.Z > 0 then
            local wd = (t.head.Position - cam.CFrame.Position).Magnitude
            local sd = (Vector2.new(sp.X,sp.Y) - cursor).Magnitude
            if sd < dynamicFov(wd) then
                local los = hasLineOfSight(t.head.Position, t.model) or (Config.torsoFallback and t.torso and hasLineOfSight(t.torso.Position, t.model))
                if los then local score = threatScore(t, cam); if score < bestScore then best, bestScore = t, score end end
            end
        end
    end
    return best
end

RunService.RenderStepped:Connect(function(dt)
    if dt and dt > 0 then
        local inst = 1 / dt
        fpsEstimate = fpsEstimate * 0.9 + math.clamp(inst, 10, 240) * 0.1
    end
    if not aimRunning then return end
    task.defer(function()
        if not aimRunning then return end
        local cam = Workspace.CurrentCamera
        if not cam then return end
        fovCircle.Position = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)
        fovCircle.Radius = fovRadius
        fovCircle.Visible = Config.aimOn
        if not Config.aimOn then currentTarget = nil; aimMemoryTarget = nil; return end
        autoPriorityTick()
        local firing = detectFire()
        if not firing then
            currentTarget = nil
            if Config.aimMemory and aimMemoryTarget and tick() < aimMemoryUntil and targetValid(aimMemoryTarget) then currentTarget = aimMemoryTarget
            else aimMemoryTarget = nil; return end
        else
            if not targetValid(currentTarget) then currentTarget = pickBest() end
            if currentTarget then aimMemoryTarget = currentTarget; aimMemoryUntil = tick() + 0.6 end
        end
        if currentTarget then
            local hv = hasLineOfSight(currentTarget.head.Position, currentTarget.model)
            local part = (hv or not Config.torsoFallback) and currentTarget.head or (currentTarget.torso or currentTarget.head)
            local aimPos = part.Position
            local hrp = currentTarget.model:FindFirstChild("HumanoidRootPart")
            local preset = aimPresets[aimPreset] or aimPresets.fast
            if hrp then aimPos = aimPos + hrp.AssemblyLinearVelocity * aimPrediction * preset.predScale end
            local cur = cam.CFrame
            local want = CFrame.new(cur.Position, aimPos)
            local smooth = aimSmoothBase
            if Config.adaptiveSmooth then
                local sp, on = cam:WorldToViewportPoint(aimPos)
                if on and sp.Z > 0 then
                    local center = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)
                    local norm = math.clamp((Vector2.new(sp.X,sp.Y) - center).Magnitude / fovRadius, 0, 1)
                    smooth = smooth * (1 - norm * 0.6)
                end
                local fpsComp = math.clamp(60 / math.max(fpsEstimate, 20), 0.5, 2.0)
                smooth = smooth * fpsComp
            end
            local s = 1 - math.exp(-dt / math.max(smooth, 0.05))
            s = math.clamp(s, preset.clampMin, preset.clampMax)
            cam.CFrame = cur:Lerp(want, s)
        end
    end)
end)

task.spawn(function()
    while plumaGui.Parent do
        if Config.triggerBot and currentTarget and Config.aimOn then
            pcall(function()
                local vim = game:GetService("VirtualInputManager")
                local vp = Workspace.CurrentCamera.ViewportSize
                vim:SendMouseButtonEvent(vp.X*0.75, vp.Y*0.75, 0, true, game, 1)
                task.wait(0.05)
                vim:SendMouseButtonEvent(vp.X*0.75, vp.Y*0.75, 0, false, game, 1)
            end)
        end
        task.wait(0.15)
    end
end)

task.spawn(function()
    while plumaGui.Parent do
        if Config.autoReload then
            pcall(function()
                local char = player.Character
                local tool = char and char:FindFirstChildOfClass("Tool")
                if tool then tool:Activate() end
            end)
        end
        task.wait(1.5)
    end
end)

local function hideMain() main.Visible = false; fab.Visible = true end
local function showMain() main.Visible = true; fab.Visible = false end
closeBtn.MouseButton1Click:Connect(hideMain)
fab.MouseButton1Click:Connect(showMain)

getgenv().Pluma = {
    Config=Config, C=C, toast=toast,
    plumaGui=plumaGui, main=main, fab=fab, watermark=watermark, wmLabel=wmLabel,
    sidebar=sidebar, switchTab=switchTab, createTab=createTab,
    createPage=createPage, addSection=addSection, makeToggle=makeToggle,
    makeAction=makeAction, makeInput=makeInput, toggleWidgets=toggleWidgets,
    pages=pages, setStatus=setStatus, hideMain=hideMain, showMain=showMain,
    SafeTeleport=SafeTeleport, getZones=getZones, clearZoneESP=clearZoneESP,
    refreshZoneESP=refreshZoneESP, createESP=createESP, destroyESP=destroyESP,
    clearPlayerESP=clearPlayerESP, clearBotESP=clearBotESP, clearLootESP=clearLootESP,
    updateESP=updateESP, isAdmin=isAdmin, espDrawings=espDrawings, botESP=botESP, lootESP=lootESP,
    fovCircle=fovCircle, currentTarget=function() return currentTarget end,
    stopAim=function() aimRunning = false end,
    applyAimPreset=applyPreset, getAimPreset=function() return aimPreset end,
    getBasePos=getBasePos,
}

createTab("main", "◆", "Main", 1)
createTab("visual", "◉", "Visual", 2)
createTab("combat", "✜", "Combat", 3)
createTab("world", "▣", "World", 4)
createTab("players", "☺", "Players", 5)

local pageMain = createPage("main")
local pageVisual = createPage("visual")
local pageCombat = createPage("combat")
local pageWorld = createPage("world")
local pagePlayers = createPage("players")

addSection(pageMain, "ТЕЛЕПОРТ", 1)
makeAction(pageMain, "⟶", "TP к ближайшей базе", 2, function()
    local char = player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then setStatus("нет персонажа", true); return end
    local bp = getBasePos()
    local zones = getZones()
    if #zones == 0 then setStatus("зоны не найдены", true); return end
    local best, bd = nil, 500
    for _, z in ipairs(zones) do local d = (z.pos - hrp.Position).Magnitude; if d < bd then best, bd = z, d end end
    if best then SafeTeleport(CFrame.new(best.pos), char); setStatus("tp: " .. best.name) else setStatus("базы рядом нет", true) end
end)
makeAction(pageMain, "⏎", "TP на базу (save/return)", 3, function()
    local char = player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local bp = getBasePos()
    if not bp then basePos = hrp.Position; toast("База", "сохранена") else SafeTeleport(CFrame.new(bp), char); toast("TP", "на базу") end
end)

addSection(pageVisual, "ESP ЗОНЫ", 1)
makeToggle(pageVisual, "zoneEsp", "▣", "ESP зон", 2, function(v) if v then task.spawn(refreshZoneESP) else clearZoneESP() end end)
addSection(pageVisual, "ESP ИГРОКИ", 3)
makeToggle(pageVisual, "boxEsp", "□", "Box", 4, function(v) if v then for _, p in ipairs(Players:GetPlayers()) do createESP(p) end else clearPlayerESP() end end)
makeToggle(pageVisual, "lineEsp", "⟶", "Line", 6, function(v) if v then for _, p in ipairs(Players:GetPlayers()) do createESP(p) end end end)
makeToggle(pageVisual, "tracer", "╲", "Tracer", 7, function(v) if v then for _, p in ipairs(Players:GetPlayers()) do createESP(p) end end end)
makeToggle(pageVisual, "nickEsp", "☰", "Nickname", 8, function(v) if v then for _, p in ipairs(Players:GetPlayers()) do createESP(p) end end end)
makeToggle(pageVisual, "hpBar", "▮", "HP Bar", 9, function(v) if v then for _, p in ipairs(Players:GetPlayers()) do createESP(p) end end end)
makeToggle(pageVisual, "distEsp", "◎", "Дистанция", 10, function(v) if v then for _, p in ipairs(Players:GetPlayers()) do createESP(p) end end end)
makeToggle(pageVisual, "chams", "◈", "Chams (все)", 11, function(v) if v then for _, p in ipairs(Players:GetPlayers()) do createESP(p) end end end)
makeToggle(pageVisual, "adminEsp", "◈", "Admin Highlight", 12, function(v) if v then for _, p in ipairs(Players:GetPlayers()) do createESP(p) end end end)
makeToggle(pageVisual, "teamCheck", "⚑", "Team Check", 13, function(v) if not v then for _, p in ipairs(Players:GetPlayers()) do createESP(p) end else clearPlayerESP() end end)
makeToggle(pageVisual, "botEsp", "○", "ESP ботов", 14)

addSection(pageVisual, "ЛУТ И ТП", 15)
makeToggle(pageVisual, "lootEsp", "★", "ESP лута (жирный)", 16, function(v) if not v then clearLootESP() end end)
makeAction(pageVisual, "⟶", "ТП к ближайшему луту", 17, function()
    local char = player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then setStatus("нет персонажа", true); return end
    local best, bd = nil, math.huge
    for obj, d in pairs(lootESP) do
        if obj.Parent and d.part and d.box.Visible then
            local dist = (d.part.Position - hrp.Position).Magnitude
            if dist < bd then best, bd = d.part, dist end
        end
    end
    if best then
        SafeTeleport(CFrame.new(best.Position), char)
        setStatus(string.format("TP к луту (%.0f studs)", bd))
        toast("ТП к луту", "перемещение...")
    else
        setStatus("лут не найден", true)
        toast("ТП к луту", "включи ESP лута и подожди")
    end
end)

addSection(pageCombat, "ПРИЦЕЛ", 1)
makeToggle(pageCombat, "aimOn", "✜", "Auto-Aim (только при стрельбе)", 2)
makeToggle(pageCombat, "wallCheck", "▤", "Wall Check", 3)
makeToggle(pageCombat, "smartTargets", "◈", "Smart Targets", 4)
makeToggle(pageCombat, "autoPriority", "◎", "Auto Priority", 5)
makeToggle(pageCombat, "aimMemory", "◔", "Aim Memory", 6)
makeToggle(pageCombat, "torsoFallback", "▽", "Torso Fallback", 7)
makeToggle(pageCombat, "adaptiveSmooth", "◈", "Adaptive Smooth + FPS", 8)
makeToggle(pageCombat, "triggerBot", "⚡", "Trigger Bot", 9)
makeToggle(pageCombat, "autoReload", "⟳", "Auto Reload", 10)
makeToggle(pageCombat, "aimVehicles", "⛊", "Aim на технику", 11)
addSection(pageCombat, "ПРЕСЕТ СКОРОСТИ", 12)
makeAction(pageCombat, "⚡", "Быстрый", 13, function() applyPreset("fast"); toast("Aim", "пресет: быстрый") end)
makeAction(pageCombat, "◈", "Средний", 14, function() applyPreset("medium"); toast("Aim", "пресет: средний") end)
makeAction(pageCombat, "◔", "Плавный", 15, function() applyPreset("smooth"); toast("Aim", "пресет: плавный") end)
makeAction(pageCombat, "＋", "Prediction +", 16, function() aimPrediction = math.min(aimPrediction + 0.05, 1); setStatus("pred: " .. string.format("%.2f", aimPrediction)) end)
makeAction(pageCombat, "−", "Prediction −", 17, function() aimPrediction = math.max(aimPrediction - 0.05, 0); setStatus("pred: " .. string.format("%.2f", aimPrediction)) end)

addSection(pageWorld, "МИР", 1)
makeToggle(pageWorld, "fullbright", "☀", "Fullbright", 2)
makeToggle(pageWorld, "noFog", "☁", "No Fog", 3)
makeToggle(pageWorld, "noclip", "◌", "Noclip", 4)

local origBrightness = Lighting.Brightness
local origFogEnd = Lighting.FogEnd
task.spawn(function()
    while plumaGui.Parent do
        pcall(function()
            Lighting.Brightness = Config.fullbright and 3 or origBrightness
            Lighting.FogEnd = Config.noFog and 1e6 or origFogEnd
            Lighting.FogStart = Config.noFog and 1e6 or 0
        end)
        if Config.noclip and player.Character then
            for _, part in ipairs(player.Character:GetDescendants()) do if part:IsA("BasePart") then part.CanCollide = false end end
        end
        task.wait(0.5)
    end
end)

local function refreshPlayersList()
    for _, child in ipairs(pagePlayers:GetChildren()) do if child:IsA("TextButton") then child:Destroy() end end
    local i = 1
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= player then
            local label = (isAdmin(plr) and "[ADMIN] " or "") .. plr.Name
            makeAction(pagePlayers, "☺", label, i, function()
                local char = player.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                local tchar = plr.Character
                local thrp = tchar and tchar:FindFirstChild("HumanoidRootPart")
                if hrp and thrp then SafeTeleport(CFrame.new(thrp.Position), char); setStatus("tp к " .. plr.Name) end
            end)
            i = i + 1
        end
    end
end
Players.PlayerAdded:Connect(function() task.wait(0.5); refreshPlayersList() end)
Players.PlayerRemoving:Connect(function(plr) destroyESP(plr); task.wait(0.5); refreshPlayersList() end)
task.spawn(function() task.wait(2); refreshPlayersList() end)

switchTab("main")

Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function()
        task.wait(0.3)
        local want = Config.boxEsp or Config.lineEsp or Config.nickEsp or Config.hpBar or Config.distEsp or Config.tracer or Config.chams or Config.adminEsp
        if want then createESP(plr) end
    end)
end)

task.spawn(function()
    task.wait(1)
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player then
            if Config.boxEsp or Config.lineEsp or Config.nickEsp or Config.hpBar or Config.distEsp or Config.tracer or Config.chams or Config.adminEsp then
                createESP(p)
            end
        end
    end
end)

task.spawn(function()
    while plumaGui.Parent do
        local fps = math.floor(fpsEstimate)
        local ping = "—"
        pcall(function() ping = tostring(math.floor(player:GetNetworkPing() * 1000)) end)
        wmLabel.Text = string.format("Pluma v19.3.18 · %d FPS · %s ms · aim:%s", fps, ping, aimPreset)
        task.wait(1)
    end
end)

-- EXTENSIONS START
local configPath = "PlumaConfig_v19318.json"
local function saveConfig() pcall(function() if writefile then writefile(configPath, HttpService:JSONEncode(Config)) end end) end
local function loadConfig()
    pcall(function()
        if isfile and isfile(configPath) then
            local txt = readfile(configPath)
            local ok, data = pcall(function() return HttpService:JSONDecode(txt) end)
            if ok and type(data) == "table" then for k,v in pairs(data) do Config[k] = v end; return true end
        end
    end)
    return false
end
local function webhookLog(title, desc)
    if not Config.webhookUrl or Config.webhookUrl == "" then return end
    pcall(function()
        local payload = HttpService:JSONEncode({content = "**" .. tostring(title) .. "**\n" .. tostring(desc)})
        HttpService:PostAsync(Config.webhookUrl, payload, Enum.HttpContentType.ApplicationJson)
    end)
end

if Config.antiKick then
    pcall(function()
        if hookmetamethod and newcclosure and getnamecallmethod then
            local oldNamecall
            oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
                if getnamecallmethod() == "Kick" and self == player then
                    webhookLog("Anti-Kick", "попытка кика")
                    return
                end
                return oldNamecall(self, ...)
            end))
        end
    end)
end

local promptBlacklist = {
    "experience","rate","rating","review","survey","feedback","rules","policy",
    "politics","terms","agree","accept","welcome","share","tell us","tell is",
    "about your","your opinion","vote","like","favorite","favourite"
}
local function isBlacklistedPrompt(prompt)
    if not prompt then return true end
    if prompt:GetAttribute("PlumaSkip") == true then return true end
    if prompt.Enabled == false then return true end
    local fields = { prompt.Name or "", prompt.ActionText or "", prompt.ObjectText or "", prompt.Parent and prompt.Parent.Name or "" }
    for _, f in ipairs(fields) do
        local fl = string.lower(tostring(f))
        for _, bw in ipairs(promptBlacklist) do if string.find(fl, bw, 1, true) then return true end end
    end
    return false
end

local function clickGuiButton(btn)
    if not btn or not btn.Parent then return false end
    local done = false
    pcall(function()
        if getconnections then
            local ok, conns = pcall(function() return getconnections(btn.MouseButton1Click) end)
            if ok and conns then
                for _, c in ipairs(conns) do
                    if c.Enabled and c.Function then
                        local ok2 = pcall(function() c:Fire() end)
                        if ok2 then done = true end
                    end
                end
            end
        end
    end)
    if not done then
        pcall(function()
            if getconnections then
                local ok, conns = pcall(function() return getconnections(btn.Activated) end)
                if ok and conns then
                    for _, c in ipairs(conns) do
                        if c.Enabled and c.Function then
                            local ok2 = pcall(function() c:Fire() end)
                            if ok2 then done = true end
                        end
                    end
                end
            end
        end)
    end
    if not done then
        pcall(function()
            local pos = btn.AbsolutePosition + btn.AbsoluteSize * 0.5
            VIM:SendMouseButtonEvent(pos.X, pos.Y, 0, true, game, 1)
            task.wait(0.03)
            VIM:SendMouseButtonEvent(pos.X, pos.Y, 0, false, game, 1)
            done = true
        end)
    end
    return done
end

local whitelistedButtons = {"BuyButton", "EquipButton", "RebirthsButton", "MissionButton", "StatsButton", "LockedButton"}
local function isWhitelistedButton(btn)
    for _, name in ipairs(whitelistedButtons) do
        if btn.Name == name then return true end
    end
    return false
end

local shopOpenKeywords = {"shop","store","market","open shop","buy menu","shop menu","open store"}
local buttonBlacklist = {"close","cancel","back","exit","no","decline","settings","mute","music","sound","language","privacy","terms","policy","experience","rate","review","discord","youtube","twitter","tiktok","instagram","facebook","share","vote","like"}

local function buttonMatches(btn, keywords, blacklist)
    local names = { btn.Name or "" }
    local tn = btn:FindFirstChildWhichIsA("TextLabel", true)
    if tn and tn.Text then table.insert(names, tn.Text) end
    if btn:IsA("TextButton") and btn.Text then table.insert(names, btn.Text) end
    for _, n in ipairs(names) do
        local nl = string.lower(tostring(n))
        if blacklist then
            local blocked = false
            for _, bw in ipairs(blacklist) do if string.find(nl, bw, 1, true) then blocked = true; break end end
            if blocked then return false end
        end
        for _, kw in ipairs(keywords) do if string.find(nl, kw, 1, true) then return true end end
    end
    return false
end

local function tryOpenShop()
    if not Config.autoOpenShop then return false end
    for _, gui in ipairs({player.PlayerGui, Workspace}) do
        for _, obj in ipairs(gui:GetDescendants()) do
            if obj:IsA("TextButton") or obj:IsA("ImageButton") then
                if buttonMatches(obj, shopOpenKeywords, buttonBlacklist) then
                    if clickGuiButton(obj) then return true end
                end
            end
        end
    end
    return false
end

local lastShopOpen = 0
task.spawn(function()
    while plumaGui.Parent do
        if Config.autoBuy then
            pcall(function()
                local found = 0
                local mainUi = player.PlayerGui:FindFirstChild("MainUi")
                if mainUi then
                    for _, obj in ipairs(mainUi:GetDescendants()) do
                        if obj:IsA("ImageButton") and isWhitelistedButton(obj) then
                            if string.find(obj.Name, "Buy") or string.find(obj.Name, "Equip") then
                                if clickGuiButton(obj) then found = found + 1 end
                            end
                        end
                    end
                end
                for _, obj in ipairs(player.PlayerGui:GetDescendants()) do
                    if obj:IsA("ImageButton") and isWhitelistedButton(obj) then
                        if string.find(obj.Name, "Buy") or string.find(obj.Name, "Equip") then
                            if clickGuiButton(obj) then found = found + 1 end
                        end
                    end
                end
                if found > 0 then
                    P.setStatus("buy: " .. found)
                    lastShopOpen = tick()
                else
                    if tick() - lastShopOpen > 3 then
                        if tryOpenShop() then
                            lastShopOpen = tick()
                            P.setStatus("открываю магазин")
                        end
                    end
                end
            end)
        end
        task.wait(1.2)
    end
end)

task.spawn(function()
    while plumaGui.Parent do
        if Config.autoQuest then
            pcall(function()
                local found = 0
                local mainUi = player.PlayerGui:FindFirstChild("MainUi")
                if mainUi then
                    for _, obj in ipairs(mainUi:GetDescendants()) do
                        if obj:IsA("ImageButton") and isWhitelistedButton(obj) then
                            if string.find(obj.Name, "Mission") or string.find(obj.Name, "Rebirth") or string.find(obj.Name, "Stats") or string.find(obj.Name, "Locked") then
                                if clickGuiButton(obj) then found = found + 1 end
                            end
                        end
                    end
                end
                if found > 0 then P.setStatus("quest: " .. found) end
            end)
        end
        task.wait(1.2)
    end
end)

-- Auto Clicker (Dropper)
task.spawn(function()
    while plumaGui.Parent do
        if Config.autoClicker then
            pcall(function()
                for _, obj in ipairs(Workspace:GetDescendants()) do
                    if obj:IsA("ClickDetector") then
                        local pn = string.lower(obj.Parent.Name)
                        if pn:find("dropper") or pn:find("clicker") or pn:find("generator") then
                            fireclickdetector(obj)
                        end
                    end
                end
            end)
        end
        task.wait(0.1)
    end
end)

-- Auto Collect Loot
task.spawn(function()
    while plumaGui.Parent do
        if Config.autoCollect then
            pcall(function()
                local char = player.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local target = nil
                    local minD = math.huge
                    for obj, d in pairs(P.lootESP) do
                        if obj.Parent and d.part then
                            local dist = (d.part.Position - hrp.Position).Magnitude
                            if dist < minD and dist < 100 then
                                target = d.part
                                minD = dist
                            end
                        end
                    end
                    
                    if target then
                        P.SafeTeleport(CFrame.new(target.Position), char)
                        task.wait(0.2)
                    end
                end
            end)
        end
        task.wait(1)
    end
end)

-- Auto Equip Best Weapon
task.spawn(function()
    while plumaGui.Parent do
        if Config.autoEquipBest then
            pcall(function()
                local backpack = player:FindFirstChild("Backpack")
                if backpack then
                    local bestTool = nil
                    for _, tool in ipairs(backpack:GetChildren()) do
                        if tool:IsA("Tool") then
                            local tn = string.lower(tool.Name)
                            if tn:find("gun") or tn:find("rifle") or tn:find("smg") or tn:find("shotgun") then
                                bestTool = tool
                                break
                            end
                        end
                    end
                    if bestTool then
                        local char = player.Character
                        local hum = char and char:FindFirstChildOfClass("Humanoid")
                        if hum then
                            hum:EquipTool(bestTool)
                        end
                    end
                end
            end)
        end
        task.wait(2)
    end
end)

-- Instant Rebirth
task.spawn(function()
    while plumaGui.Parent do
        if Config.autoRebirth then
            pcall(function()
                local mainUi = player.PlayerGui:FindFirstChild("MainUi")
                if mainUi then
                    for _, obj in ipairs(mainUi:GetDescendants()) do
                        if obj:IsA("ImageButton") and obj.Name == "RebirthsButton" then
                            clickGuiButton(obj)
                        end
                    end
                end
            end)
        end
        task.wait(1)
    end
end)

task.spawn(function()
    while plumaGui.Parent do
        if Config.fastInteract then
            pcall(function()
                local char = player.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if not hrp then return end
                for _, p in ipairs(Workspace:GetDescendants()) do
                    if p:IsA("ProximityPrompt") and not isBlacklistedPrompt(p) then
                        local part = p.Parent
                        local pos = part and (part:IsA("BasePart") and part.Position or (part:FindFirstChildWhichIsA("BasePart") and part:FindFirstChildWhichIsA("BasePart").Position))
                        if pos and (pos - hrp.Position).Magnitude < math.max(p.MaxActivationDistance or 10, 30) then
                            pcall(function() if fireproximityprompt then fireproximityprompt(p) end end)
                        end
                    end
                end
            end)
        end
        task.wait(0.2)
    end
end)

RunService.Stepped:Connect(function()
    if Config.antiRagdoll and player.Character then
        local hum = player.Character:FindFirstChildOfClass("Humanoid")
        if hum then pcall(function() hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false) end) end
    end
end)

task.spawn(function()
    while plumaGui.Parent do
        if Config.antiAfk then
            pcall(function() VirtualUser:CaptureController() end)
            pcall(function() VirtualUser:ClickButton2(Vector2.new(0,0)) end)
        end
        task.wait(10)
    end
end)

task.spawn(function()
    while plumaGui.Parent do
        if Config.autoRejoin and not player.Parent then pcall(function() TeleportService:Teleport(game.PlaceId, player) end) end
        task.wait(3)
    end
end)

createTab("farm", "★", "Farm", 6)
createTab("util", "⚙", "Util", 7)
createTab("config", "◈", "Config", 8)
local pageFarm = createPage("farm")
local pageUtil = createPage("util")
local pageConfig = createPage("config")

addSection(pageFarm, "АВТОМАТИЗАЦИЯ", 1)
makeToggle(pageFarm, "autoBuy", "✦", "Auto Buy", 2)
makeToggle(pageFarm, "autoOpenShop", "▤", "Авто-открытие магазина", 3)
makeToggle(pageFarm, "autoQuest", "✓", "Auto Quest / Daily", 4)
makeToggle(pageFarm, "fastInteract", "⚡", "Fast Interact", 5)

addSection(pageFarm, "НОВЫЕ ФУНКЦИИ (ФАРМ)", 6)
makeToggle(pageFarm, "autoClicker", "☝", "Auto Clicker (Dropper)", 7)
makeToggle(pageFarm, "autoCollect", "⇲", "Auto Collect Loot", 8)
makeToggle(pageFarm, "autoRebirth", "⟲", "Instant Rebirth", 9)
makeToggle(pageFarm, "autoEquipBest", "⚔", "Auto Equip Best Weapon", 10)

addSection(pageUtil, "ЗАЩИТА", 1)
makeToggle(pageUtil, "antiRagdoll", "⊘", "Anti-Ragdoll", 2)
makeToggle(pageUtil, "antiAfk", "◔", "Anti-AFK", 3)
makeToggle(pageUtil, "antiKick", "⛨", "Anti-Kick", 4)
makeToggle(pageUtil, "autoRejoin", "⟲", "Auto-Rejoin", 5)

addSection(pageUtil, "ДЕЙСТВИЯ", 6)
makeAction(pageUtil, "⟳", "Server Hop", 7, function()
    task.spawn(function()
        local ok, res = pcall(function()
            local url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100", game.PlaceId)
            local data = HttpService:JSONDecode(game:HttpGet(url))
            for _, srv in ipairs(data.data or {}) do if srv.id ~= game.JobId and srv.playing < srv.maxPlayers then return srv.id end end
        end)
        if ok and res then pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId, res, player) end) end
    end)
end)
makeAction(pageUtil, "⟲", "Rejoin", 8, function() pcall(function() TeleportService:Teleport(game.PlaceId, player) end) end)
makeAction(pageUtil, "⏻", "Выгрузить всё", 10, function()
    pcall(function() clearZoneESP() end)
    pcall(function() clearPlayerESP() end)
    pcall(function() clearBotESP() end)
    pcall(function() clearLootESP() end)
    pcall(function() fovCircle:Remove() end)
    aimRunning = false
    plumaGui:Destroy()
end)

addSection(pageConfig, "ПРЕСЕТЫ", 1)
makeAction(pageConfig, "⚔", "Профиль PvP", 2, function()
    for _, k in ipairs({"aimOn","wallCheck","smartTargets","autoPriority","aimMemory","torsoFallback","adaptiveSmooth","triggerBot","boxEsp","tracer","hpBar","chams","teamCheck","adminEsp"}) do
        Config[k] = true; if toggleWidgets[k] then toggleWidgets[k].set(true) end
    end
    for _, k in ipairs({"autoBuy","autoQuest","lootEsp","botEsp"}) do
        Config[k] = false; if toggleWidgets[k] then toggleWidgets[k].set(false) end
    end
    applyPreset("fast")
    toast("Профиль", "PvP активирован")
end)
makeAction(pageConfig, "★", "Профиль Фарм", 3, function()
    for _, k in ipairs({"autoBuy","autoQuest","fastInteract","lootEsp","botEsp","boxEsp","hpBar","teamCheck","antiAfk","antiRagdoll","antiKick","autoRejoin","autoOpenShop", "autoClicker", "autoCollect"}) do
        Config[k] = true; if toggleWidgets[k] then toggleWidgets[k].set(true) end
    end
    for _, k in ipairs({"aimOn","triggerBot","tracer","chams","aimVehicles"}) do
        Config[k] = false; if toggleWidgets[k] then toggleWidgets[k].set(false) end
    end
    toast("Профиль", "Фарм активирован")
end)

addSection(pageConfig, "СОХРАНЕНИЕ", 4)
makeAction(pageConfig, "💾", "Save Config", 5, function() saveConfig(); toast("Config", "сохранён") end)
makeAction(pageConfig, "📂", "Load Config", 6, function()
    if loadConfig() then for k, w in pairs(toggleWidgets) do w.set(Config[k] and true or false) end; toast("Config", "загружен") else toast("Config", "файл не найден") end
end)
makeAction(pageConfig, "↺", "Reset Config", 7, function() pcall(function() if delfile then delfile(configPath) end end); toast("Config", "сброшен") end)

addSection(pageConfig, "WEBHOOK", 8)
makeInput(pageConfig, "Discord Webhook URL", "https://discord.com/api/webhooks/...", 9, function(txt) Config.webhookUrl = txt; toast("Webhook", txt ~= "" and "сохранён" or "очищен") end)

addSection(pageConfig, "СТАТИСТИКА", 10)
local sessionStart = tick()
local statsLabel = Instance.new("TextLabel")
statsLabel.Size = UDim2.new(1,0,0,60); statsLabel.BackgroundColor3 = C.card; statsLabel.Text = ""; statsLabel.TextColor3 = C.text; statsLabel.TextSize = 10; statsLabel.Font = Enum.Font.Gotham; statsLabel.TextXAlignment = Enum.TextXAlignment.Left; statsLabel.TextYAlignment = Enum.TextYAlignment.Top; statsLabel.LayoutOrder = 11; statsLabel.Parent = pageConfig
local sc = Instance.new("UICorner"); sc.CornerRadius = UDim.new(0,10); sc.Parent = statsLabel
local sp = Instance.new("UIPadding"); sp.PaddingTop = UDim.new(0,6); sp.PaddingLeft = UDim.new(0,8); sp.Parent = statsLabel
task.spawn(function()
    while statsLabel.Parent do
        local mins = math.floor((tick() - sessionStart)/60)
        local fps = 0
        pcall(function() fps = math.floor(1 / math.max(RunService.RenderStepped:Wait(), 1e-3)) end)
        statsLabel.Text = string.format("Сессия: %d мин\nFPS: %d\nИгроков: %d", mins, fps, #Players:GetPlayers())
        task.wait(2)
    end
end)

UIS.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        if main.Visible then hideMain() else showMain() end
    elseif input.KeyCode == Enum.KeyCode.Insert then
        Config.aimOn = not Config.aimOn; if toggleWidgets.aimOn then toggleWidgets.aimOn.set(Config.aimOn) end; toast("Aim", Config.aimOn and "вкл" or "выкл")
    elseif input.KeyCode == Enum.KeyCode.End then
        local v = not Config.boxEsp
        for _, k in ipairs({"boxEsp","nickEsp","hpBar"}) do Config[k] = v; if toggleWidgets[k] then toggleWidgets[k].set(v) end end
        toast("ESP", v and "вкл" or "выкл")
    elseif input.KeyCode == Enum.KeyCode.Delete then
        Config.noclip = not Config.noclip; if toggleWidgets.noclip then toggleWidgets.noclip.set(Config.noclip) end; toast("Noclip", Config.noclip and "вкл" or "выкл")
    end
end)

print("[PlumaUI v19.3.18 combined] загружен")
