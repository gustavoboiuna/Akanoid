local Manager = require('./lib/Manager')
--io.stdout:setvbuf("no")
function love.load()
  love.window.setTitle("Arkanoid")
	manager = Manager:new()
	manager:load()
end

function love.update(dt)
	manager:update(dt)
end

function love.draw()
	manager:draw()
end
