function decor.postProcess(data)
	if decor.auto then
		data.id = data.id or "Generic"
		data.func = data.func or function() end
		data.time = data.time or 0
		
		-- Have to do this in a dumb way because it's a boolean
		if data.active == nil then data.active = true end
	end

	data.ticker = data.time
	decor.posts[data.id] = data
end

function decor.updatePosts(dt)
	for _,process in pairs(decor.posts) do
		if process.active then
			if process.time > 0 then
				process.ticker = (process.ticker - dt)

				if process.ticker <= 0 then
					process.ticker = (process.ticker + process.time)
					process.func()
				end
			else
				process.func()
			end
		end
	end
end
