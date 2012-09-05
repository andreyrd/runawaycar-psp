-- This while be mostly for the splash screen functions

-- Game splash

function gameSplashIn()
	game_splash = image.load("SPLASH/GAME.PNG")
	
	for a = 0, 255, 5 do
		image.blend(game_splash, 0, 0, a)
		screen.flip()
		screen.waitvblankstart()
	end
end

function gameSplashOut()
	for a = 255, 0, -5 do
		image.blend(game_splash, 0, 0, a)
		screen.flip()
		screen.waitvblankstart()
	end
	game_splash:free()
	game_splash = nil
	collectgarbage()
end

-- Display the mandatory NeoFlash splash screen

function neoSplashIn()
	neo = image.load("SPLASH/NEOSPLASH.PNG")
	
	for a = 0, 255, 5 do
		image.blend(neo, 0, 0, a)
		screen.flip()
		screen.waitvblankstart()
	end
end

function neoSplashOut()
	for a = 255, 0, -5 do
		image.blend(neo, 0, 0, a)
		screen.flip()
		screen.waitvblankstart()
	end
	neo:free()
	neo = nil
	collectgarbage()
end