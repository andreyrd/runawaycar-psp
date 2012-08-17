function crashed()
	screen.print(230, 136, "You have CRASHED!", color.new(255, 255, 255))
	screen.print(230, 148, "Your score was: " .. SCORE, color.new(255, 255, 255))
	if SCORE > highscore then
		screen.print(240, 160, "You beat the highscore!", color.new(255, 255, 255))
		highscore = SCORE
	else
		screen.print(240, 160, "The Highscore is " .. highscore, color.new(255, 255, 255))
	end
	screen.print(0,0,"Press Cross to exit to menu", color.new(255, 255, 255))
	
	if controls.press("cross") then
		select = 2
		PLAYER_POS = 0
		gamemode = 1
	end
end