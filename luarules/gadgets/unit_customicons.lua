--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    ico_customicons.lua
--  author:  Dave Rodgers and reworked by tovernaar123
--
--  Copyright (C) 2007.
--  Licensed under the terms of the GNU GPL, v2 or later.
--
--------------------------------------------------------------------------------
-- To add a unit simply add it in the units config table the format is:
-- unit name = path_icon, size.
-- Every entry will auto add a _scav version with the metatable.
-- Tovernaar123 dec 31, 2020
--------------------------------------------------------------------------------

function gadget:GetInfo()
	return {
		name = "CustomIcons",
		desc = "Sets custom unit icons",
		author = "trepan,BrainDamage,TheFatController,Floris,tovernaar123",
		date = "dec 31, 2020", --Yes 1 day before 2021 :P
		license = "GNU GPL, v2 or later",
		layer = -100,
		enabled = true  --  loaded by default?
	}
end


--------------------------------------------------------------------------------

if gadgetHandler:IsSyncedCode() then
	return false
end

--------------------------------------------------------------------------------

local iconScale = 1
if Spring.GetConfigFloat then
	iconScale = Spring.GetConfigFloat("UnitIconScale", 1)
end

local spSetUnitDefIcon = Spring.SetUnitDefIcon
local spFreeUnitIcon = Spring.FreeUnitIcon
local myPlayerID = Spring.GetMyPlayerID()

local units = {
	corageo = { "hazardous.png", 1.88999987 },
	armcroc = { "armcroc_1.6.png", 1.67999995 },
	cormart = { "cormart_1.3.png", 1.36499989 },
	corah = { "hover_aa.png", 1.15499997 },
	corap = { "factory_air.png", 1.52250004 },
	freefusion = { "fusion.png", 1.46999991 },
	armfig = { "air.png", 0.86099994 },
	armawac = { "air_t2_radar.png", 1.39649999 },
	coraak = { "amphib_t2_aa.png", 1.67999995 },
	armmship = { "ship_t2_missile.png", 2.0999999 },
	corpun = { "corpun_1.3.png", 1.36499989 },
	armgate = { "shield.png", 1.57499993 },
	armsam = { "vehicle_t1_missile.png", 1.04999995 },
	armfark = { "engineer_small.png", 0.94499993 },
	armageo = { "hazardous.png", 1.88999987 },
	critter_gull = { "blank.png", 1.04999995 },
	armshltx = { "factory_gantry.png", 2.51999998 },
	armpship = { "ship_pship.png", 1.25999999 },
	scavmistxl = { "blank.png", 1.04999995 },
	lootboxgold = { "lootboxt3.png", 1.20749986 },
	armseer = { "vehicle_t2_radar.png", 1.36499989 },
	corgol = { "corgol_1.75.png", 1.83749986 },
	corfhlt = { "defence_1_laser_1.05.png", 1.10249984 },
	chickena1c = { "chicken.png", 1.57499993 },
	armack = { "bot_t2_worker.png", 1.39649999 },
	armjamt = { "jammer_t1_0.9.png", 0.94499993 },
	armthundt4 = { "armthundt4.png", 3.3599999 },
	armpb = { "armpb_1.4.png", 1.46999991 },
	armap = { "factory_air.png", 1.52250004 },
	armham = { "armham_1.05.png", 1.10249984 },
	xmasball2 = { "blank.png", 1.04999995 },
	chickens3 = { "chicken_air.png", 1.36499989 },
	dice = { "blank.png", 1.04999995 },
	corarad = { "radar_t2_1.2.png", 1.25999999 },
	armuwfus = { "fusion.png", 1.46999991 },
	armptl = { "aa.png", 0.89249998 },
	armtl = { "defence_1_naval.png", 1.10249984 },
	cormine4 = { "mine.png", 0.46199998 },
	corssubold = { "sub.png", 1.39649999 },
	armsaber = { "air_hover.png", 1.25999999 },
	cortoast = { "cortoast_1.5.png", 1.57499993 },
	scavengerdroppod = { "mine.png", 0.55649996 },
	nuketestcor = { "aa.png", 0.89249998 },
	lootboxnano_t2_var4 = { "scavnanotc_t2.png", 1.96874988 },
	xmasball = { "blank.png", 1.04999995 },
	chip = { "blank.png", 1.04999995 },
	armdecom = { "armcom.png", 1.83749986 },
	vh_chickenq = { "chicken_queen.png", 4.19999981 },
	corhunt = { "air_t2_radar.png", 1.39649999 },
	chickenf2 = { "chicken_air.png", 1.78499997 },
	ve_chickenq = { "chicken_queen.png", 4.19999981 },
	scavtacnukespawner = { "aa.png", 0.89249998 },
	armhawk = { "air_t2.png", 1.02899992 },
	h_chickenq = { "chicken_queen.png", 4.19999981 },
	chickenc2 = { "chicken.png", 1.57499993 },
	armrl = { "aa.png", 0.89249998 },
	scavmist = { "blank.png", 1.04999995 },
	armassimilator = { "bot_t3.png", 1.99499989 },
	scavengerdroppodfriendly = { "mine.png", 0.55649996 },
	armsptkt4 = { "armsptkt4.png", 2.30999994 },
	nuketestcororg = { "aa.png", 0.89249998 },
	scavengerdroppodbeacon = { "beacon.png", 1.74299991 },
	scavempspawner = { "aa.png", 0.89249998 },
	scavsafeareabeacon = { "beacon.png", 1.74299991 },
	chickena1b = { "chicken.png", 1.57499993 },
	corshad = { "air_bomber.png", 1.41750002 },
	corgplat = { "defence_0_0.8.png", 0.83999997 },
	corack = { "bot_t2_worker.png", 1.39649999 },
	resourcecheat = { "building.png", 1.36499989 },
	armdecade = { "ship_raid.png", 1.15499997 },
	nuketestorg = { "aa.png", 0.89249998 },
	armvadert4 = { "armvadert4.png", 2.625 },
	armzeus = { "armzeus_1.28.png", 1.34399986 },
	corstone = { "blank.png", 1.04999995 },
	armfepocht4 = { "air_t4_flagship.png", 3.3599999 },
	nuketest = { "aa.png", 0.89249998 },
	n_chickenq = { "chicken_queen.png", 4.19999981 },
	mission_command_tower = { "mission_command_tower.png", 2.46749973 },
	armconsul = { "armconsul_1.35.png", 1.41750002 },
	meteor = { "blank.png", 1.04999995 },
	corgant = { "factory_gantry.png", 2.51999998 },
	chicken1d = { "chicken.png", 0.94499993 },
	lootdroppod_printer = { "mine.png", 0.55649996 },
	lootdroppod_gold = { "mine.png", 0.55649996 },
	corint = { "corint_2.3.png", 2.41499972 },
	armmine3 = { "mine.png", 0.55649996 },
	chicken1y = { "chicken.png", 0.94499993 },
	armacsub = { "sub_t2_worker.png", 1.74299991 },
	lootboxsilver = { "lootboxt2.png", 1.15499997 },
	coruwadvms = { "metalstorage_t2.png", 1.3125 },
	corsilo = { "nuke.png", 2.51999998 },
	lootboxplatinum = { "lootboxt4.png", 1.25999999 },
	armspy = { "eye.png", 1.23899984 },
	lootboxnano_t4_var4 = { "scavnanotc_t4.png", 3.09749985 },
	chickenp1 = { "chicken.png", 1.57499993 },
	corsfig = { "air.png", 0.86099994 },
	armwin = { "wind.png", 1.04999995 },
	chickenc3b = { "chicken.png", 1.25999999 },
	corgarp = { "amphib_tank.png", 1.25999999 },
	cortarg = { "targetting.png", 1.36499989 },
	lootboxnano_t3_var4 = { "scavnanotc_t3.png", 2.46749973 },
	lootboxnano_t3_var3 = { "scavnanotc_t3.png", 2.46749973 },
	lootboxnano_t4_var3 = { "scavnanotc_t4.png", 3.09749985 },
	scavmistxxl = { "blank.png", 1.04999995 },
	armrecl = { "sub_t2_worker.png", 1.74299991 },
	lootboxnano_t3_var1 = { "scavnanotc_t3.png", 2.46749973 },
	chickenw1d = { "chicken_air.png", 1.36499989 },
	armmanni = { "armmanni_1.55.png", 1.62749982 },
	corroach = { "corroach_0.9.png", 0.94499993 },
	coruwadves = { "energystorage_t2.png", 1.3125 },
	corsnap = { "hover_gun.png", 1.10249984 },
	lootboxnano_t2_var3 = { "scavnanotc_t2.png", 1.96874988 },
	lootboxnano_t2_var2 = { "scavnanotc_t2.png", 1.96874988 },
	armason = { "radar_t2_1.2.png", 1.25999999 },
	lootboxnano_t2_var1 = { "scavnanotc_t2.png", 1.96874988 },
	armsjam = { "ship_t2_jammer.png", 1.73249984 },
	chickenc3 = { "chicken.png", 1.25999999 },
	corlab = { "factory_bot.png", 1.52250004 },
	armstil = { "armstil_1.66.png", 1.74299991 },
	chickenw2 = { "chicken_air.png", 1.36499989 },
	armalab = { "factory_bot_t2.png", 1.9425 },
	armllt = { "defence_0_laser_0.8.png", 0.83999997 },
	armavp = { "factory_vehicle_t2.png", 1.9425 },
	corssub = { "sub.png", 1.39649999 },
	corrl = { "aa.png", 0.89249998 },
	corcom = { "corcom.png", 1.83749986 },
	armvader = { "armvader_0.9.png", 0.94499993 },
	lootboxnano_t1_var1 = { "scavnanotc_t1.png", 1.57499993 },
	armbats = { "ship_t2_battleship.png", 2.67749977 },
	corfrt = { "aa.png", 0.89249998 },
	chickenc3c = { "chicken.png", 1.25999999 },
	cornanotcplat = { "cornanotcplat_0.92.png", 0.96599996 },
	armvulc = { "armvulc_3.1.png", 3.25499964 },
	corllt = { "defence_0_laser_0.8.png", 0.83999997 },
	armtarg = { "targetting.png", 1.36499989 },
	lootboxbronze = { "lootbox.png", 1.04999995 },
	cormstor = { "metalstorage.png", 1.10249984 },
	lootboxnano_t1_var2 = { "scavnanotc_t1.png", 1.57499993 },
	hat_viking_teamcolored = { "building.png", 1.04999995 },
	armstump = { "vehicle_t1_tank.png", 1.15499997 },
	roost = { "chicken_roost.png", 1.57499993 },
	corca = { "air_worker.png", 1.25999999 },
	epic_chickenq = { "chicken_queen.png", 4.19999981 },
	e_chickenq = { "chicken_queen.png", 4.19999981 },
	armgmm = { "fusion.png", 1.46999991 },
	armmart = { "armmart_1.3.png", 1.36499989 },
	armcom = { "armcom.png", 1.83749986 },
	corvalk = { "air_trans.png", 1.36499989 },
	armah = { "hover_aa.png", 1.15499997 },
	dbg_sphere = { "allterrain.png", 1.04999995 },
	chickena1 = { "chicken.png", 1.57499993 },
	chicken1z = { "chicken.png", 0.94499993 },
	armarad = { "radar_t2_1.2.png", 1.25999999 },
	critter_penguinking = { "blank.png", 1.04999995 },
	armmark = { "bot_t2_radar.png", 1.34399986 },
	critter_penguinbro = { "blank.png", 1.04999995 },
	critter_penguin = { "blank.png", 1.04999995 },
	chickenh4 = { "chicken.png", 0.94499993 },
	critter_duck = { "blank.png", 1.04999995 },
	coradvsol = { "energy2_1.18.png", 1.23899984 },
	corcan = { "corcan_1.28.png", 1.34399986 },
	corhal = { "corhal_1.33.png", 1.39649999 },
	corfav = { "vehicle.png", 0.57749999 },
	armch = { "hover_worker.png", 1.25999999 },
	corwin = { "wind.png", 1.04999995 },
	armferret = { "aa.png", 1.15499997 },
	corvroc = { "corvroc_1.6.png", 1.67999995 },
	corkorg = { "mech.png", 3.46499968 },
	armamd = { "antinuke.png", 1.67999995 },
	armbrtha = { "armbrtha_2.5.png", 2.625 },
	armckfus = { "fusion.png", 1.46999991 },
	corvoyr = { "bot_t2_radar.png", 1.34399986 },
	cormabm = { "antinukemobile.png", 1.46999991 },
	armsnipe = { "armsnipe_1.3.png", 1.36499989 },
	corbhmth = { "corbhmth_1.55.png", 1.62749982 },
	corvipe = { "corvipe_1.4.png", 1.46999991 },
	armmeatball = { "amphib_t3.png", 2.20499969 },
	corveng = { "air.png", 0.86099994 },
	corenaa = { "aa_flak_1.4.png", 1.46999991 },
	corvamp = { "air_t2.png", 1.02899992 },
	corasy = { "factory_ship_t2.png", 1.9425 },
	corgator = { "vehicle_t1_raid.png", 0.89249998 },
	coruwms = { "metalstorage.png", 1.10249984 },
	armacv = { "vehicle_t2_worker.png", 1.36499989 },
	cordrag = { "wall_0.4.png", 0.41999999 },
	chicken1c = { "chicken.png", 0.94499993 },
	armguard = { "armguard_1.3.png", 1.36499989 },
	corspy = { "eye.png", 1.23899984 },
	coruwmme = { "mex_t2_1.15.png", 1.20749986 },
	armsehak = { "air_t2_radar.png", 1.39649999 },
	coruwmex = { "mex_t1_0.77.png", 0.80849993 },
	corhllt = { "defence_0_laser2_0.94.png", 0.98699993 },
	armatl = { "defence_2_naval.png", 1.46999991 },
	armjam = { "vehicle_t2_jammer.png", 1.36499989 },
	chicken1 = { "chicken.png", 0.94499993 },
	coruwes = { "energystorage.png", 1.10249984 },
	armmerl = { "armmerl_1.55.png", 1.62749982 },
	armblade = { "air_t2_hover_missile.png", 1.46999991 },
	armseap = { "air_torp.png", 1.57499993 },
	armmercury = { "aa_longrange_1.8.png", 1.88999987 },
	armfast = { "bot_t2_raid.png", 1.15499997 },
	cortship = { "shiptrans.png", 2.0999999 },
	cortron = { "tacnuke.png", 1.88999987 },
	armfrad = { "radar_t1_0.9.png", 0.94499993 },
	cormh = { "hover_t1_missile.png", 1.41750002 },
	armtide = { "energy1_1.0.png", 1.04999995 },
	cortrem = { "cortrem_1.85.png", 1.9425 },
	armmlv = { "armmlv_1.0.png", 1.04999995 },
	armfmine3 = { "mine.png", 0.55649996 },
	chickenc1 = { "chicken.png", 1.57499993 },
	cortl = { "defence_1_naval.png", 1.10249984 },
	corexp = { "mex_t1_0.77.png", 0.80849993 },
	cortitan = { "air_t2_torpbomber.png", 1.67999995 },
	armsd = { "seismic.png", 1.46999991 },
	armcsa = { "air_worker.png", 1.25999999 },
	corthovr = { "hovertrans.png", 1.78499997 },
	armjuno = { "jammer_t2.png", 1.25999999 },
	armpt = { "ship_tiny.png", 0.83999997 },
	coratl = { "defence_2_naval.png", 1.46999991 },
	armsubk = { "sub.png", 1.39649999 },
	corvp = { "factory_vehicle.png", 1.52250004 },
	lootboxnano_t4_var1 = { "scavnanotc_t4.png", 3.09749985 },
	corsy = { "factory_ship.png", 1.52250004 },
	corsumo = { "corsumo_1.66.png", 1.74299991 },
	corflak = { "aa_flak_1.4.png", 1.46999991 },
	corstorm = { "corstorm_1.png", 1.04999995 },
	armwar = { "armwar_1.15.png", 1.20749986 },
	armgeo = { "energy6_1.3.png", 1.36499989 },
	corason = { "radar_t2_1.2.png", 1.25999999 },
	coruwmmm = { "metalmaker_t2_1.15.png", 1.20749986 },
	armmine2 = { "mine.png", 0.46199998 },
	armca = { "air_worker.png", 1.25999999 },
	corseah = { "air_trans.png", 1.83749986 },
	armsy = { "factory_ship.png", 1.52250004 },
	armliche = { "air_liche.png", 2.0999999 },
	armafus = { "energy5_1.85.png", 1.9425 },
	armflash = { "vehicle_t1_raid.png", 0.89249998 },
	corsktl = { "mine.png", 0.55649996 },
	coresupp = { "ship_raid.png", 1.15499997 },
	armanni = { "armanni_1.95.png", 2.0474999 },
	armclaw = { "wall_0.4.png", 0.41999999 },
	coruwfus = { "fusion.png", 1.46999991 },
	corshiva = { "corshiva_2.1.png", 2.20499969 },
	corawac = { "air_t2_radar.png", 1.39649999 },
	armfrock = { "aa.png", 0.89249998 },
	lootboxnano_t4_var2 = { "scavnanotc_t4.png", 3.09749985 },
	corsharkold = { "amphib_t2.png", 1.67999995 },
	armfatf = { "targetting.png", 1.36499989 },
	corsh = { "hover_raid.png", 1.10249984 },
	armminivulc = { "armvulc_3.1.png", 1.88999987 },
	armflea = { "bot_t1_flea.png", 0.53549999 },
	armfus = { "fusion.png", 1.46999991 },
	corsolar = { "energy1_1.0.png", 1.04999995 },
	corfgate = { "shield.png", 1.57499993 },
	armthovr = { "hovertrans.png", 1.78499997 },
	correap = { "vehicle_t2_tank.png", 1.46999991 },
	corsd = { "seismic.png", 1.46999991 },
	corscreamer = { "aa_longrange_1.8.png", 1.88999987 },
	corpt = { "ship_tiny.png", 0.83999997 },
	chicken_dodo2 = { "chicken.png", 0.94499993 },
	corkarganetht4 = { "corkarganetht4.png", 3.14999986 },
	armrad = { "radar_t1_0.9.png", 0.94499993 },
	chicken1x = { "chicken.png", 0.94499993 },
	armroy = { "ship_destroyer.png", 1.51199996 },
	corfmd = { "antinuke.png", 1.67999995 },
	lootboxnano_t1_var3 = { "scavnanotc_t1.png", 1.57499993 },
	coreter = { "vehicle_t2_jammer.png", 1.36499989 },
	armuwmme = { "mex_t2_1.15.png", 1.20749986 },
	corfdrag = { "wall_0.4.png", 0.41999999 },
	corsub = { "sub.png", 1.39649999 },
	corfmkr = { "metalmaker_t1_0.75.png", 0.78749996 },
	corraid = { "vehicle_t1_tank.png", 1.15499997 },
	armart = { "armart_1.png", 1.04999995 },
	corpyro = { "corpyro_1.15.png", 1.20749986 },
	armasy = { "factory_ship_t2.png", 1.9425 },
	coracsub = { "sub_t2_worker.png", 1.74299991 },
	armamph = { "armamph_1.3.png", 1.36499989 },
	cormmkr = { "metalmaker_t2_1.15.png", 1.20749986 },
	cormaw = { "wall_0.4.png", 0.41999999 },
	corptl = { "aa.png", 0.89249998 },
	armepoch = { "ship_t2_flagship.png", 3.46499968 },
	armdrag = { "wall_0.4.png", 0.41999999 },
	armfgate = { "shield.png", 1.57499993 },
	armnanotcplat = { "armnanotcplat_0.92.png", 0.96599996 },
	corsb = { "air_bomber.png", 1.41750002 },
	corpship = { "ship_pship.png", 1.25999999 },
	chickenw1b = { "chicken_air.png", 1.36499989 },
	armpeep = { "air_los.png", 0.78749996 },
	armpincer = { "amphib_tank.png", 1.25999999 },
	corfrad = { "radar_t1_0.9.png", 0.94499993 },
	cormando = { "commando.png", 1.41750002 },
	cornecro = { "bot_t1_tinyworker.png", 0.69300002 },
	corcomboss = { "corcomboss.png", 4.19999981 },
	cornanotc = { "cornanotc_0.92.png", 0.96599996 },
	armsfig = { "air.png", 0.86099994 },
	cormuskrat = { "amphib_worker.png", 1.36499989 },
	armsub = { "sub.png", 1.39649999 },
	cormship = { "ship_t2_missile.png", 2.0999999 },
	cormort = { "cormort_1.3.png", 1.36499989 },
	cormoho = { "mex_t2_1.15.png", 1.20749986 },
	armuwmex = { "mex_t1_0.77.png", 0.80849993 },
	corfus = { "fusion.png", 1.46999991 },
	cormlv = { "cormlv_1.0.png", 1.04999995 },
	armsh = { "hover_raid.png", 1.10249984 },
	cormls = { "shipengineer.png", 1.57499993 },
	corplat = { "factory_air.png", 1.52250004 },
	armgremlin = { "eye.png", 1.23899984 },
	cormine3 = { "mine.png", 0.55649996 },
	cormine2 = { "mine.png", 0.46199998 },
	corsent = { "vehicle_t2_aa.png", 1.36499989 },
	chicken_dodo1 = { "chicken.png", 0.94499993 },
	armuwadvms = { "metalstorage_t2.png", 1.3125 },
	cormexp = { "mex_t2_1.15.png", 1.20749986 },
	corfast = { "corfast_1.3.png", 1.36499989 },
	corjamt = { "jammer_t1_0.9.png", 0.94499993 },
	corparrow = { "corparrow_1.55.png", 1.62749982 },
	corbuzz = { "corbuzz_3.85.png", 4.04249954 },
	corminibuzz = { "corbuzz_3.85.png", 1.88999987 },
	armvp = { "factory_vehicle.png", 1.52250004 },
	chickenr2 = { "chicken.png", 1.57499993 },
	corhlt = { "defence_1_laser_1.05.png", 1.10249984 },
	cormakr = { "metalmaker_t1_0.75.png", 0.78749996 },
	armfmkr = { "metalmaker_t1_0.75.png", 0.78749996 },
	cormadsam = { "aa.png", 1.15499997 },
	armtship = { "shiptrans.png", 2.0999999 },
	armcs = { "ship_worker.png", 1.39649999 },
	corlevlr = { "corlevlr_1.2.png", 1.25999999 },
	coravp = { "factory_vehicle_t2.png", 1.9425 },
	armfort = { "wall_0.4.png", 0.41999999 },
	corfblackhyt4 = { "air_t4_flagship.png", 3.3599999 },
	armrectrt4 = { "bot_worker.png", 2.0999999 },
	corroy = { "ship_destroyer.png", 1.51199996 },
	armfav = { "vehicle.png", 0.57749999 },
	chickenr3 = { "chicken.png", 2.72999978 },
	coraap = { "factory_air_t2.png", 1.9425 },
	corfink = { "air_los.png", 0.78749996 },
	armnanotc = { "armnanotc_0.92.png", 0.96599996 },
	corcat = { "corcat_1.9.png", 1.99499989 },
	armestor = { "energystorage.png", 1.10249984 },
	corcs = { "ship_worker.png", 1.39649999 },
	armpwt4 = { "armpwt4.png", 2.30999994 },
	armuwadves = { "energystorage_t2.png", 1.3125 },
	corintr = { "vehicle_trans.png", 1.78499997 },
	corspec = { "bot_t2_jammer.png", 1.34399986 },
	armjanus = { "armjanus_1.2.png", 1.25999999 },
	corhurc = { "air_t2_bomber.png", 1.74299991 },
	armsubkold = { "sub.png", 1.39649999 },
	corhrk = { "corhrk_1.35.png", 1.41750002 },
	corhp = { "factory_hover.png", 1.52250004 },
	armflak = { "aa_flak_1.4.png", 1.46999991 },
	corwolv = { "corwolv_1.png", 1.04999995 },
	armsolar = { "energy1_1.0.png", 1.04999995 },
	armbrawl = { "air_t2_hover.png", 1.46999991 },
	corgolt4 = { "armrattet4.png", 3.09749985 },
	armraz = { "armraz_1.75.png", 1.83749986 },
	corcrwt4 = { "corcrwt4.png", 3.3599999 },
	corshroud = { "jammer_t2.png", 1.25999999 },
	armuwmmm = { "metalmaker_t2_1.15.png", 1.20749986 },
	corsok = { "corsok_1.8.png", 1.88999987 },
	corgatreap = { "vehicle_t2.png", 1.36499989 },
	corafus = { "energy5_1.85.png", 1.9425 },
	armcarry = { "ship_t2_carrier.png", 2.51999998 },
	corcv = { "vehicle_worker.png", 0.99749994 },
	corgate = { "shield.png", 1.57499993 },
	armvang = { "allterrain_vanguard_2.4.png", 2.51999998 },
	armmoho = { "mex_t2_1.15.png", 1.20749986 },
	armfflak = { "aa_flak_1.4.png", 1.46999991 },
	corfrock = { "aa.png", 0.89249998 },
	corfmine3 = { "mine.png", 0.55649996 },
	armuwes = { "energystorage.png", 1.10249984 },
	corvrad = { "vehicle_t2_radar.png", 1.36499989 },
	corfhp = { "factory_hover.png", 1.52250004 },
	armserp = { "sub.png", 1.39649999 },
	corsjam = { "ship_t2_jammer.png", 1.73249984 },
	corfatf = { "targetting.png", 1.36499989 },
	corseal = { "corseal_1.45.png", 1.52250004 },
	cormex = { "mex_t1_0.77.png", 0.80849993 },
	coreyes = { "eye.png", 0.89249998 },
	critter_ant = { "blank.png", 1.04999995 },
	cormist = { "vehicle_t1_missile.png", 1.04999995 },
	armrattet4 = { "armrattet4.png", 3.09749985 },
	corerad = { "aa.png", 1.15499997 },
	corseap = { "air_torp.png", 1.57499993 },
	corch = { "hover_worker.png", 1.25999999 },
	armaas = { "ship_t2_aa.png", 1.73249984 },
	cordemont4 = { "cordemont4.png", 2.625 },
	armamsub = { "factory_amph.png", 1.52250004 },
	cordecom = { "corcom.png", 1.83749986 },
	armamb = { "armamb_1.5.png", 1.57499993 },
	corcut = { "air_hover.png", 1.25999999 },
	corcsa = { "air_worker.png", 1.25999999 },
	corjuno = { "jammer_t2.png", 1.25999999 },
	armthund = { "air_bomber.png", 1.41750002 },
	corcrw = { "air_krow.png", 2.0999999 },
	armemp = { "emp.png", 1.88999987 },
	cortide = { "energy1_1.0.png", 1.04999995 },
	corcrus = { "ship_t2_cruiser.png", 2.25749993 },
	armaca = { "air_t2_worker.png", 1.62749982 },
	corcrash = { "corcrash_0.95.png", 0.99749994 },
	corgantuw = { "factory_gantry.png", 2.51999998 },
	cordoom = { "cordoom_1.95.png", 2.0474999 },
	corkarg = { "corkarg_2.05.png", 2.15249991 },
	armscab = { "antinukemobile.png", 1.46999991 },
	armaser = { "bot_t2_jammer.png", 1.34399986 },
	corcarry = { "ship_t2_carrier.png", 2.51999998 },
	corck = { "bot_worker.png", 0.99749994 },
	corbw = { "air_bladew.png", 0.78749996 },
	corban = { "corban_1.6.png", 1.67999995 },
	armrock = { "armrock_1.png", 1.04999995 },
	corblackhy = { "ship_t2_flagship.png", 3.46499968 },
	coracv = { "vehicle_t2_worker.png", 1.36499989 },
	armyork = { "vehicle_t2_aa.png", 1.36499989 },
	armhlt = { "defence_1_laser_1.05.png", 1.10249984 },
	corbats = { "ship_t2_battleship.png", 2.67749977 },
	armfido = { "armfido_1.28.png", 1.34399986 },
	armpw = { "bot_t1_raid_0.7.png", 0.73499995 },
	armhp = { "factory_hover.png", 1.52250004 },
	coramph = { "coramph_1.3.png", 1.36499989 },
	armveil = { "jammer_t2.png", 1.25999999 },
	armmls = { "shipengineer.png", 1.57499993 },
	cormine1 = { "mine.png", 0.37799999 },
	armaak = { "amphib_t2_aa.png", 1.67999995 },
	corarch = { "ship_t2_aa.png", 1.73249984 },
	armdfly = { "air_trans.png", 1.83749986 },
	armshltxuw = { "factory_gantry.png", 2.51999998 },
	corapt3 = { "factory_air_t3.png", 1.52250004 },
	corape = { "air_t2_hover_missile.png", 1.46999991 },
	armfhp = { "factory_hover.png", 1.52250004 },
	armsonar = { "radar_t1_0.9.png", 0.94499993 },
	chickenh1b = { "chicken.png", 0.94499993 },
	coramsub = { "factory_amph.png", 1.52250004 },
	lootboxnano_t3_var2 = { "scavnanotc_t3.png", 2.46749973 },
	armlun = { "armlun_1.8.png", 1.88999987 },
	coralab = { "factory_bot_t2.png", 1.9425 },
	coraca = { "air_t2_worker.png", 1.62749982 },
	armmmkr = { "metalmaker_t2_1.15.png", 1.20749986 },
	corak = { "bot_t1_raid_0.7.png", 0.73499995 },
	armbull = { "vehicle_t2_tank.png", 1.46999991 },
	armlunchbox = { "allterrain.png", 2.0474999 },
	armrectr = { "bot_t1_tinyworker.png", 0.69300002 },
	armfboy = { "armfboy_1.6.png", 1.67999995 },
	armlance = { "air_t2_torpbomber.png", 1.67999995 },
	chickenr1 = { "chicken.png", 1.57499993 },
	corrad = { "radar_t1_0.9.png", 0.94499993 },
	armeyes = { "eye.png", 0.89249998 },
	corgeo = { "energy6_1.3.png", 1.36499989 },
	armamex = { "mex_t1_0.77.png", 0.80849993 },
	corsonar = { "radar_t1_0.9.png", 0.94499993 },
	chickena2 = { "chicken.png", 1.57499993 },
	armmar = { "amphib_t3.png", 2.20499969 },
	armuwms = { "metalstorage.png", 1.10249984 },
	chicken2b = { "chicken.png", 1.25999999 },
	corestor = { "energystorage.png", 1.10249984 },
	armserpold = { "sub.png", 1.39649999 },
	lootboxnano_t1_var4 = { "scavnanotc_t1.png", 1.57499993 },
	armgplat = { "defence_0_0.8.png", 0.83999997 },
	armapt3 = { "factory_air_t3.png", 1.52250004 },
	chicken2 = { "chicken.png", 1.25999999 },
	chickenw1c = { "chicken_air.png", 1.36499989 },
	chickenw1 = { "chicken_air.png", 1.36499989 },
	armatlas = { "air_trans.png", 1.36499989 },
	armcv = { "vehicle_worker.png", 0.99749994 },
	corasp = { "corasp_2.4.png", 2.51999998 },
	armmstor = { "metalstorage.png", 1.10249984 },
	chickens1 = { "chicken.png", 1.25999999 },
	correcl = { "sub_t2_worker.png", 1.74299991 },
	armjeth = { "armjeth_0.95.png", 0.99749994 },
	armdl = { "defence_1_naval.png", 1.10249984 },
	armmex = { "mex_t1_0.77.png", 0.80849993 },
	chickenh5 = { "chicken.png", 1.57499993 },
	critter_goldfish = { "blank.png", 1.04999995 },
	chickenh3 = { "chicken.png", 1.25999999 },
	corjugg = { "juggernaut.png", 3.14999986 },
	chickenh1 = { "chicken.png", 0.94499993 },
	armmh = { "hover_t1_missile.png", 1.41750002 },
	chickenf1b = { "chicken_air.png", 1.78499997 },
	chickenf1 = { "chicken_air.png", 1.78499997 },
	armspid = { "allterrain_emp.png", 1.04999995 },
	chickena2b = { "chicken.png", 1.57499993 },
	armsb = { "air_bomber.png", 1.41750002 },
	armmakr = { "metalmaker_t1_0.75.png", 0.78749996 },
	armsilo = { "nuke.png", 2.51999998 },
	banana = { "unknown.png", 2.0999999 },
	armcomboss = { "armcomboss.png", 4.19999981 },
	armlatnk = { "armlatnk_1.3.png", 1.36499989 },
	armanac = { "hover_gun.png", 1.10249984 },
	armcir = { "aa.png", 1.15499997 },
	armsptk = { "armsptk_1.44.png", 1.51199996 },
	chickens2 = { "chicken.png", 1.57499993 },
	armfdrag = { "wall_0.4.png", 0.41999999 },
	armdf = { "fusion.png", 1.46999991 },
	armbanth = { "bantha.png", 2.83500004 },
	armtorps = { "ship.png", 1.25999999 },
	chicken1b = { "chicken.png", 0.94499993 },
	corshark = { "sub_t2.png", 1.78499997 },
	armaap = { "factory_air_t2.png", 1.9425 },
	armcrus = { "ship_t2_cruiser.png", 2.25749993 },
	cortermite = { "cortermite_1.5.png", 1.57499993 },
	armbeamer = { "defence_0_laser2_0.94.png", 0.98699993 },
	armstone = { "blank.png", 1.04999995 },
	armmav = { "armmav_1.3.png", 1.36499989 },
	chickend1 = { "chicken_roost.png", 1.57499993 },
	armfhlt = { "defence_1_laser_1.05.png", 1.10249984 },
	armfrt = { "aa.png", 0.89249998 },
	corthud = { "corthud_1.05.png", 1.10249984 },
	armpnix = { "air_t2_bomber.png", 1.74299991 },
	armlab = { "factory_bot.png", 1.52250004 },
	armkam = { "air_hover.png", 1.25999999 },
	chickenh2 = { "chicken.png", 1.25999999 },
	armplat = { "factory_air.png", 1.52250004 },
	armbeaver = { "amphib_worker.png", 1.36499989 },
	armasp = { "armasp_2.4.png", 2.51999998 },
	armadvsol = { "energy2_1.18.png", 1.23899984 },
	cordl = { "defence_1_naval.png", 1.10249984 },
	armmine1 = { "mine.png", 0.37799999 },
	corfort = { "wall_0.4.png", 0.41999999 },
	armck = { "bot_worker.png", 0.99749994 },
	hat_viking_teamcolored = { "blank.png", 1.83749986 },
}

setmetatable(units, { __index =
function(table, key)
	if string.find(key, "_scav") then
		local new_key = key:gsub("_scav", "")
		local normal_icon = units[new_key]
		local new_object;
		if normal_icon then
			local new_path = "inverted/"..normal_icon[1]
			new_object = {new_path, normal_icon[2]} -- new path old
		end
		return new_object
	end
end})

local iconTypes = {}
function addUnitIcon(name, path, size)
    Spring.AddUnitIcon(name, path, size)
    iconTypes[name] = path
end

function loadUnitIcons()
	local root = 'icons/'
	for id, unit in ipairs(UnitDefs) do
		local name = unit.name
		local icon = units[name]
		if icon then
			local path = root..icon[1]
			local size = icon[2]
			spFreeUnitIcon(name) --Free the icon so it can be used
			addUnitIcon(name, path, size * iconScale) -- Create the icon in the enigne
			spSetUnitDefIcon(id, name)  -- Set the unit icon
		else
			Spring.Echo("No icon for: " ..name)
		end
	end
end

function gadget:GotChatMsg(msg, playerID)
	if playerID == myPlayerID then
		if string.sub(msg, 1, 14) == "uniticonscale " then
			iconScale = tonumber(string.sub(msg, 15))
			Spring.SetConfigFloat("UnitIconScale", iconScale)
			loadUnitIcons()
		end
	end
end

function GetIconTypes()
	return iconTypes
end

function gadget:Initialize()
	gadgetHandler:RegisterGlobal('GetIconTypes', GetIconTypes)
	if Spring.GetGameFrame() == 0 then
		loadUnitIcons()
	end
end
