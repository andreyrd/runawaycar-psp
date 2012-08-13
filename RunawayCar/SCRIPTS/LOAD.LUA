os.luadevsplash();	

neoSplashIn();

-- Load all of the cars

car_orange = model.load("MODELS/CAR_ORANGE.OBJ")

neoSplashOut();


gameSplashIn();

-- The different obstacles

-- cone_obj = model.load("MODELS/CONE.OBJ")
dumpster_obj = model.load("MODELS/GREENDUMPSTER.OBJ")
trashcan_obj = model.load("MODELS/TRASHCAN.OBJ")


-- the different street objects

turn_obj = model.load("MODELS/ROAD_TURN.OBJ")
street_obj = model.load("MODELS/ROAD.OBJ")

-- Note.
-- I add a black outline because that gives the object a cartoony look
-- It's much easier to make a good looking cartoony game then a good
-- looking realistic game.
-- Not trying to take the easy way out or nothing :P


gameSplashOut();

-- Some variables
SIDEWALK_HIT = 0