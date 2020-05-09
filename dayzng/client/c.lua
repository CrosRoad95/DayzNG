DGS = exports.dgs
config = exports.dayzngconfig

sx,sy = guiGetScreenSize()
guis = {}

local createdGuis = {}
local visibleGuis = {}

function getGui(guiId)
  if(not guis[guiId])then
    return false
  end
  if(not createdGuis[guiId])then
    createdGuis[guiId] = guis[guiId]()
  end
  return createdGuis[guiId]
end

function isGuiEnabled(guiId)
  local gui = getGui(guiId)
  if(gui)then
    return DGS:dgsGetVisible(gui)
  end
  return false
end

function setGuiEnabled(guiId, enabled)
  local gui = getGui(guiId)
  if(gui)then
    DGS:dgsSetVisible(gui, enabled)
    if(enabled)then
      visibleGuis[gui] = true
      showCursor(enabled)
    else
      visibleGuis[gui] = nil
      if(table.size(visibleGuis) == 0)then
        showCursor(false)
      end
    end
    return true
  end
  return false
end

bindKey("j", "down", function()
  setGuiEnabled("inventory", not isGuiEnabled("inventory"))
end)

addEvent("setGuiEnabled", true)
addEventHandler("setGuiEnabled", localPlayer, function(guiId, enabled)
  setGuiEnabled(guiId, enabled)
end)

addEventHandler("onClientResourceStart", resourceRoot, function()
  triggerServerEvent("clientReady", resourceRoot)
end)

function table.size(tab)
  local length = 0
  for _ in pairs(tab) do length = length + 1 end
  return length
end