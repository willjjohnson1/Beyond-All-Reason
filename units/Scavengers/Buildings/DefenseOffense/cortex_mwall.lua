return {
	cormwall = {
		maxacc = 0,
		energycost = 4800, --was 4850
		metalcost = 1020, --was 485
		buildpic = "CORMWALL.DDS",
		buildtime = 14000, -- was 12214
		canrepeat = false,
		category = "ALL NOTLAND WEAPON NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE EMPABLE",
		collisionvolumeoffsets = "0 -3 0",
		collisionvolumescales = "32 50 32",
		collisionvolumetype = "CylY",
		corpse = "DEAD",
		damagemodifier = 0.25,
		decoyfor = "cortex_fortificationwall",
		explodeas = "smallBuildingexplosiongeneric",
		footprintx = 2,
		footprintz = 2,
		hidedamage = true,
		idleautoheal = 10,
		idletime = 900,
		levelground = false,
		mass = 10000000000,
		health = 5320, --was 4450, --1/2 of cortex_fortificationwall
		maxslope = 24,
		maxwaterdepth = 0,
		nochasecategory = "MOBILE",
		objectname = "Units/CORMWALL.s3o",
		script = "Units/CORMWALL.cob",
		seismicsignature = 0,
		selfdestructas = "tinyBuildingExplosionGenericSelfd",
		sightdistance = 330,
		stealth = true,
		turnrate = 0,
		upright = true,
		yardmap = "ffff",
		customparams = {
			neutral_when_closed = true,
			usebuildinggrounddecal = true,
			buildinggrounddecaltype = "decals/cortex_fortificationwall_aoplane.dds",
			buildinggrounddecalsizey = 4,
			buildinggrounddecalsizex = 4,
			buildinggrounddecaldecayspeed = 30,
			unitgroup = 'weapon',
			decoyfor = "armada_fortificationwall",
			model_author = "Beherith",
			normaltex = "unittextures/cor_normal.dds",
			removewait = true,
			subfolder = "cortex_buildings/landdefenceoffence",
			techlevel = 2,
		},
		featuredefs = {
			dead = {
				autoreclaimable = 0,
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0 -3 0",
				collisionvolumescales = "32 50 32",
				collisionvolumetype = "CylY",
				damage = 540,
				energy = 0,
				featuredead = "ROCKTEETH",
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 20,
				hitdensity = 100,
				metal = 205,
				object = "Units/cortex_fortificationwall.s3o",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			rockteeth = {
				animating = 0,
				animtrans = 0,
				blocking = false,
				category = "heaps",
				collisionvolumescales = "35.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 500,
				footprintx = 2,
				footprintz = 2,
				height = 20,
				hitdensity = 100,
				metal = 2,
				object = "Units/cor1X1A.s3o",
				reclaimable = true,
				resurrectable = 0,
				shadtrans = 1,
				world = "greenworld",
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:flamestreamxm",
			},
			pieceexplosiongenerators = {
				[1] = "deathceg3",
				[2] = "deathceg4-fire",
			},
		},
		sounds = {
			canceldestruct = "cancel2",
			cloak = "kloak1",
			uncloak = "kloak1un",
			underattack = "warning1",
			cant = {
				[1] = "cantdo4",
			},
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			ok = {
				[1] = "servmed2",
			},
			select = {
				[1] = "servmed2",
			},
		},
		weapondefs = {
			-- banisher = {
			-- 	areaofeffect = 128,
			-- 	avoidfeature = false,
			-- 	burnblow = true,
			-- 	burst = 7,
			-- 	burstrate = 0.3333,
			-- 	cegtag = "missiletraillarge-red",
			-- 	craterareaofeffect = 128,
			-- 	craterboost = 0,
			-- 	cratermult = 0,
			-- 	edgeeffectiveness = 0.55,
			-- 	explosiongenerator = "custom:genericshellexplosion-large-bomb",
			-- 	firestarter = 20,
			-- 	flighttime = 7.4,
			-- 	impulseboost = 0.123,
			-- 	impulsefactor = 0.123,
			-- 	model = "banishermissile.s3o",
			-- 	name = "Banisher",
			-- 	noselfdamage = true,
			-- 	range = 300,
			-- 	reloadtime = 38, --18
			-- 	smoketrail = true,
			-- 	smokePeriod = 7, --7
			-- 	smoketime = 24, --48
			-- 	smokesize = 11.3,
			-- 	smokecolor = 0.82,
			-- 	smokeTrailCastShadow = false,
			-- 	soundhit = "cortex_banisher_b",
			-- 	soundhitwet = "splsmed",
			-- 	soundstart = "cortex_banisher_a",
			-- 	startvelocity = 240,
			-- 	texture1 = "null",
			-- 	texture2 = "railguntrail",
			-- 	tolerance = 9000,
			-- 	tracks = true,
			-- 	trajectoryheight = 0.45,
			-- 	turnrate = 60000,
			-- 	turret = true,
			-- 	weaponacceleration = 220,
			-- 	weapontimer = 0.25,
			-- 	weapontype = "StarburstLauncher",
			-- 	weaponvelocity = 650,
			-- 	damage = {
			-- 		default = 750,
			-- 	},
			-- },
			exp_heavyrocket = {
				areaofeffect = 96,
				avoidfeature = false,
				burst = 7,
				burstrate = 0.1,
				cegtag = "missiletrailsmall-red",
				craterboost = 0,
				cratermult = 0,
				dance = 24,
				edgeeffectiveness = 0.65,
				explosiongenerator = "custom:genericshellexplosion-catapult",
				firestarter = 70,
				flighttime = 3.2,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				metalpershot = 0,
				model = "catapultmissile.s3o",
				movingaccuracy = 600,
				name = "CatapultRockets",
				noselfdamage = true,
				proximitypriority = -1,
				range = 675, --1/2 of cortex_catapult
				reloadtime = 15,
				smoketrail = true,
				smokePeriod = 4,
				smoketime = 16,
				smokesize = 8.5,
				smokecolor = 0.5,
				smokeTrailCastShadow = false,
				soundhit = "rockhit",
				soundhitwet = "splsmed",
				soundstart = "rapidrocket3",
				startvelocity = 165,
				texture1 = "null",
				texture2 = "smoketrailbar",
				trajectoryheight = 3,
				turnrate = 5000,
				turret = true,
				weaponacceleration = 100,
				weapontimer = 6,
				weapontype = "MissileLauncher",
				weaponvelocity = 530,
				wobble = 2000,
				damage = {
					default = 450,
				},
			},
		},
		weapons = {
			[1] = {
				def = "exp_heavyrocket",
				onlytargetcategory = "SURFACE",
				fastautoretargeting = true,
			},
		},
	},
}
