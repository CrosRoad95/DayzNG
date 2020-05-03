function getInventoryType()
  return get("inventoryType")
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