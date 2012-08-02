STREET_HEIGHT = -5
STREET_SIZE = 10
STREET_POS = 0

-- This is the players speed
SPEED = 0.05
PLAYER_POS = 0


currentRoad = {}


for a = 1, 7 do
	currentRoad[a] = {}
end

generateRoad(currentRoad)