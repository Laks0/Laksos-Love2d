require "tools/render"
require "tools/sceneHandler"
local UI = require "UI/ui"

defaultFont = love.graphics.getFont()

width = love.graphics.getWidth()
height = love.graphics.getHeight()

function love.load()
  render:create(5)

  scenes:load("game")
end

function love.update(dt)
  render:clear()

  mouse = {
    x = love.mouse.getX(),
    y = love.mouse.getY()
  }

  scenes:update(dt)

  click = false
end

function love.draw()
  for i = 1, #render do
    render:show(i)
  end
end

function mouse_in(x,y,w,h)
  return pos_in(mouse.x,mouse.y,x,y,w,h)
end

function pos_in(x,y,x2,y2,w,h)
  return x > x2 and x < x2 + w and y > y2 and y < y2 + h
end

function love.mousepressed(x,y,b)
  click = (b==1)
end

function lerp(v,m,M)
  if v < m then
    v = m
  end
  if v > M then
    v = M
  end
  return v
end
