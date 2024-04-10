return {
	armuwmme = {
		maxacc = 0,
		activatewhenbuilt = true,
		maxdec = 0,
		buildangle = 32768,
		energycost = 9800,
		metalcost = 650,
		buildingmask = 0,
		buildpic = "ARMUWMME.DDS",
		buildtime = 24800,
		canrepeat = false,
		category = "ALL NOTLAND NOTSUB NOWEAPON NOTSHIP NOTAIR NOTHOVER SURFACE UNDERWATER EMPABLE",
		corpse = "DEAD",
		energyupkeep = 20,
		explodeas = "hugeBuildingExplosionGeneric-uw",
		extractsmetal = 0.004,
		footprintx = 4,
		footprintz = 4,
		idleautoheal = 5,
		idletime = 1800,
		health = 2300,
		maxslope = 30,
		metalstorage = 600,
		minwaterdepth = 15,
		objectname = "Units/ARMUWMME.s3o",
		onoffable = true,
		script = "Units/ARMUWMME.cob",
		seismicsignature = 0,
		selfdestructas = "hugeBuildingExplosionGenericSelfd-uw",
		sightdistance = 182,
		yardmap = "h cbbbbbbc bssssssb bsssossb bsobbssb bssbbosb bssosssb bssssssb cbbbbbbc",
		customparams = {
			usebuildinggrounddecal = true,
			buildinggrounddecaltype = "decals/armuwmme_aoplane.dds",
			buildinggrounddecalsizey = 8,
			buildinggrounddecalsizex = 8,
			buildinggrounddecaldecayspeed = 30,
			unitgroup = 'metal',
			cvbuildable = true,
			metal_extractor = 4,
			model_author = "FireStorm",
			normaltex = "unittextures/Arm_normal.dds",
			removestop = true,
			removewait = true,
			subfolder = "armbuildings/seaeconomy",
			techlevel = 2,
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "-4.05554199219 -3.90136718735e-05 1.12891387939",
				collisionvolumescales = "70.6470947266 41.1475219727 59.8421783447",
				collisionvolumetype = "Box",
				damage = 1232,
				featuredead = "HEAP",
				footprintx = 5,
				footprintz = 5,
				height = 140,
				metal = 391,
				object = "Units/armuwmme_dead.s3o",
				reclaimable = true,
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 616,
				footprintx = 5,
				footprintz = 5,
				height = 4,
				metal = 156,
				object = "Units/arm5X5C.s3o",
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
			activate = "cmd-on",
			canceldestruct = "cancel2",
			deactivate = "cmd-off",
			underattack = "warning1",
			working = "cmd-on",
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			select = {
				[1] = "waterex1",
			},
		},
	},
}
