function options()
	screen.print(0, 0, "Game programmed by:", color.new(0, 0, 0))
	screen.print(0, 12, "Frankdrey - Models, Menus, Misc. Code", color.new(0, 0, 0))
	screen.print(0, 24, "10$man - Gameplay", color.new(0, 0, 0))
	screen.print(0, 36, "spereksta - Music", color.new(0, 0, 0))
	screen.print(0, 56, "Press Cross to return to menu", color.new(0, 0, 0))


	if controls.press("cross") then
		gamemode = 1
	end
end