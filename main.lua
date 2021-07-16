require("require")

function love.load()
	global.load()
	decor.load()

	decor.frame("diag")
	love.graphics.setBackgroundColor(0.3, 0.3, 0.3)
end

function love.update(dt)
	decor.update(dt)
	shutter.update(dt)
end

function love.draw()
	decor.draw()
end

function love.keypressed(key)
	decor.keypressed(key)
end
