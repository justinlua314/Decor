local lineColors = {}

for i = 1, 1000 do
	local t = {(love.math.random(100) / 200), (love.math.random(100) / 200), (love.math.random(100) / 200)}
	table.insert(lineColors, t)
end

for i = 1,200 do
	decor.canvas({
		x = (5 * i),
		width = 5, height = global.screen.h,
		drawFunction = function()
			for i = 1,2000 do
				decor.rectangle({
					color = lineColors[love.math.random(#lineColors)],
					x = love.math.random(150), y = love.math.random(950),
					width = love.math.random(100), height = love.math.random(100)
				})
			end
		end
	})
end

for i = 1,200 do
	decor.canvas({
		y = (5 * (i + 1)),
		width = 5, height = global.screen.w,
		drawFunction = function()
			for i = 1,2000 do
				decor.rectangle({
					color = lineColors[love.math.random(#lineColors)],
					x = love.math.random(150), y = love.math.random(950),
					width = love.math.random(100), height = love.math.random(100)
				})
			end
		end,
		rotation = -90
	})
end

local switcher = true
local cols = {
	{0.4, 1, 1},
	{0.58, 0, 0.83}
}
local currentCol


for i = 1, 20 do
	if switcher then
		currentCol = cols[1]
	else
		currentCol = cols[2]
	end

	currentCol[4] = (love.math.random(20, 100) / 100)

	switcher = not switcher

	decor.rectangle({
		x = (250 + love.math.random(-50, 50)), y = (300 + love.math.random(-50, 50)),
		color = currentCol
	})
end

for i = 1, 20 do
	if switcher then
		currentCol = cols[1]
	else
		currentCol = cols[2]
	end

	currentCol[4] = (love.math.random(20, 100) / 100)

	switcher = not switcher

	decor.rectangle({
		x = (650 + love.math.random(-50, 50)), y = (300 + love.math.random(-50, 50)),
		color = currentCol
	})
end

decor.curve({
	color = {0.11, 0.56, 1},
	points = {
		250, 700,
		500, 800,
		750, 700
	},
	thickness = 20
})

local f = require("posts.melt")

decor.postProcess({
	id = "melt",
	func = f,
	time = 0.1,
	active = false,
	key = "space"
})
