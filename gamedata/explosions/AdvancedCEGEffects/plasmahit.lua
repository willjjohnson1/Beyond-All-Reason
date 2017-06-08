-- genericshellexplosion-small-sparks-burn
-- genericshellexplosion-medium-sparks-burn
-- genericshellexplosion-large-sparks-burn

local definitions = {
  ["plasmahit-small"] = {
    groundflash = {
      air                = true,
      flashalpha         = 0.3,
      flashsize          = 2,
      ground             = true,
      ttl                = 18,
      water              = true, 
	  underwater         = true,
      color = {
        [1]  = 1,
        [2]  = 0.7,
        [3]  = 0.05,
      },
    },
    kickedupwater = {
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      water              = true,
	  underwater         = true,
      properties = {
        airdrag            = 0.87,
        colormap           = [[0.7 0.7 0.9 0.35	0 0 0 0.0]],
        directional        = false,
        emitrot            = 90,
        emitrotspread      = 5,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0.1, 0]],
        numparticles       = 10,
        particlelife       = 2,
        particlelifespread = 13,
        particlesize       = 2,
        particlesizespread = 1,
        particlespeed      = 1.5,
        particlespeedspread = 4.5,
        pos                = [[0, 1, 0]],
        sizegrowth         = 0.5,
        sizemod            = 0.7,
        texture            = [[wake]],
      },
    },
    sparks_directional = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      underwater         = true,
      properties = {
        airdrag            = 0.9,
        colormap           = [[1 0.8 0.6 0.04   1 0.55 0.2 0.02   0 0 0 0 ]],
        directional        = true,
        emitrot            = 5,
        emitrotspread      = 45,
        emitvector         = [[dir]],
        gravity            = [[0, -0.2, 0]],
        numparticles       = 3,
        particlelife       = 4,
        particlelifespread = 3,
        particlesize       = 26,
        particlesizespread = 33,
        particlespeed      = 1,
        particlespeedspread = 4,
        pos                = [[0, 2, 0]],
        sizegrowth         = 2.6,
        sizemod            = 0.5,
        texture            = [[gunshotglow]],
        useairlos          = false,
      },
    },
    sparks = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      underwater         = true,
      properties = {
        airdrag            = 0.9,
        colormap           = [[1 0.8 0.6 0.04   1 0.55 0.2 0.02   0 0 0 0 ]],
        directional        = true,
        emitrot            = 15,
        emitrotspread      = 60,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, -0.2, 0]],
        numparticles       = 1,
        particlelife       = 4,
        particlelifespread = 3,
        particlesize       = 18,
        particlesizespread = 18,
        particlespeed      = 1,
        particlespeedspread = 4,
        pos                = [[0, 2, 0]],
        sizegrowth         = 2.6,
        sizemod            = 0.5,
        texture            = [[gunshotglow]],
        useairlos          = false,
      },
    },
    centerflare = {
      air                = true,
      class              = [[heatcloud]],
      count              = 1,
      ground             = true,
      underwater         = 1,
      water              = true,
      underwater         = true,
      properties = {
        heat               = 7,
        heatfalloff        = 1.6,
        maxheat            = 20,
        pos                = [[r-2 r2, 2.5, r-2 r2]],
        size               = 0.8,
        sizegrowth         = 1.5,
        speed              = [[0, 0, 0]],
        texture            = [[flare]],
      },
    },

    underwaterexplosionspikes = {
      class              = [[CSimpleParticleSystem]],
      count              = 2,
      underwater         = 1,
      properties = {
        airdrag            = 0.9,
        colormap           = [[0.7 0.8 0.9 0.03   0.2 0.5 0.9 0.01		0 0 0 0.0]],
        directional        = true,
        emitrot            = 45,
        emitrotspread      = 32,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0.5, 0]],
        numparticles       = 4,
        particlelife       = 4,
        particlelifespread = 13,
        particlesize       = 1,
        particlesizespread = 0,
        particlespeed      = 2,
        particlespeedspread = 1.5,
        pos                = [[0, 2, 0]],
        sizegrowth         = 2,
        sizemod            = 0.25,
        texture            = [[wake]],
        useairlos          = false,
      },
    },
  },

  ["plasmahit-medium"] = {
    groundflash = {
      air                = true,
      flashalpha         = 0.35,
      flashsize          = 2.4,
      ground             = true,
      ttl                = 20,
      water              = true, 
	  underwater         = true,
      color = {
        [1]  = 1,
        [2]  = 0.7,
        [3]  = 0.05,
      },
    },
    kickedupwater = {
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      water              = true,
	  underwater         = true,
      properties = {
        airdrag            = 0.87,
        colormap           = [[0.7 0.7 0.9 0.35	0 0 0 0.0]],
        directional        = false,
        emitrot            = 90,
        emitrotspread      = 5,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0.1, 0]],
        numparticles       = 15,
        particlelife       = 2,
        particlelifespread = 15,
        particlesize       = 2,
        particlesizespread = 1,
        particlespeed      = 2,
        particlespeedspread = 6,
        pos                = [[0, 1, 0]],
        sizegrowth         = 0.5,
        sizemod            = 0.7,
        texture            = [[wake]],
      },
    },
    sparks_directional = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      underwater         = true,
      properties = {
        airdrag            = 0.9,
        colormap           = [[1 0.8 0.6 0.015   1 0.55 0.2 0.008   0 0 0 0 ]],
        directional        = true,
        emitrot            = 5,
        emitrotspread      = 45,
        emitvector         = [[dir]],
        gravity            = [[0, -0.2, 0]],
        numparticles       = 3,
        particlelife       = 6,
        particlelifespread = 4,
        particlesize       = 30,
        particlesizespread = 45,
        particlespeed      = 1.5,
        particlespeedspread = 4.5,
        pos                = [[0, 2, 0]],
        sizegrowth         = 2.9,
        sizemod            = 0.5,
        texture            = [[gunshotglow]],
        useairlos          = false,
      },
    },
    sparks = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      underwater         = true,
      properties = {
        airdrag            = 0.9,
        colormap           = [[1 0.8 0.6 0.04   1 0.55 0.2 0.02   0 0 0 0 ]],
        directional        = true,
        emitrot            = 15,
        emitrotspread      = 60,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, -0.2, 0]],
        numparticles       = 2,
        particlelife       = 6,
        particlelifespread = 4,
        particlesize       = 20,
        particlesizespread = 20,
        particlespeed      = 1,
        particlespeedspread = 4.5,
        pos                = [[0, 2, 0]],
        sizegrowth         = 2.9,
        sizemod            = 0.5,
        texture            = [[gunshotglow]],
        useairlos          = false,
      },
    },

    centerflare = {
      air                = true,
      class              = [[heatcloud]],
      count              = 1,
      ground             = true,
      underwater         = 1,
      water              = true,
      underwater         = true,
      properties = {
        heat               = 8,
        heatfalloff        = 1.6,
        maxheat            = 15,
        pos                = [[r-2 r2, 2.5, r-2 r2]],
        size               = 1,
        sizegrowth         = 1.5,
        speed              = [[0, 0, 0]],
        texture            = [[flare]],
      },
    },
    underwaterexplosionspikes = {
      class              = [[CSimpleParticleSystem]],
      count              = 2,
      underwater         = 1,
      properties = {
        airdrag            = 0.9,
        colormap           = [[0.7 0.8 0.9 0.03   0.2 0.5 0.9 0.01		0 0 0 0.0]],
        directional        = true,
        emitrot            = 45,
        emitrotspread      = 32,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0.5, 0]],
        numparticles       = 4,
        particlelife       = 4,
        particlelifespread = 15,
        particlesize       = 1,
        particlesizespread = 0,
        particlespeed      = 3,
        particlespeedspread = 2,
        pos                = [[0, 2, 0]],
        sizegrowth         = 2,
        sizemod            = 0.25,
        texture            = [[wake]],
        useairlos          = false,
      },
    },
  },

}



function tableMerge(t1, t2)
  for k,v in pairs(t2) do
    if type(v) == "table" then
      if type(t1[k] or false) == "table" then
        tableMerge(t1[k] or {}, t2[k] or {})
      else
        t1[k] = v
      end
    else
      t1[k] = v
    end
  end
  return t1
end

function deepcopy(orig)
  local orig_type = type(orig)
  local copy
  if orig_type == 'table' then
    copy = {}
    for orig_key, orig_value in next, orig, nil do
      copy[deepcopy(orig_key)] = deepcopy(orig_value)
    end
    setmetatable(copy, deepcopy(getmetatable(orig)))
  else -- number, string, boolean, etc
    copy = orig
  end
  return copy
end



-- add coloring
--local colors = {
--  red = {
--    sparks = {properties={colormap=[[1 0.4 0.1 0.04   1 0.2 0.1 0.02   0 0 0 0 ]]}},
--    hit = {properties={colormap=[[1 0.3 0.1 0.05   0.035 0.01 0.005 0.04   0.012 0.008 0.005 0.08   0.04 0.04 0.005 0.08   0.04 0.038 0.035 0.08       0 0 0 0 ]]}},
--  },
--  green = {
--    sparks = {properties={colormap=[[0.7 1 0.3 0.04   0.7 1 0.2 0.02   0 0 0 0 ]]}},
--    hit = {properties={colormap=[[0.3 1 0.1 0.05   0.015 0.035 0.005 0.04   0.006 0.012 0.005 0.08   0.04 0.04 0.005 0.08   0.04 0.038 0.035 0.08       0 0 0 0 ]]}},
--  },
--  yellow = {
--    sparks = {properties={colormap=[[1 1 0.3 0.04   1 1 0.2 0.02   0 0 0 0 ]]}},
--    hit = {properties={colormap=[[1 1 0.1 0.05   0.035 0.035 0.005 0.04   0.012 0.012 0.005 0.08   0.04 0.04 0.005 0.08   0.04 0.038 0.035 0.08       0 0 0 0 ]]}},
--  },
--  blue = {
--    sparks = {properties={colormap=[[0.7 0.7 1 0.04   0.7 0.7 1 0.02   0 0 0 0 ]]}},
--    hit = {properties={colormap=[[0.3 0.3 1 0.05   0.01 0.01 0.35 0.04   0.006 0.006 0.012 0.08   0.04 0.04 0.005 0.08   0.04 0.038 0.035 0.08       0 0 0 0 ]]}},
--  },
--  purple = {
--    sparks = {properties={colormap=[[1 0.7 0.9 0.04   1 0.7 09 0.02   0 0 0 0 ]]}},
--     hit = {properties={colormap=[[1 0.3 1 0.05   0.35 0.01 0.35 0.04   0.012 0.006 0.012 0.08   0.04 0.04 0.005 0.08   0.04 0.038 0.035 0.08       0 0 0 0 ]]}},
--  },
--}
--
--local sizes = {
--  "plasmahit-small",
--  "plasmahit-medium",
--}
--for color, effects in pairs(colors) do
--  for k, size in pairs(sizes) do
--    definitions[size.."-"..color] = tableMerge(deepcopy(definitions[size]), deepcopy(effects))
--  end
--end


return definitions