-- This is a functions I made that will normalize a vector.
-- Just leave it here. We may need it for the lighting.
function unit(x, y, z)
	local len = math.sqrt((x * x) + (y * y) + (z * z))
	return x / len, y / len, z / len
end