local diraddon = require("telescope").load_extension("dir")
local builtin = require('telescope.builtin')

vim.keymap.set("n", "<leader>sd", "<cmd>GrepInDirectory<CR>", { noremap = true, silent = false} )
vim.keymap.set("n", "<leader>sf", "<cmd>FileInDirectory<CR>", { noremap = true, silent = false })

vim.keymap.set('n', '<leader>ts', builtin.treesitter, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>sd', function() builtin.grep_string ({ cwd = vim.fn.expand('%:p:h') }) end, {})
-- vim.keymap.set('n', '<leader>fs', require("telescope").extensions.live_grep_args.live_grep_args, { noremap = true })
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })

vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch Current [W]ord' })

-- vim.keymap.set('n', '<leader>fs', function()
--      builtin.grep_string({ search = vim.fn.input("Grep > ") });

--: don't preview binaries
local previewers = require("telescope.previewers")
local Job = require("plenary.job")
local new_maker = function(filepath, bufnr, opts)
  filepath = vim.fn.expand(filepath)
  Job:new({
    command = "file",
    args = { "--mime-type", "-b", filepath },
    on_exit = function(j)
      local mime_type = vim.split(j:result()[1], "/")[1]
      if mime_type == "text" then
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
      else
        -- maybe we want to write something to the buffer here
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
        end)
      end
    end
  }):sync()
end

require("telescope").setup {
  defaults = {
    buffer_previewer_maker = new_maker,
  }
}
