--[[
    lemme find the other stats
    AutoFire false
    Bullets 1
    Range 600
    FireRate 0.08
    MaxAmmo 15
    Spread 11
    Damage 10
    CurrentAmmo 15
    StoredAmmo 100
    ReloadTime 2
    i dont think spread works either, when i tried it it was dedded
    Yeah
--]]

local StatBullets = 1
local StatAutofire = false
local StatFireRate = 0.08
local StatCurrentAmmo = 15
local StatStoredAmmo 
local StatReloadTime = 2
local StatRange = 600

local library = loadstring(game:HttpGet("https://pastebin.com/raw/4bkx1mLs"))()

local w1 = library:CreateWindow("Gun Modder")
w1:Toggle("Automatic", {}, function(v)
    StatAutofire = v
end)
w1:Slider("Bullets", {
    min = 1,
    max = 150,
    flag = ""
}, function(v)
    StatBullets = tonumber(v)
end)
w1:Slider("Firerate", {
    min = 0,
    max = 150,
    flag = ""
}, function(v)
    StatFireRate = tonumber(v)
end)
w1:Slider("Reload Time", {
    min = 0,
    max = 150,
    flag = ""
}, function(v)
    StatReloadTime = tonumber(v)
end)
w1:Box("Current Ammo", {
    flag = "ammo",
    type = "number"
}, function(v)
    StatCurrentAmmo = tonumber(v)
end)
w1:Box("Max Ammo", {
    flag = "ammo2",
    type = "number"
}, function(v)
    StatMaxAmmo = tonumber(v)
end)
w1:Button("Infinite Current Ammo", function()
    StatCurrentAmmo = math.huge
end)
w1:Button("Infinite Max Ammo", function()
    StatMaxAmmo = math.huge
end)
w1:Button("Infinite Range", function()
    StatRange = math.huge
end)
w1:Button("Give All Guns", function()
    for i,v in pairs(Workspace.Prison_ITEMS.giver:GetChildren()) do
        local Gun = Workspace.Remote.ItemHandler:InvokeServer(v.ITEMPICKUP)
        print(Gun)
    end
end)

w1:Button("Mod Equipped Gun", function()
    if game.Players.LocalPlayer.Character:FindFirstChild("Taser") then
        game.StarterGui:SetCore("SendNotification",  {
            Title = "Error";
            Text = "This doesn't work with taser :(";
            Icon = "";
            Duration = 10;
        })
    elseif game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and not game.Players.LocalPlayer.Character:FindFirstChild("Taser") then
        local GunScript = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").GunInterface
        local func = 0
        for i,v in pairs(getgc()) do
            if type(v) == "function" then
                if typeof(getfenv(v).script) == "Instance" and getfenv(v).script == GunScript then
                    func = func + 1
                    if func == 4 then
                        local GunStats = debug.getupvalue(v, 3)
                        GunStats.AutoFire = StatAutofire
                        GunStats.Bullets = StatBullets
                        GunStats.Range = StatRange
                        GunStats.FireRate = StatFireRate
                        GunStats.MaxAmmo = StatMaxAmmo
                        GunStats.CurrentAmmo = StatCurrentAmmo
                        GunStats.ReloadTime = StatReloadTime
                    end
                end
            end
        end
    end
end)
 -- this script currently crashes, oof --