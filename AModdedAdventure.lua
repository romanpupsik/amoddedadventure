local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
if game.PlaceId == 17041031058 then
    OrionLib:MakeNotification({
        Name = "Detected game",
        Content = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
        Image = "rbxassetid://4483345998",
        Time = 5
    })

    local Window = OrionLib:MakeWindow({Name = "Cursed Hub", HidePremium = true,IntroText = "Cursed Hub", SaveConfig = true, ConfigFolder = "AModdedAdventureFolder"})

    local AutofarmTab = Window:MakeTab({
        Name = "Autofarm",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    local Section = AutofarmTab:AddSection({
        Name = "Destroy"
    })

    AutofarmTab:AddButton({
        Name = "Destroy GUI",
        Callback = function()
            OrionLib:Destroy()
        end
    })

    local Section2 = AutofarmTab:AddSection({
        Name = "Autofarm"
    })

    local running = false

    local function AutofarmAllItems()
        while running do
            local items = game.Workspace.Drops:GetDescendants()
            for _, item in ipairs(items) do
                if item:IsA("Tool") and item:FindFirstChild("Handle") then
                    local char = game:GetService("Players").LocalPlayer.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        char.HumanoidRootPart.CFrame = item.Handle.CFrame
                        print("Teleporting to item: "..item.Name)
                    end
                    wait(0.1)
                    if not running then break end
                end
            end
            wait(1)
        end
    end

    AutofarmTab:AddToggle({
        Name = "Autofarm all items",
        Default = false,
        Callback = function(Value)
            running = Value
            if running then
                spawn(AutofarmAllItems)
            end
        end    
    })

    local running2 = false

    local function AutofarmBanknotes()
        while running2 do
            local items = game.Workspace.Drops:GetDescendants()
            for _, item in ipairs(items) do
                if item:IsA("UnionOperation") and item:FindFirstChild("TouchInterest") then
                    local char = game:GetService("Players").LocalPlayer.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        char.HumanoidRootPart.CFrame = item.CFrame
                        print("Teleporting to banknote...")
                    end
                    wait(0.1)
                    if not running2 then break end
                end
            end
            wait(1)
        end
    end

    AutofarmTab:AddToggle({
        Name = "Autofarm Banknotes",
        Default = false,
        Callback = function(Value)
            running2 = Value
            if running2 then
                spawn(AutofarmBanknotes)
            end
        end    
    })

    OrionLib:MakeNotification({
        Name = "Loading",
        Content = "GUI Loaded!",
        Image = "rbxassetid://4483345998",
        Time = 5
    })

    OrionLib:Init()
else
    OrionLib:MakeNotification({
        Name = "Detected game",
        Content = "not have script",
        Image = "rbxassetid://4483345998",
        Time = 5
    })
end
