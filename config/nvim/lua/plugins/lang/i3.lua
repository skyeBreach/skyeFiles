vim.filetype.add({
    pattern = {
        [".*/i3/config%.d/.*%.conf"] = "i3config",
        [".*/i3/betterlockscreenrc"] = "bash",
        [".*/betterlockscreen/betterlockscreenrc"] = "bash",
    },
})

return {}
