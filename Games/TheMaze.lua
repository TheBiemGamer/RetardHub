local Workspace = game:GetService("Workspace")
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("RetardHub | The Maze", "DarkTheme")

-- Main Tab
local Visuals = Window:NewTab("Visuals")
local ESPSection = Visuals:NewSection("ESP")
local LightningSection = Visuals:NewSection("Lightning")

-- Player ESP
ESPSection:NewToggle("Player ESP", "Toggle ESP for players", function(state)
    _G.esp = false
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local Highlight = Instance.new("Highlight")
    Highlight.Name = "Highlight"

    if state then
        _G.esp = true
        function ApplyToCurrentPlayers()
            for i,player in pairs(Players:GetChildren()) do 
                repeat wait() until player.Character
                if not player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
                    local HighlightClone = Highlight:Clone()
                    HighlightClone.Adornee = player.Character
                    HighlightClone.Parent = player.Character:FindFirstChild("HumanoidRootPart")
                    HighlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    HighlightClone.Name = "Highlight"
                end
            end
        end    
        
        RunService.Heartbeat:Connect(function()
            if _G.esp == true then
                ApplyToCurrentPlayers()
            end
        end)

    else
        _G.esp = false
        function RemoveFromCurrentPlayers()
            for i,player in pairs(Players:GetChildren()) do 
                repeat wait() until player.Character
                if player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
                    player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight"):Destroy()
                end
            end
        end

        RemoveFromCurrentPlayers()

    end
end)
    
-- Monster ESP
ESPSection:NewToggle("Monster ESP", "Toggle ESP for monsters", function(state)
    _G.monsteresp = false
    local Orotund = game:GetService("Workspace").TheOrotund
    local Cajoler = game:GetService("Workspace").TheCajoler
    local Highlight = Instance.new("Highlight")
    Highlight.Name = "Highlight"

    if state then
        _G.monsteresp = true
        function ApplyToMonsters()
            repeat wait() until Orotund
            if not Orotund:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
                local HighlightClone = Highlight:Clone()
                HighlightClone.Adornee = Orotund
                HighlightClone.Parent = Orotund:FindFirstChild("HumanoidRootPart")
                HighlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                HighlightClone.Name = "Highlight"
            end
            repeat wait() until Cajoler
            if not Cajoler:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
                local HighlightClone = Highlight:Clone()
                HighlightClone.Adornee = Cajoler
                HighlightClone.Parent = Cajoler:FindFirstChild("HumanoidRootPart")
                HighlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                HighlightClone.Name = "Highlight"
            end
        end    
        
        if _G.monsteresp == true then
            ApplyToMonsters()
        end

    else
        _G.monsteresp = false
        function RemoveFromMonsters()
                repeat wait() until Orotund
                if Orotund:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
                    Orotund:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight"):Destroy()
                end
                repeat wait() until Cajoler
                if Cajoler:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
                    Cajoler:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight"):Destroy()
                end
        end
    
        RemoveFromMonsters()

    end
end)
    
-- Fullbright
LightningSection:NewToggle("Fullbright", "Toggle fullbright", function(state)
    local Lightning = game:GetService("Lighting")
    if state then
        Lightning.Brightness = 100
        Lightning.FogEnd = 1000000
        Lightning.GlobalShadows = false
    else
        Lightning.Brightness = 1
        Lightning.FogEnd = 95
        Lightning.GlobalShadows = true
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