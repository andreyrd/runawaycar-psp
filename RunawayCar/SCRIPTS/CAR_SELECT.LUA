function carSelect()
	screen.print(GRAF, 350, 2, "Points: " .. points, color.new(255, 255, 255))
	if current_car == option_select then
		screen.print(GRAF, 0, 240, cars[option_select][1], color.new(255, 255, 255))
	else
		if cars[option_select][2] == 1 then
			screen.print(GRAF, 0, 240, cars[option_select][1] .. " - Owned", color.new(0, 0, 0))
		else
			screen.print(GRAF, 0, 240, cars[option_select][1] .. " - Locked", color.new(0, 0, 0))
			screen.print(GRAF, 0, 252, "Buy for " .. option_select * 3000, color.new(0, 0, 0))
		end
	end
	
	if controls.press("cross") and current_car ~= option_select then
		if cars[option_select][2] == 0 then
			if points > option_select * 3000 then
				cars[option_select][2] = 1
				cars_unlocked = cars_unlocked + 1
				points = points - option_select * 3000
			end
		else
			current_car = option_select
			if option_select == 1 then
				CAR:free()
				CAR = nil
				collectgarbage()
				
				CAR = model.load("MODELS/Car_blue.obj")
			elseif option_select == 2 then
				CAR:free()
				CAR = nil
				collectgarbage()
				
				CAR = model.load("MODELS/Car_green.obj")
			elseif option_select == 3 then
				CAR:free()
				CAR = nil
				collectgarbage()
				
				CAR = model.load("MODELS/Car_red.obj")
			elseif option_select == 4 then
				CAR:free()
				CAR = nil
				collectgarbage()
				
				CAR = model.load("MODELS/Car_black.obj")
			end
		end
	end
	
	if controls.press("up") then
		if option_select > 1 then
			option_select = option_select - 1
		end
	end
	if controls.press("down") then
		if option_select < 4 then
			option_select = option_select + 1
		end
	end
	
	if controls.press("circle") then
		gamemode = 1
	end
end