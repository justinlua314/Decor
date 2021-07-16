local polygon = {
	color = {1, 1, 1},
	mode = "fill",
	points = {},
	rotation = 0
}

function decor.polygon(data)
	if decor.auto then
		data = data or {}
		data.color = data.color or polygon.color
		data.mode = data.mode or polygon.mode
		data.points = data.points or polygon.points
		data.rotation = data.rotation or polygon.rotation
	end

	love.graphics.setColor(data.color)
	love.graphics.rotate(math.rad(data.rotation))

	love.graphics.polygon(data.mode, data.points)

	love.graphics.origin()
end
