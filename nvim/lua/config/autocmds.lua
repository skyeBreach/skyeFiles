-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- ================================================================================================================== --
-- Rulers/Color Columns

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",

    callback = function(_)
        local buf = vim.b[vim.api.nvim_get_current_buf()] or {}
        if buf and buf.rulers then
            vim.opt.colorcolumn = buf.rulers
        else
            vim.opt.colorcolumn = ""
        end
    end,
})

-- ================================================================================================================== --
-- FileType: Markdown

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.conceallevel = 0
    end,
})

-- ================================================================================================================== --
