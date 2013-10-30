if not wac then return end

if SERVER then AddCSLuaFile('shared.lua') end
ENT.Base 			= "wac_hc_base"
ENT.Type 			= "anim"
ENT.Category		= "theres nothing here"
ENT.PrintName		= "Jupiter 2"
ENT.Author			= "SentryGunMan, Dr. Matt, Hornetnest, Weltensturm"
ENT.Spawnable		= true
ENT.AdminSpawnable		= true
ENT.AutomaticFrameAdvance = true // anims

ENT.Model		= "models/sentry/jupiter2.mdl"
ENT.EngineForce	= 34
ENT.Weight		= 24551
ENT.AngBrakeMul	= 0.012
ENT.SmokePos	= Vector(0,0,121)
ENT.FirePos		= Vector(0,0,121)

ENT.TopRotor = {
	dir = -1,
	pos = Vector(0,0,121),
	model = "models/props_junk/sawblade001a.mdl",
}
 
ENT.BackRotor = {
	dir = -1,
	pos = Vector(0,0,121),
	model = "models/props_junk/sawblade001a.mdl",
}

if CLIENT then
	ENT.thirdPerson = {
		distance = 1500
	}
	language.Add("Undone_wacufo", "Undone WAC UFO")
end

ENT.Wheels={
	{
		mdl="models/sentry/fa18fw.mdl",
		pos=Vector(-168,168,12),
		friction=100,
		mass=550,
	},
	{
		mdl="models/sentry/fa18fw.mdl",
		pos=Vector(-168,-168,12),
		friction=100,
		mass=550,
	},
	{
		mdl="models/sentry/fa18fw.mdl",
		pos=Vector(168,168,12),
		friction=100,
		mass=550,
	},
	{
		mdl="models/sentry/fa18fw.mdl",
		pos=Vector(168,-168,12),
		friction=100,
		mass=550,
	},
}

ENT.Seats = {
	{
		pos=Vector(290,-48,180),
		exit=Vector(200,-18,175),
	},
	{
		pos=Vector(290,40,180),
		exit=Vector(200,18,175),
		ang=Angle(0,-30,0),
	},
}

ENT.Sounds = {
	Start="WAC/Jup2/start.wav",
	Blades="WAC/jup2/external.wav",
	Engine="WAC/jup2/internal.wav",
	MissileAlert="HelicopterVehicle/MissileNearby.mp3",
	MissileShoot="HelicopterVehicle/MissileShoot.mp3",
	MinorAlarm="HelicopterVehicle/MinorAlarm.mp3",
	LowHealth="HelicopterVehicle/LowHealth.mp3",
	CrashAlarm="HelicopterVehicle/CrashAlarm.mp3",
}

function ENT:DrawPilotHud() end
function ENT:DrawWeaponSelection() end