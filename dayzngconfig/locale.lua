locale = {}

function getDefaultLanguage()
  return getGeneralConfig("defaultLanguage")
end

function getLocalization(player)
  return getElementData(player or localPlayer, "localization") or getDefaultLanguage();
end

if(localPlayer)then
  function getText(textId, ...)
    local localization = getLocalization();
    local l = locale[localization]
    if(not l)then
      localization = getDefaultLanguage()
      l = locale[localization]
    end
    local args = {...}
    if(#args > 0)then
      local text = l[textId] or "NOT FOUND client Lng: "..tostring(localization).." id: "..tostring(textId);
      return string.format(text, ...)
    else
      return l[textId] or "NOT FOUND client Lng: "..tostring(localization).." id: "..tostring(textId)
    end
  end
else
  function getText(player, textId, ...)
    local localization = getLocalization(player);
    local l = locale[localization]
    if(not l)then
      localization = getDefaultLanguage()
      l = locale[localization]
    end
    local args = {...}
    if(#args > 0)then
      local text = l[textId] or "NOT FOUND server Lng: "..tostring(localization).." id: "..tostring(textId);
      return string.format(text, ...)
    else
      return l[textId] or "NOT FOUND server Lng: "..tostring(localization).." id: "..tostring(textId)
    end
  end
end

function setTranslation(language, orignal, translation)
  if(not locale[language])then
    locale[language] = {}
  end
  locale[language][orignal] = translation
end
