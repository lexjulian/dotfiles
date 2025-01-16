vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap

-- normal mode
keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Netrw File Explorer" })
keymap.set("n", "<leader>ss", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<leader>qd", "<cmd>bdelete<cr>", { desc = "Delete Buffer" })
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move Left" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move Down" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move Up" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move Right" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Moves down and center the screen simultaneuosly" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Moves up and center the screen simultaneuosly" })
keymap.set("n", "n", "nzzzv", { desc = "Move to the next search and centers the screen" })
keymap.set("n", "N", "Nzzzv", { desc = "Move to the previous search and centers the screen" })
keymap.set("n", "<leader>ya", ":%y+<CR>", { desc = "Yank the entire contents of the file" })
keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })
keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
keymap.set("n", "<F2>", "<C-z>", { desc = "Minimize Editor" })
keymap.set("n", "<leader>tt", "<cmd>vsplit | terminal<cr>", { desc = "Open terminal on the left side" })

-- Obsidian
keymap.set("n", "<leader>odd", ":w<cr>:!rm '%:p'<cr>:bd<cr>") -- delete current note
keymap.set("n", "<leader>od", ":ObsidianTemplate (OBSIDIAN) Daily<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>") -- new daily note
keymap.set("n", "<leader>on", ":ObsidianTemplate (OBSIDIAN) Notes<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>") -- new standard note
keymap.set("n", "<leader>ot", "gg3G$", { desc = "Go to top, down 3 lines, and end of line" })

-- insert mode
keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })

-- visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move the selected text up" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move the selected text down" })

-- terminal mode
keymap.set("t", "jj", [[<C-\><C-n>]], { desc = "Normal mode in Terminal" })

-- paste mode
keymap.set("x", "<leader>p", "\"_dP", { desc = "Paste persistent clipboard" })

-- delete to void
keymap.set("n", "<leader>d", "\"_d")
keymap.set("v", "<leader>d", "\"_d")

-- keymaps from plugins
-- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
-- vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
-- vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
-- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
-- vim.keymap.set({ "n", "v" }, "<leader>gf", { desc = "Formats file" }
-- vim.keymap.set("n", "<leader>e", function() toggle_telescope(harpoon:list()) end,
--     { desc = "Open harpoon window" })
-- vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
-- -- Remove item from the list and close the buffer
-- vim.keymap.set("n", "<leader>hx", function()
--     harpoon:list():remove()
--     vim.cmd("bdelete")
-- end)
-- vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end)
-- vim.keymap.set("n", "<leader>h5", function() harpoon:list():select(5) end)
-- vim.keymap.set('n', '<leader>fu', vim.cmd.UndotreeToggle)
-- keymap.set("n", "<leader>fa", builtin.find_files, { desc = "Fuzzy find files in cwd" })
-- keymap.set("n", "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Fuzzy find in files" })
-- keymap.set("n", "<leader>ff", builtin.git_files, { desc = "Search in git files" })
-- keymap.set("n", "<leader>ps", function()
--     builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end)
