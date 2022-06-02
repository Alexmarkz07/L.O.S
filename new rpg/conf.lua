function love.conf( t )
  t.identity = nil
  t.console = false
  t.accelerormeterjoystick=true
  t.externalstorage=false
  t.gamacorrect=false
  
  t.window.title="Labyrinth of Souls"
  t.window.icon= false
  t.window.width = 800
  t.window.height = 608
  t.window.bordless =false
  t.window.resizable =false
  t.window.miniwidth = 1
  t.window.miniheight =1
  t.window.fullscreen = false
  t.window.fullscreentype = "desktop"
  t.window.vsync = true
  t.window.msaa = 0
  t.window.dysplay = 1
  t.window.highdpi=false
  t.window.x=nil
  t.window.y=nil
  
  t.modules.audio=true
  t.modules.event=true
  t.modules.graphics=true
  t.modules.image=true
  t.modules.keyboard=true
  t.modules.joystick=true
  t.modules.math=true
  t.modules.mouse=true
  t.modules.physics=true
  t.modules.sound=true
  t.modules.system=true
  t.modules.timer=true
  t.modules.touch=true
  t.modules.video=true
  t.modules.window=true
  t.modules.thread=true
end
