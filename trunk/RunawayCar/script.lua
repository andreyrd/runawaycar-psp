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
-- Here looks like a good place to display the NeoFlash Splash screen.


drawLight(1, 0, 11, -51)

os.cpu(333)

-- This will just show the street to make sure everything is alright

sound.play(MSC)

while true do
	screen.clear(color.new(135, 206, 250))
	controls.read()
	
	loopMusic()
	
	car_orange:position(PLAYER_POS, PLAYER_HEIGHT, -STREET_SIZE)
	car_orange:rotation(0, Y_ROT, 0)
	car_orange:blit()
	
	
	
	scrollStreet()
	
	scrollClouds()
	
	if gamemode == 2 then
		game()
	elseif gamemode == 1 then
		menu()
	elseif gamemode == 3 then
		pause()
	elseif gamemode == 4 then
		options()
	end
	screen.flip()
	screen.waitvblankstart()
end