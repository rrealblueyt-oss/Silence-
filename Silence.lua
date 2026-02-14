local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

game.Lighting.MainColorCorrection.TintColor = Color3.fromRGB(180, 0, 255)
game.Lighting.MainColorCorrection.Contrast = 1

local tween = game:GetService("TweenService")
tween:Create(game.Lighting.MainColorCorrection, TweenInfo.new(2.5), {Contrast = 0}):Play()
tween:Create(game.Lighting.MainColorCorrection, TweenInfo.new(80), {TintColor = Color3.fromRGB(255,255,255)}):Play()

local entity = spawner.Create({
 Entity = {
  Name = "Silence",
  Asset = "rbxassetid://16899810519",
  HeightOffset = 0
 },
 Lights = {
  Flicker = {
   Enabled = true,
   Duration = 1.5
  },
  Shatter = true,
  Repair = false
 },
 CameraShake = {
  Enabled = true,
  Range = 100,
  Values = {2, 25, 0.1, 1}
 },
 Movement = {
  Speed = 65,
  Delay = 1,
  Reversed = false
 },
 Rebounding = {
  Enabled = false,
  Type = "Ambush",
  Min = 1,
  Max = 1,
  Delay = 2
 },
 Damage = {
  Enabled = true,
  Range = 50,
  Amount = 9999
 },
 Crucifixion = {
  Enabled = false,
  Range = 40,
  Resist = false,
  Break = true
 },
 Death = {
  Type = "Guiding",
  Hints = {"your die to silence"},
  Cause = "die to silence"
 }
})

entity:SetCallback("OnDamagePlayer", function(newHealth)
 local ReSt = game.ReplicatedStorage
 local Plr = game.Players.LocalPlayer
 ReSt.GameStats["Player_"..Plr.Name].Total.DeathCause.Value = "die to silence"
end)

entity:Run()
