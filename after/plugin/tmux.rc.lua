-- tmux bindings
require'tmux'.setup{
    copy_sync = {
        enable = false,
        ignore_buffers = { empty = false },
        redirect_to_clipboard = true,
        register_offset = 0,
        sync_clipboard = true,
        sync_deletes = true,
        sync_unnamed = true,
    },
    navigation = {
        cycle_navigation = true,
        enable_default_keybindings = true,
        persist_zoom = false,
    }
}
