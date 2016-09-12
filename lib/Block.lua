-- Define the block's attributes
local Block = {
	width = 10,
	height = 10,
	color = {255, 255, 255}
}

-- Create the block object
function Block:new(x, y, color)
	object = {}
	setmetatable(object, self)
	self.__index = self

	object.x, object.y = x, y
	Block.color = color

	return object
end

-- Draw the block
function Block:draw()
	love.graphics.setColor(Block.color)
	love.graphics.quad('fill', 
		self.x - Block.width/2, self.y - Block.height/2,
		self.x + Block.width/2, self.y - Block.height/2,
		self.x + Block.width/2, self.y + Block.height/2,
		self.x - Block.width/2, self.y + Block.height/2)
end

return Block
