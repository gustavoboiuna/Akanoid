SpecialBlock = {}

-- Create the Block object
function SpecialBlock.new(xPos, yPos, limitX, limitY)
	local self = {}

	-- Private member variables
	local color = {255, 255, 255}
	local moveIncrement = 500
  
	-- Public member variables
	self.x = xPos
	self.y = yPos
	self.width = 95
	self.height = 15
  
	self.iniX = xPos + self.width/2
	self.iniY = yPos
	self.limitX = limitX - self.width/2
	self.limitY = limitY
  
	-- Public methods
	-- trabalho-07 - Co-rotina
	function move()
		while true do
      while (self.x < self.limitX) do coroutine.yield('right') end
      self.width, self.height = self.height, self.width

      while (self.y < self.limitY) do coroutine.yield('down') end
      self.width, self.height = self.height, self.width

      while (self.x > self.iniX) do coroutine.yield('left') end
      self.width, self.height = self.height, self.width

      while (self.y > self.iniY) do coroutine.yield('up') end
      self.width, self.height = self.height, self.width
		end
	end
  
	local moveCo = coroutine.wrap(move)
  
	function self.update(dt)
		moveDir = moveCo()
    
		if (moveDir == 'left') then	self.x = self.x - moveIncrement * dt    
		elseif (moveDir == 'right') then self.x = self.x + moveIncrement * dt    
		elseif (moveDir == 'down') then self.y = self.y + moveIncrement * dt
		elseif (moveDir == 'up') then self.y = self.y - moveIncrement * dt
		end
	end
  
	function self.draw()
		-- Render the Block object.
		love.graphics.setColor(color)
		love.graphics.polygon('fill', 
			self.x - self.width/2, self.y - self.height/2,
			self.x + self.width/2, self.y - self.height/2,
			self.x + self.width/2, self.y + self.height/2,
			self.x - self.width/2, self.y + self.height/2)
	end

	return self
end

return SpecialBlock
