-- This is a functions I made that will normalize a vector.
-- Just leave it here. We may need it for the lighting.
function unit(x, y, z)
	local len = math.sqrt((x * x) + (y * y) + (z * z))
	return x / len, y / len, z / len
end



-- I have rellocated your splash screen sprites and changed them up a bit to work better
-- Fly in from left

function splashIn()
	for i = -480, 0, 1 do 
		
		image.blit(splash_game, i, 0) 
		
		-- Don't forget to include this frank.
		screen.flip()
		screen.waitvblankstart()
	end
end



function splashOut()
	for i = 0, 480, 1 do 
		image.blit(splash_game, i, 0) 
		
		screen.flip()
		screen.waitvblankstart()
	end  
end