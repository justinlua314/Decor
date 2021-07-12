local function circleThing()
	if not love.mouse.isDown(1) then return end
	love.graphics.setCanvas(decor.render)
	decor.circle({
		color = global.color.random(),
		x = love.mouse.getX(), y = love.mouse.getY(),
		radius = 20
	})
	love.graphics.setCanvas()
end

decor.postProcess({
	func = circleThing
})

local m = require("posts/melt")

decor.postProcess({ -- Inactive melt, must be activated by something
	id = "melt",
	func = m,
	active = false
})
