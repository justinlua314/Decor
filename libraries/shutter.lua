shutter = {
	count = 0,
	rate = 0,

	time = 0,
	iteration = 1,
	albumTitle = nil
}

-- Call this to take screenshots
function shutter.snap(count, albumTitle, rate)
	if decor.auto then
		count = count or 1
		albumTitle = albumTitle or "Unnamed"
		rate = rate or 0.01
	end

	--[[
	With very simple paintings on slow hdds
	0 is too fast for Love 2d to write the screenshots.
	0.01 seems consistant in testing.
	]]

	if rate < 0.01 then rate = 0.01 end

	shutter.albumTitle = albumTitle
	shutter.count = count
	shutter.rate = rate
end

-- On Windows screenshots are stored in User/AppData/Roaming/LOVE/decor
function shutter.screenshot()
	if not love.filesystem.getInfo(shutter.albumTitle) then
		love.filesystem.createDirectory(shutter.albumTitle)
	end

	print(shutter.iteration)
	love.graphics.captureScreenshot(
		shutter.albumTitle.."/"..tostring(shutter.iteration)..".png"
	)

	if shutter.count > 0 then
		print("Screenshot taken, " .. tostring(shutter.count) .. " remaining.")
	else
		print("Screenshot taken. Shutter snap complete.")
	end

	shutter.iteration = (shutter.iteration + 1)
	decor.frame(decor.currentPainting)
end

function shutter.update(dt)
	if shutter.count == 0 then return end

	shutter.time = (shutter.time - dt)
	
	if shutter.time <= 0 then
		shutter.screenshot()
		shutter.count = (shutter.count - 1)

		if shutter.count > 0 then
			shutter.time = (shutter.time + shutter.rate)
		else
			shutter.time = 0
			shutter.iteration = 1
		end
	end
end
