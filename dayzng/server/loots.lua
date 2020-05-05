local loots = {}
local lootsByResource = {}
local lootsByCategory = {}

function regenerateLoot(loot)

end

function onLootGetsDestroyed()
  local objects = getElementData(source, "itemsObjects") or {}
  for i,v in ipairs(objects)do
    destroyElement(v)
  end
  local sourceResourceRoot = getElementData(source, "sourceResourceRoot")
  local category = getElementData(source, "category")
  for i,v in ipairs(lootsByResource[sourceResourceRoot]) do
    if(v == source)then
      table.remove(lootsByResource[sourceResourceRoot], i)
      break
    end
  end
  for i,v in ipairs(lootsByCategory[category]) do
    if(v == source)then
      table.remove(lootsByCategory[category], i)
      break
    end
  end
  for i,v in ipairs(loots)do
    if(v == source)then
      table.remove(loots, i)
      break
    end
  end
  if(#lootsByResource[sourceResourceRoot] == 0)then
    lootsByResource[sourceResourceRoot] = nil
  end
  if(#lootsByCategory[category] == 0)then
    lootsByCategory[category] = nil
  end
end

local function onResourceStop()
  while(lootsByResource[source])do
    destroyElement(lootsByResource[source][1])
  end
  removeEventHandler("onResourceStop", source, onResourceStop)
end

function createLoot(category, x,y,z,i,d)
  if(not isValidItemCategory(category))then
    return false
  end
  if(not i and not d)then
    i = 0
    d = 0
  end
  local itemsObjectsNum = exports.dayzngconfig:getGeneralConfig("visibleItemsObjectsInLoot")
  local itemsObjects = {}
  local loot = createColSphere(x,y,z,exports.dayzngconfig:getGeneralConfig("lootSphereSize"))
  for i=1,itemsObjectsNum do
    local dummyObject = createObject(1337,x,y,z)
    setElementCollisionsEnabled(dummyObject, false)
    setElementAlpha(dummyObject, 0)
    itemsObjects[#itemsObjects + 1] = dummyObject
    attachElements(dummyObject, loot, 0,0,0)
    setElementInterior(dummyObject, i)
    setElementDimension(dummyObject, d)
    
  end
  setElementData(loot, "itemsObjects", itemsObjects, false)
  setElementData(loot, "category", category, false)
  setElementData(loot, "sourceResourceRoot", sourceResourceRoot, false)
  addEventHandler("onElementDestroy", loot, onLootGetsDestroyed) 

  if(not lootsByCategory[category])then
    lootsByCategory[category] = {}
  end
  table.insert(lootsByCategory[category], loot)
  
  if(not lootsByResource[sourceResourceRoot])then
    lootsByResource[sourceResourceRoot] = {}
    addEventHandler("onResourceStop", sourceResourceRoot, onResourceStop)
  end
  table.insert(lootsByResource[sourceResourceRoot], loot)

  regenerateLoot(loot)

  return loot
end

function getLootCategory(loot)
  return getElementData(loot, "category")
end

