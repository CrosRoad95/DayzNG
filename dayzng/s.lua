local config;
addEventHandler("onResourceStart", resourceRoot, function()
  config = exports.dayzngconfig
end)

addEvent("onDayzDatabaseConnected", true)

playerByUID = {}
UIDByPlayer = {}
local readyPlayers = {}

function onPlayerQuit()
  uid = getElementData(source, "uid")
  if(uid)then
    playerByUID[uid] = nil
    UIDByPlayer[source] = nil
  end
end

function initPlayer(player)
  uid = getElementData(player, "uid")
  playerByUID[uid] = player
  UIDByPlayer[player] = uid
end

function onPlayerJoin(player)
  addEventHandler("onPlayerQuit", player, onPlayerQuit)
  if(not getElementData(player, "uid"))then
    local camera = exports.dayzngconfig:getGeneralConfig("joinCamera")
    fadeCamera(player, true)
    setCameraMatrix(player, unpack(camera))
  end
end

addEventHandler("onResourceStart", resourceRoot, function()
  local uid
  for i,v in ipairs(getElementsByType("player"))do
    uid = getElementData(v, "uid")
    if(uid)then
      initPlayer(v)
    end
  end
end)

function onClientReady()
  readyPlayers[client] = true
  local uid = getElementData(client, "uid")
  if(uid)then

  else
    onPlayerJoin(client)
    setGuiEnabled(client, "login", true)
  end
end

addEvent("clientReady", true)
addEventHandler("clientReady", resourceRoot, onClientReady)

function setGuiEnabled(player, guiId, enabled)
  if(readyPlayers[player])then
    triggerClientEvent(player, "setGuiEnabled", player, guiId, enabled)
    return true
  end
  return false
end

addEvent("requestLogin", true)
addEventHandler("requestLogin", resourceRoot, function(login, password)
  if(string.len(login) <= 3 or string.len(login) > 22)then
    showPlayerPopup(client, "error", config:getText(client, "Login must be between %i and %i characters.",3,22))
    return;
  end
  if(string.len(password) <= 3 or string.len(password) > 30)then
    showPlayerPopup(client, "error", config:getText(client, "Password must be between %i and %i characters.",3,30))
    return;
  end
  local uid = getAccountByLogin(login, true)
  if(not uid)then
    showPlayerPopup(client, "error", config:getText(client, "Account doesn't exists."))
    return;
  end
  if(not verifyAccountPassword(uid, password))then
    showPlayerPopup(client, "error", config:getText(client, "Wrong password."))
    return;
  end
  
  setGuiEnabled(client, "login", false)

  if(isPlayerLoggedIn(client))then
    showPlayerPopup(client, "error", config:getText(client, "You're already logged in."))
    return;
  end
  loginPlayer(client, uid)
end)

addEvent("requestRegister", true)
addEventHandler("requestRegister", resourceRoot, function(login, password, repeatPassword)
  if(repeatPassword ~= password)then
    showPlayerPopup(client, "error", config:getText(client, "Passwords are not the same."))
    return;
  end
  
  if(string.len(login) <= 3 or string.len(login) > 22)then
    showPlayerPopup(client, "error", config:getText(client, "Login must be between %i and %i characters.",3,22))
    return;
  end
  if(string.len(password) <= 3 or string.len(password) > 30)then
    showPlayerPopup(client, "error", config:getText(client, "Password must be between %i and %i characters.",3,30))
    return;
  end
  local uid = getAccountByLogin(login)
  if(uid)then
    showPlayerPopup(client, "error", config:getText(client, "Account with this login already exists."))
    return;
  end
  
  registerAccount(login, password)
  showPlayerPopup(client, "info", config:getText(client, "Account created."))
end)