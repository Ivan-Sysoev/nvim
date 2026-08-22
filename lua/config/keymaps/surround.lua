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
	vim.keymap.set("v", "<leader>" .. key, function()
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("gsa" .. char, true, true, true), "m", true)
	end, { desc = "Surround selection with " .. char })
end
