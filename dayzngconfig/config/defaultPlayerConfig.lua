-- startup values, only values which depends on difficulty
defaultPlayerConfig = {
  -- key = difficulty = value
  ["blood"] = { -- initial value, max value
    ["easy"] = {15000,15000},
    ["medium"] = {12000,12000},
    ["hard"] = {5000,9000},
    ["impossible"] = {2500,8000},
  },
  ["bleeding"] = { -- initial value
    ["easy"] = 0,
    ["medium"] = 0,
    ["hard"] = 0,
    ["impossible"] = 0,
  },
  ["inventory"] = { -- amount of slots, classing and grid inventory 
    ["easy"] = {12,{4,3}},
    ["medium"] = {10,{5,2}},
    ["hard"] = {8,{4,2}},
    ["impossible"] = {6,{3,2}},
  },
  ["hungry"] = { -- initial value, max value
    ["easy"] = {120,120},
    ["medium"] = {100,100},
    ["hard"] = {70,80},
    ["impossible"] = {40,60},
  },
  ["thirsty"] = { -- initial value, max value
    ["easy"] = {120,120},
    ["medium"] = {100,100},
    ["hard"] = {70,80},
    ["impossible"] = {40,60},
  },
}
