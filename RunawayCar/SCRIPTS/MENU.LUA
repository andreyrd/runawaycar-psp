function menu()
	-- Move selector (Car)
	if(controls.press("left") and select > 1) then
		for a = 1, 4 do
			PLAYER_POS = PLAYER_POS - 1 / a
		end
		select = select - 1
	end

	if(controls.right("right") and select < 3) then
		for a = 1, 4 do
			PLAYER_POS = PLAYER_POS + 1 / a
		end
		select = select + 1
	end



	if select == 1 then
		if controls.press("cross") then
			gamemode = 2
		end
		screen.print(240 - string.len("Play")/2 * 16, 120, "Play", color.new(0, 0, 255))
	end

	if select == 2 then
		if controls.press("cross") then
			gamemode = 4
		end
		screen.print(240 - string.len("Options")/2 * 12, 120, "Options", color.new(0, 0, 255))
	end
	if select == 3 then
		if controls.press("cross") then
			os.exit()
		end
		screen.print(240 - string.len("Exit")/2 * 12, 120, "Exit", color.new(0, 0, 255))
	end
end