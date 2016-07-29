AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("HUD.lua")

include("shared.lua")
include("HUD.lua")

function GM:PlayerSpawn(ply)
	ply:SetGravity(0.80)
	ply:SetMaxHealth(100)
	ply:SetRunSpeed(500)
	ply:SetWalkSpeed(300)
	ply:Give("weapon_physcannon")
	ply:Give("weapon_physgun")
	ply:SetupHands()
end