local Player = {
	width = 70,
	height = 10,
	moveIncrement = 10
}

function Player:new()
	object = {}
	setmetatable(object, self)
	self.__index = self

	object.x, object.y = Player.place()

	return object
end

function Player:place()
	x = (love.graphics.getWidth() - Player.width) / 2
	y = love.graphics.getHeight() - Player.height - 5

	return x, y
end

function Player:update()
	if love.keyboard.isDown('right') then
		self:moveRight()
	else
		if love.keyboard.isDown('left') then
			self:moveLeft()
		end
	end
end

function Player:moveLeft()
	if self.x - Player.moveIncrement >= 0 + Player.width/2 + 10 then
		self.x = self.x - Player.moveIncrement
	end
end

function Player:moveRight()
	if self.x + Player.moveIncrement <= love.graphics.getWidth() - Player.width/2 - 10 then
		self.x = self.x + Player.moveIncrement
	end
end

function Player:draw()
	love.graphics.polygon('fill', {
		self.x - Player.width/2, self.y - Player.height/2,
		self.x + Player.width/2, self.y - Player.height/2,
		self.x + Player.width/2, self.y + Player.height/2,
		self.x - Player.width/2, self.y + Player.height/2 })
end

return Player
