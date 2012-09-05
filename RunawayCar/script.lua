-- Here's the main script file for our Runaway car game.

-- Run through the load file
dofile("SCRIPTS/LOAD.LUA")

--Set the lighting up
drawLight(1, 0, 11, -51)

--Set the cpu speed to 333 mhz
os.cpu(333)

--play deh music
sound.play(MSC, 1)

while true do
	screen.clear(color_sky)
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
		about()
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