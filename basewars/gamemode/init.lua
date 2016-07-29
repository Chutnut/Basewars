AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("HUD.lua")

include("shared.lua")
include("HUD.lua")

function GM:PlayerInitialSpawn(ply)
	if (ply:GetNWInt("playerLvl") <= 0) then
		ply:SetNWInt("playerLvl", 1)
	end
end

function GM:OnNPCKilled(npc, attacker, inflictor)
	attacker:SetNWInt("playerMoney", attacker:GetNWInt("playerMoney") + 100)
	
	attacker:SetNWInt("playerExp", attacker:GetNWInt("playerExp") + 100)
	
	checkForLevel(attacker)
end

function GM:PlayerDeath(victm, inflictor, attacker)
	attacker:SetNWInt("playerMoney", attacker:GetNWInt("playerMoney") + 200)
	
	attacker:SetNWInt("playerExp", attacker:GetNWInt("playerExp") + 100)
	
	checkForLevel(attacker)
end

function checkForLevel(ply)
	local exptolevel = (ply:GetNWInt("playerLvl" * 100) * 2)
	local curExp = ply:GetNWInt("playerExp")
	local curLvl = ply:GetNWInt("playerLvl")
	
	if (curExp >= exptolevel) then
		curExp = curExp - exptolevel
		
		ply:SetNWInt("playerExp", curExp)
		ply:SetNWInt("playerLvl", curLvl + 1)
	end
end