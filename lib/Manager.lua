local Player = require('./lib/Player')
local Block = require('./lib/Block')
local Ball = require('./lib/Ball')

-- Define the manager's attributes
local Manager = {
	player = Player:new(),
  ball = Ball:new(),
	blocks = {},
  score
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

  Manager.ball:place()
  Manager.score = 0
end

-- Update
function Manager:update(dt)
	Manager.player:update(dt)
  Manager.ball:update(dt)
  
  Manager.ball:checkCollision(Manager.player)
  
  for i, block in ipairs(Manager.blocks) do
  	if Manager.ball:checkCollision(block) then
      table.remove(Manager.blocks, i)
      Manager.score = Manager.score + 50
    end
  end
end

-- Draw the player and the blocks
function Manager:draw()
	Manager.player:draw()

	for i = 0, table.getn(Manager.blocks) do
		Manager.blocks[i]:draw()
	end
  
	Manager.ball:draw()
	love.graphics.setColor({255, 255, 255})
  love.graphics.print("Score: "..Manager.score, 10, 10)
end

return Manager
