function menu()
	--Fix car's position
	PLAYER_POS = select - 3
	-- Move selector (Car)
	if(controls.press("left") and select > 1) then
		select = select - 1
	end

	if(controls.press("right") and select < 6) then
		select = select + 1
	end


	if select == 1 then
		if controls.press("cross") then
			SPEED = 0.25
			PLAYER_POS = 0
			SCORE = 0
			DAMAGE = 0
			gamemode = 2
		end
		screen.print(GRAF, 240 - string.len("Play")/2 * 16, 120, "Play", color.new(0, 0, 255))
	end
	
	if select == 2 then
		if controls.press("cross") then
			gamemode = 5
		end
		screen.print(GRAF, 240 - string.len("car garage")/2 * 16, 120, "Car Garage", color.new(0, 0, 255))
	end
	
	if select == 3 then
		if controls.press("cross") then
			saveGame()
		end
		screen.print(GRAF, 240 - string.len("Save")/2 * 16, 120, "Save", color.new(0, 0, 255))
	end
	
	if select == 4 then
		if controls.press("cross") then
			check = loadGame()
			if check ~= nil then
				highscore = tonumber(check[1])
				points = tonumber(check[2])
				cars[1][2] = tonumber(check[3])
				cars[2][2] = tonumber(check[4])
				cars[3][2] = tonumber(check[5])
				cars[4][2] = tonumber(check[6])
				cars_unlocked = tonumber(check[7])
			end
		end
		screen.print(GRAF, 240 - string.len("Load")/2 * 16, 120, "Load", color.new(0, 0, 255))
	end
	
	if select == 5 then
		if controls.press("cross") then
			gamemode = 4
		end
		screen.print(GRAF, 240 - string.len("About")/2 * 16, 120, "About", color.new(0, 0, 255))
	end
	if select == 6 then
		if controls.press("cross") then
			os.exit()
		end
		screen.print(GRAF, 240 - string.len("Exit")/2 * 12, 120, "Exit", color.new(0, 0, 255))
	end
end