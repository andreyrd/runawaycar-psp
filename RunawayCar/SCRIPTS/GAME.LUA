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