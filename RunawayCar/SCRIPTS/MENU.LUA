scrollStreet()

car_orange:position(PLAYER_POS, STREET_HEIGHT, -STREET_SIZE)
car_orange:rotation(0, 0, 0)
car_orange:blit()

if(controls.left() and PLAYER_POS > -2 and moved = 0) then
	PLAYER_POS = PLAYER_POS - 2
	moved = 1
end
if(controls.right() and PLAYER_POS < 2 and moved = 1) then
	PLAYER_POS = PLAYER_POS + 2
	moved = 1
end

while(moved_counter < 3) do  --Makes the selector less jumpy
	moved_counter++
end
if(moved_counter == 3) then
	moved = 0
end

if(PLAYER_POS == -2 and controls.cross()) then
	gamemode = 1
end
if(PLAYER_POS == 0 and controls.cross()) then
	-- Credits or options or something
end
if(PLAYER_POS == 2 and controls.cross()) then
	os.exit()
end