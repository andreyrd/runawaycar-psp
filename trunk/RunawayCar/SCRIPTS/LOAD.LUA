os.luadevsplash();	

neoSplashIn();

-- Load all of the cars

car_orange = model.load("MODELS/CAR-ORANGE.OBJ", color.new(0, 0, 0), 1)

neoSplashOut();
gameSplashIn();

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

gameSplashOut();