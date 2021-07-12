-- Dependencies are listed next to their relative library

local libs = {
	"global",
	"decor/core" -- global
}

for _,lib in pairs(libs) do
	require("libraries/" .. lib)
end

