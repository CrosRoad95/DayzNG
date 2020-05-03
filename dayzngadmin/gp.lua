function gp(cmd,t)
  if(not t)then
   t = 1
  end
  local t = tonumber(t)
  if(t)then
    local pos = false;
    if(t == 1)then
      local x,y,z = getElementPosition(localPlayer)
      pos = string.format("%.2f,%.2f,%.2f",x,y,z)
    elseif(t == 2)then
      local x,y,z = getElementPosition(localPlayer)
      local _,_,r = getElementRotation(localPlayer)
      pos = string.format("%.2f,%.2f,%.2f,%.2f",x,y,z,r)
    elseif(t == 3)then
      local x,y,z = getElementPosition(localPlayer)
      local _,_,r = getElementRotation(localPlayer)
      local i,d = getElementInterior(localPlayer),getElementDimension(localPlayer)
      pos = string.format("%.2f,%.2f,%.2f,%.2f,%i,%i",x,y,z,r,i,d)
    elseif(t == 4)then
      local vehicle = getPedOccupiedVehicle(localPlayer)
      if(vehicle)then
        localPlayer = vehicle
      end
      local x,y,z = getElementPosition(localPlayer)
      local rx,ry,rz = getElementRotation(localPlayer)
      local i,d = getElementInterior(localPlayer),getElementDimension(localPlayer)
      pos = string.format("%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%i,%i",x,y,z,rx,ry,rz,i,d)
    elseif(t == 5)then
      local x,y,z = getElementPosition(localPlayer)
      local i,d = getElementInterior(localPlayer),getElementDimension(localPlayer)
      pos = string.format("%.2f,%.2f,%.2f,%i,%i",x,y,z,i,d)
    elseif(t == 6)then
      local x,y,z = getElementPosition(localPlayer)
      pos =string.format("{%.2f,%.2f,%.2f},",x,y,z)
    elseif(t == 7)then
      local x,y = getElementPosition(localPlayer)
      pos = string.format("%.2f,%.2f,",x,y)
    end
    if(pos)then
      outputConsole(pos)
      setClipboard(pos)
    end
  end
end

addCommandHandler("gp", gp)