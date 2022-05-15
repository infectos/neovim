require'nvim-tree'.setup {
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
    }
}
