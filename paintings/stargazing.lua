--[[
-- You must replace these assets with something else
-- The music was loaded into the main.lua file and played by a button press. Simple
local man = love.graphics.newImage("images/man.png")
local bear = love.graphics.newImage("images/bear.png")
astro = love.image.newImageData("images/astro.jpg")
]]

local offset = {x = 200, y = 200}

love.graphics.setColor(1, 1, 1)
love.graphics.draw(man)

local dots = {}

local function thingy(x, y, r, g, b, a)
	table.insert(dots, {x = x, y = y, angle = -math.pi, color = {r, g, b}})

	return r,g,b,a
end

astro:mapPixel(thingy)

for _,dot in pairs(dots) do
	love.graphics.setColor(dot.color)
	love.graphics.points((dot.x + offset.x), (dot.y + offset.y))
end


-- Programming show =============================================================

local radius = 150
local movePercent = 2
local start = {x = 350, y = 300}
local targetColor = {1, 1, 1}
local activeColor = {1, 1, 1}

local targetBackgroundColor = {0.2, 0.2, 0.2}
local activeBackgroundColor = {0.2, 0.2, 0.2}

local channels = {}
local centers = {
	{x = 250, y = 250},
	{x = 450, y = 250},
	{x = 350, y = 300},
	{x = 250, y = 450},
	{x = 375, y = 550},
	{x = 710, y = 85},
	{x = 845, y = 210},
	{x = 105, y = 750},
	{x = 97, y = 930},
	{x = 346, y = 904},
	{x = 145, y = 685},
	{x = 160, y = 925},
	{x = 50, y = 310},
	{x = 320, y = 45},
	{x = 70, y = 15},
}

local lines = {}
local thickness = 40
local lineAngle = 20
local lineSpeed = 40

local bearAlpha = 1
local bearTicker = false


local randomThings = {}

for i = 1, #centers do table.insert(channels, {}) end


local function drop()
	for _,dot in pairs(dots) do
		dot.y = (dot.y + love.math.random(15))

		if dot.y > 500 then
			if #channels[1] == 0 then
				for _,dot in pairs(dots) do
					targetBackgroundColor = {(love.math.random(20, 60) / 100), (love.math.random(20, 60) / 100), (love.math.random(20, 60) / 100)}
					for i = 1,3 do
						dot.color[i] = (dot.color[i] + (love.math.random(-20, 20) / 100))
					end

					table.insert(channels[love.math.random(#channels)], dot)
				end
			end

			decor.posts["drop"].active = false
			decor.posts["rotate"].active = true
		end
	end

	love.graphics.setCanvas(decor.render)
	love.graphics.clear()
	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(man)

	for _,dot in pairs(dots) do
		dot.color[4] = (love.math.random(10, 60) / 100)
		love.graphics.setColor(dot.color)
		love.graphics.points((dot.x + offset.x), (dot.y + offset.y))
	end

	love.graphics.setCanvas()
end

decor.postProcess({
	id = "drop",
	func = drop,
	active = false
})

local function rotate()
	love.graphics.setCanvas(decor.render)
	love.graphics.clear()

	if bearTicker then
		bearAlpha = bearAlpha + 0.04
		if bearAlpha > 1 then
			bearAlpha = 1
			bearTicker = false
		end
	else
		bearAlpha = bearAlpha - 0.04
		if bearAlpha < 0 then
			bearAlpha = 0
			bearTicker = true
		end
	end

	love.graphics.setColor(1, 1, 1, bearAlpha)
	love.graphics.draw(bear)

	for _,thing in pairs(randomThings) do
		love.graphics.setColor(thing.color)

		love.graphics.circle("fill", thing.x, thing.y, thing.radius)
	end

	for k,channel in pairs(channels) do
		for _,dot in pairs(channel) do
			if love.math.random(movePercent) == 1 then
				dot.x = (centers[k].x + (radius * math.cos(dot.angle)))
				dot.y = (centers[k].y + (radius * math.sin(dot.angle)))
				dot.angle = (dot.angle + math.pi * love.timer.getDelta() + (love.math.random(100, 200) / 1000))
			end

			love.graphics.setColor(dot.color)
			love.graphics.circle("fill", dot.x, dot.y, 5)
		end
	end

	for val = 1,3 do
		if activeColor[val] > targetColor[val] then
			activeColor[val] = (activeColor[val] - 0.01)
		elseif activeColor[val] < targetColor[val] then
			activeColor[val] = (activeColor[val] + 0.01)
		end
	end

	for val = 1,3 do
		if activeBackgroundColor[val] > targetBackgroundColor[val] then
			activeBackgroundColor[val] = (activeBackgroundColor[val] - 0.01)
		elseif activeBackgroundColor[val] < targetBackgroundColor[val] then
			activeBackgroundColor[val] = (activeBackgroundColor[val] + 0.01)
		end
	end

	love.graphics.setColor(0, 0, 0, 0.5)

	for _,line in pairs(lines) do
		love.graphics.polygon("fill", line)

		line[1] = (line[1] - lineSpeed)
		line[3] = (line[3] - lineSpeed)

		line[6] = (line[6] + lineSpeed)
		line[8] = (line[8] + lineSpeed)
	end

	if love.math.random(10) == 7 then targetColor = global.color.random() end
	if love.math.random(30) == 7 then targetBackgroundColor = {(love.math.random(20, 60) / 100), (love.math.random(20, 60) / 100), (love.math.random(20, 60) / 100)} end

	if love.math.random(3) == 3 then
		table.insert(lines, {1000, 0, (1000 + thickness), 0, (1000 + lineAngle), 50, (1000 + lineAngle + thickness), 50})
		if #lines > 100 then
			table.remove(lines, 1)
		end
	end

	if love.math.random(20) == 7 then
		table.insert(randomThings, {x = love.math.random(1000), y = love.math.random(1000), radius = love.math.random(20, 80), color = {(love.math.random(20, 60) / 100), (love.math.random(20, 60) / 100), (love.math.random(20, 60) / 100), 0.7}})
	end

	if love.math.random(25) == 7 then
		table.remove(randomThings, love.math.random(#randomThings))
	end

	love.graphics.setBackgroundColor(activeBackgroundColor)
	love.graphics.setColor(activeColor)
	love.graphics.draw(man)
	love.graphics.setCanvas()
end

decor.postProcess({
	id = "rotate",
	func = rotate,
	active = false
})
