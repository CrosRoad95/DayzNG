local _spawnPlayer = spawnPlayer

function getAccountData(uid, key)
  local q = exports.dayzngdb:dbGet("playerdata", "select data from %s where pid = ? and valuekey = ? limit 1 ", uid, key)
  if(#q > 0)then
    return fromJSON(q[1].data)
  else
    return false
  end
end

function getAccountDataId(uid, key)
  local q = exports.dayzngdb:dbGet("playerdata", "select id from %s where pid = ? and valuekey = ? limit 1 ", uid, key)
  if(#q > 0)then
    return q[1].id
  else
    return false
  end
end

function setAccountData(uid, key, value)
  local id = getAccountDataId(uid, key)
  if(id)then
    exports.dayzngdb:dbSet("playerdata", "update %s set data = ? where id = ? limit 1", toJSON(value,true), id)
  else
    exports.dayzngdb:dbSet("playerdata", "insert into %s (pid, valuekey, data)value(?,?,?)", uid, key, toJSON(value, true))
  end
  return true
end

function getPlayerLastLocation(player)
  local uid = getElementData(player, "uid")
  if(not uid)then
    return false
  end
  local location = getAccountData(player, "location")
  return location
end

function spawnPlayer(player)
  local uid = getElementData(player, "uid")
  if(uid)then
    local lastLocation = getAccountData(uid, "location")
    if(lastLocation)then
      local skin = getAccountData(uid, "skin") or 0
      setCameraTarget(player, player)
      _spawnPlayer(player, lastLocation[1], lastLocation[2], lastLocation[3], lastLocation[4], 0, skin, lastLocation[5], lastLocation[6])
      return true;
    end
  end
  setCameraTarget(player, player)
  local spawn = exports.dayzngconfig:getSpawn()
  _spawnPlayer(player, spawn[1], spawn[2], spawn[3])
end

function showPlayerPopup(player, title, message)
  outputChatBox(message, player) -- for now
end