for column = 1, 500 do
	for row = 1,500 do
		decor.rectangle({
			color = global.color.random(),
			x = (-1000 + (100 * column) + (50 * row) + love.math.random(-10, 10)),
			y = ((row - 1) * 50 + love.math.random(-10, 10)),
			width = 25,
			height = 200
		})
	end
end
