if(controls.left() and PLAYER_POS > -5.5) then
	PLAYER_POS = PLAYER_POS - (SPEED * 2)
end
if(controls.right() and PLAYER_POS < 5.5) then
	PLAYER_POS = PLAYER_POS + (SPEED * 2)
end

-- Sidewalk damage code
if(SIDEWALK_HIT == 0 and (PLAYER_POS > 3.5 or PLAYER_POS < -3.5)) then
	SIDEWALK_HIT = 1 -- Once they get the damage, they won't get it anymore, to prevent infinite damage from sidewalk
	DAMAGE = DAMAGE + 0.1
	PLAYER_HEIGHT = PLAYER_HEIGHT + 0.1
else
	SIDEWALK_HIT = 0
end