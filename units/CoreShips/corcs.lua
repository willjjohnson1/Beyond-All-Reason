return {
	corcs = {
		acceleration = 2.76/30,
		brakerate = 2.76/60,
		buildcostenergy = 3200,
		buildcostmetal = 400,
		builddistance = 200,
		builder = true,
		shownanospray = false,
		buildpic = "CORCS.DDS",
		buildtime = 9000*0.8,
		canmove = true,
		category = "ALL NOTLAND MOBILE NOTSUB SHIP NOWEAPON NOTAIR NOTHOVER SURFACE CORVETTE",
		collisionvolumeoffsets = "0 -6 0",
		collisionvolumescales = "22 22 67",
		collisionvolumetype = "CylZ",
		corpse = "DEAD",
		description = "Tech Level 1",
		energymake = 15,
		energystorage = 15,
		explodeas = "mediumexplosiongeneric",
		floater = true,
		footprintx = 2,
		footprintz = 4,
		icontype = "sea",
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 1000,
		maxvelocity = 2.76,
		metalmake = 0.115,
		minwaterdepth = 15,
		movementclass = "BOATCORVETTE2X4",
		name = "Construction Corvette",
		objectname = "CORCS",
		seismicsignature = 0,
		selfdestructas = "mediumexplosiongeneric",
		sightdistance = 700,
		terraformspeed = 1250,
		turninplace = true,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 1.3662,
		turnrate = 520,
		waterline = 3,
		workertime = 250,
		repairtime = 125,
		reclaimtime = 125,
		buildoptions = {
			[1] = "coreyes",
			[2] = "cordl",
			[3] = "cordrag",
			[4] = "cormaw",
			[5] = "cortide",
			[6] = "coruwmex",
			[7] = "cormex",
			[8] = "corfmkr",
			[9] = "coruwms",
			[10] = "coruwes",
			[11] = "corsy",
			[12] = "corasy",
			[13] = "corfhp",
			[14] = "csubpen",
			[15] = "corsonar",
			[16] = "corfrad",
			[17] = "corfdrag",
			[18] = "corgplat",
			[19] = "cortl",
			[20] = "corfrt",
			[21] = "corfhlt",
			[22] = "corplat",
		},
		customparams = {
			
			area_mex_def = "coruwmex",
		},
		featuredefs = {
			dead = {
				blocking = false,
				category = "corpses",
				collisionvolumeoffsets = "0.0 0.0 0.0374984741211",
				collisionvolumescales = "45.9999694824 17.25 80.0749969482",
				collisionvolumetype = "Box",
				damage = 690,
				description = "Construction Ship Wreckage",
				energy = 0,
				featuredead = "HEAP",
				footprintx = 5,
				footprintz = 5,
				height = 4,
				hitdensity = 100,
				metal = 200,
				object = "CORCS_DEAD",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 2016,
				description = "Construction Ship Heap",
				energy = 0,
				footprintx = 5,
				footprintz = 5,
				height = 4,
				hitdensity = 100,
				metal = 100,
				object = "5X5C",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sfxtypes = { 
 			pieceExplosionGenerators = { 
				"deathceg2",
				"deathceg3",
				"deathceg4",
			},
		},
		sounds = {
			build = "nanlath2",
			canceldestruct = "cancel2",
			repair = "repair2",
			underattack = "warning1",
			working = "reclaim1",
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
				[1] = "shcormov",
			},
			select = {
				[1] = "shcorsel",
			},
		},
	},
}
