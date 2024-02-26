if not gadgetHandler:IsSyncedCode() then
    return
end

local gadgetEnabled = false
if Spring.Utilities.Gametype.IsPvE() then
	Spring.Echo("[ControlVictory] Deactivated because Raptors or Scavengers are present!")
elseif Spring.GetModOptions().scoremode ~= "disabled" and Spring.GetModOptions().scoremode_chess then
    gadgetEnabled = true
end

function gadget:GetInfo()
	return {
		name      = "Control Victory Chess Mode",
		desc      = "123",
		author    = "Damgam",
		date      = "2021",
		license   = "GNU GPL, v2 or later",
		layer     = -100,
		enabled   = gadgetEnabled,
	}
end

local positionCheckLibrary = VFS.Include("luarules/utilities/damgam_lib/position_checks.lua")

local ChessModeUnbalancedModoption = Spring.GetModOptions().scoremode_chess_unbalanced
local ChessModePhaseTimeModoption = Spring.GetModOptions().scoremode_chess_adduptime
local ChessModeSpawnPerPhaseModoption = Spring.GetModOptions().scoremode_chess_spawnsperphase

local capturePointRadius = math.floor(Spring.GetModOptions().captureradius)

local gaiaTeamID = Spring.GetGaiaTeamID()
local gaiaAllyTeamID = select(6, Spring.GetTeamInfo(gaiaTeamID))
local teams = Spring.GetTeamList()

local teamSpawnPositions = {}
local teamSpawnQueue = {}
local teamRespawnQueue = {}
local teamIsLandPlayer = {}
local resurrectedUnits = {}

local isCommander = {}
for unitDefID, unitDef in pairs(UnitDefs) do
	if unitDef.customParams.iscommander then
		isCommander[unitDefID] = true
	end
end

local function distance(pos1,pos2)
	local xd = pos1.x-pos2.x
	local yd = pos1.z-pos2.z
	local dist = math.sqrt(xd*xd + yd*yd)
	return dist
end

function GetControlPoints()
	--if controlPoints then return controlPoints end
	controlPoints = {}
	if Script.LuaRules('ControlPoints') then
		local rawPoints = Script.LuaRules.ControlPoints() or {}
		for id = 1, #rawPoints do
			local rawPoint = rawPoints[id]
			local rawPoint = rawPoint
			local pointID = id
			local pointOwner = rawPoint.owner
			local pointPosition = {x=rawPoint.x, y=rawPoint.y, z=rawPoint.z}
			local point = {pointID=pointID, pointPosition=pointPosition, pointOwner=pointOwner}
			controlPoints[id] = point
		end
	end
	return controlPoints
end

-- function GetRandomAllyPoint(teamID, unitName)
--     local _,_,_,_,_,allyTeamID = Spring.GetTeamInfo(teamID)
--     local unitDefID = UnitDefNames[unitName].id
-- 	for i = 1,1000 do
-- 		local r = math.random(1,#controlPoints)
-- 		local point = controlPoints[r]
-- 		local pointAlly = controlPoints[r].pointOwner
-- 		local pointPos = controlPoints[r].pointPosition
-- 		local y = Spring.GetGroundHeight(pointPos.x, pointPos.z)
--         local unreachable = true
--         if (-(UnitDefs[unitDefID].minWaterDepth) > y) and (-(UnitDefs[unitDefID].maxWaterDepth) < y) or UnitDefs[unitDefID].canFly then
--             unreachable = false
--         end
--         if unreachable == false and pointAlly == allyTeamID then
-- 			pos = pointPos
-- 			break
-- 		end
-- 	end
-- 	return pos
-- end

-- function GetClosestEnemyPoint(unitID)
-- 	local pos
-- 	local bestDistance
-- 	local controlPoints = controlPointsList
-- 	local unitAllyTeam = Spring.GetUnitAllyTeam(unitID)
-- 	local unitDefID = Spring.GetUnitDefID(unitID)
-- 	local unitPositionX, unitPositionY, unitPositionZ = Spring.GetUnitPosition(unitID)
-- 	local position = {x=unitPositionX, y=unitPositionY, z=unitPositionZ}
-- 	for i = 1, #controlPoints do
-- 		local point = controlPoints[i]
-- 		local pointAlly = controlPoints[i].pointOwner
-- 		if pointAlly ~= unitAllyTeam then
-- 			local pointPos = controlPoints[i].pointPosition
-- 			local dist = distance(position, pointPos)
-- 			local y = Spring.GetGroundHeight(pointPos.x, pointPos.z)
-- 			local unreachable = true
-- 			if (-(UnitDefs[unitDefID].minWaterDepth) > y) and (-(UnitDefs[unitDefID].maxWaterDepth) < y) or UnitDefs[unitDefID].canFly then
-- 				unreachable = false
-- 			end
-- 			if unreachable == false and (not bestDistance or dist < bestDistance) then
-- 				bestDistance = dist
-- 				pos = pointPos
-- 			end
-- 		end
-- 	end
-- 	return pos
-- end


local function pickRandomUnit(list, quantity)
    if #list > 1 then
        r = math.random(1,#list)
    else
        r = 1
    end
    pickedTable = {}
    for i = 1,quantity do
        table.insert(pickedTable, list[r])
    end
    r = nil
    return pickedTable
end


local starterLandUnitsList = {
    [1] = {
        table = {
            --bots
            "armada_pawn",
            "cortex_grunt",
            --vehicles
            "armada_blitz",
            "cortex_incisor",
        },
        quantity = 10,
    },
    [2] = {
        table = {
            "armada_tick",
            "armada_rover",
            "cortex_rascal" ,
        },
        quantity = 5,
    },
    -- [3] = {
    --     table = {
    --         "armassistdrone",
    --         "corassistdrone",
    --     },
    --     quantity = 1,
    -- },
    [3] = {
        table = {
            "armada_lazarus",
            "cortex_graverobber",
        },
        quantity = 4,
    },
    [4] = {
        table = {
            "armada_groundhog",
            "cortex_trapper",
        },
        quantity = 2,
    },
    [5] = {
        table = {
            -- "armada_crossbow",
            -- "cortex_trasher",
            -- "armada_sweeper",
            -- "cortex_birdeater",
            "armada_whistler",
            "cortex_lasher",
        },
        quantity = 4,
    },
}

local landUnitsList = {

    -- Tier 1
    [1] = {
        [1] = {
            table = {
                -- Bots
                "armada_pawn",
                "armada_rocketeer",
                "armada_mace",
                --"armada_crossbow",
                "armada_centurion",
                "cortex_grunt",
                "cortex_thug",
                "cortex_aggravator",
                --"cortex_trasher",
                "legkark",
                "leggob",
                "legcen",
                "legbal",

                -- Vehicles
                "armada_blitz",
                "armada_stout",
                "armada_shellshocker",
                "armada_whistler",
                "armada_pincer",
                "armada_janus",
                "cortex_incisor",
                "cortex_lasher",
                "cortex_wolverine",
                "cortex_pounder",
                "cortex_brute",
                "leggat",
                "legrail",

                -- Hovercraft
                "armada_seeker",
                "armada_possum",
                --"armada_sweeper",
                "armada_crocodile",
                "cortex_goon",
                "cortex_mangonel",
                --"cortex_birdeater",
                "cortex_cayman",
            },
            quantity = 10,
        },
        [2] = {
            table = {
                "armada_lazarus",
                "cortex_graverobber",
            },
            quantity = 4,
        },
        -- [2] = {
        --     table = {
        --         "armada_constructionbot",
        --         "armada_constructionvehicle",
        --         "armada_beaver",
        --         "armada_constructionhovercraft",
        --         "cortex_constructionbot",
        --         "cortex_constructionvehicle",
        --         "cortex_muskrat",
        --     },
        --     quantity = 1,
        -- },
    },

    -- Tier 2
    [2] = {
        [1] = {
            table = {
                -- Bots
                "armada_tumbleweed",
                "armada_webber",
                "armada_recluse",
                "armada_sprinter",
                "armada_amphibiousbot",
                "armada_hound",
                "armada_welder",
                "armada_ghost",
                --"armada_archangel",
                "armada_sharpshooter",
                "armada_gunslinger",
                "cortex_bedbug",
                "cortex_fiend",
                --"cortex_twitcher",
                "cortex_sheldon",
                "cortex_duck",
                "cortex_skuttle",
                "cortex_spectre",
                "cortex_sumo",
                --"cortex_manticore",
                "cortex_termite",
                "cortex_commando",

                -- Vehicles
                "armada_gremlin",
                "armada_mauser",
                "armada_jaguar",
                --"armada_shredder",
                "armada_turtle",
                "armada_ambassador",
                "armada_bull",
				--"corforge",
                "cortex_quaker",
                --"cortex_fury",
                "cortex_alligator",
                "cortex_tiger",
                "corgatreap",
                "cortex_negotiator",
                "cortex_banisher",
                "cortex_poisonarrow",

                -- Hovercraft
                "cortex_halberd",
            },
            quantity = 5,
        },
        [2] = {
            table = {
                "armada_lazarus",
                "cortex_graverobber",
            },
            quantity = 3,
        },
        -- [2] = {
        --     table = {
        --         "armada_advancedconstructionbot",
        --         "armada_decoycommander",
        --         "armada_advancedconstructionvehicle",
        --         --"armada_consul",
        --         "cortex_advancedconstructionbot",
        --         "cortex_decoycommander",
        --         "cortex_advancedconstructionvehicle",
        --     },
        --     quantity = 1,
        -- },
    },

    -- Tier 3
    [3] = {
        [1] = {
            table = {
                -- Heavy T2s
                "cortex_tzar",
                "cortex_mammoth",
                "armada_fatboy",
                "armada_starlight",
                "cortex_tremor",
                "cortex_arbiter",

                -- Bots
                "armada_marauder",
                "armada_vanguard",
                "armada_razorback",
                "cortex_shiva",
                "cortex_karganeth",
                "cortex_catapult",
                "armada_lunchbox",
                "armmeatball",
                "armassimilator",

                -- Vehicles
                "armada_thor",

                -- Hovercraft
                "armada_lunkhead",
                "cortex_cataphract",
                "armada_recluset4",
            },
            quantity = 3,
        },
        [2] = {
            table = {
                "armada_lazarus",
                "cortex_graverobber",
            },
            quantity = 2,
        },
        -- [2] = {
        --     table = {
        --         "armada_advancedconstructionbot",
        --         "armada_decoycommander",
        --         "armada_advancedconstructionvehicle",
        --         --"armada_consul",
        --         "cortex_advancedconstructionbot",
        --         "cortex_decoycommander",
        --         "cortex_advancedconstructionvehicle",
        --     },
        --     quantity = 1,
        -- },
    },

    -- Tier 4
    [4] = {
        [1] = {
            table = {
                "cortex_juggernaut",
                "cortex_behemoth",
                "armada_titan",
                "armada_thor",

                -- Superboss
                "armada_pawnt4",
                "armrattet4",
                "armada_tumbleweedt4",
                "cortex_gruntt4",
                "cortex_demon",
                "cortex_karganetht4",
                "cortex_tzart4",
            },
            quantity = 1,
        },
        [2] = {
            table = {
                "armada_lazarus",
                "cortex_graverobber",
            },
            quantity = 1,
        },
        -- [2] = {
        --     table = {
        --         "armada_advancedconstructionbot",
        --         "armada_decoycommander",
        --         "armada_advancedconstructionvehicle",
        --         --"armada_consul",
        --         "cortex_advancedconstructionbot",
        --         "cortex_decoycommander",
        --         "cortex_advancedconstructionvehicle",
        --     },
        --     quantity = 1,
        -- },
    },
}

local starterSeaUnitsList = {
    [1] = {
        table = {
            "armada_skater",
            "cortex_herring",
        },
        quantity = 10,
    },
    [2] = {
        table = {
            "armada_grimreaper",
            "cortex_deathcavalry",
        },
        quantity = 4,
    },
    -- [2] = {
    --     table = {
    --         "armassistdrone",
    --         "corassistdrone",
    --     },
    --     quantity = 1,
    -- },
}

local seaUnitsList = {
    -- Tier 1
    [1] = {
        [1] = {
            table = {
                "armada_skater",
                "armada_dolphin",
                "armada_ellysaw",
                "armada_eel",
                "armada_pincer",
                "cortex_herring",
                "cortex_supporter",
                "cortex_riptide",
                "cortex_orca",
                "cortex_garpike",

                -- Hovercraft
                "armada_seeker",
                "armada_possum",
                --"armada_sweeper",
                "armada_crocodile",
                "cortex_goon",
                "cortex_mangonel",
                --"cortex_birdeater",
                "cortex_cayman",
            },
            quantity = 10,
        },
        [2] = {
            table = {
                "armada_grimreaper",
                "cortex_deathcavalry",
            },
            quantity = 4,
        },
        -- [2] = {
        --     table = {
        --         "armada_beaver",
        --         "armada_constructionhovercraft",
        --         "armada_constructionship",
        --         "cortex_muskrat",
        --         "cortex_constructionship",
        --     },
        --     quantity = 1,
        -- },
    },

    -- Tier 2
    [2] = {
        [1] = {
            table = {
                "armada_corsair",
                "armada_voyager",
                "armada_barracuda",
                "armada_dragonslayer",
                "armada_paladin",
                "armada_longbow",
                "armada_turtle",
                "cortex_oppressor",
                "cortex_pathfinder",
                "cortex_predator",
                "cortex_arrowstorm",
                "cortex_buccaneer",
                "cortex_kraken",
                "cortex_messenger",
                "cortex_alligator",

                -- Hovercraft
                "cortex_halberd",
            },
            quantity = 5,
        },
        [2] = {
            table = {
                "armada_grimreaper",
                "cortex_deathcavalry",
            },
            quantity = 3,
        },
        -- [2] = {
        --     table = {
        --         "armada_voyager",
        --         "armada_advancedconstructionsub",
        --         "cortex_pathfinder",
        --         "cortex_advancedconstructionsub",
        --     },
        --     quantity = 1,
        -- },
    },

    -- Tier 3
    [3] = {
        [1] = {
            table = {
                "armada_dreadnought",
                "armada_epoch",
                "armada_serpent",
                "cortex_despot",
                "cortex_blackhydra",
                "corslrpc",
                "armada_dolphint3",
                "armada_ellysawt3",
                "armada_skatert2",

                -- Hovercraft
                "armada_lunkhead",
                "cortex_cataphract",
            },
            quantity = 3,
        },
        [2] = {
            table = {
                "armada_grimreaper",
                "cortex_deathcavalry",
            },
            quantity = 2,
        },
        -- [2] = {
        --     table = {
        --         "armada_voyager",
        --         "armada_advancedconstructionsub",
        --         "cortex_pathfinder",
        --         "cortex_advancedconstructionsub",
        --     },
        --     quantity = 1,
        -- },
    },

    -- Tier 4
    [4] = {
        [1] = {
            table = {
                "armada_serpentt3",
                "armada_epoch",
                "cortex_blackhydra",
                "armada_tumbleweedt4",
                "cortex_juggernaut",
                "armada_titan",
                "cortex_supportert3",
            },
            quantity = 1,
        },
        [2] = {
            table = {
                "armada_grimreaper",
                "cortex_deathcavalry",
            },
            quantity = 1,
        },
        -- [2] = {
        --     table = {
        --         "armada_voyager",
        --         "armada_advancedconstructionsub",
        --         "cortex_pathfinder",
        --         "cortex_advancedconstructionsub",
        --     },
        --     quantity = 1,
        -- },
    },
}



--local spawnsPerPhase = ChessModeSpawnPerPhaseModoption
local addUpFrequency = ChessModePhaseTimeModoption*1800
--local spawnTimer = 9000
local respawnTimer = 2500
--local phase
--local canResurrect = {}

-- Functions to hide commanders
-- for unitDefID, unitDef in pairs(UnitDefs) do
--     if unitDef.canResurrect then
--         canResurrect[unitDefID] = true
--     end
-- end

local function disableUnit(unitID)
	Spring.MoveCtrl.Enable(unitID)
	Spring.MoveCtrl.SetNoBlocking(unitID, true)
    local r = math.random(0,3)
    local x = 0
    local z = 0
    if r == 0 then
        x = 0 - math.random(0,1900)
        z = 0 - math.random(0,1900)
    elseif r == 1 then
        x = Game.mapSizeX + math.random(0,1900)
        z = 0 - math.random(0,1900)
    elseif r == 2 then
        x = 0 - math.random(0,1900)
        z = Game.mapSizeZ + math.random(0,1900)
    elseif r == 3 then
        x = Game.mapSizeX + math.random(0,1900)
        z = Game.mapSizeZ + math.random(0,1900)
    end
    Spring.MoveCtrl.SetPosition(unitID, x, 2000, z)
	Spring.SetUnitNeutral(unitID, true)
	Spring.SetUnitCloak(unitID, true)
	--Spring.SetUnitHealth(unitID, {paralyze=99999999})
	Spring.SetUnitMaxHealth(unitID, 10000000)
	Spring.SetUnitHealth(unitID, 10000000)
	Spring.SetUnitNoDraw(unitID, true)
	Spring.SetUnitStealth(unitID, true)
	Spring.SetUnitNoSelect(unitID, true)
	Spring.SetUnitNoMinimap(unitID, true)
	Spring.GiveOrderToUnit(unitID, CMD.MOVE_STATE, { 0 }, 0)
	Spring.GiveOrderToUnit(unitID, CMD.FIRE_STATE, { 0 }, 0)
end

local initialCommanders = {}
local function introSetUp()
    for i = 1,#teams do
        local teamID = teams[i]
        local teamUnits = Spring.GetTeamUnits(teamID)
        if teamID ~= gaiaTeamID then
            for _, unitID in ipairs(teamUnits) do
                local x,y,z = Spring.GetUnitPosition(unitID)
                teamSpawnPositions[teamID] = { x = x, y = y, z = z}
                if teamSpawnPositions[teamID].y > 0 then
                    teamIsLandPlayer[teamID] = true
                else
                    teamIsLandPlayer[teamID] = false
                end
				teamSpawnQueue[teamID] = {}
				teamRespawnQueue[teamID] = {}
                disableUnit(unitID)
				initialCommanders[unitID] = true
            end
        end
    end
    phase = 1
end


local function destroyCommanders()
	for unitID, _ in pairs(initialCommanders) do
		if Spring.ValidUnitID(unitID) then
			Spring.DestroyUnit(unitID, false, true)
		end
	end
	initialCommanders = nil
end

local function addInfiniteResources()
    for i = 1,#teams do
        local teamID = teams[i]
        Spring.SetTeamResource(teamID, "ms", 1000000)
        Spring.SetTeamResource(teamID, "es", 1000000)
        Spring.SetTeamResource(teamID, "m", 500000)
        Spring.SetTeamResource(teamID, "e", 500000)
    end
end

-- local function spawnUnitsFromQueue(teamID)
--     if teamSpawnQueue[teamID] then
--         if teamSpawnQueue[teamID][1] then
--             local pos = GetRandomAllyPoint(teamID, teamSpawnQueue[teamID][1])
--             local spawnedUnit
--             if pos and pos.x then
--                 local x = pos.x+math.random(-50,50)
--                 local z = pos.z+math.random(-50,50)
--                 local y = Spring.GetGroundHeight(x,z)
--                 spawnedUnit = Spring.CreateUnit(teamSpawnQueue[teamID][1], x, y, z, 0, teamID)
--                 Spring.SpawnCEG("scav-spawnexplo",x,y,z,0,0,0)
--                 table.remove(teamSpawnQueue[teamID], 1)
--             else
--                 local x = teamSpawnPositions[teamID].x + math.random(-64,64)
--                 local z = teamSpawnPositions[teamID].z + math.random(-64,64)
--                 local y = Spring.GetGroundHeight(x,z)
--                 spawnedUnit = Spring.CreateUnit(teamSpawnQueue[teamID][1], x, y, z, 0, teamID)
--                 Spring.SpawnCEG("scav-spawnexplo",x,y,z,0,0,0)
--                 table.remove(teamSpawnQueue[teamID], 1)
--             end
--             local rawPos = GetClosestEnemyPoint(spawnedUnit)
--             if rawPos then
--                 local posx = rawPos.x
--                 local posz = rawPos.z
--                 local posy = Spring.GetGroundHeight(posx, posz)
--                 if posx then
--                     Spring.GiveOrderToUnit(spawnedUnit, CMD.FIGHT,  {posx+math.random(-capturePointRadius,capturePointRadius), posy, posz+math.random(-capturePointRadius,capturePointRadius)}, {"alt", "ctrl"})
--                 end
--             end
--         end
--     end
-- end

-- local function respawnUnitsFromQueue(teamID)
--     if teamRespawnQueue[teamID] then
--         if teamRespawnQueue[teamID][1] then
--             local pos = GetRandomAllyPoint(teamID, teamRespawnQueue[teamID][1])
--             local spawnedUnit
--             if pos and pos.x then
--                 local x = pos.x+math.random(-50,50)
--                 local z = pos.z+math.random(-50,50)
--                 local y = Spring.GetGroundHeight(x,z)
--                 spawnedUnit = Spring.CreateUnit(teamRespawnQueue[teamID][1], x, y, z, 0, teamID)
--                 Spring.SpawnCEG("scav-spawnexplo",x,y,z,0,0,0)
--                 table.remove(teamRespawnQueue[teamID], 1)
--             else
--                 local x = teamSpawnPositions[teamID].x + math.random(-64,64)
--                 local z = teamSpawnPositions[teamID].z + math.random(-64,64)
--                 local y = Spring.GetGroundHeight(x,z)
--                 spawnedUnit = Spring.CreateUnit(teamRespawnQueue[teamID][1], x, y, z, 0, teamID)
--                 Spring.SpawnCEG("scav-spawnexplo",x,y,z,0,0,0)
--                 table.remove(teamRespawnQueue[teamID], 1)
--             end
--             local rawPos = GetClosestEnemyPoint(spawnedUnit)
--             if rawPos then
--                 local posx = rawPos.x
--                 local posz = rawPos.z
--                 local posy = Spring.GetGroundHeight(posx, posz)
--                 if posx then
--                     Spring.GiveOrderToUnit(spawnedUnit,CMD.MOVE_STATE,{0},0)
--                     Spring.GiveOrderToUnit(spawnedUnit, CMD.FIGHT,  {posx+math.random(-capturePointRadius,capturePointRadius), posy, posz+math.random(-capturePointRadius,capturePointRadius)}, {"alt", "ctrl"})
--                 end
--             end
--         end
--     end
-- end

local function spawnUnitsFromQueue(teamID)
    if teamSpawnQueue[teamID] then
        if teamSpawnQueue[teamID][1] then
            local x = teamSpawnPositions[teamID].x + math.random(-64,64)
            local z = teamSpawnPositions[teamID].z + math.random(-64,64)
            local y = Spring.GetGroundHeight(x,z)
			local spawnedUnit = Spring.CreateUnit(teamSpawnQueue[teamID][1], x, y, z, 0, teamID)
			if spawnedUnit then
				Spring.GiveOrderToUnit(spawnedUnit,CMD.MOVE_STATE,{0},0)
				Spring.SpawnCEG("scav-spawnexplo",x,y,z,0,0,0)
			end
            table.remove(teamSpawnQueue[teamID], 1)
        end
    end
end

local function respawnUnitsFromQueue(teamID)
    if teamRespawnQueue[teamID] then
        if teamRespawnQueue[teamID][1] then
            local x = teamSpawnPositions[teamID].x + math.random(-64,64)
            local z = teamSpawnPositions[teamID].z + math.random(-64,64)
            local y = Spring.GetGroundHeight(x,z)
            local spawnedUnit = Spring.CreateUnit(teamRespawnQueue[teamID][1], x, y, z, 0, teamID)
			if spawnedUnit then
				Spring.GiveOrderToUnit(spawnedUnit,CMD.MOVE_STATE,{0},0)
				Spring.SpawnCEG("scav-spawnexplo",x,y,z,0,0,0)
			end
            table.remove(teamRespawnQueue[teamID], 1)
        end
    end
end

local function chooseNewUnits(starter, tier)
    if starter then
        landWave = starterLandUnitsList
        landWaveQuantity = #starterLandUnitsList

        seaWave = starterSeaUnitsList
        seaWaveQuantity = #starterSeaUnitsList
    else
        if (Spring.GetGameSeconds() > 450 and tier > 80) or (Spring.GetGameSeconds() > 750) then -- Tier 4 -- Big Tech 3 units
            landWave = landUnitsList[4]
            landWaveQuantity = #landUnitsList[4]
            seaWave = seaUnitsList[4]
            seaWaveQuantity = #seaUnitsList[4]
        elseif (Spring.GetGameSeconds() > 300 and tier > 60) or (Spring.GetGameSeconds() > 600) then -- Tier 3 -- Expensive Tech 2 units and small Tech 3 units
            landWave = landUnitsList[3]
            landWaveQuantity = #landUnitsList[3]
            seaWave = seaUnitsList[3]
            seaWaveQuantity = #seaUnitsList[3]
        elseif (Spring.GetGameSeconds() > 150 and tier > 40) or (Spring.GetGameSeconds() > 450) then -- Tier 2 -- Less Expensive Tech 2 units
            landWave = landUnitsList[2]
            landWaveQuantity = #landUnitsList[2]
            seaWave = seaUnitsList[2]
            seaWaveQuantity = #seaUnitsList[2]
        else  -- Tier 1
            landWave = landUnitsList[1]
            landWaveQuantity = #landUnitsList[1]
            seaWave = seaUnitsList[1]
            seaWaveQuantity = #seaUnitsList[1]
        end
    end

    landUnit = {}
    seaUnit = {}
    for j = 1,landWaveQuantity do
        landUnit[j] = pickRandomUnit(landWave[j].table, landWave[j].quantity)
    end
    for j = 1,seaWaveQuantity do
        seaUnit[j] = pickRandomUnit(seaWave[j].table, seaWave[j].quantity)
    end
end

local function addNewUnitsToQueue(starter)
	--local landRandom, landUnit, landUnitCount
	--local seaRandom, seaUnit, seaUnitCount
    local tier = math.random(1,100)
    chooseNewUnits(starter, tier)
    for i = 1,#teams do
        local teamID = teams[i]
        if ChessModeUnbalancedModoption then
            chooseNewUnits(starter, tier)
        end
        if teamIsLandPlayer[teamID] then
            for j = 1,landWaveQuantity do
                for k = 1, #landUnit[j] do
                    if teamSpawnQueue[teamID] then
                        if teamSpawnQueue[teamID][1] then
                            teamSpawnQueue[teamID][#teamSpawnQueue[teamID]+1] = landUnit[j][k]
                        else
                            teamSpawnQueue[teamID][1] = landUnit[j][k]
                        end
                    end
                end
            end
        else
            for j = 1,seaWaveQuantity do
                for k = 1, #seaUnit[j] do
                    if teamSpawnQueue[teamID] then
                        if teamSpawnQueue[teamID][1] then
                            teamSpawnQueue[teamID][#teamSpawnQueue[teamID]+1] = seaUnit[j][k]
                        else
                            teamSpawnQueue[teamID][1] = seaUnit[j][k]
                        end
                    end
                end
            end
        end
    end

    landUnit = nil
    landUnitCount = nil
    seaUnit = nil
    seaUnitCount = nil
end

local function respawnDeadUnit(unitName, unitTeam)
    if teamRespawnQueue[unitTeam] then
        if teamRespawnQueue[unitTeam][1] then
            teamRespawnQueue[unitTeam][#teamRespawnQueue[unitTeam]+1] = unitName
        else
            teamRespawnQueue[unitTeam][1] = unitName
        end
    end
end

function gadget:GameFrame(n)
    if n%30 == 0 then
		controlPointsList = GetControlPoints()
	end
    if n == 31 then
        local capturePointPatrolRadius = capturePointRadius*1.5
        for i = 1,#controlPointsList do
            local x = controlPointsList[i].pointPosition.x
            local z = controlPointsList[i].pointPosition.z
            local y = Spring.GetGroundHeight(x, z)
            local landRandomUnit = starterLandUnitsList[1].table[math.random(1,#starterLandUnitsList[1].table)]
            local seaRandomUnit = starterSeaUnitsList[1].table[math.random(1,#starterSeaUnitsList[1].table)]
            local losCheck = positionCheckLibrary.VisibilityCheckEnemy(x, y, z, 1, gaiaAllyTeamID, true, true, true)
            if losCheck == true then
                for j = 1,5 do
                    local unitID
                    if y > -10 then
                        unitID = Spring.CreateUnit(landRandomUnit, x+math.random(-32,32), y, z+math.random(-32,32), 0, gaiaTeamID)
                    else
                        unitID = Spring.CreateUnit(seaRandomUnit, x+math.random(-32,32), y, z+math.random(-32,32), 0, gaiaTeamID)
                    end
                    if unitID then
                        Spring.GiveOrderToUnit(unitID,CMD.MOVE_STATE,{1},0)
                        Spring.GiveOrderToUnit(unitID, CMD.FIGHT,  {x+math.random(-capturePointPatrolRadius, capturePointPatrolRadius), y, z+math.random(-capturePointPatrolRadius, capturePointPatrolRadius)}, {"alt", "ctrl"})
                        for k = 1,10 do
                            Spring.GiveOrderToUnit(unitID, CMD.PATROL,  {x+math.random(-capturePointPatrolRadius, capturePointPatrolRadius), y, z+math.random(-capturePointPatrolRadius, capturePointPatrolRadius)}, {"shift", "alt", "ctrl"})
                        end
                    end
                end
            end
        end
    end
    if n == 20 then
        introSetUp()
    end
	if n == 110 then	-- killing it too early doesnt work somehow (probably due to spawn animation)
		-- com-ends/game_end ignores this scoremode so we can delete the initial commanders
		destroyCommanders()
	end
    if n == 25 then
        addNewUnitsToQueue(true)
    end
    if n%900 == 1 then
        addInfiniteResources()
    end
    if n > 25 and n%addUpFrequency == 1 then
        Spring.PlaySoundFile("sounds/voice/allison/ReinforcementsHaveArrived.wav", 0.75, nil, "ui")
        addNewUnitsToQueue(false)
    end
    for i = 1,#teams do
        local teamID = teams[i]
        if n == 30 then
            for i = 1,100 do
                spawnUnitsFromQueue(teamID)
                respawnUnitsFromQueue(teamID)
            end
        end

        if teamSpawnQueue[teamID] and #teamSpawnQueue[teamID] > 0 then
            -- if teamRespawnQueue[teamID] and #teamRespawnQueue[teamID] > 0 then
            --     if n > 25 and n%math.ceil(spawnTimer/(#teamRespawnQueue[teamID]+#teamSpawnQueue[teamID])) == 1 then
            --         spawnUnitsFromQueue(teamID)
            --     end
            -- else
                -- if n > 25 and n%spawnTimer == 1 then
                    spawnUnitsFromQueue(teamID)
                -- end
            -- end
        else
            if teamRespawnQueue[teamID] and #teamRespawnQueue[teamID] > 0 then
                if n > 25 and n%math.ceil(respawnTimer/(#teamRespawnQueue[teamID])) == 1 then
                    respawnUnitsFromQueue(teamID)
                end
            end
        end
    end
end

function gadget:UnitCreated(unitID, unitDefID, unitTeam, builderID)
    if builderID then-- and canResurrect[Spring.GetUnitDefID(builderID)] then
        resurrectedUnits[unitID] = true
    end
end

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam, attackerID, attackerDefID, attackerTeam)
    local unitName = UnitDefs[unitDefID].name
    if resurrectedUnits[unitID] then
        resurrectedUnits[unitID] = nil
    elseif unitTeam ~= gaiaTeamID and not isCommander[unitDefID] then
        local UnitName = UnitDefs[unitDefID].name
        respawnDeadUnit(UnitName, unitTeam)
    end
end
