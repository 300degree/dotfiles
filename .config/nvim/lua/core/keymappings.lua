local keymap = vim.keymap.set
local opts = { silent = true }

-- Modes --
-- normal_mode = "n"
-- insert_mode = "i"
-- visual_mode = "v"

-- Normal --
keymap("n", "w", "<CMD>update<CR>")
keymap("n", "q", "<CMD>q!<CR>")

-- Insert --
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- keymap("", "", "", opt)

-- Plugins --

-- Nvim-Tree
keymap("n", "<C-f>", "<CMD>NvimTreeToggle<CR>", opts)

-- BufferLine --
keymap("n", "<S-l>", "<CMD>BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", "<CMD>BufferLineCyclePrev<CR>", opts)
keymap("n", "<C-w>", "<CMD>BufferLineCloseRight<CR>", opts)

-- Telescope --
keymap("n", "ff", "<CMD>Telescope find_files<CR>", opts)
keymap("n", "fp", "<CMD>Telescope projects<CR>", opts)
keymap("n", "gt", "<CMD>Telescope git_status<CR>", opts)
keymap("n", "cm", "<CMD>Telescope git_commits<CR>", opts)
