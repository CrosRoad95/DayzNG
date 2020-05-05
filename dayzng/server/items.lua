local items = {}
local itemsByCategory = {}
local itemsByResource = {}
local itemsCategory = {}

function removeItem(itemId)
  if(not items[itemId])then
    return false;
  end

  local sourceResourceRoot = items[itemId].sourceResourceRoot
  local categoryName = items[itemId]["category"][1]
  for i,v in ipairs(itemsByCategory[categoryName])do
    if(v == itemId)then
      table.remove(itemsByCategory[categoryName], i)
      break;
    end
  end
  if(#itemsByCategory[categoryName] == 0)then
    itemsByCategory[categoryName] = nil
    for i,v in ipairs(itemsCategory)do
      if(v == categoryName)then
        table.remove(itemsCategory, i)
        break;
      end
    end
  end

  for i,v in ipairs(itemsByResource[sourceResourceRoot])do
    if(v == itemId)then
      table.remove(itemsByResource[sourceResourceRoot], i)
      break;
    end
  end
  if(#itemsByResource[sourceResourceRoot] == 0)then
    itemsByResource[sourceResourceRoot] = nil
  end
  items[itemId] = nil
end

local function onResourceStop()
  while(itemsByResource[source])do
    removeItem(itemsByResource[source][1])
  end
end

function createItem(itemId, params)
  if(not itemId or type(itemId) ~= "number")then
    return false
  end

  if(items[itemId])then
    return false
  end
  
  if(not params["name"])then
    return false
  end
  if(not params["category"])then
    return false
  end
  if(not params["space"])then
    return false
  end
  if(not params["stackable"])then
    return false
  end
  if(not params["rarity"])then
    return false
  end
  if(not itemsByResource[sourceResourceRoot])then
    itemsByResource[sourceResourceRoot] = {}
    addEventHandler("onResourceStop", sourceResourceRoot, onResourceStop)
  end

  local categoryName = params["category"][1]
  if(not itemsByCategory[categoryName])then
    itemsByCategory[categoryName] = {}
    itemsCategory[#itemsCategory + 1] = categoryName
  end
  table.insert(itemsByCategory[categoryName], itemId);
  table.insert(itemsByResource[sourceResourceRoot], itemId)
  params.sourceResourceRoot = sourceResourceRoot
  items[itemId] = params;
  return true;
end

function getItemByID(itemId)
  return items[itemId] or false
end

function getItemsFromResource(resource)
  return itemsByResource[resource] or {}
end

function getItemsFromCategory(category)
  return itemsByCategory[category] or {}
end

function getAllItemsCategories()
  return itemsCategory;
end