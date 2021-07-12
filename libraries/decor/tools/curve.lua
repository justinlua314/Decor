local curve = {
	color = {1, 1, 1},
	points = {},
	thickness = 5
}

function decor.curve(data)
	if decor.auto then
		data = data or {}
		data.color = data.color or curve.color
		data.points = data.points or curve.points
		data.thickness = data.thickness or curve.thickness
	end

	local lineToDraw = love.math.newBezierCurve(data.points)
	lineToDraw = lineToDraw:render()

	love.graphics.setColor(data.color)

	for i = 1, #lineToDraw, 2 do
		local x, y = lineToDraw[i], lineToDraw[i + 1]

		love.graphics.circle("fill", x, y, data.thickness)
	end
end
