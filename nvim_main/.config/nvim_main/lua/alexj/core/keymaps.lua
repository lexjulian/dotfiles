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

-- insert mode
keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })

-- visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move the selected text up" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move the selected text down" })

-- paste mode
keymap.set("x", "<leader>p", "\"_dP", { desc = "Paste persistent clipboard" })

-- delete to void
keymap.set("n", "<leader>d", "\"_d")
keymap.set("v", "<leader>d", "\"_d")
