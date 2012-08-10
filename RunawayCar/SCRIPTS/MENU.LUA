scrollStreet()

car_orange:position(PLAYER_POS, STREET_HEIGHT, -STREET_SIZE)
car_orange:rotation(0, math.rad(180), 0)
car_orange:blit()

if(controls.left() and PLAYER_POS > -4) then
	PLAYER_POS = PLAYER_POS - 2
end
if(controls.right() and PLAYER_POS < 4) then
	PLAYER_POS = PLAYER_POS + 2
end