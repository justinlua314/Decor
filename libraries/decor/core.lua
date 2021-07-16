decor = {
	currentPainting = nil,
	auto = true,
	modtime = nil,
	render = love.graphics.newCanvas(),
	posts = {},
	time = 0,
	edit = false
}

function decor.editing(bool)
	decor.edit = bool
	if bool then love.graphics.setCanvas(decor.render); return end
	love.graphics.setCanvas()
end

function decor.frame(painting)
	local ok, chunk, result

	ok, chunk = pcall(love.filesystem.load, ("paintings/" .. painting .. ".lua"))

	if not ok then
		print("Error1: " .. tostring(chunk))
	else
		ok, result = pcall(chunk)

		if not ok then
			print("Error2: " .. tostring(result))
		else
			decor.modtime = love.filesystem.getInfo("paintings/" .. painting .. ".lua").modtime
			decor.currentPainting = painting
			love.graphics.setCanvas(decor.render)
			love.graphics.clear()
			chunk()
			love.graphics.setCanvas()
		end
	end
end

function decor.load()
	for _,file in pairs(love.filesystem.getDirectoryItems("libraries/decor")) do
		if love.filesystem.getInfo("libraries/decor/" .. file).type == "directory" then
			for _,tool in pairs(love.filesystem.getDirectoryItems("libraries/decor/" .. file)) do
				if tool:sub(-4) == ".lua" and tool ~= "canvas.lua" then
					require("libraries/decor/" .. file .. "/" .. tool:sub(1, -5))
				end
			end

			-- Requiring canvas last so that it may reference all other decor tools regardless of load order.
			require("libraries/decor/structures/canvas")
		end
	end
end

function decor.update(dt)
	decor.updatePosts(dt) -- decor/structures/post

	decor.time = (decor.time + dt)
	
	if decor.time > 1 then
		decor.time = (decor.time - 1)

		if decor.currentPainting then
			decor.refresh(decor.currentPainting)
		end
	end
end

function decor.draw()
	if decor.edit == true then return end
	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(decor.render)
end

function decor.keypressed(key)
	for _,post in pairs(decor.posts) do
		if post.key and post.key == key then
			post.active = not post.active
		end
	end
end

function decor.refresh(painting)
	local n = love.filesystem.getInfo("paintings/" .. painting .. ".lua").modtime
	if n ~= decor.modtime then
		decor.frame(painting)
	end
end
