function getInventoryType()
  return 1--get("inventoryType")
end

function getServerDifficulty()
  return generalConfig["difficulty"]
end

function getSpawn(player, spawnId)
  if(spawnId)then
    if(spawns[spawnId])then
      return spawns[spawnId]
    else
      return false
    end
  else
    return spawns[math.random(#spawns)]
  end
end

function getConfig(key, difficulty)
  if(difficultyConfig[key])then
    if(difficulty)then
      return difficultyConfig[key][difficulty];
    else
      local difficulty = getDefaultLanguage();
      return difficultyConfig[key][difficulty];
    end
  end
end

function getGeneralConfig(key)
  return generalConfig[key]
end

function insertDefaultLootTable()
  for category, loots in pairs(lootsLocations)do
    for i,loot in ipairs(loots)do
      exports.dayzngdb:dbSet("loots", "insert into %s (location, category)values(?,?)", category,table.concat(loot,","))
    end
  end
end

addEventHandler("onDayzDatabaseConnected", root, function()
  local q = exports.dayzngdb:dbGet("loots", "select count(*) as count from %s")
  if(q[1].count == 0)then
    insertDefaultLootTable();
    outputDebugString("Default loot table has been added inserted.")
  end
end)

function createDefaultLoots()
  for category, positions in pairs(lootsLocations)do
    for i,position in ipairs(positions)do
      exports.dayzng:createLoot(category, unpack(position))
    end
  end
end

addEventHandler("onDayzStarted", root, function()
  createDefaultLoots()
  for i,v in ipairs(synchronizedConfigs)do
    setElementData(root, "general_config_"..v, getGeneralConfig(v))
  end
end)