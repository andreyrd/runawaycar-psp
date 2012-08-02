-- Here's the main script file for our Runaway car game.

-- Load all of the scripts.

dofile("SCRIPTS/FUNCTIONS.LUA")

dofile("SCRIPTS/LOAD.LUA")

-- This contains test functions for scrolling the street.

dofile("SCRIPTS/SCROLL.LUA")

-- Here looks like a good place to display the NeoFlash Splash screen.

neoSplash()


setLighting()

-- This will just show the street to make sure everything is alright

while true do
	screen.clear()
	
	scrollStreet()
	
	-- Drawing a car, just to see how it looks
	
	car_green:position(PLAYER_POS, STREET_HEIGHT, -STREET_SIZE)
	car_green:rotation(0, math.rad(180), 0)
	car_green:blit()
	
	screen.flip()
	screen.waitvblankstart()
end