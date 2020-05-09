local inventoryItems, lootItems

function getInventoryGridList()
  return inventoryItems;
end

function getLootGridList()
  return lootItems;
end

function getInventoryGridList()
  return inventoryItems;
end

function getLootGridList()
  return lootItems;
end

function createInventoryGui()
  local inventoryWindow = DGS:dgsCreateWindow ( sx/2 - 375, sy/2 - 300, 750, 600, config:getText("Inventory"), false, 0xFFFFFFFF, 25, nil, 0xC8141414, nil, 0x96141414, 5, true)
  local inventoryName = DGS:dgsCreateLabel(0.02,0.04,0.46,0.04,"Inventory",true,inventoryWindow)
  local inventorySlots = DGS:dgsCreateLabel(0.02,0.91,0.46,0.04,"Items: 0/12",true,inventoryWindow)
  local lootName = DGS:dgsCreateLabel(0.52,0.04,0.46,0.04,"Loot",true,inventoryWindow)
  local lootSlots = DGS:dgsCreateLabel(0.52,0.91,0.46,0.04,"Items: 0/12",true,inventoryWindow)
  inventoryItems = DGS:dgsCreateGridList(0.02, 0.09, 0.46, 0.84, true, inventoryWindow)
  lootItems = DGS:dgsCreateGridList(0.52, 0.09, 0.46, 0.84, true, inventoryWindow)
  DGS:dgsGridListAddColumn(inventoryItems, "Item name", 0.8 )
  DGS:dgsGridListAddColumn(inventoryItems, "Amount", 0.2 )
  DGS:dgsGridListAddColumn(lootItems, "Item name", 0.8 )
  DGS:dgsGridListAddColumn(lootItems, "Amount", 0.2 )
  DGS:dgsWindowSetSizable(inventoryWindow, false)
  DGS:dgsLabelSetVerticalAlign(lootName, "center")
  DGS:dgsLabelSetHorizontalAlign(lootName, "center")
  DGS:dgsLabelSetVerticalAlign(inventoryName, "center")
  DGS:dgsLabelSetHorizontalAlign(inventoryName, "center")
  DGS:dgsLabelSetVerticalAlign(inventorySlots, "center")
  DGS:dgsLabelSetHorizontalAlign(inventorySlots, "center")
  DGS:dgsLabelSetVerticalAlign(lootSlots, "center")
  DGS:dgsLabelSetHorizontalAlign(lootSlots, "center")

  return inventoryWindow;
end

guis["inventory"] = createInventoryGui
