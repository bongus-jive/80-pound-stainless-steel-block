function init()
  if config.getParameter("gravity") then
    return object.smash(true)
  end
end

function update()
  script.setUpdateDelta(0)

  if config.getParameter("thud") then
    object.setConfigParameter("thud", nil)

    local range = config.getParameter("thudPitchRange")
    if range then
      animator.setSoundPitch("thud", sb.makeRandomSource():randf(range[1], range[2]))
    end

    animator.playSound("thud")
    animator.burstParticleEmitter(object.direction() == 1 and "thud" or "thudFlip")
  end
end

function die()
  local box = object.boundBox()
  local pos = { (box[1] + box[3]) / 2, (box[2] + box[4]) / 2 }
  local proj = config.getParameter("projectileName")
  world.spawnProjectile(proj, pos, nil, { object.direction(), 0 })
end
