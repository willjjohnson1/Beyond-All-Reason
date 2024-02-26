return {
	legbar = {
		maxacc = 0.01654,
		maxdec = 0.054,
		energycost = 3600,
		metalcost = 320,
		buildpic = "LEGBAR.DDS",
		buildtime = 4000,
		canmove = true,
		category = "ALL TANK MOBILE WEAPON NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE EMPABLE",
		collisionvolumeoffsets = "0 -2 0",
		collisionvolumescales = "34 14 40",
		collisionvolumetype = "Box",
		corpse = "DEAD",
		explodeas = "pyro",
		footprintx = 3,
		footprintz = 3,
		idleautoheal = 5,
		idletime = 1800,
		leavetracks = true,
		health = 1670,
		maxslope = 17,
		speed = 40.5,
		maxwaterdepth = 12,
		movementclass = "TANK3",
		nochasecategory = "VTOL",
		objectname = "Units/LEGBAR.s3o",
		script = "Units/LEGBAR.cob",
		seismicsignature = 0,
		selfdestructas = "pyro",
		sightdistance = 400,
		trackoffset = 8,
		trackstrength = 7,
		tracktype = "corwidetracks",
		trackwidth = 35,
		turninplace = true,
		turninplaceanglelimit = 90,
		turninplacespeedlimit = 0.957,
		turnrate = 240,
		customparams = {
			usebuildinggrounddecal = true,
			buildinggrounddecaltype = "decals/cortex_tzar_aoplane.dds",
			buildinggrounddecalsizey = 4,
			buildinggrounddecalsizex = 4,
			buildinggrounddecaldecayspeed = 30,
			buildinggrounddecalalpha = 0.5,
			unitgroup = 'weapon',
			basename = "base",
			cannon1name = "barrel",
			driftratio = "0",
			firingceg = "barrelshot-medium",
			flare1name = "flare",
			kickback = "-2.4",
			model_author = "Mr Bob",
			normaltex = "unittextures/cor_normal.dds",
			restoretime = "3000",
			rockstrength = "7.5",
			sleevename = "sleeve",
			subfolder = "cortex_vehicles/t2",
			turretname = "turret",
			wpn1turretx = "30",
			wpn1turrety = "40",
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0 0 0",
				collisionvolumescales = "60 16 60",
				collisionvolumetype = "Box",
				damage = 650,
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 3,
				footprintz = 3,
				height = 15,
				hitdensity = 100,
				metal = 192,
				object = "Units/legbar_dead.s3o",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "85.0 14.0 6.0",
				collisionvolumetype = "cylY",
				damage = 325,
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 3,
				footprintz = 3,
				height = 4,
				hitdensity = 100,
				metal = 96,
				object = "Units/cor3X3C.s3o",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:barrelshot-large",
				[2] = "custom:dust_cloud_dirt",
			},
			pieceexplosiongenerators = {
				[1] = "deathceg3",
				[2] = "deathceg4",
			},
		},
		sounds = {
			canceldestruct = "cancel2",
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
				[1] = "tcormove",
			},
			select = {
				[1] = "tcorsel",
			},
		},
		weapondefs = {
			clusternapalm = {
				areaofeffect = 150,
				avoidfeature = false,
				cegtag = "burnflame",
				collidefriendly = false,
				colormap = "0.75 0.73 0.67 0.024   0.37 0.4 0.30 0.021   0.22 0.21 0.14 0.018  0.024 0.014 0.009 0.03   0.0 0.0 0.0 0.008",
				craterareaofeffect = 90,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				explosiongenerator = "custom:genericshellexplosion-small",
				flamegfxtime = 1,
				gravityaffected = "true",
				impulseboost = 0.123,
				impulsefactor = 0.123,
				mygravity = 0.1,
				name = "HeavyCannon",
				noselfdamage = true,
				projectiles = 3,
				range = 535,
				reloadtime = 7.5,
				rgbcolor = "1 0.25 0.1",
				size = 4,
				soundhitdry = "flamhit1",
				soundhitwet = "sizzle",
				soundstart = "cannhvy2",
				sprayangle = 2400,
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 250,
				damage = {
					default = 30,
					subs = 10,
					vtol = 10,
				},
			},
		},
		weapons = {
			[1] = {
				def = "CLUSTERNAPALM",
				onlytargetcategory = "SURFACE",
			},
		},
	},
}
