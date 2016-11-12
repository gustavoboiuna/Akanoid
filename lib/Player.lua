-- trabalho-07
Player = {}

-- Create the Player object
function Player.new()
	local self = {}

	-- Private member variables
	local x = love.graphics.getWidth() / 2
	local y = love.graphics.getHeight() - 5
	local width = 70
	local height = 10
	local moveIncrement = 500

	-- Public methods
	function self.place()
		x = love.graphics.getWidth() / 2
		y = love.graphics.getHeight() - 5
	end

	function self.update(dt)
		-- Movement handling
		if love.keyboard.isDown('right') or love.keyboard.isDown('d') then
			moveRight(dt)
		elseif love.keyboard.isDown('left') or love.keyboard.isDown('a') then
			moveLeft(dt)
		end
	end

	function self.draw()
		-- Render the Player object.
		love.graphics.setColor(255, 0, 0)

		love.graphics.polygon('fill',
			x - width/2, y - height/2,
			x + width/2, y - height/2,
			x + width/2, y + height/2,
			x - width/2, y + height/2)
	end

	-- Private methods
	local function moveLeft(dt)
		-- Move left if not out of bounds.
		if x - moveIncrement/40 >= 0 + width/2 + 10 then x = x - moveIncrement * dt end
	end

	local function moveRight(dt)
		-- Move right if not out of bounds.
		if x + moveIncrement/40 <= love.graphics.getWidth() - width/2 - 10 then x = x + moveIncrement * dt end
	end

	return self
end

