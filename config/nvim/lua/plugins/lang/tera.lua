vim.treesitter.query.add_directive("tera-host!", function(_, _, bufnr, _, metadata)
    local name = vim.api.nvim_buf_get_name(tonumber(bufnr) or 0)
    local ext = name:match("%.([%w_]+)%.tera$")
    local ft = ext and vim.filetype.match({ filename = "x." .. ext })
    metadata["injection.language"] = ft and vim.treesitter.language.get_lang(ft) or ext
end, { force = true })

return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = { ensure_installed = { "tera", "html" } },
    },
}
