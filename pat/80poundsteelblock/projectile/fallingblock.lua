local function tilePos()
  local pos = mcontroller.position()
  pos[1] = math.floor(pos[1])
  pos[2] = math.floor(pos[2])
  return pos
end

local startPos
function init()
  startPos = tilePos()
end

function destroy()
  local obj = config.getParameter("objectName")
  local pos = tilePos()

  if (pos[1] ~= startPos[1] or pos[2] ~= startPos[2]) and not world.objectAt(pos) then
    local dir = mcontroller.rotation() == 0 and 1 or -1
    local params = config.getParameter("objectParameters")
    
    if world.placeObject(obj, pos, dir, params) then
      return
    end
  end
  
  world.spawnItem(obj, pos)
end
