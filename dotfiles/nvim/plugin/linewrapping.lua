-- don't wrap to next line by default
vim.opt.wrap = false

local function enable_visual_nav()
	vim.opt_local.wrap = true
	vim.opt_local.linebreak = true
end

local function disable_visual_nav()
	vim.opt_local.wrap = false
	vim.opt_local.linebreak = false
end

local function apply_visual_nav_for_ft()
	local ft = vim.bo.filetype
	if ft == "text" or ft == "markdown" or ft == "tex" then
		enable_visual_nav()
	else
		disable_visual_nav()
	end
end

local function toggle_visual_nav()
	vim.b.visual_nav_enabled = not vim.b.visual_nav_enabled

	if vim.b.visual_nav_enabled then
		enable_visual_nav()
		print("Visual-line navigation ENABLED")
	else
		disable_visual_nav()
		print("Visual-line navigation DISABLED")
	end
end

-- Normal mode movement
vim.keymap.set("n", "j", function()
	if vim.b.visual_nav_enabled then
		local count = vim.v.count
		return "gj" .. (count > 1 and tostring(count - 1) or "")
	else
		return "j"
	end
end, { expr = true })

vim.keymap.set("n", "k", function()
	if vim.b.visual_nav_enabled then
		local count = vim.v.count
		return "gk" .. (count > 1 and tostring(count - 1) or "")
	else
		return "k"
	end
end, { expr = true })

vim.keymap.set("n", "0", function()
	return vim.b.visual_nav_enabled and "g0" or "0"
end, { expr = true })

vim.keymap.set("n", "$", function()
	return vim.b.visual_nav_enabled and "g$" or "$"
end, { expr = true })

-- Visual mode movement
vim.keymap.set("x", "j", function()
	return vim.b.visual_nav_enabled and "gj" or "j"
end, { expr = true })

vim.keymap.set("x", "k", function()
	return vim.b.visual_nav_enabled and "gk" or "k"
end, { expr = true })

vim.keymap.set("x", "0", function()
	return vim.b.visual_nav_enabled and "g0" or "0"
end, { expr = true })

vim.keymap.set("x", "$", function()
	return vim.b.visual_nav_enabled and "g$" or "$"
end, { expr = true })

-- Enable for specific filetypes
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "tex", "text" },
	callback = function()
		vim.b.visual_nav_enabled = true
		enable_visual_nav()
	end,
})

-- Set initial empty buffer to filetype text
vim.api.nvim_create_augroup("InitialEmptyBuffer", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
	group = "InitialEmptyBuffer",
	callback = function()
		if vim.fn.expand("%") == "" and vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
			vim.bo.filetype = "text"
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = apply_visual_nav_for_ft,
})

vim.api.nvim_create_user_command("ToggleVisualNav", toggle_visual_nav, {})
