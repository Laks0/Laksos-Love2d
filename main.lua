require "tools/render"
require "tools/sceneHandler"
local UI = require "UI/ui"

defaultFont = love.graphics.getFont()

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
