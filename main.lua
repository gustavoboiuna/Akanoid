local Player = require('./lib/Player')

function love.load()
  player = Player:new()
end

function love.update(dt)
  player:update()

end

function love.draw()
    player:draw()
end
