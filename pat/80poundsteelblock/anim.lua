function init()
  script.setUpdateDelta(0)
  localAnimator.clearDrawables()

  local draw = { image = objectAnimator.getParameter("backImage"), centered = false }

  local pos = objectAnimator.position()
  local offset = objectAnimator.getParameter("imagePosition", { 2, 0 })
  pos[1], pos[2] = pos[1] + (offset[1] / 8), pos[2] + (offset[2] / 8)
  draw.position = pos

  if objectAnimator.direction() == -1 then
    draw.image = draw.image.."?flipx"
  end

  localAnimator.addDrawable(draw, objectAnimator.getParameter("backLayer"))
end
