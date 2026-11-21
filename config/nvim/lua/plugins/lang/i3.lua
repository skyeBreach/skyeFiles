vim.filetype.add({
    pattern = {
        [".*/i3/config%.d/.*%.conf"] = "i3config",
        [".*/betterlockscreen/betterlockscreenrc"] = "bash",
    },
})

return {}
