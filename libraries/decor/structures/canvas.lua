local canvas = {
	x = 0, y = 0,
	width = 0, height = 0,
	drawFunction = nil,
	rotation = 0,
	

	object = nil -- internal
}

function decor.canvas(data)
	if decor.auto then
		data = data or {}
		data.x = data.x or canvas.x
		data.y = data.y or canvas.y
		data.width = data.width or canvas.width
		data.height = data.height or canvas.height
		data.drawFunction = data.drawFunction or function() end
		data.rotation = data.rotation or canvas.rotation
	end

	data.object = love.graphics.newCanvas(data.width, data.height)
	
	love.graphics.setCanvas(data.object)
	data.drawFunction()
	love.graphics.setCanvas(decor.render)

	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.draw(data.object, data.x, data.y, math.rad(data.rotation))
end
