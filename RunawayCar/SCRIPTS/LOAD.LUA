os.luadevsplash();
	
dofile("SCRIPTS/PRE_LOAD.LUA")

neoSplashIn();

-- Load the car

CAR = model.load("MODELS/Car_blue.obj")

neoSplashOut();



gameSplashIn();

--Define some colors
color_sky = color.new(135, 206, 250)
color_white = color.new(255, 255, 255)

-- Load our font
GRAF = font.load("degrassi.pgf")

--Get Random
math.randomseed(os.time() * batt.percent() * batt.temp())

-- The different obstacles
-- cone_obj = model.load("MODELS/CONE.OBJ")
dumpster_obj = model.load("MODELS/GREENDUMPSTER.OBJ")
trashcan_obj = model.load("MODELS/TRASHCAN.OBJ")
roadblock_obj = model.load("MODELS/ROADBLOCK_GRAY.OBJ")

-- the different street objects
street_obj = model.load("MODELS/ROAD.OBJ")
coin_obj = model.load("MODELS/COIN.OBJ")


-- Scenery :)
cloud_obj = model.load("MODELS/CLOUD.OBJ")
buildingR_obj = model.load("MODELS/BUILDING1.OBJ")
buildingL_obj = model.load("MODELS/BUILDING2.OBJ")

-- Music
MSC = sound.load("MUSIC/CHASE.MP3")
MSC_ON = 1
DING = sound.load("MUSIC/DING.WAV")
CRASH_SND = sound.load("MUSIC/CRASH.WAV")
SMALL_CRASH = sound.load("MUSIC/SMALL_CRASH.WAV")
SCREECH = sound.load("MUSIC/SCREECH.WAV")

-- Some variables
SIDEWALK_HIT = 0
STREET_HEIGHT = -5
STREET_SIZE = 11.8
STREET_POS = 0
STREET_POS_X = 0

-- Player Variables
SPEED = 0.25
PLAYER_POS = -3
PLAYER_HEIGHT = STREET_HEIGHT
CAR_SIZE = 3.65
Y_ROT = 0
MAX_SPEED = 2
DAMAGE = 0
SCORE = 0
reset = 1
timer = 0

-- Menu
gamemode = 1
select = 1

--options
option_select = 1

--Cars
cars = {}
cars[1] = {"Blue Speedster", 1}
cars[2] = {"Green Prize", 0}
cars[3] = {"Red Blazer", 0}
cars[4] = {"Slick Black", 0}
cars_unlocked = 1
current_car = 1

--Money
points = 0
points_multiplier = 1
highscore = 0

--Clouds
CLOUD = {}
CLOUD[1] = {math.random(-10, 10), math.random(2, 15), math.random(-40, -50)}
CLOUD[2] = {math.random(-10, 10), math.random(2, 15), math.random(-40, -50)}
CLOUD[3] = {math.random(-10, 10), math.random(2, 15), math.random(-40, -50)}

--Objects
OBJECT = {}
OBJECT[1] = {math.random(1, 3), math.random(-5, 5), -STREET_SIZE * 6}
OBJECT[2] = {math.random(1, 3), math.random(-5, 5), -STREET_SIZE * 9}

COIN = {}
COIN[1] = {OBJECT[1][2], OBJECT[1][3] - STREET_SIZE}
for a = 2, 8 do
	COIN[a] = {COIN[a - 1][1], COIN[a - 1][2] - STREET_SIZE / 8}
end
COIN_SPIN = 1

--load all deh functions
dofile("SCRIPTS/FUNCTIONS_WORLD.LUA")
dofile("SCRIPTS/FUNCTIONS_GAME.LUA")
dofile("SCRIPTS/FUNCTIONS_MENU.LUA")

gameSplashOut();