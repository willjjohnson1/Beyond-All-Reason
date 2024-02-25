
local function miniboss1(currentFrame)
	if currentFrame > scavconfig.gracePeriod*2 then
		local T2bosses = {"corgol_scav","corparrow_scav","armada_fatboy_scav","armada_starlight_scav",} --"corsumo_scav",
		local T3bosses = {"armada_marauder_scav","armada_vanguard_scav","armada_razorback_scav","corshiva_scav","corkarg_scav","cortex_catapult_scav","armada_lunkhead_scav","corsok_scav","armada_recluset4_scav",}
		local T4bosses = {"corkorg_scav", "corjugg_scav", "armada_titan_scav","armada_pawnt4_scav","armrattet4_scav","armada_tumbleweedt4_scav","cordemon_scav","corkarganetht4_scav",}
		local baseNumber = ((spawnmultiplier*0.5)+(teamcount*0.5))*0.5
		for i = 1,1000 do
			local posx = math_random(300,mapsizeX-300)
			local posz = math_random(300,mapsizeZ-300)
			local posy = Spring.GetGroundHeight(posx, posz)
			CanSpawnEvent = positionCheckLibrary.VisibilityCheckEnemy(posx, posy, posz, 300, ScavengerAllyTeamID, true, true, false)
			if CanSpawnEvent then
				CanSpawnEvent = positionCheckLibrary.SurfaceCheck(posx, posy, posz, 300)
			end
			if CanSpawnEvent then
				if TierSpawnChances.T2 == 0 and TierSpawnChances.T3 == 0 and TierSpawnChances.T4 == 0 then
					local unit = T2bosses[math_random(1,#T2bosses)]
					for a = 1,math.ceil(baseNumber*4) do
						Spring.CreateUnit(unit, posx+math_random(-300,300), posy, posz+math_random(-300,300), math_random(0,3),ScavengerTeamID)
					end
				elseif TierSpawnChances.T3 == 0 and TierSpawnChances.T4 == 0 then
					local unit = T3bosses[math_random(1,#T3bosses)]
					for a = 1,math.ceil(baseNumber*4) do
						Spring.CreateUnit(unit, posx+math_random(-300,300), posy, posz+math_random(-300,300), math_random(0,3),ScavengerTeamID)
					end
				elseif TierSpawnChances.T4 == 0 then
					local unit = T4bosses[math_random(1,#T4bosses)]
					for a = 1,math.ceil(baseNumber*4) do
						Spring.CreateUnit(unit, posx+math_random(-300,300), posy, posz+math_random(-300,300), math_random(0,3),ScavengerTeamID)
					end
				else
					local unit = T4bosses[math_random(1,#T4bosses)]
					for a = 1,math.ceil(baseNumber*8) do
						Spring.CreateUnit(unit, posx+math_random(-300,300), posy, posz+math_random(-300,300), math_random(0,3),ScavengerTeamID)
					end
				end
				--ScavSendNotification("scav_eventminiboss")
				break
			end
		end
	end
end

local function miniboss2(currentFrame)
	if currentFrame > scavconfig.gracePeriod*2 then
		local T2bosses = {"scavmist_scav","scavmist_scav",}
		local T3bosses = {"scavmist_scav","scavmist_scav",}
		local T4bosses = {"scavmistxl_scav", "scavmistxl_scav",}
		local baseNumber = ((spawnmultiplier*0.5)+(teamcount*0.5))
		for i = 1,1000 do
			local posx = math_random(300,mapsizeX-300)
			local posz = math_random(300,mapsizeZ-300)
			local posy = Spring.GetGroundHeight(posx, posz)
			CanSpawnEvent = positionCheckLibrary.VisibilityCheckEnemy(posx, posy, posz, radius, ScavengerAllyTeamID, true, true, false)
			if CanSpawnEvent then
				CanSpawnEvent = positionCheckLibrary.SurfaceCheck(posx, posy, posz, 300)
			end
			if CanSpawnEvent then
				if TierSpawnChances.T2 == 0 and TierSpawnChances.T3 == 0 and TierSpawnChances.T4 == 0 then
					local unit = T2bosses[math_random(1,#T2bosses)]
					for a = 1,math.ceil(baseNumber*4) do
						Spring.CreateUnit(unit, posx+math_random(-300,300), posy, posz+math_random(-300,300), math_random(0,3),ScavengerTeamID)
					end
				elseif TierSpawnChances.T3 == 0 and TierSpawnChances.T4 == 0 then
					local unit = T3bosses[math_random(1,#T3bosses)]
					for a = 1,math.ceil(baseNumber*4) do
						Spring.CreateUnit(unit, posx+math_random(-300,300), posy, posz+math_random(-300,300), math_random(0,3),ScavengerTeamID)
					end
				elseif TierSpawnChances.T4 == 0 then
					local unit = T4bosses[math_random(1,#T4bosses)]
					for a = 1,math.ceil(baseNumber*4) do
						Spring.CreateUnit(unit, posx+math_random(-300,300), posy, posz+math_random(-300,300), math_random(0,3),ScavengerTeamID)
					end
				else
					local unit = T4bosses[math_random(1,#T4bosses)]
					for a = 1,math.ceil(baseNumber*8) do
						Spring.CreateUnit(unit, posx+math_random(-300,300), posy, posz+math_random(-300,300), math_random(0,3),ScavengerTeamID)
					end
				end
				ScavSendNotification("scav_eventcloud")
				break
			end
		end
	end
end

return {
	miniboss1,
	miniboss1,
	--miniboss2,
}