function getInventoryType()
  return 1--get("inventoryType")
end

function getDifficulty()
  return get("difficulty")
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

function getConfig(key)
  if(difficultyConfig[key])then
    local difficulty = getDifficulty();
    return difficultyConfig[key][difficulty];
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

