os.luadevsplash();	



-- Don't forget quotation marks :P
splash_game = image.load("splash/game.png")

splashIn()


-- Load all of the cars

car_red = model.load("MODELS/CAR-RED.OBJ", color.new(0, 0, 0), 1)

car_blue = model.load("MODELS/CAR-BLUE.OBJ", color.new(0, 0, 0), 1)
car_yellow = model.load("MODELS/CAR-YELLOW.OBJ", color.new(0, 0, 0), 1)
car_green = model.load("MODELS/CAR-GREEN.OBJ", color.new(0, 0, 0), 1)
car_orange = model.load("MODELS/CAR-ORANGE.OBJ", color.new(0, 0, 0), 1)


-- The different obstacles

cone_obj = model.load("MODELS/CONE.OBJ", color.new(0, 0, 0), 1)
dumpster_obj = model.load("MODELS/GREENDUMPSTER.OBJ", color.new(0, 0, 0), 1)
trashcan_obj = model.load("MODELS/TRASHCAN.OBJ", color.new(0, 0, 0), 1)


-- the different street objects

turn_obj = model.load("MODELS/ROAD-TURN.OBJ", color.new(0, 0, 0), 1)
street_obj = model.load("MODELS/ROAD.OBJ", color.new(0, 0, 0), 1)

-- Note.
-- I add a black outline because that gives the object a cartoony look
-- It's much easier to make a good looking cartoony game then a good
-- looking realistic game.
-- Not trying to take the easy way out or nothing :P

-- Add delay here if needed...

-- I don't think a delay would be needed.

splashOut()