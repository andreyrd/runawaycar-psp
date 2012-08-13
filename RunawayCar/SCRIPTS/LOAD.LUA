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

-- Some variables
SIDEWALK_HIT = 0

STREET_HEIGHT = -5
STREET_SIZE = 10
STREET_POS = 0
STREET_POS_X = 0

-- This is the players speed
SPEED = 0.40
PLAYER_POS = 0
PLAYER_HEIGHT = STREET_HEIGHT

gamemode = 0

moved = 0
moved_counter = 0

gameSplashOut();