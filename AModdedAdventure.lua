local plr = game.Players.LocalPlayer
local char = plr.Character
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
if game.PlaceId == 17041031058 then
    OrionLib:MakeNotification({
        Name = "Detected game",
        Content = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
        Image = "rbxassetid://4483345998",
        Time = 5
    })

    local Window = OrionLib:MakeWindow({Name = "Cursed Hub", HidePremium = true, SaveConfig = true, ConfigFolder = "AModdedAdventureFolder", IntroEnabled = true, IntroText = "Cursed Hub"})

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
                        firetouchinterest(item.Handle,game.Players.LocalPlayer.Character.HumanoidRootPart,1)
                        print(item.Name)
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

    local OpenGUITab = Window:MakeTab({
        Name = "Gui",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    local OpenGUISection = OpenGUITab:AddSection({
        Name = "Open GUI"
    })

    local BlackmarketGUIButton = OpenGUITab:AddButton({
        Name = "Toggle Blackmarket GUI",
        Callback = function()
        if plr.PlayerGui.BlackmarketGUI.Enabled == false then
            plr.PlayerGui.BlackmarketGUI.Enabled = true
            OrionLib:MakeNotification({
            Name = "Blackmarket GUI",
            Content = "opened!",
            Image = "rbxassetid://4483345998",
            Time = 5
            })
        else
            plr.PlayerGui.BlackmarketGUI.Enabled = false
            OrionLib:MakeNotification({
            Name = "Blackmarket GUI",
            Content = "closed!",
            Image = "rbxassetid://4483345998",
            Time = 5
            })
        end
        end
    })

    local ShopGUIButton = OpenGUITab:AddButton({
        Name = "Toggle Shop GUI",
        Callback = function()
        if plr.PlayerGui.ShopGUI.Enabled == false then
            plr.PlayerGui.ShopGUI.Enabled = true
            OrionLib:MakeNotification({
            Name = "Shop GUI",
            Content = "opened!",
            Image = "rbxassetid://4483345998",
            Time = 5
            })
        else
            plr.PlayerGui.ShopGUI.Enabled = false
            OrionLib:MakeNotification({
            Name = "Shop GUI",
            Content = "closed!",
            Image = "rbxassetid://4483345998",
            Time = 5
            })
        end
        end
    })

    local StandStorageButton = OpenGUITab:AddButton({
        Name = "FireServer Stand Storage",
        Callback = function()
        fireclickdetector(Workspace.NPCs.rev4p.ClickDetector)
        end
    })

    local AutoSaleTab = Window:MakeTab({
        Name = "Auto Sale",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    local AutoSaleSection = AutoSaleTab:AddSection({
        Name = "Coming soon.."
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
