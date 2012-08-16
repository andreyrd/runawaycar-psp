os.luadevsplash();	

--Get Random
math.randomseed(os.time())

neoSplashIn();

-- Load all of the cars

car_orange = model.load("MODELS/CAR_ORANGE.OBJ")

neoSplashOut();


gameSplashIn();

-- The different obstacles

-- cone_obj = model.load("MODELS/CONE.OBJ")
dumpster_obj = model.load("MODELS/GREENDUMPSTER.OBJ")
trashcan_obj = model.load("MODELS/TRASHCAN.OBJ")
roadblock_obj = model.load("MODELS/ROADBLOCK_GRAY.OBJ")

-- the different street objects

turn_obj = model.load("MODELS/ROAD_TURN.OBJ")
street_obj = model.load("MODELS/ROAD.OBJ")


-- Scenery :)

cloud_obj = model.load("MODELS/CLOUD.OBJ")

buildingR_obj = model.load("MODELS/BUILDING1.OBJ")
buildingL_obj = model.load("MODELS/BUILDING2.OBJ")

-- Music
MSC = sound.load("MUSIC/CHASE.MP3")
MSC_ON = 1
-- Some variables
SIDEWALK_HIT = 0

STREET_HEIGHT = -5
STREET_SIZE = 11.8
STREET_POS = 0
STREET_POS_X = 0


-- Player Variables
SPEED = 0.25
PLAYER_POS = 0
PLAYER_HEIGHT = STREET_HEIGHT
Y_ROT = 0

MAX_SPEED = 2

DAMAGE = 0


SCORE = 0

reset = 1
timer = 0

-- Menu
gamemode = 1

select = 2


--options
option_select = 1

--Clouds
CLOUD = {}
CLOUD[1] = {math.random(-10, 10), math.random(2, 15), math.random(-40, -50)}
CLOUD[2] = {math.random(-10, 10), math.random(2, 15), math.random(-40, -50)}
CLOUD[3] = {math.random(-10, 10), math.random(2, 15), math.random(-40, -50)}


--Objects
OBJECT = {}
OBJECT[1] = {math.random(1, 3), math.random(-5, 5), -STREET_SIZE * 6}
OBJECT[2] = {math.random(1, 3), math.random(-5, 5), -STREET_SIZE * 9}

gameSplashOut();