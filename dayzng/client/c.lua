DGS = exports.dgs
config = exports.dayzngconfig

guis = {}
local createdGuis = {}

function getGui(guiId)
  if(not guis[guiId])then
    return false
  end
  if(not createdGuis[guiId])then
    createdGuis[guiId] = guis[guiId]()
  end
  return createdGuis[guiId]
end

function setGuiEnabled(guiId, enabled)
  local gui = getGui(guiId)
  if(gui)then
    DGS:dgsSetVisible(gui, enabled)
    showCursor(enabled)
  end
end

addEvent("setGuiEnabled", true)
addEventHandler("setGuiEnabled", localPlayer, function(guiId, enabled)
  setGuiEnabled(guiId, enabled)
end)

addEventHandler("onClientResourceStart", resourceRoot, function()
  triggerServerEvent("clientReady", resourceRoot)
end)