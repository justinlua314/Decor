local circle = {
	color = {1, 1, 1},
	mode = "fill",
	x = 0, y = 0,
	radius = 100,
	rotation = 0
}

function decor.circle(data)
	if decor.auto then
		data = data or {}
		data.color = data.color or circle.color
		data.mode = data.mode or circle.mode
		data.x = data.x or circle.x
		data.y = data.y or circle.y
		data.radius = data.radius or circle.radius
		data.rotation = data.rotation or circle.rotation
	end

	love.graphics.setColor(data.color)
	love.graphics.rotate(math.rad(data.rotation))

	love.graphics.circle(data.mode, data.x, data.y, data.radius)

	love.graphics.rotate(0)
end
