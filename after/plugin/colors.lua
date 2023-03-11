function SetupColor(color)
	color = color or "habamax"
	vim.cmd.colorscheme(color)

	-- does not set transparent background
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

SetupColor()
