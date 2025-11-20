local function tilePos()
  local pos = mcontroller.position()
  pos[1] = math.floor(pos[1])
  pos[2] = math.floor(pos[2])
  return pos
end

function init()
  startPos = tilePos()
end

function update()
  local power = math.abs(mcontroller.yVelocity())
  projectile.setPower(power)
end

function destroy()
  local obj = config.getParameter("objectName")

  local pos = tilePos()
  if (pos[1] == startPos[1] and pos[2] == startPos[2]) or world.objectAt(pos) then
    world.spawnItem(obj, pos)
    return
  end

  local dir = mcontroller.rotation() == 0 and 1 or -1
  world.placeObject(obj, pos, dir, { projectileVelocity = mcontroller.yVelocity() })
end
