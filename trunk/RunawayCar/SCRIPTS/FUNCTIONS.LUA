-- This is a functions I made that will normalize a vector.
-- Just leave it here. We may need it for the lighting.
function unit(x, y, z)
	local len = math.sqrt((x * x) + (y * y) + (z * z))
	return x / len, y / len, z / len
end

-- Game splash

function gameSplashIn()
	game_splash = image.load("SPLASH/GAME.PNG")
	
	for a = 0, 255, 5 do
		image.blend(game_splash, 0, 0, a)
		screen.flip()
		screen.waitvblankstart()
	end
end

function gameSplashOut()
	for a = 255, 0, -5 do
		image.blend(game_splash, 0, 0, a)
		screen.flip()
		screen.waitvblankstart()
	end
	game_splash:free()
	game_splash = nil
	collectgarbage()
end

-- Display the mandatory NeoFlash splash screen

function neoSplashIn()
	neo = image.load("SPLASH/NEOSPLASH.PNG")
	
	for a = 0, 255, 5 do
		image.blend(neo, 0, 0, a)
		screen.flip()
		screen.waitvblankstart()
	end
end

function neoSplashOut()
	for a = 255, 0, -5 do
		image.blend(neo, 0, 0, a)
		screen.flip()
		screen.waitvblankstart()
	end
	neo:free()
	neo = nil
	collectgarbage()
end
	


function drawLight(n, x, y, z)
	world.lighttype(n, 2)
	world.lightcomponent(n, 1)
	world.lightambient(n, color.new(255, 255, 255))
	world.lightposition(n, x, y, z)
	world.lightenabled(n, true)
	world.lightattenuation(n, 0, 0, 0.0000005)
	world.lights(true)
	world.ambient(color.new(0, 0, 0))
	world.specular(4.04)
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
		drawStreet(STREET_POS_X, STREET_HEIGHT, STREET_POS - STREET_SIZE * a)
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