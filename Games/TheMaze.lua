local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("RetardHub | The Maze", "DarkTheme")

-- Main Tab
local Visuals = Window:NewTab("Visuals")
local ESPSection = Visuals:NewSection("ESP")
local LightningSection = Visuals:NewSection("Lightning")

-- Player ESP
ESPSection:NewToggle("Player ESP", "Toggle ESP for players", function(state)
    if state then
        print("Toggle On")
    else
        print("Toggle Off")
    end
end)
    
-- Monster ESP
ESPSection:NewToggle("Monster ESP", "Toggle ESP for monsters", function(state)
    if state then
        print("Toggle On")
    else
        print("Toggle Off")
    end
end)
    
-- Item ESP
ESPSection:NewToggle("Item ESP", "Toggle ESP for items", function(state)
    if state then
        print("Toggle On")
    else
        print("Toggle Off")
    end
end)
    
-- Fullbright
LightningSection:NewToggle("Fullbright", "Toggle fullbright", function(state)
    local Lightning = game:GetService("Lighting")
    if state then
        Lightning.Brightness = 100
        Lightning.FogEnd = 1000000
    else
        Lightning.Brightness = 1
        Lightning.FogEnd = 95
    end
end)
    
-- Misc Tab
local Misc = Window:NewTab("Misc")
local FunSection = Misc:NewSection("Fun")
    
-- Infinite Axe
FunSection:NewToggle("Infinite Axe", "Toggle infinite axes spawning", function(state)
    _G.infiniteaxe = false
    if state then
        _G.infiniteaxe = true
        while _G.infiniteaxe == true do
            fireclickdetector(game:GetService("Workspace").Axe.Handle.ClickDetector)
            wait(.1)
        end
    else
        _G.infiniteaxe = false
    end
end)