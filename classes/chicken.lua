Chicken = { 
  name = "Tom Hanks",
  gender = "non-binary",
  
  posX = 50,
  posY = 50,
  
  direction = 1, -- 1 = N ; 2 = E ; 3 = S ; 4 = W 
  
  wobble = 1,
  
  bodyColor = {1, .992, .816},
  beakColor = {1, .929, .372},
  footColor = {.549, .384, .345},
  eyesColor = {.164, .133, .102},
  combColor = {.913, .361, .294},
  
  age = 0,
  
  hunger = 0
}

math.randomseed(os.time())

function Chicken:new(obj)
  obj = obJ or {}
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function Chicken:setPos(x, y)
  self.posX = x
  self.X = x
  self.posY = y
  self.Y = y
end

function Chicken:getPosX()
  return self.posX
end

function Chicken:getPosY()
  return self.posY
end


-- #################################
--            Movement
-- #################################
function Chicken:randomMove(dt)
  self.posX = self.posX + math.random(-50, 50) * dt
  self.posY = self.posY + math.random(-50, 50) * dt
end

function Chicken:directionMove(dt)
  if self.direction == 1 then
    self.posY = self.posY - 80 * dt
  end
  if self.direction == 2 then
    self.posX = self.posX + 80 * dt
  end
  if self.direction == 3 then
    self.posY = self.posY + 80 * dt
  end
  if self.direction == 4 then
    self.posX = self.posX - 80 * dt
  end
end

function Chicken:directionRandom()
  if math.random(200) == 1 then
    self.direction = math.random(4)
  end
end

function Chicken:directionReverse()
  if self.direction == 1 then
    self.direction = 3
  elseif self.direction == 2 then
    self.direction = 4
  elseif self.direction == 3 then
    self.direction = 1
  elseif self.direction == 4 then
    self.direction = 2
  end
end

-- #################################
--            Set Colors
-- #################################
function Chicken:setBodyColor(color)
  self.bodyColor = color
end

function Chicken:setBeakColor(color)
  self.beakColor = color
end

function Chicken:setFootColor(color)
  self.footColor = color
end

function Chicken:setEyesColor(color)
  self.eyesColor = color
end

function Chicken:setCombColor(color)
  self.combColor = color
end



-- #################################
--            Get Colors
-- #################################
function Chicken:getBodyColor()
  return self.bodyColor
end

function Chicken:getBeakColor()
  return self.beakColor
end

function Chicken:getFootColor()
  return self.footColor
end

function Chicken:getEyesColor()
  return self.eyesColor
end

function Chicken:getCombColor()
  return self.combColor
end

-- #################################
--            Images
-- #################################
function Chicken:setImage(image)
  self.image = image
end

function Chicken:genImage()
  chickenData = love.image.newImageData(8,8)
  beak = self:getBeakColor()
  comb = self:getCombColor()
  eye  = self:getEyesColor()
  feet = self:getFootColor()
  body = self:getBodyColor()
  
  -- beak 
  chickenData:setPixel(0, 2, beak[1], beak[2], beak[3], 1)
  -- comb
  chickenData:setPixel(1, 0, comb[1], comb[2], comb[3], 1)
  -- eye
  chickenData:setPixel(1, 2, eye[1], eye[2], eye[3], 1)
  -- feet
  chickenData:setPixel(3, 7, feet[1], feet[2], feet[3], 1)
  -- body
  bodyPlan = {{}, {1,2}, {2}, {1,2}, {1,2,3,4,5,6,7}, {1,2,3,4,5,6}, {2,3,4,5}, {}}
  for i, layer in ipairs(bodyPlan) do
    for j, pixel in ipairs(layer) do
      chickenData:setPixel(pixel, i - 1, body[1], body[2], body[3], 1)
    end
  end
  
  return love.graphics.newImage(chickenData)
end


-- #################################
--            
-- #################################

function Chicken:checkBorders()
  X = self:getPosX()
  Y = self:getPosY()
  
  if X < 0 or Y < 160 or X > 1640 or Y > 960 then
    self:directionReverse()
  end
end

function Chicken:findFood()
  
end

function Chicken:update(dt)
  self:directionMove(dt)
  self:directionRandom()
  self:checkBorders()
end










