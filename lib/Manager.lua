local Player = require('lib.Player')
local Block = require('lib.Block')
local Ball = require('lib.Ball')
local SpecialBlock = require('lib.SpecialBlock')
Manager = {}

-- Create the Manager object
function Manager.new()
	local self = {}

	-- Private member variables
	local player = Player.new()
	local ball = Ball.new()
	local specialBlock = SpecialBlock.new(0, 20, love.graphics.getWidth(), love.graphics.getHeight()/2)
	local blocks = {}
	local score = 0

	-- Public methods
	function self.load()
		-- Initialize the scene.
		for i = 0, 6 do
			for j = 0, 9 do
				blocks[(10 * i + j) + 1] = Block.new(i * 100 + 100, j * 20 + 75, i)
			end
		end

		player.place()
		ball.place()
		score = 0
	end

	function self.update(dt)
		-- Update the scene.
		player.update(dt)
		ball.update(dt)
		specialBlock.update(dt)
    
		ball.checkCollision(player)
		ball.checkCollision(specialBlock)
    
		for i, block in ipairs(blocks) do
			if ball.checkCollision(block) then
				block.remove = true
				score = score + 50
			end
		end
   
		for i, block in ipairs(blocks) do
			if(block.remove == true) then
				table.remove(blocks, i)
			end
		end

		if ball.y >= love.graphics.getHeight() then self.load() end
	end

	function self.draw()
		-- Draw the scene.
		player.draw()
		ball.draw()
		specialBlock.draw()
    
		for i = 1, table.getn(blocks) do blocks[i].draw() end

		love.graphics.setColor({255, 255, 255})
		love.graphics.print("Score: " .. score, 10, 10)
	end

	return self
end

return Manager
