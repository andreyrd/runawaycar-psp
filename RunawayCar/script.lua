-- Here's the main script file for our Runaway car game.

-- Load all of the scripts.

dofile("SCRIPTS/FUNCTIONS.LUA")

dofile("SCRIPTS/LOAD.LUA")

-- This contains test functions for scrolling the street.

dofile("SCRIPTS/SCROLL.LUA")


dofile("SCRIPTS/GAME.LUA")
dofile("SCRIPTS/MENU.LUA")
dofile("SCRIPTS/PAUSE.LUA")
dofile("SCRIPTS/OPTIONS.LUA")
dofile("SCRIPTS/CAR_SELECT.LUA")
dofile("SCRIPTS/CRASH.LUA")
-- Here looks like a good place to display the NeoFlash Splash screen.

drawLight(1, 0, 11, -51)

os.cpu(333)

-- This will just show the street to make sure everything is alright

sound.play(MSC)

while true do
	screen.clear(color.new(135, 206, 250))
	controls.read()
	
	loopMusic()
	
	
	
	scrollStreet()
	
	scrollClouds()
	
	if gamemode == 2 then
		game()
		CAR:position(PLAYER_POS, PLAYER_HEIGHT, -STREET_SIZE)
		CAR:rotation(0,Y_ROT, 0)
		CAR:blit()
	elseif gamemode == 1 then
		menu()
		CAR:position(PLAYER_POS, PLAYER_HEIGHT, -STREET_SIZE)
		CAR:rotation(0,Y_ROT, 0)
		CAR:blit()
	elseif gamemode == 3 then
		pause()
		CAR:position(PLAYER_POS, PLAYER_HEIGHT, -STREET_SIZE)
		CAR:rotation(0,Y_ROT, 0)
		CAR:blit()
	elseif gamemode == 4 then
		options()
		CAR:position(PLAYER_POS, PLAYER_HEIGHT, -STREET_SIZE)
		CAR:rotation(0,Y_ROT, 0)
		CAR:blit()
	elseif gamemode == 5 then
		carSelect()
		CAR:position(PLAYER_POS, PLAYER_HEIGHT, -STREET_SIZE)
		CAR:rotation(0,Y_ROT, 0)
		CAR:blit()
	elseif gamemode == 100 then
		crashed()
	end
	screen.flip()
	screen.waitvblankstart()
end