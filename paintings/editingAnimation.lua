local function big()
	decor.editing(true)
	decor.circle({
		color = global.color.random(),
		x = love.math.random(-5, global.screen.w),
		y = love.math.random(-5, global.screen.h),
		radius = 20
	})
	decor.editing(false)
end

decor.postProcess({
	id = "circleslmao",
	func = big
})
