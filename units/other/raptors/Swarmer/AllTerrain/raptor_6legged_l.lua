return {
	raptor_6legged_l = {
		maxacc = 1.4375,

		maxdec = 2.3,
		energycost = 5280,
		metalcost = 99,
		builder = false,
		buildpic = "raptors/raptorc3c.DDS",
		buildtime = 1875,
		canattack = true,
		canguard = true,
		canmove = true,
		canpatrol = true,
		canstop = "1",
		capturable = false,
		category = "BOT MOBILE WEAPON ALL NOTSUB NOTSHIP NOTAIR NOTHOVER SURFACE RAPTOR EMPABLE",
		collisionvolumeoffsets = "0 -3 -3",
		collisionvolumescales = "18 28 40",
		collisionvolumetype = "box",
		defaultmissiontype = "Standby",
		explodeas = "BUG_DEATH",
		footprintx = 2,
		footprintz = 2,
		leavetracks = true,
		maneuverleashlength = "640",
		mass = 89,
		health = 2650,
		maxreversevelocity = 3,
		maxslope = 18,
		speed = 63.0,
		maxwaterdepth = 15,
		movementclass = "RAPTORALLTERRAINHOVER",
		noautofire = false,
		nochasecategory = "VTOL",
		objectname = "Raptors/raptor_6legged_l.s3o",
		script = "Raptors/raptor_6legged_l.cob",
		seismicsignature = 0,
		selfdestructas = "BIGBUG_DEATH",
		side = "THUNDERBIRDS",
		sightdistance = 200,
		smoothanim = true,
		sonardistance = 450,
		trackoffset = 0.5,
		trackstrength = 3,
		trackstretch = 1,
		tracktype = "RaptorTrackPointy",
		trackwidth = 35,
		turninplace = true,
		turninplaceanglelimit = 90,
		turnrate = 1840,
		unitname = "raptor_6legged_l",
		upright = false,
		waterline = 16,
		workertime = 0,
		customparams = {
			subfolder = "other/raptors",
			model_author = "Kremenchuk, Beherith",
			normalmaps = "yes",
			normaltex = "unittextures/chicken_l_normals.png",
		},
		sfxtypes = {
			explosiongenerators = {
				[1] = "custom:blood_spray",
				[2] = "custom:blood_explode",
				[3] = "custom:dirt",
			},
			pieceexplosiongenerators = {
				[1] = "blood_spray",
				[2] = "blood_spray",
				[3] = "blood_spray",
			},
		},
		weapondefs = {
			weapon = {
				areaofeffect = 24,
				collidefriendly = 0,
				collidefeature = 0,
				avoidfeature = 0,
				avoidfriendly = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.3,
				explosiongenerator = "custom:raptorspike-small-sparks-burn",
				firesubmersed = true,
				impulseboost = 2.2,
				impulsefactor = 1,
				interceptedbyshieldtype = 0,
				model = "Raptors/spike.s3o",
				name = "Claws",
				noselfdamage = true,
				range = 200,
				reloadtime = 1,
				soundstart = "smallraptorattack",
				targetborder = 1,
				tolerance = 5000,
				turret = true,
				waterweapon = true,
				weapontimer = 0.1,
				weapontype = "Cannon",
				weaponvelocity = 1000,
				damage = {
					default = 700,
				},
			},
		},
		weapons = {
			[1] = {
				def = "WEAPON",
				maindir = "0 0 1",
				maxangledif = 110,
			},
		},
	},
}
