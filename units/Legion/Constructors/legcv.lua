return {
	legcv = {
		maxacc = 0.03049,
		maxdec = 0.06099,
		energycost = 2100,
		metalcost = 145,
		builddistance = 130,
		builder = true,
		buildpic = "LEGCV.DDS",
		buildtime = 4160,
		canmove = true,
		category = "ALL TANK MOBILE NOTSUB NOWEAPON NOTSHIP NOTAIR NOTHOVER SURFACE EMPABLE",
		collisionvolumeoffsets = "0 0 0",
		collisionvolumescales = "35 22 49",
		collisionvolumetype = "Box",
		corpse = "DEAD",
		energymake = 10,
		energystorage = 50,
		explodeas = "mediumexplosiongeneric-builder",
		footprintx = 3,
		footprintz = 3,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
		health = 1430,
		maxslope = 16,
		speed = 51.0,
		maxwaterdepth = 19,
		movementclass = "TANK3",
		objectname = "Units/cortex_constructionvehicle.s3o",
		radardistance = 50,
		script = "Units/cortex_constructionvehicle.cob",
		seismicsignature = 0,
		selfdestructas = "mediumExplosionGenericSelfd-builder",
		sightdistance = 260,
		terraformspeed = 450,
		trackoffset = 3,
		trackstrength = 6,
		tracktype = "corwidetracks",
		trackwidth = 32,
		turninplace = true,
		turninplaceanglelimit = 90,
		turninplacespeedlimit = 1.1979,
		turnrate = 421,
		workertime = 90,
		buildoptions = {
			"cortex_solarcollector",
			"cortex_advancedsolarcollector",
			"cortex_windturbine",
			"cortex_geothermalpowerplant",
			"cortex_metalstorage",
			"cortex_energystorage",
			"legmex",
			"legmext15",
			"cortex_energyconverter",
			"legavp",
			"leglab",
			"legvp",
			"legap",
			"cortex_hovercraftplatform",
			"cortex_constructionturret",
			"cortex_beholder",
			"cortex_radartower",
			"corscavdrag",
			"corscavdtl",
			"corscavdtf",
			"corscavdtm",
			"cortex_guard",
			"legmg",
			"cortex_agitator",
			"cortex_thistle",
			"cortex_sam",
			"cortex_eradicator",
			"cortex_jellyfish",
			"cortex_castro",
			"cortex_juno",
			"cortex_shipyard",
			"legdefcarryt1",
		},
		customparams = {
			unitgroup = 'builder',
			area_mex_def = "legmex",
			area_mexT15_def = "legmext15",
			model_author = "Mr Bob",
			normaltex = "unittextures/cor_normal.dds",
			subfolder = "cortex_vehicles",
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0.31364440918 1.09863281317e-06 0.657264709473",
				collisionvolumescales = "32.9147644043 17.5585021973 49.4168548584",
				collisionvolumetype = "Box",
				damage = 874,
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 3,
				footprintz = 3,
				height = 20,
				hitdensity = 100,
				metal = 87,
				object = "Units/cortex_constructionvehicle_dead.s3o",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "55.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 487,
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 3,
				footprintz = 3,
				height = 4,
				hitdensity = 100,
				metal = 35,
				object = "Units/cor3X3D.s3o",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sfxtypes = {
			pieceexplosiongenerators = {
				[1] = "deathceg2-builder",
				[2] = "deathceg3-builder",
				[3] = "deathceg4-builder",
			},
		},
		sounds = {
			build = "nanlath2",
			canceldestruct = "cancel2",
			capture = "capture1",
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
				[1] = "vcormove",
			},
			select = {
				[1] = "vcorsel",
			},
		},
	},
}
