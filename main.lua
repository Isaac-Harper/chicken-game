function love.load()
 require("classes/chicken")
 love.window.setMode(0,0)
 love.graphics.setDefaultFilter("nearest", "nearest")
 x = 50
 y = 50
 chickens = {}
 math.randomseed(os.time()) 
 love.graphics.setBackgroundColor(.454,.737,.239,1)
 dt = 0
 gate = love.graphics.newImage("graphics/gateSprite.png")
 sky = love.graphics.newImage("graphics/skySprite.png")
end


function addChicken(x,y)
  qw = Chicken:new()
  
  qw:setImage(qw:genImage())
  
  qw:setPos(x, y)
  
  table.insert(chickens, qw)
end


-- Mouse Presses
function love.mousepressed(mx, my, button)
  -- Right Mouse
  if button == 1 then
    -- drop food
  end
  
 if button == 2 then
    x, y = love.mouse.getPosition( )
    addChicken(x, y)
 end
end

-- Keyboard Presses
function love.keypressed(key, scancode, isrepeat)
  -- Kill all chickens
  if key == "r" then
    chickens = {}
  end
  if key == "q" then
    love.event.quit()
  end
end

function love.update(dt)
  -- Updates chickens
  if #chickens ~= 0 then
    for i,v in ipairs(chickens) do
      v:update(dt)
    end
  end
  
  dt = dt + 1
end

function love.draw()
  --1680 x 1000 
  -- Draw chickens
  i=0
  while i < 21 do
    love.graphics.draw(sky, i * 80, 0, 0, 5)
    love.graphics.draw(gate, i * 80, 80, 0, 5)
    i = i + 1
  end
  if #chickens ~= 0 then
    for i,v in ipairs(chickens) do
      love.graphics.draw(v.image, v.posX, v.posY, 0, 5)
    end
  end
end