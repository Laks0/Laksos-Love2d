scenes = {
  game = require "scenes/game"
}

local currentScene = ""

function scenes:load(s)
  self[s]:load()

  currentScene = s
end

function scenes:update(dt)
  self[currentScene]:update(dt)
end
