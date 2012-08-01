-- Here's the main script file for our Runaway car game.

-- Load all of the scripts.

dofile("SCRIPTS/LOAD.LUA")

-- This contains test functions for scrolling the street.
dofile("SCRIPTS/SCROLL.LUA")


--This will just show the street to make sure everything is alright
while true do
	screen.clear()
	drawStreet(PLAYER_POS, STREET_HEIGHT, -10)
	drawStreet(PLAYER_POS, STREET_HEIGHT, -20)
	drawStreet(PLAYER_POS, STREET_HEIGHT, -30)
	drawStreet(PLAYER_POS, STREET_HEIGHT, -40)
	drawStreet(PLAYER_POS, STREET_HEIGHT, -50)
	drawStreet(PLAYER_POS, STREET_HEIGHT, -60)
	
	screen.flip()
	screen.waitvblankstart()
end