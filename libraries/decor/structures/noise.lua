local noise = {
	colors = {},
	x = 0, y = 0,
	width = 0, height = 0,
	density = 1,
	spread = 1,
	shade = 1,
	shape = "rectangle",
	rotation = 0,
	pixelRotation = 0
}

function decor.noise(data)
	if decor.auto then
		data = data or {}
		data.colors = data.colors or {{0, 0, 0}, {1, 1, 1}}
		data.x = data.x or noise.x
		data.y = data.y or noise.y
		data.width = data.width or noise.width
		data.height = data.height or noise.height
		data.density = data.density or noise.density
		data.spread = data.spread or noise.spread
		data.shade = data.shade or noise.shade
		data.shape = data.shape or noise.shape
		data.rotation = data.rotation or noise.rotation
		data.pixelRotation = data.pixelRotation or noise.pixelRotation
	end

	love.graphics.rotate(math.rad(data.rotation))

	for column = 1, data.height, data.density do
		for row = 1, data.width, data.density do
			local highlight = 1


			highlight = love.math.noise(love.math.random())
			if highlight < data.shade then highlight = data.shade end

			local col = data.colors[love.math.random(#data.colors)]
			table.insert(col, 4, highlight)
			love.graphics.setColor(col)

			local xPoint = (data.x + row)
			local yPoint = (data.y + column)

			if data.pixelRotation ~= 0 then
				love.graphics.rotate(math.rad(love.math.random(data.pixelRotation)))
			end

			if data.shape == "rectangle" then
				love.graphics.rectangle("fill", xPoint, yPoint, love.math.random(data.spread), love.math.random(data.spread))
			elseif data.shape == "circle" then
				love.graphics.circle("fill", xPoint, yPoint, love.math.random(data.spread))
			end
		end
	end

	love.graphics.origin()
end
