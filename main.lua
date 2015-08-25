local sti = 
require("STI")
require("camera")

function love.load()
	
	windowWidth  = love.graphics.getWidth()
    windowHeight = love.graphics.getHeight()

	love.physics.setMeter(20)

	map = sti.new("map/map.lua")

	world = love.physics.newWorld(0, 0)

	collision = map:initWorldCollision(world)

	map:addCustomLayer("Sprite Layer", 3)

    local spriteLayer = map.layers["Sprite Layer"]
    spriteLater.sprites = {
    	player = {
    		image = love.graphics.newImage("textures/whale.png"),
    		x = 200,
    		y = 200,
    		r = 0,
    	}	
    }

    function spriteLayer:update(dt)
    	for _, sprite in pairs(self.sprites) do 
    		local x = math.floor(sprite.x)
    		local y = math.floor(sprite.y)
    		local r = sprite.r
    		love.graphics.draw(sprite.image, x, y, r)
    	end
    end
end


function love.draw()
	local translateX = 0
	local translateY = 0

	map:setDrawRange(-translateX, -translateY, windowWidth, windowHeight)
	map:draw()
	love.graphics.setColor(255, 0, 0, 255)
	map:drawWorldCollision(collision)

	love.graphics.setColor(255, 255, 255, 255)

	--camera:set()
	--love.graphics.setColor( 0, 150, 90 )
	--love.graphics.rectangle("fill", player.x - player.w/2, player.y - player.h/2, player.w, player.h)
	--camera:unset()
end

function love.update(dt)
	map:update(dt)
 
	--if love.keyboard.isDown("d") then
	--	player:right()
	--end
	--if love.keyboard.isDown("a") then
	--	player:left()
	--end
	--if love.keyboard.isDown(" ") and not(hasJumped) then
	--	player:jump()
	--end
	--if love.keyboard.isDown("e") then
	--	player:runr()
	--end
	--if love.keyboard.isDown("q") then
	--	player:runl()
	--end
	
	--player:update(dt)
	
	--camera:setPosition( player.x - (love.graphics.getWidth()/2), player.y - (love.graphics.getHeight()/2))
end

--function love.keyreleased(key)
--	if (key == "a") or (key == "d") or (key == "q") or (key == "e") then
--		player.x_vel = 0
--	end
--end