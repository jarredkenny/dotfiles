local map = vim.api.nvim_set_keymap

vim.g.mapleader = ","

map("n", "<leader>n", [[:NvimTreeToggle<CR>]], {})
map("n", "<leader>t", [[:ToggleTerm<CR>]], {})
map("v", "<leader>/", [[:CommentToggle<CR>]], {})
map("n", "<leader>/", [[:CommentToggle<CR>]], {})
map("n", "<leader>ff", [[:Telescope find_files<CR>]], {})
map("n", "<leader>fb", [[:Telescope buffers<CR>]], {})
map("n", "<leader>fg", [[:Telescope live_grep<CR>]], {})

map("n", "<C-S-Up>", "<Esc>:m ,-2<CR>==gi", {})
map("n", "<C-S-Down>", "<Esc>:m .+1<CR>==gi", {})
map("i", "<C-S-Up>", "<Esc>:m .-2<CR>==gi", {})
map("i", "<C-S-Down>", "<Esc>:m .+1<CR>==gi", {})
map("v", "<C-S-Up>", ":m >+1<CR>gv==gv", {})
map("v", "<C-S-Down>", ":m <-2<CR>gv==gv", {})
