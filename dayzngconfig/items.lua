local items = {}
function createItem(id, properties)
  if(items[id])then
    return false
  end
  items[id] = properties
  return true
end
