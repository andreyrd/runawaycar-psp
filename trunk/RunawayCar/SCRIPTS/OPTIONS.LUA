function options()
	screen.print(0, 0, "Game programmed by:", color.new(0, 0, 0))
	screen.print(0, 12, "Frankdrey - Models, Menus, Misc. Code", color.new(0, 0, 0))
	screen.print(0, 24, "10$man - Gameplay", color.new(0, 0, 0))
	screen.print(0, 36, "spereksta - Music", color.new(0, 0, 0))
	screen.print(0, 56, "Press Circle to return to menu", color.new(0, 0, 0))
	screen.print(0, 80, "Press select to bring up the save dialogue", color.new(0, 0, 0))
	screen.print(0, 92, "Press start to load your save", color.new(0, 0, 0))
	screen.print(0, 68, "Press Triangle to goto the car garage", color.new(0, 0, 0))

	if controls.press("circle") then
		gamemode = 1
	end
	
	if controls.press("select") then
		saveGame()
	end
	
	if controls.press("start") then
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
	if controls.press("triangle") then
		gamemode = 5
	end
end