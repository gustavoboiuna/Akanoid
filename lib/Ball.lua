-- trabalho-07
Ball = {}

-- Create the Ball object
function Ball.new()
	local self = {}

	-- Private member variables
	local radius = 10
	local moveIncrement = 320
	local direction = {x = 0, y = -1}

	-- Public member variables
	self.x = love.graphics.getWidth() / 2
	self.y = love.graphics.getHeight() * 2/3

	-- Private methods
	local function changeDirection(otherX, otherWidth)
		-- Change self direction given other's position and size.
		direction.y = direction.y * -1
	
		if self.x > otherX then
			direction.x = 1

		elseif self.x >= (otherX - otherWidth / 2) then
			direction.x = -1
		end
	end

	-- Public methods
	function self.place()
		self.x = love.graphics.getWidth() / 2
		self.y = love.graphics.getHeight() * 2/3
    direction.y = -1
    direction.x = 0
	end

	function self.update(dt)
		-- Update self position and direction.
		self.y = self.y - (direction.y * moveIncrement * dt)
		self.x = self.x + (direction.x * moveIncrement * dt)
	
		if self.x >= (love.graphics.getWidth() - radius) or self.x <= (0 + radius) then
			direction.x = direction.x * -1
		end
	
		if self.y <= (0 + radius) then
			direction.y = -1
		end
	end

	function self.draw()
		-- Render the Ball object.
		love.graphics.setColor(255, 255, 255)
		love.graphics.circle("fill", self.x, self.y, radius, 100)
	end

	function self.checkCollision(object)
		-- Return true if a collision has occurred between self and object.
		if  (self.x + radius) > (object.x - object.width/2) and 
			(self.x - radius) < (object.x + object.width/2) and
			(self.y + radius) > (object.y - object.height/2) and
			(self.y - radius) < (object.y + object.height/2) then
				changeDirection(object.x, object.width)
				return true
		end

		return false
	end

	

	return self
end

return Ball
