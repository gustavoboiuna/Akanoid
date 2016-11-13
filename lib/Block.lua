-- trabalho-07
Block = {}

-- Create the Block object
function Block.new(xPos, yPos, col)
	local self = {}

	-- Private member variables
	local column = col
	local color = {255, 255, 255}

	-- Public member variables
	self.x = xPos
	self.y = yPos
	self.width = 95
	self.height = 15

	-- Private methods
	local function setColor()
		-- Set the color of the block based on its column
			if column == 0 then color = {237,  50,  55} -- red
		elseif column == 1 then color = {245, 134,  52} -- orange
		elseif column == 2 then color = {255, 242,  18} -- yellow
		elseif column == 3 then color = {  0, 168,  89} -- green
		elseif column == 4 then color = {  0, 175, 239} -- blue
		elseif column == 5 then color = { 62,  64, 149} -- purple
		elseif column == 6 then color = {129,  90, 164} -- pink
		elseif column < 0 or column > 6 then color = {255, 0, 255} end -- white
	end

	-- Public methods
	function self.draw()
		-- Render the Block object.
		love.graphics.setColor(color)
		love.graphics.polygon('fill', 
			self.x - self.width/2, self.y - self.height/2,
			self.x + self.width/2, self.y - self.height/2,
			self.x + self.width/2, self.y + self.height/2,
			self.x - self.width/2, self.y + self.height/2)
	end

	setColor()

	return self
end

return Block
