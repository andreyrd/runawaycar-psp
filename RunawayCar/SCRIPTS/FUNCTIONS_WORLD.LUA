-- This is a functions I made that will normalize a vector.
-- Just leave it here. We may need it for the lighting.
function unit(x, y, z)
	local len = math.sqrt((x * x) + (y * y) + (z * z))
	return x / len, y / len, z / len
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
	world.fog(10, 50, color.new(135, 206, 250))
	world.update()
end

-- This function will fill roadArray with a series of numbers that stand for different objects
-- 1 = Forward Road
-- 2 = Turning Road (Won't turn yet though)
-- 3 = Building type 1
-- 4 = Building type 2
-- 5 = Building type 3

function generateRoad(roadArray)
	for a = 1, #roadArray do
		roadArray[a][1] = 1
		roadArray[a][2] = 1
		roadArray[a][3] = 1
	end
end

currentRoad = {}


for a = 1, 6 do
	currentRoad[a] = {}
end

generateRoad(currentRoad)

-- Simply draws a street

function drawStreet(x, y, z)
	street_obj:position(x, y, z)
	street_obj:rotation(math.rad(180), 0, 0)
	street_obj:blit()
end

-- draws a building
function drawBuilding(x, z, dir)
	if dir == 1 then
		buildingL_obj:rotation(0, math.rad(180), 0)
		buildingL_obj:position(x, -6, z)
		buildingL_obj:blit()
	elseif dir == 2 then
		buildingR_obj:position(x, -6, z)
		buildingR_obj:rotation(0, math.rad(180), 0)
		buildingR_obj:blit()
	end
end

--Draws a cloud
function drawCloud(x, y, z)
	cloud_obj:position(x, y, z)
	cloud_obj:blit()
end

-- This function should just cause the street to keep scrolling.

function scrollStreet()

	-- Draw the different street segments

	for a = 1, #currentRoad - 1 do
		drawStreet(STREET_POS_X, STREET_HEIGHT, STREET_POS - STREET_SIZE * a)
		drawBuilding(-8, STREET_POS - STREET_SIZE * a, 1)
		drawBuilding(8, STREET_POS - STREET_SIZE * a, 2)
	end

	-- Scroll them at the speed of SPEED
	
	STREET_POS = STREET_POS + SPEED
	
	-- Everytime you pass one segment, add a new segment (One will be prerendered out of view)
	
	if STREET_POS > STREET_SIZE then
		for a = 1, #currentRoad - 1 do
			currentRoad[a][1] = currentRoad[a + 1][1]
			currentRoad[a][2] = currentRoad[a + 1][2]
			currentRoad[a][3] = currentRoad[a + 1][3]
		end
		currentRoad[6][1] = 1
		currentRoad[6][2] = 1
		currentRoad[6][3] = 1
		
		STREET_POS = 0
	end
end

--Scrolls Clouds
function scrollClouds()
	for a = 1, #CLOUD do
		if CLOUD[a][1] < 15 then
			CLOUD[a][1] = CLOUD[a][1] + 0.10
		else
			CLOUD[a][1] = -15
		end
		drawCloud(CLOUD[a][1], CLOUD[a][2], CLOUD[a][3])
	end
end

--Scroll Object
function scrollObject()
	for a = 1, #OBJECT do
		if OBJECT[a][1] == 1 then
			drawDumpster(OBJECT[a][2], OBJECT[a][3])
		elseif OBJECT[a][1] == 2 then
			drawTrash(OBJECT[a][2], OBJECT[a][3])
		elseif OBJECT[a][1] == 3 then
			drawRoadblock(OBJECT[a][2], OBJECT[a][3])
		end
		OBJECT[a][3] = OBJECT[a][3] + SPEED
		if OBJECT[a][3] > 0 then
			OBJECT[a][1] = math.random(1, 3)
			OBJECT[a][2] = math.random(-5, 5)
			OBJECT[a][3] = -STREET_SIZE * 6
		end
	end
end

function loopMusic()
	if sound.playing(MSC) == false then
		sound.play(MSC, 1)
	end
end