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