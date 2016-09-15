local Manager = require('./lib/Manager')

function love.load()
	manager = Manager:new()
	manager:load()
end

function love.update(dt)
	manager:update()
end

function love.draw()
	manager:draw()
end
