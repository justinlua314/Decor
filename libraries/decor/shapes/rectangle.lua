local rectangle = {
	color = {1, 1, 1},
	mode = "fill",
	x = 0, y = 0,
	width = 100, height = 100,
	rotation = 0
}

function decor.rectangle(data)
	if decor.auto then
		data = data or {}
		data.color = data.color or rectangle.color
		data.mode = data.mode or rectangle.mode
		data.x = data.x or rectangle.x
		data.y = data.y or rectangle.y
		data.width = data.width or rectangle.width
		data.height = data.height or rectangle.height
		data.rotation = data.rotation or rectangle.rotation
	end

	love.graphics.setColor(data.color)
	love.graphics.rotate(math.rad(data.rotation))

	love.graphics.rectangle(data.mode, data.x, data.y, data.width, data.height)

	love.graphics.origin()
end
