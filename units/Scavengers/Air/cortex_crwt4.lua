return {
	cortex_dragont4 = {
		maxacc = 0.08,
		activatewhenbuilt = true,
		blocking = false,
		bankingallowed = false,
		maxdec = 0.275,
		energycost = 150000,
		metalcost = 15000,
		buildpic = "scavengers/cortex_dragont4.DDS",
		buildtime = 150000,
		canfly = true,
		canmove = true,
		category = "ALL WEAPON VTOL NOTSUB NOTHOVER T4AIR",
		collide = true,
		collisionvolumeoffsets = "0 10 0",
		collisionvolumescales = "80 51 120",
		collisionvolumetype = "Box",
		cruisealtitude = 110,
		explodeas = "bantha",
		footprintx = 5,
		footprintz = 5,
		hoverattack = true,
		idleautoheal = 15,
		idletime = 1200,
		health = 22000,
		maxslope = 10,
		speed = 114.9,
		maxwaterdepth = 0,
		nochasecategory = "VTOL",
		objectname = "Units/scavboss/cortex_dragont4.s3o",
		script = "Units/scavboss/cortex_dragont4.cob",
		seismicsignature = 0,
		selfdestructas = "bantha",
		sightdistance = 675,
		turninplaceanglelimit = 360,
		turnrate = 200,
		upright = true,
		customparams = {
			maxrange = "450",
			unitgroup = 'aa',
			model_author = "Mr Bob, Hornet",
			normaltex = "unittextures/cor_normal.dds",
			subfolder = "other/scavengers",
			techlevel = 3,
		},
		sfxtypes = {
			crashexplosiongenerators = {
				[1] = "crashing-large",
				[2] = "crashing-large",
				[3] = "crashing-large2",
				[4] = "crashing-large3",
				[5] = "crashing-large3",
			},
			pieceexplosiongenerators = {
				[1] = "deathceg3",
				[2] = "deathceg4",
				[3] = "deathceg2",
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
				[1] = "vtolcrmv",
			},
			select = {
				[1] = "vtolcrac",
			},
		},
		weapondefs = {
		
			kmaw = { -- fire based with trailing AoE on particles (or not, atm)
				accuracy = 0,
				areaofeffect = 128,
				avoidfeature = false,
				avoidfriendly = true,
				avoidground = false,
				burst = 12,
				burstrate = 0.03333,
				burnblow = true,
				bouncerebound = 1,
				cegtag = "burnflamethermite",
				colormap = "1 0.95 0.9 0.032   0.55 0.55 0.40 0.028   0.40 0.28 0.19 0.024   0.033 0.018 0.011 0.04   0.0 0.0 0.0 0.01",
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.01,
				explosiongenerator = "custom:burnthermite",
				groundbounce = true,
				bounceSlip = 1.0,
				firestarter = 100,
				firesubmersed = false,
				flameGFXTime = 1,
				groundbounce = true,
				impulseboost = 0,
				impulsefactor = 0,
				intensity = 0.85,
				name = "Demon's Maw; Heavy long range AoE flamethrower",
				noexplode = false,
				noselfdamage = true,
				predictboost = 1,
				range = 500,
				reloadtime = 0.39996,
				sizegrowth = 2.25,
				soundhitwet = "sizzle",
				soundstart = "Flamhvy1",
				soundtrigger = true,
				tolerance = 20000,
				turret = true,
				waterweapon = false,
				weapontype = "Flame",
				weaponvelocity = 500,
				damage = {
					default = 40,--100,
					subs = 10,
				}--,customparams = { single_hit_multi = 'true' },
			},
		
			edragon_missile = {
			
				areaofeffect = 16,
				avoidfeature = false,
				burnblow = true,
				canattackground = false,
				cegtag = "missiletrailaa-large",
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				explosiongenerator = "custom:genericshellexplosion-medium-aa",
				firestarter = 72,
				flighttime = 2.5,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				model = "cormissile.s3o",
				name = "Advanced antiair rapid missile launcher",
				noselfdamage = true,
				range = 840,
				reloadtime = 0.4,
				smoketrail = true,
				smokePeriod = 7,
				smoketime = 10,
				smokesize = 4.2,
				smokecolor = 1.0,
				smokeTrailCastShadow = false,
				castshadow = false,
				soundhit = "packohit",
				soundhitwet = "splshbig",
				soundstart = "packolau",
				soundtrigger = true,
				startvelocity = 800,
				texture1 = "null",
				texture2 = "smoketrailaa",
				tolerance = 9950,
				tracks = true,
				turnrate = 68000,
				turret = true,
				weaponacceleration = 160,
				weapontimer = 2,
				weapontype = "MissileLauncher",
				weaponvelocity = 1250,
				damage = {
					bombers = 400,
					fighters = 400,
					vtol = 400,
				},			
			},
			krowbosslaser = {
				areaofeffect = 8,
				avoidfeature = false,
				beamtime = 0.25,
				beamttl = 1.75,
				corethickness = 0.13,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				cylindertargeting = 1,
				edgeeffectiveness = 0.15,
				energypershot = 50,
				explosiongenerator = "custom:laserhit-large-green",
				firestarter = 90,
				impulseboost = 0,
				impulsefactor = 0,
				laserflaresize = 6.05,
				name = "Ultra HighEnergyLaser",
				noselfdamage = true,
				proximitypriority = 1,
				range = 625,
				reloadtime = 2.5,
				rgbcolor = "0 1 0",
				soundhitdry = "",
				soundhitwet = "sizzle",
				soundstart = "lasrhvy2",
				soundtrigger = 1,
				targetmoveerror = 0.3,
				thickness = 4,
				tolerance = 10000,
				turret = true,
				weapontype = "BeamLaser",
				weaponvelocity = 800,
				damage = {
					commanders = 200,
					default = 2000,
					vtol = 200,
					subs = 200,
				},
			},
			krowbosslaser2 = {
				areaofeffect = 32,
				avoidfeature = false,
				beamtime = 0.5,
				beamttl = 2.5,
				corethickness = 0.2,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				cylindertargeting = 1,
				edgeeffectiveness = 0.15,
				energypershot = 100,
				explosiongenerator = "custom:genericshellexplosion-medium-beam",
				firestarter = 90,
				impulseboost = 0,
				impulsefactor = 0,
				laserflaresize = 7.7,
				name = "Ultra High energy a2g laser",
				noselfdamage = true,
				range = 680,
				reloadtime = 5.2,
				rgbcolor = "1 0.8 0",
				rgbcolor2 = "0.8 0 0",
				soundhitdry = "",
				soundhitwet = "sizzle",
				soundstart = "lasrhvy3",
				soundtrigger = 1,
				targetmoveerror = 0.15,
				thickness = 6.7,
				tolerance = 10000,
				turret = true,
				weapontype = "BeamLaser",
				weaponvelocity = 800,
				damage = {
					commanders = 500,
					default = 5000,
					vtol = 500,
					subs = 500,
				},
			},
		},
		weapons = {
			[1] = {
				def = "kmaw",
				onlytargetcategory = "SURFACE",
				maindir = "0 -1 1",
                maxangledif = 180,
			},
			[2] = {
				def = "edragon_missile",
				badtargetcategory = "NOTAIR",
				onlytargetcategory = "VTOL",
				fastautoretargeting = true,
			},
			[3] = {
				def = "KROWBOSSLASER",
				onlytargetcategory = "SURFACE",
				maindir = "1 -1 0",
                maxangledif = 180,
			},
			[4] = {
				def = "KROWBOSSLASER",
				onlytargetcategory = "SURFACE",
				maindir = "1 -1 0",
                maxangledif = 180,
			},
			[5] = {
				def = "KROWBOSSLASER",
				onlytargetcategory = "SURFACE",
				maindir = "-1 -1 0",
                maxangledif = 180,
			},
			[6] = {
				def = "KROWBOSSLASER",
				onlytargetcategory = "SURFACE",
				maindir = "-1 -1 0",
                maxangledif = 180,
			},
		},
	},
}
