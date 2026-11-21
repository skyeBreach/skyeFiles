vim.filetype.add({
    pattern = {
        [".*/dunst/dunstrc"] = { "dosini", { priority = 10 } },
        [".*/dunst/dunstrc%.d/.*%.conf"] = { "dosini", { priority = 10 } },
    },
})

return {}
