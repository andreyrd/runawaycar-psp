function game()
	if controls.left() then
		if PLAYER_POS > -5.5 then
			PLAYER_POS = PLAYER_POS - 0.25
			Y_ROT = math.rad(5)
		else
			DAMAGE = DAMAGE + 2
		end
	end

	if controls.right()then
		if PLAYER_POS < 5.5 then
			PLAYER_POS = PLAYER_POS + 0.25
			Y_ROT = math.rad(355)
		else
			DAMAGE = DAMAGE + 2
		end
	end

	if not controls.right() and not controls.left() then
		Y_ROT = 0
	end
	
	if controls.press("start") then
		gamemode = 3
		PLAYER_POS = 0
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
		if OBJECT[a][1] == 1 then
			if OBJECT[a][2] > PLAYER_POS - 2.75 and OBJECT[a][2] < PLAYER_POS + 2.75 and OBJECT[a][3] > -STREET_SIZE - 2 and OBJECT[a][3] < -10 then
				DAMAGE = DAMAGE + 25
				OBJECT[a][2] = -200
			end
		elseif OBJECT[a][1] == 2 then
			if OBJECT[a][2] > PLAYER_POS - 1.25 and OBJECT[a][2] < PLAYER_POS + 1.25 and OBJECT[a][3] > -STREET_SIZE - 2 and OBJECT[a][3] < -10 then
				DAMAGE = DAMAGE + 50
				OBJECT[a][2] = -200
			end
		elseif OBJECT[a][1] == 3 then
			if OBJECT[a][2] > PLAYER_POS - 2.75 and OBJECT[a][2] < PLAYER_POS + 2.75 and OBJECT[a][3] > -STREET_SIZE - 2 and OBJECT[a][3] < -10 then
				DAMAGE = DAMAGE + 50
				OBJECT[a][2] = -200
			end
		end
	end
	
	if timer > 0 then
		screen.print(string.len("Speed up!")/2 * 12, 240, "Speed Up!", color.new(0, 0, 0))
		timer = timer - 1
	end
	
	screen.print(350, 250, "MPH: " .. SPEED * 100, color.new(255, 255, 255))

	--Add score
	SCORE = SCORE + 1

	drawDamage(2, 2, 200, 20)
	drawScore(300, 2)

	scrollObject()
	
	
	if SCORE == 1000 then
		SPEED = 0.5
		timer = 50
	end
	if SCORE == 2000 then
		SPEED = 0.75
		timer = 50
	end
	if SCORE == 3000 then
		SPEED = 1
		timer = 50
	end
	if SCORE == 4000 then
		SPEED = 1.25
		timer = 50
	end
	if SCORE == 5000 then
		SPEED = 1.5
		timer = 50
	end
	if SCORE == 6000 then
		SPEED = 1.75
		timer = 50
	end
	if SCORE > 7000 then
		SPEED = 2
		screen.print(200, 240, "Final Speed! Double Points!")
		SCORE = SCORE + 1
	end
	
	
	--Are you dead?
	if DAMAGE >= 100 then
		gamemode = 100
	end
end