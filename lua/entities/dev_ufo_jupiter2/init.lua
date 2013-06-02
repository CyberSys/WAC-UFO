
include("shared.lua")
AddCSLuaFile("shared.lua")

function ENT:SpawnFunction(ply, tr)
	if (!tr.Hit) then return end
	local ent=ents.Create(ClassName)
	ent:SetPos(tr.HitPos+tr.HitNormal*10)
	ent:Spawn()
	ent:Activate()
	ent.Owner=ply	
	for i=1,4 do 
		ent.wheels[i]:SetRenderMode(RENDERMODE_TRANSALPHA)
		ent.wheels[i]:SetColor(Color(255,255,255,0))
	end
	return ent
end

function ENT:PhysicsUpdate(ph)
	self:base("wac_hc_base").PhysicsUpdate(self,ph)
	
	local geardown,t1=self:LookupSequence("geardown")
	local gearup,t2=self:LookupSequence("gearup")	
	local trace=util.QuickTrace(self:LocalToWorld(Vector(0,0,162)), self:LocalToWorld(Vector(0,0,0)), {self,self.TopRotor})
	local phys=self:GetPhysicsObject()
	local pos = self:GetPos()
	local tr=util.QuickTrace(pos+self:GetUp()*10,Vector(0,0,-999999),self.Entity)

	if IsValid(phys) and not self.disabled then
		if pos.z-tr.HitPos.z  > 280 and self:GetSequence() != gearup then
			self:ResetSequence(gearup) 
			self:SetPlaybackRate(1.0)
		elseif pos.z-tr.HitPos.z < 280  and self:GetSequence() == gearup then
			self:ResetSequence(geardown)
			self:SetPlaybackRate(1.0)
		end
	end
end

concommand.Add("wac_cl_air_spawn", function(ply,cmd,args)
	if args[1]=="totallynothing" then
		local tr=ply:GetEyeTraceNoCursor()
		if (!tr.Hit) then return end
		local ent=ents.Create("dev_ufo_jupiter2")
		ent:SetPos(tr.HitPos+tr.HitNormal*10)
		ent:Spawn()
		ent:Activate()
		ent.Owner=ply
		for i=1,4 do 
			ent.wheels[i]:SetRenderMode(RENDERMODE_TRANSALPHA)
			ent.wheels[i]:SetColor(Color(255,255,255,0))
		end
		undo.Create( "WACUFO" )
			undo.AddEntity(ent)
			undo.SetPlayer(ply)
		undo.Finish()
		hook.Call("PlayerSpawnedSENT", gmod.GetGamemode(), ply, ent)
	else
		print("um no")
	end
end)