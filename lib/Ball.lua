-- Define the ball's attributes
local Ball = {
	radius = 10,
	moveIncrement = 400,
	direction = {0, 0}
}

-- Create the ball object
function Ball:new()
	object = {}
	setmetatable(object, self)
	self.__index = self

	object.x, object.y = Ball.place()

	return object
end

-- Spawn the ball at the correct position
function Ball:place()
	x = love.graphics.getWidth() / 2
	y = love.graphics.getHeight() * 2/3

	return x, y
end

-- Update the ball
function Ball:update()

end

-- Draw the ball
function Ball:draw()
	love.graphics.setColor(255, 0, 0)
	love.graphics.circle("fill", self.x, self.y, self.radius, 100)
end
