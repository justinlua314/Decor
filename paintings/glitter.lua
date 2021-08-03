rects = {
	count = 10000,
	speed = 0.01,

	list = {}
}

for i = 1,rects.count do
	table.insert(rects.list, {
		x = love.math.random(global.screen.w),
		y = love.math.random(global.screen.h),
		color = global.color.random(),
		target = global.color.random()
	})

	decor.rectangle({
		x = rects.list[i].x,
		y = rects.list[i].y,
		width = 20,
		height = 20,
		color = rects.list[i].color
	})
end

local function shift()
	decor.editing(true)
	love.graphics.clear()

	for _,rect in pairs(rects.list) do
		rect.color, finished = global.color.shift(rect.color, rect.target, rects.speed)
		if finished then rect.target = global.color.random() end

		decor.rectangle({
			x = rect.x,
			y = rect.y,
			width = 20,
			height = 20,
			color = rect.color
		})
	end

	decor.editing(false)
end

decor.postProcess({
	id = "shift",
	func = shift,
	active = false,
	key = "space"
})
