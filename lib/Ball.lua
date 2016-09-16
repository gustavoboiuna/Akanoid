-- Define the ball's attributes
local Ball = {
	radius = 10,
	moveIncrement = 300,
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
  Ball.direction[2] = -1
  
	return x, y
end

-- Update the ball
function Ball:update(dt)
  self.y = self.y - (self.direction[2] * self.moveIncrement * dt)
  self.x = self.x + (self.direction[1] * self.moveIncrement * dt)
  
  if self.x >= (love.graphics.getWidth() - self.radius) or self.x <= 0 then
    self.direction[1] = self.direction[1] * -1
  end
  
  if self.y <= (0 + self.radius) then
    self.direction[2] = -1
  end
  
  if self.y >= love.graphics.getHeight() then
    --MORREU
  end
end

-- Draw the ball
function Ball:draw()
	love.graphics.setColor(255, 255, 255)
	love.graphics.circle("fill", self.x, self.y, self.radius, 100)
end

function Ball:checkCollision(object)
  if (self.x + self.radius) > (object.x - object.width/2) and 
     (self.x - self.radius) < (object.x + object.width/2) and
     (self.y + self.radius) > (object.y - object.height/2) and
     (self.y - self.radius) < (object.y + object.height/2) then
      self:changeDirection(object.x, object.width)
      return true
  end

  return false
end

function Ball:changeDirection(x, width)
  self.direction[2] = self.direction[2] * -1
  division = width/3
  
  if self.x > (x + division/2) then
    self.direction[1] = 1
  elseif self.x >= (x - division/2) then
    self.direction[1] = -1
  end
end

return Ball
