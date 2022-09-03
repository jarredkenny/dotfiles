local map = vim.api.nvim_set_keymap

map("n", "<leader>\\", [[:NvimTreeToggle<CR>]], {})
map("n", "<leader>/", [[:CommentToggle<CR>]], {})
map("v", "<leader>/", [[:CommentToggle<CR>]], {})
map("n", "<leader>n", [[:DashboardNewFile<CR>]], {})
map("n", "<leader>t", [[:ToggleTerm<CR>]], {})
map("n", "<leader>ff", [[:Telescope find_files<CR>]], {})
map("n", "<leader>fg", [[:Telescope live_grep<CR>]], {})
map("n", "<leader>fb", [[:Telescope buffers<CR>]], {})
