local Player = require('./lib/Player')
local Block = require('./lib/Block')

-- Define the manager's attributes
local Manager = {
	player = Player:new(),
	blocks = {}
}

-- Create the manager object
function Manager:new()
	object = {}
	setmetatable(object, self)
	self.__index = self

	return object
end

-- Initialize the array of blocks
function Manager:load()
	for i = 0, 6 do
		for j = 0, 9 do
			Manager.blocks[10 * i + j] = Block:new(i * 100 + 100, j * 20 + 75, i)
		end
	end
end

-- Update the player
function Manager:update(dt)
	Manager.player:update(dt)

end

-- Draw the player and the blocks
function Manager:draw()
	Manager.player:draw()

	for i = 0, 69 do
		Manager.blocks[i]:draw()
	end

	love.graphics.setColor({255, 255, 255})
end

return Manager
