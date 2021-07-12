local pallet = {}

local thickness = 40
local variety = 100

beepNoise = love.audio.newSource("sounds/beep.mp3", "static")
beepNoise:setVolume(0.05)

for col = 1,variety do
	table.insert(pallet, global.color.random())
end

local currentCol = 1
local rowCol = 1

diag = {row = 1, column = 1}

local function animate()
	love.graphics.setCanvas(decor.render)
	decor.rectangle({
		color = pallet[currentCol],
		x = diag.column, y = diag.row,
		width = thickness, height = thickness
	})

	beepNoise:play()

	currentCol = (currentCol + 1)
	if currentCol > #pallet then currentCol = 1 end

	diag.column = (diag.column + thickness)

	if diag.column > 1000 then
		diag.column = 1
		diag.row = (diag.row + thickness)
		beepNoise:setPitch((1 / (1000 / thickness)) * (diag.row / thickness))
		print((1 / (1000 / thickness)) * (diag.row / thickness))

		if rowCol < #pallet then
			currentCol = (rowCol + 1)
		else
			currentCol = 1
		end

		rowCol = currentCol

		if diag.row >= 1000 then
			decor.posts["animate"].active = false
			decor.posts["melt"].active = true

			local s = love.audio.newSource("sounds/bassdrop.mp3", "static")
			s:setVolume(0.2)
			s:play()
		end
	end
	love.graphics.setCanvas()
end

decor.postProcess({
	id = "animate",
	func = animate
})

local melt = require("posts.melt")

decor.postProcess({
	id = "melt",

	time = 0.1,	func = melt,
	active = false
})
