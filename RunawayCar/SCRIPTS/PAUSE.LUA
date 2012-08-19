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