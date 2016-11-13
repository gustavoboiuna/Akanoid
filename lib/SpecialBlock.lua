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
  
  self.iniX = xPos + self.width/2 + 10
  self.iniY = yPos
  self.limitX = limitX - self.width/2 - 10
  self.limitY = limitY
  
	-- Public methods
  -- trabalho-07 - Co-rotina
	function move()
    phase = 0
    
    while true do
      if (phase == 0) then 
        while (self.x < self.limitX) do coroutine.yield('right') end
        phase = 1
      elseif (phase == 1) then
        while (self.y < self.limitY) do coroutine.yield('down') end
        phase = 2
      elseif (phase == 2) then
        while (self.x > self.iniX) do coroutine.yield('left') end
        phase = 3
      else
        while (self.y > self.iniY) do coroutine.yield('up') end
        phase = 0
      end
    end
	end
  
  local moveCo = coroutine.wrap(move)
  function self.update(dt)
    moveDir = moveCo()
    
    if(moveDir == 'left') then
      self.x = self.x - moveIncrement * dt
    end
    
    if(moveDir == 'right') then
      self.x = self.x + moveIncrement * dt
    end
    
    if(moveDir == 'down') then
      self.y = self.y + moveIncrement * dt
    end
    
    if(moveDir == 'up') then
      self.y = self.y - moveIncrement * dt
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