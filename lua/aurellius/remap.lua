
-- Set the leader key to space
vim.g.mapleader = " "

-- Execute the Ex command mode from normal mode with <leader>pv
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- In visual mode, move the selected lines down with J
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- In visual mode, move the selected lines up with K
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- In normal mode, join lines with J and return to the original position
vim.keymap.set("n", "J", "mzJ`z")

-- Scroll down half a page and center the cursor line
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Scroll up half a page and center the cursor line
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search forward for the next occurrence and center the cursor line
vim.keymap.set("n", "n", "nzzzv")

-- Search backward for the previous occurrence and center the cursor line
vim.keymap.set("n", "N", "Nzzzv")

-- Start a "Vim with me" session
vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)

-- Stop a "Vim with me" session
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- In visual mode, cut the selected text and paste it before the cursor with <leader>p
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yank (copy) to the system clipboard with <leader>y in both normal and visual modes
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

-- Yank (copy) the entire line to the system clipboard with <leader>Y in normal mode
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete without affecting the default register in both normal and visual modes with <leader>d
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Exit insert mode with Ctrl+C (not recommended as it overrides the default behavior)
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Disable the Q key in normal mode (Q usually enters Ex mode)
vim.keymap.set("n", "Q", "<nop>")

-- Open a new tmux window with a sessionizer using Ctrl+f
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Format the buffer using LSP with <leader>f
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Go to the next compiler error with Ctrl+k and center the cursor line
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")

-- Go to the previous compiler error with Ctrl+j and center the cursor line
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Go to the next LSP diagnostic with <leader>k and center the cursor line
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")

-- Go to the previous LSP diagnostic with <leader>j and center the cursor line
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Prepare a substitution command for the word under the cursor with <leader>s
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make the current file executable with <leader>x
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Open the packer.lua configuration file with <leader>vpp
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>")

-- Execute a CellularAutomaton command with <leader>mr
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

-- Reload the current vim configuration with double leader key
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
