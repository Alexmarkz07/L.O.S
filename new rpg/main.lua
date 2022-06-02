

function love.load()
  --imports  
    wf=require'util/windfield'
    world= wf.newWorld(0,0)
    camera=require'util/camera'
    cam= camera()
    anim8 = require 'util/anim8'
    love.graphics.setDefaultFilter("nearest", "nearest")
    sti=require'util/sti'
    gameMap= sti('Mapas/fase1.lua')
  
   
  --personagem
    player = {}
    player.collider =world:newBSGRectangleCollider(0,500,24,34,2)
    player.collider:setFixedRotation(true)
    player.x = 0
    player.y = 530
    player.speed = 80
    
    player.spriteSheet = love.graphics.newImage('Imagens/char.png')
    player.grid = anim8.newGrid( 32, 48, player.spriteSheet:getWidth(), player.spriteSheet:getHeight() )
  
    --animações do player
    player.animations = {}
    player.animations.down = anim8.newAnimation( player.grid('1-4', 1), 0.2 )
    player.animations.left = anim8.newAnimation( player.grid('1-4', 2), 0.2 )
    player.animations.right = anim8.newAnimation( player.grid('1-4', 3), 0.2 )
    player.animations.up = anim8.newAnimation( player.grid('1-4', 4), 0.2 )
  
    player.anim = player.animations.right
    
    
    
    --som
    sounds={}
    sounds.jojo= love.audio.newSource('som/jojo.mp3', "stream")
    sounds.jojo:play()
    sounds.jojo:setLooping(true)
    sounds.jojo:setVolume(0.075)
    
    --objetos estaticos 
    paredes={}
  
    if gameMap.layers['parede'] then
      for i, obj in pairs (gameMap.layers['parede'].objects) do
        local parede = world:newRectangleCollider(obj.x, obj.y, obj.width,obj.height)
        parede:setType('static')
        table.insert(paredes,parede)
      end
      
    end
    
    
  end
  
  function love.update(dt)
    local isMoving = false
  
    local vx=0
    local vy=0
  
    if love.keyboard.isDown("right") then
        vx= player.speed
        player.anim = player.animations.right
        isMoving = true
    end
  
    if love.keyboard.isDown("left") then
        vx = player.speed * -1
        player.anim = player.animations.left
        isMoving = true
    end
  
    if love.keyboard.isDown("down") then
        vy= player.speed
        player.anim = player.animations.down
        isMoving = true
    end
  
    if love.keyboard.isDown("up") then
        vy= player.speed *-1
        player.anim = player.animations.up
        isMoving = true
    end
  
    player.collider:setLinearVelocity(vx, vy)
  
    if isMoving == false then
        player.anim:gotoFrame(2)
    end
    
    world:update(dt)
  
    player.x=player.collider:getX()+5
    player.y=player.collider:getY()-20
  
    player.anim:update(dt)
    

    

   
    cam:lookAt(player.x,player.y)
    
    local w=love.graphics.getWidth()
    local h=love.graphics.getHeight()
  
    if cam.x < w/2 then
      cam.x = w/2
  end
  
  
  if cam.y < h/2 then
      cam.y = h/2
  end
  
  
  local mapW = gameMap.width * gameMap.tilewidth
  local mapH = gameMap.height * gameMap.tileheight
  
  
  if cam.x > (mapW - w/2) then
      cam.x = (mapW - w/2)
  end
  
  if cam.y > (mapH - h/2) then
      cam.y = (mapH - h/2)
  end
  
  
  end
  
  function love.draw()
  
    cam:attach()
    
    
      gameMap:drawLayer(gameMap.layers["chao"])
      
      gameMap:drawLayer(gameMap.layers["extras"])
      
      player.anim:draw(player.spriteSheet, player.x, player.y, nil, 0.75,nil,24)
      
      --world:draw()
    cam:detach()
   
  end