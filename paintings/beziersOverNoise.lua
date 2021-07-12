local random = false
local pallet = {}


if random then
	for i = 1,500 do
		table.insert(pallet, pattern.randomColor())
	end
else
	pallet = {
		{0.75, 0.7, 0.56},
		{0.34, 0.31, 0.34},
		{0.56, 0.31, 0.33},
		{0.95, 0.94, 0.91},
		{0.14, 0.15, 0.16}
	}
end

decor.noise({
	colors = pallet,
	x = -100, y = -500,
	width = 1250, height = 1500,
	density = 4,
	spread = 20,
	rotation = 5,
	pixelRotation = 10
})


for line = 1,10 do
	local t = {}

	for point = 1,5 do
		table.insert(t, (250 * (point - 1)))
		table.insert(t, (math.floor((1000 / 10) * (line - 1) + 50) + love.math.random(-50, 50)))
	end

	decor.curve({
		color = {
			((0.18 / 10) * line),
			((0.4 / 10) * line),
			((0.75 / 10) * line),
			0.2
		},
		points = t,
		thickness = 20
	})
end

decor.circle({
	color = {0.6, 0, 0, 0.5},
	x = 775, y = 100,
	radius = 150
})

decor.circle({
	color = {0, 0.6, 0, 0.5},
	x = 900, y = 100,
	radius = 150
})

decor.circle({
	color = {0, 0, 0.6, 0.5},
	x = 900, y = 225,
	radius = 150
})
