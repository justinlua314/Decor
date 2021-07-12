-- This doesn't work the way I want it to

local function acid()
	local patches = {}

	for patch = 1, love.math.random(5) do
		
	end

	local im = decor.render:newImageData()

	for row = (im:getHeight() - 1), 4, -1 do
		for column = 1, (im:getWidth() - 1) do
			local y = love.math.random(3)
			local r, g, b, a = im:getPixel(column, (row - y))
			im:setPixel(column, row, r, g, b, a)

			if love.math.random(10) == 2 then
				im:setPixel(column, (row - y), 0, 0, 0, 0)
			end
		end
	end

	im = love.graphics.newImage(im)
	
	love.graphics.setCanvas(decor.render)
	love.graphics.clear()
	love.graphics.draw(im)
	love.graphics.setCanvas()
end

return acid
