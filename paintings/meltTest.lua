decor.rectangle({
	color = {0.5, 0.5, 0.5},
	width = 500, height = 500
})

local f = require("posts.melt")

decor.postProcess({
	id = "melt",
	func = f,
	time = 0.1,
	active = false,
	key = "space"
})
