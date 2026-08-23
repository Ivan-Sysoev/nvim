-- Better gsa setup
local visual_surrounds = {
	["`"] = "`",
	['"'] = '"',
	["'"] = "'",
	["("] = "(",
	[")"] = ")",
	["["] = "[",
	["]"] = "]",
	["{"] = "{",
	["}"] = "}",
}

for key, char in pairs(visual_surrounds) do
	vim.keymap.set("v", "g" .. key, "gsa" .. char, { remap = true, desc = "Surround selection with " .. char })
end
