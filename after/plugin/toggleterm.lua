require("toggleterm").setup {
    start_in_insert = true,
    autochdir = true,
    direction = 'float'
}

vim.keymap.set('n', '<leader>co', "<cmd>ToggleTerm size=10 direction='float'<CR>")

-- TODO: find how to persist a single terminal so a new one is not created when it loads from a different location (unless desired)
-- NOTE: do this by setting hidden


-- local function is_git_repo()
--    local is_repo = vim.fn.system("git rev-parse --is-inside-work-tree")
--
--     return vim.v.shell_error = 0
-- end
-- 
-- packer.nvim: Error running config for toggleterm.nvim: [string "..."]:0: attempt to call a nil value
--
--
      -- config = function()
          -- require("toggleterm").setup()
      -- end
