return {
	corwin = {
		maxacc = 0,
		activatewhenbuilt = true,
		maxdec = 0,
		energycost = 175,
		metalcost = 45,
		buildpic = "CORWIN.DDS",
		buildtime = 1680,
		canrepeat = false,
		category = "ALL NOTLAND NOTSUB NOWEAPON NOTSHIP NOTAIR NOTHOVER SURFACE EMPABLE",
		collisionvolumeoffsets = "0 2 0",
		collisionvolumescales = "34 89 34",
		collisionvolumetype = "CylY",
		corpse = "DEAD",
		energystorage = 0.5,
		explodeas = "windboom",
		footprintx = 3,
		footprintz = 3,
		idleautoheal = 5,
		idletime = 1800,
		health = 199,
		maxslope = 10,
		maxwaterdepth = 0,
		objectname = "Units/CORWIN.s3o",
		script = "Units/CORWIN.cob",
		seismicsignature = 0,
		selfdestructas = "windboom",
		sightdistance = 273,
		windgenerator = 25,
		yardmap = "ooo ooo ooo",
		customparams = {
			usebuildinggrounddecal = true,
			buildinggrounddecaltype = "decals/corwin_aoplane.dds",
			buildinggrounddecalsizey = 5,
			buildinggrounddecalsizex = 5,
			buildinggrounddecaldecayspeed = 30,
			unitgroup = 'energy',
			model_author = "Mr Bob",
			normaltex = "unittextures/cor_normal.dds",
			removestop = true,
			removewait = true,
			subfolder = "corbuildings/landeconomy",
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0 0 0",
				collisionvolumescales = "34 89 34",
				collisionvolumetype = "cylY",
				damage = 107,
				featuredead = "HEAP",
				footprintx = 3,
				footprintz = 3,
				height = 20,
				metal = 27,
				object = "Units/corwin_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "85.0 14.0 6.0",
				collisionvolumetype = "cylY",
				damage = 54,
				footprintx = 3,
				footprintz = 3,
				height = 4,
				metal = 11,
				object = "Units/cor4X4A.s3o",
				reclaimable = true,
				resurrectable = 0,
			},
		},
		sfxtypes = {
			pieceexplosiongenerators = {
				[1] = "deathceg2",
				[2] = "deathceg3",
				[3] = "deathceg4",
			},
		},
		sounds = {
			canceldestruct = "cancel2",
			underattack = "warning1",
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			select = {
				[1] = "windgen",
			},
		},
	},
}
