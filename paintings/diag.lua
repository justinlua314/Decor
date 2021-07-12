local pallet = {}

local thickness = 10
local variety = 100

for col = 1,variety do
	table.insert(pallet, global.color.random())
end

local currentCol = 1
local rowCol = 1

for row = 1,1000,thickness do
	for column = 1,1000,thickness do
		decor.rectangle({
			color = pallet[currentCol],
			x = column, y = row,
			width = thickness, height = thickness
		})

		currentCol = (currentCol + 1)
		if currentCol > #pallet then currentCol = 1 end
	end

	if rowCol < #pallet then
		currentCol = (rowCol + 1)
	else
		currentCol = 1
	end

	rowCol = currentCol
end
