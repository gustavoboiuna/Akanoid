-- trabalho-07
Player = {}

-- Create the Player object
-- trabalho-07 - Closure
-- Player.new é uma closure que encapsula em seu ambiente as variáveis self e as funções moveLeft e moveRight
function Player.new()
	local self = {}

	-- Private member variables
	local moveIncrement = 500

	-- Public member variables
	self.width = 70
	self.height = 10
	self.x = love.graphics.getWidth() / 2
	self.y = love.graphics.getHeight() - 5

	-- Private methods
	local function moveLeft(dt)
		-- Move left if not out of bounds.
		if self.x - moveIncrement/40 >= 0 + self.width/2 + 10 then self.x = self.x - moveIncrement * dt end
	end

	local function moveRight(dt)
		-- Move right if not out of bounds.
		if self.x + moveIncrement/40 <= love.graphics.getWidth() - self.width/2 - 10 then self.x = self.x + moveIncrement * dt end
	end

	-- Public methods
	function self.place()
		self.x = love.graphics.getWidth() / 2
		self.y = love.graphics.getHeight() - 5
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
			self.x - self.width/2, self.y - self.height/2,
			self.x + self.width/2, self.y - self.height/2,
			self.x + self.width/2, self.y + self.height/2,
			self.x - self.width/2, self.y + self.height/2)
	end

	return self
end

return Player
