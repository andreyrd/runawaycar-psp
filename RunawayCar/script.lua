-- Here's the main script file for our Runaway car game.

-- Load all of the scripts.

dofile("SCRIPTS/FUNCTIONS.LUA")

dofile("SCRIPTS/LOAD.LUA")

-- This contains test functions for scrolling the street.

dofile("SCRIPTS/SCROLL.LUA")

-- Here looks like a good place to display the NeoFlash Splash screen.


drawLight(1, 0, 5, -50)

os.cpu(333)

-- This will just show the street to make sure everything is alright

while true do
	screen.clear()
	controls.read()

	if(gamemode==1) then
		dofile("SCRIPTS/GAME.LUA")
	else
		dofile("SCRIPTS/MENU.LUA")
	end
	
	screen.flip()
	screen.waitvblankstart()
end