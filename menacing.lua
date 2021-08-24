--credits to DekuDimz and his opensource 
local blur = Instance.new("BlurEffect", game.Lighting)
blur.Size = 0
local ScreenGui = Instance.new("ScreenGui")
local ImageLabel = Instance.new("ImageLabel")
local StarterGui = game:GetService("StarterGui")
local bindable = Instance.new("BindableFunction")

ScreenGui.Parent = game.CoreGui
ImageLabel.Parent = ScreenGui
ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel.BackgroundTransparency = 1
ImageLabel.Position = UDim2.new(0.5, -(303 / 2), 0.5, -(263 / 2))
ImageLabel.Rotation = 0
ImageLabel.Size = UDim2.new(0, 303,0, 263)
ImageLabel.Image = "rbxassetid://6587457747"
ImageLabel.ImageTransparency = 1

for i = 1, 50, 2 do
    blur.Size = i
    ImageLabel.ImageTransparency = ImageLabel.ImageTransparency - 0.1
    wait()
end
wait(0.1)

for i = 1, 50, 2 do
    blur.Size = 50 - i
    ImageLabel.ImageTransparency = ImageLabel.ImageTransparency + 0.1
    wait()
end
blur:Destroy()
ScreenGui:Destroy()

local Config = {
    WindowName = "A Menacing Timeline",
	Color = Color3.fromRGB(255,128,64),
	Keybind = Enum.KeyCode.RightControl
}
repeat wait() until game:IsLoaded() wait()
game:GetService("Players").LocalPlayer.Idled:connect(function() --anti afk
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

local Meta = getrawmetatable(game)
local NewIndex = Meta.__newindex
setreadonly(Meta, false)

Meta.__newindex = newcclosure(function(t, k, ...)
  
   if not checkcaller() and (k == "WalkSpeed" or k == "JumpPower") then
       return
   end
   NewIndex(t, k, ...)
end)
setreadonly(Meta, true)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed= 25
game:GetService('RunService').Stepped:connect(function()
    pcall(function()
        if game.Players.LocalPlayer.Character.Head:FindFirstChild('Overhead') then --removes name?
            game.Players.LocalPlayer.Character.Head.Overhead:remove()
        end 
    end) 
end)

function c()
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
        if v.ClassName == "Tool" and v:FindFirstChild("Combat Script") then --find tool/combat script
            v.Parent = game.Players.LocalPlayer.Character
        end
    end
end

game:GetService('RunService').Stepped:connect(function() 
    pcall(function()
        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
    end) 
end) 

system = {"KingCrimsonStand","MonoKingCrimson","SilverChariotStand","WhitesnakeStand","HierophantGreenStand","BaldiStand","StarPlatinumStand","MagiciansRed","GoldExperienceStand","GoldExperienceRequiemStand","StarPlatinumStoneOcean","StarPlatinumStoneOceanFP","CrazyDiamondStand","TuskAct1","TuskAct2","TuskAct3","TuskAct4","HTFTStarPlatinumStand","TheWorldStand","TheWorldOVAStand","TheWorldOverHeavenStand","PurpleGuy"} --find names

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/im-retarded-3"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("Main")
local Tab2 = Window:CreateTab("UI Settings")

local Section1 = Tab1:CreateSection("AutoFarms")
local Section2 = Tab1:CreateSection("Misc")
local Section3 = Tab2:CreateSection("Menu")
local Section4 = Tab2:CreateSection("Background")

getgenv().grabItem = false;

function doGrab()
    spawn(function()
        local playerHead = game.Players.LocalPlayer.Character.Head
        while wait() do
            if not getgenv().grabItem then break end
            for i, v in pairs(game:GetService("Workspace").Asda:GetDescendants()) do --find touchfire folder
                if v.Name == "TouchInterest" and v.Parent then
                    firetouchinterest(playerHead,v.Parent, 0)
                    wait(0.01)
                    firetouchinterest(playerHead,v.Parent, 1)
                    break;
                end
            end
        end
    end)
end

local Toggle1 = Section1:CreateToggle("Auto Farm Items", nil, function(bool)
 getgenv().grabItem = bool
    print("Auto Grab is: ", bool);
    if bool then
        doGrab();
    end
end)

local TextBox1 = Section2:CreateTextBox("WalkSpeed", "Only numbers", true, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
end)

local TextBox1 = Section2:CreateTextBox("JumpPower", "Only numbers", true, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
end)

local Dropdown1 = Section1:CreateDropdown("Select Stand")
    Dropdown1:AddToolTip("Select Stand")
for i,v in next, system do
    Dropdown1:AddOption(v, function(String)
        system = String --change system to mob names
    end)
end

local TextBox1 = Section1:CreateTextBox("Health (equip & select stand first)", "Only numbers", true, function(Value)
        local args = {
        [1] = system,
        [2] = 75,
        [3] = Value
        }
    game:GetService("ReplicatedStorage").Stand:FireServer(unpack(args))
end)

local Toggle1 = Section2:CreateToggle("Infinite Jump", nil, function(State)
    Infinite = State
    game:GetService("UserInputService").JumpRequest:connect(function()
    	if Infinite then
    		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
    	end
    end) 
end)

local Toggle1 = Section2:CreateToggle("B Fly", nil, function(State)
    sex2 = State --haha
    local gogo1000 = 0
    local LP = game:service('Players').LocalPlayer
    local MOUSE = LP:GetMouse()
        MOUSE.KeyDown:connect(function(KEY)
    if KEY:lower() == 'b' then
        if sex2 then
            local LP = game:service('Players').LocalPlayer
            local MOUSE = LP:GetMouse()
            gogo1000 = gogo1000 + 1
    _G.FLYING = false
        local T = LP.Character.Torso
        local CONTROL = {F = 0, B = 0, L = 0, R = 0}
        local lCONTROL = {F = 0, B = 0, L = 0, R = 0}
        local SPEED = 5
        local function FLY()
    _G.FLYING = true
        local BG = Instance.new('BodyGyro', T)
        local BV = Instance.new('BodyVelocity', T)
            BG.P = 9e4
            BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            BG.cframe = T.CFrame
            BV.velocity = Vector3.new(0, 0.1, 0)
            BV.maxForce = Vector3.new(9e9, 9e9, 9e9)

spawn(function()
    repeat wait()
        LP.Character.Humanoid.PlatformStand = true
        if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 then
            SPEED = 50
        elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0) and SPEED ~= 0 then
            SPEED = 0
        end
            if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 then
                BV.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B) * 0.2, 0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
            elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and SPEED ~= 0 then
                BV.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B) * 0.2, 0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
            else
                BV.velocity = Vector3.new(0, 0.1, 0)
            end
                BG.cframe = game.Workspace.CurrentCamera.CoordinateFrame
                until not _G.FLYING
            CONTROL = {F = 0, B = 0, L = 0, R = 0}
            lCONTROL = {F = 0, B = 0, L = 0, R = 0}
            SPEED = 0
                BG:destroy()
                BV:destroy()
                    LP.Character.Humanoid.PlatformStand = false
                end)
            end
            MOUSE.KeyDown:connect(function(KEY)
                if KEY:lower() == 'w' then
                    CONTROL.F = 1
                elseif KEY:lower() == 's' then
                    CONTROL.B = -1
                elseif KEY:lower() == 'a' then
                    CONTROL.L = -1 
                elseif KEY:lower() == 'd' then 
                    CONTROL.R = 1
                end
            end)
            MOUSE.KeyUp:connect(function(KEY)
                if KEY:lower() == 'w' then
                    CONTROL.F = 0
                elseif KEY:lower() == 's' then
                    CONTROL.B = 0
                elseif KEY:lower() == 'a' then
                    CONTROL.L = 0
                elseif KEY:lower() == 'd' then
                    CONTROL.R = 0
                end
            end)
                FLY()
                if gogo1000 == 2 then
                    _G.FLYING = false
                    gogo1000 = 0
                end
            end
        end
    end) 
end)

local Button1 = Section2:CreateButton("Anti Lag", function() --nice nice more people need to use this
    for _,v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then
        v.Material = Enum.Material.SmoothPlastic;
            if v:IsA("Texture") then
                v:Destroy();
            end 
        end		
    end
end)

local Button1 = Section2:CreateButton("Teleport to RandomPlayer", function() --kinda works sometimes
    local randomPlayer = game.Players:GetPlayers()
    [math.random(1,#game.Players:GetPlayers())]

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(randomPlayer.Character.Head.Position.X, randomPlayer.Character.Head.Position.Y, randomPlayer.Character.Head.Position.Z))
end)
 
local Button1 = Section2:CreateButton("ServerHop", function()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    local File = pcall(function()
        AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
    end)
    if not File then
        table.insert(AllIDs, actualHour)
        writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end 

function TPReturner() --thank you big ups
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end

    Teleport()
end)

local Toggle3 = Section3:CreateToggle("Destroy Gui", nil, function(State)
	Window:Toggle(State)
end)
    
Toggle3:SetState(true)
    local Colorpicker3 = Section3:CreateColorpicker("UI Color", function(Color)
    	Window:ChangeColor(Color)
    end)
    Colorpicker3:UpdateColor(Config.Color)

local Dropdown3 = Section4:CreateDropdown("Image")
    local Option7 = Dropdown3:AddOption("Default", function(String)
    	Window:SetBackground("2151741365")
    end)
    local Option8 = Dropdown3:AddOption("Hearts", function(String)
    	Window:SetBackground("6073763717")
    end)
    local Option9 = Dropdown3:AddOption("Abstract", function(String)
    	Window:SetBackground("6073743871")
    end)
    local Option10 = Dropdown3:AddOption("Hexagon", function(String)
    	Window:SetBackground("6073628839")
    end)
    local Option11 = Dropdown3:AddOption("Circles", function(String)
    	Window:SetBackground("6071579801")
    end)
    local Option12 = Dropdown3:AddOption("Lace With Flowers", function(String)
    	Window:SetBackground("6071575925")
    end)
    local Option13 = Dropdown3:AddOption("Floral", function(String)
    	Window:SetBackground("5553946656")
    end)
    Option7:SetOption()

local Colorpicker4 = Section4:CreateColorpicker("Color", function(Color)
	Window:SetBackgroundColor(Color)
end)
    Colorpicker4:UpdateColor(Color3.new(1,1,1))

local Slider3 = Section4:CreateSlider("Transparency",0,1,nil,false, function(Value)
	Window:SetBackgroundTransparency(Value)
end)
    Slider3:SetValue(0)

local Slider4 = Section4:CreateSlider("Tile Scale",0,1,nil,false, function(Value)
	Window:SetTileScale(Value)
end)
    Slider4:SetValue(0.5)
