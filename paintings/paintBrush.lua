local function circleThing()
	if not love.mouse.isDown(1) then return end
	decor.editing(true)
	decor.circle({
		color = global.color.random(),
		x = love.mouse.getX(), y = love.mouse.getY(),
		radius = 20
	})
	decor.editing(false)
end

decor.postProcess({
	func = circleThing
})

local m = require("posts/melt")

decor.postProcess({
	id = "melt",
	func = m,
	active = false,
	key = "space"
})
