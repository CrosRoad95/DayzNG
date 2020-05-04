addEventHandler("onDayzStarted", root, function()
local dayzNg = exports.dayzNG

dayzNg:createItem(1,
{
  ["name"] = {
    ["en"] = "Bandage",
    ["pl"] = "Bandaż",
  },
  ["category"] = { 
    "Medical",
    {"Medical items", "General"},
  },
  ["space"] = {
    1,
    {1,1}
  },
  ["stackable"] = 1,
  ["rarity"] = 4,
})

dayzNg:createItem(2,
{
  ["name"] = {
    ["en"] = "Painkiller",
    ["pl"] = "Lek przeciwbólowy",
  },
  ["category"] = { 
    "Medical",
    {"Medical items", "General"},
  },
  ["space"] = {
    1,
    {1,1}
  },
  ["stackable"] = 1,
  ["rarity"] = 4,
})

end, false, "high")