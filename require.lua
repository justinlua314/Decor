-- Dependencies are listed next to their relative library

local libs = {
	"global",
	"decor/core",
	"shutter"		-- decor/core
}

for _,lib in pairs(libs) do
	require("libraries/" .. lib)
end

