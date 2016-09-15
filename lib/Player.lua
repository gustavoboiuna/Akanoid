-- Define the player's attributes
local Player = {
	width = 70,
	height = 10,
	moveIncrement = 10
}

-- Create the player object
function Player:new()
	object = {}
	setmetatable(object, self)
	self.__index = self

	object.x, object.y = Player.place()

	return object
end

-- Spawn the player at the correct position
function Player:place()
	x = (love.graphics.getWidth() - Player.width) / 2
	y = love.graphics.getHeight() - Player.height - 5

	return x, y
end

-- Movement handling
function Player:update()
	if love.keyboard.isDown('right') or love.keyboard.isDown('d') then
		self:moveRight()
	else
		if love.keyboard.isDown('left') or love.keyboard.isDown('a') then
			self:moveLeft()
		end
	end
end

-- Translate the player to the left if the player is not out of bounds
function Player:moveLeft()
	if self.x - Player.moveIncrement >= 0 + Player.width/2 + 10 then
		self.x = self.x - Player.moveIncrement
	end
end

-- Translate the player to the right if the player is not out of bounds
function Player:moveRight()
	if self.x + Player.moveIncrement <= love.graphics.getWidth() - Player.width/2 - 10 then
		self.x = self.x + Player.moveIncrement
	end
end

-- Draw the player
function Player:draw()
	love.graphics.setColor(255, 0, 0)

	love.graphics.quad('fill', 
		self.x - Player.width/2, self.y - Player.height/2,
		self.x + Player.width/2, self.y - Player.height/2,
		self.x + Player.width/2, self.y + Player.height/2,
		self.x - Player.width/2, self.y + Player.height/2)
end

return Player