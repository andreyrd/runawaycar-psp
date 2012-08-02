-- This is a functions I made that will normalize a vector.
-- Just leave it here. We may need it for the lighting.
function unit(x, y, z)
	local len = math.sqrt((x * x) + (y * y) + (z * z))
	return x / len, y / len, z / len
end



-- I have rellocated your splash screen sprites and changed them up a bit to work better
-- Fly in from left

function splashIn()
	for i = -120, 0, 1 do 
		
		image.blit(splash_game, i * 4, 0) 
		
		-- Don't forget to include this frank.
		screen.flip()
		screen.waitvblankstart()
	end
end

function splashOut()
	for i = 0, 120, 1 do 
		image.blit(splash_game, i * 4, 0) 
		
		screen.flip()
		screen.waitvblankstart()
	end  
end


-- Display the mandatory NeoFlash splash screen

function neoSplash()
	neo = image.load("SPLASH/NEOSPLASH.PNG")
	
	for a = 1, 136 do
		image.blit(neo, 0, (a * 2) - 272)
		screen.flip()
		screen.waitvblankstart()
	end
	
	-- A delay...
	
	local a = 1
	while a < 1000 do
		a = a + 1
	end
	
	for a = 136, 272 do
		image.blit(neo, 0, (a * 2) - 272)
		screen.flip()
		screen.waitvblankstart()
	end
	
	neo:free()
	neo = nil
	collectgarbage()
end
	


function setLighting()
	world.perspective(75.0, 16.0/9.0, 01, 1000.0)
	world.lighttype(1, 1)
	world.lightcomponent(1, 2)
	world.lightdiffuse(1, color.new(255, 255, 255))
	world.lightambient(1, color.new(40,40,80))
	world.lightspecular(1, color.new(255, 255, 255)) 
	world.lightposition(1, 4, 4, 4)
	world.lightdirection(1, -0.862, 0.267, -0.534)
	world.lightenabled(1, true)
	world.lightattenuation(0.1, 0, 0, 0.00000005)
	world.lights(true)
	world.ambient(color.new(80, 80, 100))
	world.specular(1)

	
	world.fog(5, 50, color.new(100, 100, 100))
	
	world.update()
end


-- This function will fill roadArray with a series of numbers that stand for different objects
-- 1 = Forward Road
-- 2 = Turning Road (Won't turn yet though)
-- 3 = Building type 1
-- 4 = Building type 2
-- 5 = Building type 3

math.randomseed(os.time())

function generateRoad(roadArray)
	for a = 1, #roadArray do
		roadArray[a][1] = math.random(1, 3)
		roadArray[a][2] = 1
		roadArray[a][3] = math.random(1, 3)
	end
end


-- Simply draws a street

function drawStreet(x, y, z)
	street_obj:position(x, y, z)
	street_obj:blit()
end


-- This function should just cause the street to keep scrolling.

function scrollStreet()

	-- Draw the different street segments

	for a = 1, 6 do
		drawStreet(PLAYER_POS, STREET_HEIGHT, STREET_POS - STREET_SIZE * a)
	end

	-- Scroll them at the speed of SPEED
	
	STREET_POS = STREET_POS + SPEED
	
	-- Everytime you pass one segment, add a new segment (One will be prerendered out of view)
	
	if STREET_POS > STREET_SIZE then
		for a = 1, 6 do
			currentRoad[a][1] = currentRoad[a + 1][1]
			currentRoad[a][2] = currentRoad[a + 1][2]
			currentRoad[a][3] = currentRoad[a + 1][3]
		end
		currentRoad[7][1] = math.random(1, 3)
		currentRoad[7][2] = 1
		currentRoad[7][3] = math.random(1, 3)
		
		STREET_POS = 0
	end
end