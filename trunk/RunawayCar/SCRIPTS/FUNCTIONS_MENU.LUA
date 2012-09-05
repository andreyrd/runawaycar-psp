function menu()
	--Fix car's position
	PLAYER_POS = select - 3
	-- Move selector (Car)
	if(controls.press("left") and select > 1) then
		select = select - 1
	end

	if(controls.press("right") and select < 6) then
		select = select + 1
	end


	if select == 1 then
		if controls.press("cross") then
			SPEED = 0.25
			PLAYER_POS = 0
			SCORE = 0
			DAMAGE = 0
			gamemode = 2
		end
		screen.print(GRAF, 240 - string.len("Play")/2 * 16, 120, "Play", color.new(0, 0, 255))
	end
	
	if select == 2 then
		if controls.press("cross") then
			gamemode = 5
		end
		screen.print(GRAF, 240 - string.len("Garage")/2 * 16, 120, "Car Garage", color.new(0, 0, 255))
	end
	
	if select == 3 then
		if controls.press("cross") then
			saveGame()
		end
		screen.print(GRAF, 240 - string.len("Save")/2 * 16, 120, "Save", color.new(0, 0, 255))
	end
	
	if select == 4 then
		if controls.press("cross") then
			check = loadGame()
			if check ~= nil then
				highscore = tonumber(check[1])
				points = tonumber(check[2])
				cars[1][2] = tonumber(check[3])
				cars[2][2] = tonumber(check[4])
				cars[3][2] = tonumber(check[5])
				cars[4][2] = tonumber(check[6])
				cars_unlocked = tonumber(check[7])
			end
		end
		screen.print(GRAF, 240 - string.len("Load")/2 * 16, 120, "Load", color.new(0, 0, 255))
	end
	
	if select == 5 then
		if controls.press("cross") then
			gamemode = 4
		end
		screen.print(GRAF, 240 - string.len("About")/2 * 16, 120, "About", color.new(0, 0, 255))
	end
	if select == 6 then
		if controls.press("cross") then
			os.exit()
		end
		screen.print(GRAF, 240 - string.len("Exit")/2 * 12, 120, "Exit", color.new(0, 0, 255))
	end
end

function carSelect()
	screen.print(GRAF, 350, 2, "Points: " .. points, color.new(255, 255, 255))
	if current_car == option_select then
		screen.print(GRAF, 0, 240, cars[option_select][1], color.new(255, 255, 255))
	else
		if cars[option_select][2] == 1 then
			screen.print(GRAF, 0, 240, cars[option_select][1] .. " - Owned", color.new(0, 0, 0))
		else
			screen.print(GRAF, 0, 240, cars[option_select][1] .. " - Locked", color.new(0, 0, 0))
			screen.print(GRAF, 0, 252, "Buy for " .. option_select * 2000, color.new(0, 0, 0))
		end
	end
	
	if controls.press("cross") and current_car ~= option_select then
		if cars[option_select][2] == 0 then
			if points > option_select * 2000 then
				cars[option_select][2] = 1
				cars_unlocked = cars_unlocked + 1
				points = points - option_select * 2000
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

function saveGame()
	DATA = {highscore, points, cars[1][2], cars[2][2], cars[3][2], cars[4][2], cars_unlocked}
	DATA_SAVE = string.implode(DATA, "%")
	saveplace = {gameid="DEMODEV", savenames="RunawayCar"}
	saveconfig = {title="Runaway Car Save", subtitle=os.date(), details="Cars Unlocked: " .. cars_unlocked .. "\nHighscore: " .. highscore .. "\nPoints: " .. points, savetext="New stuff!"}
	done, where = savedata.save(saveplace,saveconfig,DATA_SAVE)
	if done then
		return where
	else
		return nil
	end
end

function loadGame()
	saveplace = {gameid="DEMODEV", savenames="RunawayCar"};
	done, where, what = savedata.load(saveplace);
	if done then
		what = string.explode(what, "%")
		return what
	end
end

function about()
	screen.print(GRAF, 0, 0, "Game made by:", color.new(0, 0, 0))
	screen.print(GRAF, 0, 40, "Frankdrey - Models, Menus, Misc. Code", color.new(0, 0, 0))
	screen.print(GRAF, 0, 80, "10$man - Gameplay", color.new(0, 0, 0))
	screen.print(GRAF, 0, 120, "spereksta - Music", color.new(0, 0, 0))
	screen.print(GRAF, 0, 160, "Press Circle to return to menu", color.new(0, 0, 0))

	if controls.press("circle") then
		gamemode = 1
	end
end