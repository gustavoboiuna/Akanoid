-- trabalho-07
Ball = {}

-- Create the Ball object
function Ball.new()
	local self = {}

	-- Private member variables
	local x = love.graphics.getWidth() / 2
	local y = love.graphics.getHeight() * 2/3
	local radius = 10
	local moveIncrement = 320
	local direction = {x = 0, y = -1}

	-- Public methods
	function self.place()
		x = love.graphics.getWidth() / 2
		y = love.graphics.getHeight() * 2/3
	end

	function self.update(dt)
		-- Update self position and direction.
		y = y - (direction.y * moveIncrement * dt)
		x = x + (direction.x * moveIncrement * dt)
	
		if x >= (love.graphics.getWidth() - radius) or x <= (0 + radius) then
			direction.x = direction.x * -1
		end
	
		if y <= (0 + radius) then
			direction.y = -1
		end
	end

	function self.draw()
		-- Render the Ball object.
		love.graphics.setColor(255, 255, 255)
		love.graphics.circle("fill", x, y, radius, 100)
	end

	function self.checkCollision(object)
		-- Return true if a collision has occurred between self and object.
		if  (x + radius) > (object.x - object.width/2) and 
			(x - radius) < (object.x + object.width/2) and
			(y + radius) > (object.y - object.height/2) and
			(y - radius) < (object.y + object.height/2) then
				changeDirection(object.x, object.width)
				return true
		end

		return false
	end

	-- Private methods
	local function changeDirection(otherX, otherWidth)
		-- Change self direction given other's position and size.
		direction.y = direction.y * -1
	
		if x > otherX then
			direction.x = 1

		elseif x >= (otherX - otherWidth / 2) then
			direction.x = -1
		end
	end

	return self
end
