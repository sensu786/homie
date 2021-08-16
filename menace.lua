getgenv().grabItem = false;

function doGrab()
    spawn(function()
        local playerHead = game.Players.LocalPlayer.Character.Head
        while wait() do
            if not getgenv().grabItem then break end
            for i, v in pairs(game:GetService("Workspace").Asda:GetDescendants()) do
                if v.Name == "TouchInterest" and v.Parent then
                    -- we will fire the touch event
                    firetouchinterest(playerHead,v.Parent, 0)
                    wait(0.01)
                    firetouchinterest(playerHead,v.Parent, 1)
                    break;
                end
            end
        end
    end)
end

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local w = library:CreateWindow("Mr. Worldwide")

local b = w:CreateFolder("Item Farm")

b:Toggle("Grab",function(bool)
    getgenv().grabItem = bool
    print("Auto Grab is: ", bool);
    if bool then
        doGrab();
    end
end

b:DestroyGui()
