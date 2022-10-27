require'nvim-tree'.setup {
    auto_reload_on_write = true,
    diagnostics = {
        enable = true,
    },
    view = {
        preserve_window_proportions = true,
    },
    actions = {
        open_file = {
            resize_window = true,
        }
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 400,
    }
}
