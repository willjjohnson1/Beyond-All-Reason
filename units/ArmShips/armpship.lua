return {
	armpship = {
		maxacc = 0.04771,
		airsightdistance = 470,
		autoheal = 1.5,
		blocking = true,
		maxdec = 0.04771,
		energycost = 2550,
		metalcost = 380,
		buildpic = "ARMPSHIP.DDS",
		buildtime = 4250,
		canmove = true,
		category = "ALL NOTLAND MOBILE WEAPON NOTSUB SHIP NOTAIR NOTHOVER SURFACE EMPABLE",
		collisionvolumeoffsets = "0 -4 1",
		collisionvolumescales = "26 26 76",
		collisionvolumetype = "CylZ",
		corpse = "DEAD",
		explodeas = "mediumExplosionGeneric",
		floater = true,
		footprintx = 4,
		footprintz = 4,
		idleautoheal = 2,
		idletime = 900,
		health = 2150,
		speed = 81.0,
		minwaterdepth = 6,
		movementclass = "BOAT4",
		nochasecategory = "VTOL UNDERWATER",
		objectname = "Units/ARMPSHIP.s3o",
		script = "Units/ARMPSHIP.cob",
		seismicsignature = 0,
		selfdestructas = "mediumExplosionGenericSelfd",
		sightdistance = 500,
		turninplace = true,
		turninplaceanglelimit = 90,
		turnrate = 375,
		waterline = 0,
		customparams = {
			unitgroup = 'weapon',
			normaltex = "unittextures/Arm_normal.dds",
			subfolder = "armships",
		},
		featuredefs = {
			dead = {
				blocking = false,
				category = "corpses",
				collisionvolumeoffsets = "0.255500793457 0.0 -1.26264953613",
				collisionvolumescales = "20.0704803467 16.0 67.0992736816",
				collisionvolumetype = "Box",
				damage = 500,
				featuredead = "HEAP",
				footprintx = 1,
				footprintz = 3,
				height = 4,
				metal = 195,
				object = "Units/armpship_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				category = "heaps",
				collisionvolumescales = "55.0 4.0 6.0",
				collisionvolumetype = "cylY",
				damage = 1032,
				footprintx = 3,
				footprintz = 3,
				height = 4,
				metal = 97.5,
				object = "Units/arm3X3A.s3o",
				reclaimable = true,
				resurrectable = 0,
			},
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:waterwake-medium",
				[2] = "custom:bowsplash-small",
			},
			pieceexplosiongenerators = {
				[1] = "deathceg2",
				[2] = "deathceg3",
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
				[1] = "sharmmov",
			},
			select = {
				[1] = "sharmsel",
			},
		},
		weapondefs = {
			plasma = {
				areaofeffect = 36,
				avoidfeature = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				explosiongenerator = "custom:genericshellexplosion-small",
				gravityaffected = "true",
				impulseboost = 0.123,
				impulsefactor = 0.123,
				name = "Light long-range plasma cannon",
				noselfdamage = true,
				predictboost = 0.4,
				range = 470,
				reloadtime = 1.2,
				size = 2,
				soundhit = "xplomed3",
				soundhitwet = "splshbig",
				soundstart = "cannon1",
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 290,
				damage = {
					default =  70,
					subs = 70,
					vtol = 37,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "LIGHTAIRSCOUT UNDERWATER",
				def = "PLASMA",
				onlytargetcategory = "NOTSUB",
			},
			[2] = {
				badtargetcategory = "LIGHTAIRSCOUT UNDERWATER",
				def = "PLASMA",
				maindir = "0 0 1",
				maxangledif = 290,
				onlytargetcategory = "NOTSUB",
			},
		},
	},
}
