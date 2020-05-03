difficultyConfig = {
  ["startupItems"] = {
    -- difficulty, [itemId] = amount
    ["easy"] = {
      [1] = 2,
      [1] = 1,
    },
    ["medium"] = {
      [1] = 1,
      [1] = 1,
    },
    ["hard"] = {
      [1] = 1,
    },
    ["impossible"] = {},
  },

  ["drop"] = { -- how many items drop from each category?
    -- difficulty, [category] = procentage
    ["easy"] = {
      ["Medical"] = 3,
    },
    ["medium"] = {
      ["Medical"] = 2.5,
    },
    ["hard"] = {
      ["Medical"] = 2,
    },
    ["impossible"] = {
      ["Medical"] = 1.5,
    },
  },

  ["dropRate"] = {
    -- difficulty, [category] = {drop from, drop to} or constant number
    ["easy"] = {
      ["Medical"] = {2,3},
    },
    ["medium"] = {
      ["Medical"] = {1,3},
    },
    ["hard"] = {
      ["Medical"] = {1,2},
    },
    ["impossible"] = {
      ["Medical"] = 1,
    },
  },

  ["lootSpawn"] = { -- procentage of loots spawned after refresh
    -- difficulty, [category] = procentage
    ["easy"] = 100,
    ["medium"] = 85,
    ["hard"] = 70,
    ["impossible"] = 50,
  },

  ["lootItemsAmount"] = { -- how many items spawn in loots?
    -- difficulty, [category] = how many items, between 2 numbers
    ["easy"] = {5,7},
    ["medium"] = {3,5},
    ["hard"] = {2,4},
    ["impossible"] = {2,3}
  },

  ["lootRespawn"] = { -- how often loots are respawned?
    -- difficulty, [category] = time in seconds
    ["easy"] = 60 * 60 * 2, -- 2 hours
    ["medium"] = 60 * 60 * 3, -- 3 hours
    ["hard"] = 60 * 60 * 3.5, -- 3,5 hours
    ["impossible"] = 60 * 60 * 4, -- 3,5 hours
  },

  ["dropWeaponAmmo"] = {
    -- difficulty, should spawn ammo nex to weapon? how many mags? {drop from, drop to} or constant number
    ["easy"] = {2, 3},
    ["medium"] = {1,2},
    ["hard"] = {0,1},
    ["impossible"] = 0, -- don't spawn ammo next to weapon
  },

  ["bleedingMultiplier"] = {
    ["easy"] = 0.7,
    ["medium"] = 1,
    ["hard"] = 1.3,
    ["impossible"] = 1.6,
  },

  ["fractureChanceFall"] = {
    ["easy"] = 15,
    ["medium"] = 25,
    ["hard"] = 40,
    ["impossible"] = 70,
  },

  ["fractureChanceZombie"] = {
    ["easy"] = 10,
    ["medium"] = 20,
    ["hard"] = 30,
    ["impossible"] = 50,
  },
  
  ["healingThresholds"] = { -- Above what procentage of hungry and thirsty you starts self healing
    ["easy"] = {70, 70},
    ["medium"] = {80, 80},
    ["hard"] = {90, 90},
    ["impossible"] = {100, 100}, -- don't heal
  },

  ["healing"] = { -- self healing per minute when you are not hungry, thirsty
    ["easy"] = 50,
    ["medium"] = 20,
    ["hard"] = 5,
    ["impossible"] = 0,
  },

  ["healingBleeding"] = { -- self bleed healing per minute when you are not hungry, thirsty
    ["easy"] = 20,
    ["medium"] = 10,
    ["hard"] = 3,
    ["impossible"] = 0,
  },

  ["coldDamage"] = { -- how many blood you loosing every minute of being cold
    ["easy"] = 50,
    ["medium"] = 120,
    ["hard"] = 200,
    ["impossible"] = 400,
  },

  ["infectionChance"] = { -- procentage, after get hit by zombie
    ["easy"] = 10,
    ["medium"] = 20,
    ["hard"] = 35,
    ["impossible"] = 50,
  },

  ["infectionDamage"] = { -- how many blood you loosing every minute of being infected
    ["easy"] = 80,
    ["medium"] = 200,
    ["hard"] = 300,
    ["impossible"] = 500,
  },

  ["zombieVisibilityDistance"] = { -- base zombie visibility distance
    ["easy"] = 25,
    ["medium"] = 32,
    ["hard"] = 40,
    ["impossible"] = 50,
  },

  ["zombieSoundDistance"] = { -- base zombie visibility distance
    ["easy"] = 25,
    ["medium"] = 32,
    ["hard"] = 40,
    ["impossible"] = 50,
  },

  ["painChance"] = { -- base zombie visibility distance
    ["easy"] = 25,
    ["medium"] = 32,
    ["hard"] = 40,
    ["impossible"] = 50,
  },

}