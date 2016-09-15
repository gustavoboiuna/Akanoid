local Manager = require('./lib/Manager')

function love.load()
	manager = Manager:new()
	manager:load()
end

function love.update(dt)
	manager:update(dt)
end

function love.draw()
	manager:draw()
end
