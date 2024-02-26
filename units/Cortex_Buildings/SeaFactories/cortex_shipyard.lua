return {
	cortex_shipyard = {
		maxacc = 0,
		maxdec = 0,
		energycost = 1200,
		metalcost = 600,
		builder = true,
		buildpic = "cortex_shipyard.DDS",
		buildtime = 6600,
		canmove = true,
		category = "ALL NOTSUB NOWEAPON NOTAIR NOTHOVER SURFACE EMPABLE",
		collisionvolumeoffsets = "0 0 2",
		collisionvolumescales = "124 59 122",
		collisionvolumetype = "Box",
		corpse = "DEAD",
		energystorage = 100,
		explodeas = "largeBuildingexplosiongeneric",
		footprintx = 8,
		footprintz = 8,
		idleautoheal = 5,
		idletime = 1800,
		health = 4300,
		metalstorage = 100,
		minwaterdepth = 30,
		objectname = "Units/cortex_shipyard.s3o",
		script = "Units/cortex_shipyard.cob",
		seismicsignature = 0,
		selfdestructas = "largeBuildingExplosionGenericSelfd",
		sightdistance = 340,
		terraformspeed = 500,
		waterline = 1,
		workertime = 165,
		yardmap = "oyyyyyyoyccccccyyccccccyyccccccyyccccccyyccccccyyccccccyoyyyyyyo",
		buildoptions = {
			[1] = "cortex_constructionship",
			[2] = "cortex_deathcavalry",
			[3] = "cortex_supporter",
			[4] = "cortex_herring",
			[5] = "cortex_riptide",
			[6] = "cortex_oppressor",
			[7] = "cortex_orca",
		},
		customparams = {
			unitgroup = 'builder',
			model_author = "Mr Bob",
			normaltex = "unittextures/cor_normal.dds",
			subfolder = "cortex_buildings/seafactories",
		},
		featuredefs = {
			dead = {
				blocking = false,
				category = "corpses",
				collisionvolumeoffsets = "0 -10 -4",
				collisionvolumescales = "116 56 120",
				collisionvolumetype = "Box",
				damage = 1794,
				energy = 0,
				footprintx = 7,
				footprintz = 7,
				height = 4,
				hitdensity = 100,
				metal = 400,
				object = "Units/cortex_shipyard_dead.s3o",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:WhiteLight",
			},
			pieceexplosiongenerators = {
				[1] = "deathceg3",
				[2] = "deathceg4",
			},
		},
		sounds = {
			canceldestruct = "cancel2",
			underattack = "warning1",
			unitcomplete = "untdone",
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			select = {
				[1] = "pshpactv",
			},
		},
	},
}
