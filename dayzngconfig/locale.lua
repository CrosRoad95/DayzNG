locale = {}

if(localPlayer)then
  function getDefaultLanguage()
    return getElementData(root,"defaultLanguage")
  end
else
  function getDefaultLanguage()
    return get("defaultLanguage")
  end
end

if(not localPlayer)then
  setElementData(root, "defaultLanguage", getDefaultLanguage())
end

function getLocalization(player)
  return getElementData(player or localPlayer, "localization") or getDefaultLanguage();
end

if(localPlayer)then
  function getText(textId)
    local localization = getLocalization();
    local l = locale[localization]
    if(not l)then
      localization = getDefaultLanguage()
      l = locale[localization]
    end
    return l[textId] or "NOT FOUND client Lng: "..tostring(localization).." id: "..tostring(textId)
  end
else
  function getText(player, textId)
    local localization = getLocalization(player);
    local l = locale[localization]
    if(not l)then
      localization = getDefaultLanguage()
      l = locale[localization]
    end
    return l[textId] or "NOT FOUND server Lng: "..tostring(localization).." id: "..tostring(textId)
  end
end