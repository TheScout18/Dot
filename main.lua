local sti = 
require("STI")
require("player")
--require("lighting")

function love.load()
	xCloud = 0
	
	Pcloud = love.graphics.newImage( "textures/cloud.png" )
	
	Pwhale = love.graphics.newImage("textures/whale.png")
    
    player.LOAD()
	
	windowWidth  = love.graphics.getWidth()
    
    windowHeight = love.graphics.getHeight()
	
	map = sti.new("map/map.lua")
	
	love.physics.setMeter(32)
	
	world = love.physics.newWorld(0, 0)
	
	collision = map:initWorldCollision(world)
	
end

function love.draw()
	local translateX = 0
	local translateY = 0

	map:setDrawRange(-translateX, -translateY, windowWidth, windowHeight)
	map:draw()
	love.graphics.setColor(255, 0, 0, 255)
	map:drawWorldCollision(collision)

	love.graphics.setColor(255, 255, 255, 255)

	love.graphics.setColor( 255, 255, 255, 255 ) --Cloud
    love.graphics.draw( Pcloud, xCloud - 420, -37, 0, 1, 1, 0, 0 )

    player.DRAW()
    
end

function love.update(dt)
	map:update(dt)
	player.UPDATE(dt)

	xCloud = xCloud + 40*dt
	if xCloud >= (800 + 420) then
		xCloud = 0
	end
end