function game()
	if controls.left() then
		if PLAYER_POS > -5.5 then
			PLAYER_POS = PLAYER_POS - 0.25
			Y_ROT = math.rad(5)
		else
			DAMAGE = DAMAGE + 2
			sound.play(SCREECH, 3)
		end
	end

	if controls.right()then
		if PLAYER_POS < 5.5 then
			PLAYER_POS = PLAYER_POS + 0.25
			Y_ROT = math.rad(355)
		else
			DAMAGE = DAMAGE + 2
			sound.play(SCREECH, 3)
		end
	end

	if not controls.right() and not controls.left() then
		Y_ROT = 0
	end
	
	if controls.press("start") then
		gamemode = 3
	end

	-- Sidewalk damage code
	if (PLAYER_POS > 3.5 or PLAYER_POS < -3.5) then
		if SIDEWALK_HIT == 0 then
			DAMAGE = DAMAGE + 1
			PLAYER_HEIGHT = PLAYER_HEIGHT + 0.3
		end
		SIDEWALK_HIT = 1 -- Once they get the damage, they won't get it anymore, to prevent infinite damage from sidewalk
	else
		if SIDEWALK_HIT == 1 then
			PLAYER_HEIGHT = PLAYER_HEIGHT - 0.3
		end
		SIDEWALK_HIT = 0
	end

	
	--Check for collisions with objects
	for a = 1, #OBJECT do
		sound.volume(SMALL_CRASH, 50)
		if OBJECT[a][1] == 1 then
			if OBJECT[a][2] > PLAYER_POS - 2.25 and OBJECT[a][2] < PLAYER_POS + 2.25 and OBJECT[a][3] > -STREET_SIZE - 2 and OBJECT[a][3] < -10 then
				DAMAGE = DAMAGE + 50
				OBJECT[a][2] = -200
				sound.play(SMALL_CRASH, 2)
			end
		elseif OBJECT[a][1] == 2 then
			if OBJECT[a][2] > PLAYER_POS - 1.25 and OBJECT[a][2] < PLAYER_POS + 1.25 and OBJECT[a][3] > -STREET_SIZE - 2 and OBJECT[a][3] < -10 then
				DAMAGE = DAMAGE + 25
				OBJECT[a][2] = -200
				sound.play(SMALL_CRASH, 2)
			end
		elseif OBJECT[a][1] == 3 then
			if OBJECT[a][2] > PLAYER_POS - 2.25 and OBJECT[a][2] < PLAYER_POS + 2.25 and OBJECT[a][3] > -STREET_SIZE - 2 and OBJECT[a][3] < -10 then
				DAMAGE = DAMAGE + 50
				OBJECT[a][2] = -200
				sound.play(SMALL_CRASH, 2)
			end
		end
	end
	
	for a = 1, #COIN do
		if COIN[a][1] > PLAYER_POS - 1.25 and COIN[a][1] < PLAYER_POS + 1.25 and COIN[a][2] > -STREET_SIZE - 2 and COIN[a][2] < -10 then
			points = points + points_multiplier
			COIN[a][1] = -200
			sound.play(DING, 2)
		end
	end
	
	if timer > 0 then
		screen.print(GRAF, string.len("Speed up!")/2 * 12, 240, "Speed Up!", color.new(0, 0, 0))
		timer = timer - 1
	end
	
	screen.print(GRAF, 350, 250, "MPH: " .. SPEED * 100, color.new(255, 255, 255))

	--Add score
	SCORE = SCORE + 1

	drawDamage(2, 2, 200, 5)
	drawScore(300, 10)
	screen.print(GRAF, 300, 30, "Points: " .. points, color.new(234, 143, 35))

	scrollObject()
	scrollCoins()
	
	if SCORE < 1000 then
		points_multiplier = 1
	end
	
	if SCORE == 1000 then
		SPEED = 0.5
		timer = 50
	end
	if SCORE == 2000 then
		SPEED = 0.7
		timer = 50
	end
	if SCORE == 3000 then
		SPEED = 0.9
		timer = 50
		points_multiplier = 2
	end
	if SCORE == 4000 then
		SPEED = 1.1
		timer = 50
	end
	if SCORE == 5000 then
		SPEED = 1.3
		timer = 50
	end
	if SCORE == 6000 then
		SPEED = 1.5
		timer = 50
	end
	if SCORE > 7000 then
		SPEED = 1.7
		screen.print(GRAF, 185, 240, "Final Speed! Triple Points!")
		SCORE = SCORE + 1
		points_multiplier = 3
	end
	
	
	--Are you dead?
	if DAMAGE >= 100 then
		gamemode = 100
		sound.play(CRASH_SND, 2)
	end
end

--We will put obstacles here, since they are only part of the game, not the whole world.

--Draws a Dumpster
function drawDumpster(x, z)
	if x < -3.5 then
		dumpster_obj:rotation(0, math.rad(270), 0)
		dumpster_obj:position(x, STREET_HEIGHT + 0.5, z)
	elseif x > 3.5 then
		dumpster_obj:rotation(0, math.rad(90), 0)
		dumpster_obj:position(x, STREET_HEIGHT + 0.5, z)
	else
		dumpster_obj:rotation(0, math.rad(180), 0)
		dumpster_obj:position(x, STREET_HEIGHT, z)
	end
	dumpster_obj:blit()
end

--Draws a TrashCan
function drawTrash(x, z)
	if x < -3.5 or x > 3.5 then
		trashcan_obj:position(x, STREET_HEIGHT + 0.5, z)
	else
		trashcan_obj:position(x, STREET_HEIGHT, z)
	end
	trashcan_obj:blit()
end

--Draws the roadblock
function drawRoadblock(x, z)
	if x < -3.5 or x > 3.5 then
		roadblock_obj:position(x, STREET_HEIGHT + 0.5, z)
	else
		roadblock_obj:position(x, STREET_HEIGHT, z)
	end
	roadblock_obj:rotation(math.rad(270), 0, 0)
	roadblock_obj:blit()
end

--Draws a coin
function drawCoin(x, z)
	if x < -3.5 or x > 3.5 then
		coin_obj:position(x, STREET_HEIGHT + 0.5, z)
	else
		coin_obj:position(x, STREET_HEIGHT, z)
	end
	COIN_SPIN = COIN_SPIN + 0.5
	if COIN_SPIN > 360 then
		COIN_SPIN = 1
	end
	
	coin_obj:rotation(0, math.rad(COIN_SPIN), 0)
	coin_obj:blit()
end

--Scroll Coins
function scrollCoins()
	for a = 1, 8 do
		if COIN[a][2] > 0 then
			if a == 1 then
				COIN[a][1] = OBJECT[1][2]
				COIN[a][2] = OBJECT[1][3] - STREET_SIZE
			else
				COIN[a][1] = COIN[a - 1][1]
				COIN[a][2] = COIN[a - 1][2] - (STREET_SIZE * 2) / 8
			end
		end
		COIN[a][2] = COIN[a][2] + SPEED
		drawCoin(COIN[a][1], COIN[a][2])
	end
end

function drawDamage(x, y, length, height)
	draw.fillrect(x - 2, y - 2, length + 4, height + 4, color.new(0, 0, 255))
	draw.fillrect(x, y, (100 - DAMAGE) / 100 * length, height, color.new(0, 255, 0))
	
end


function drawScore(x, y)
	screen.print(GRAF, x, y, "Score: " .. SCORE, color.new(234, 143, 35))
end

function crashed()
	screen.print(GRAF, 240 - string.len("You have CRASHED!")/2 * 16, 100, "You have CRASHED!", color.new(0, 0, 0))
	screen.print(GRAF, 240 - string.len("Your score was: " .. SCORE)/2 * 16, 140, "Your score was: " .. SCORE, color.new(0, 0, 0))
	if SCORE > highscore then
		screen.print(GRAF, 240 - string.len("You beat the highscore!")/2 * 16, 180, "You beat the highscore!", color.new(0, 0, 0))
		highscore = SCORE
	else
		screen.print(GRAF, 240 - string.len("The Highscore is " .. highscore)/2 * 16, 180, "The Highscore is " .. highscore, color.new(0, 0, 0))
	end
	screen.print(GRAF, 0,10,"Press Cross to exit to menu", color.new(0, 0, 0))
	
	if controls.press("cross") then
		select = 1
		gamemode = 1
	end
end

function pause()
	screen.print(GRAF, 0, 0, "Game Paused.", color.new(0, 0, 0))
	screen.print(GRAF, 0, 40, "To return to the menu, press SQUARE", color.new(0,0,0))
	screen.print(GRAF, 0, 80, "To return to game, press Start or X", color.new(0, 0, 0))


	if controls.press("start") or controls.press("cross") then
		gamemode = 2
	end

	if controls.press("square") then
		select = 2
		gamemode = 1
		PLAYER_POS = -3
	end
end