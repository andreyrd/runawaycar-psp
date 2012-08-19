function options()
	screen.print(GRAF, 0, 0, "Game programmed by:", color.new(0, 0, 0))
	screen.print(GRAF, 0, 40, "Frankdrey - Models, Menus, Misc. Code", color.new(0, 0, 0))
	screen.print(GRAF, 0, 80, "10$man - Gameplay", color.new(0, 0, 0))
	screen.print(GRAF, 0, 120, "spereksta - Music", color.new(0, 0, 0))
	screen.print(GRAF, 0, 160, "Press Circle to return to menu", color.new(0, 0, 0))

	if controls.press("circle") then
		gamemode = 1
	end
end