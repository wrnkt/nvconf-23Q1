local todocomments = require("todo-comments")

require("todo-comments").setup {
    signs = true,
    keywords = {
        FIX = { icon = "🚧", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
        TODO = { icon = "🛠", color = "info" },
        HACK = { icon = "⚠️", color = "warning" },
        WARN = { icon = "⚠️", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = "📶", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = "🗒️", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING" } },
        PASS = { icon = "✅", color = "test", alt = { "PASSED" } },
        FAIL = { icon = "🚫", color = "test", alt = { "FAILED" } }
    },
    highlight = {
        multiline = true,
        multiline_pattern = "^.",
        multiline_context = 10,
        after = "fg"
    },
    colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" }
    }
}

vim.keymap.set('n', '<leader>tt', "<cmd>TodoTelescope<CR>")


vim.keymap.set("n", "]t", function()
        todocomments.jump_next()
    end,
    { desc = "Next todo comment" }
)

vim.keymap.set("n", "[t", function()
        todocomments.jump_prev()
    end,
    { desc = "Previous todo comment" }
)

