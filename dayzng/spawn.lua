local spawnPlayer = _spawnPlayer

function spawnPlayer(player, spawnId)
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