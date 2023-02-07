local bufferline = require('bufferline')

bufferline.setup({
    options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        numbers = "none",
        -- numbers = "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        --     close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
        --     right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        --     left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
        --     middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
        indicator = {
                    -- icon = '', -- this should be omitted if indicator style is not 'icon'
                    style = 'none',
            },
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        diagnostics = "nvim_lsp",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "center",
                separator = false
            }
        },
        color_icons = true, -- whether or not to add the filetype icon highlights
        -- show_buffer_icons = true, -- disable filetype icons for buffers
        --     show_buffer_close_icons = true | false,
        --     show_buffer_default_icon = true | false, -- whether or not an unrecognised filetype should show a default icon
        --     show_close_icon = true | false,
        --     show_tab_indicators = true | false,
        --     show_duplicate_prefix = true | false, -- whether to show duplicate buffer prefix
        --     persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        --     -- can also be a table containing 2 custom separators
        --     -- [focused and unfocused]. eg: { '|', '|' }
        --     separator_style = "slant" | "thick" | "thin" | { 'any', 'any' },
        --     enforce_regular_tabs = false | true,
        --     always_show_bufferline = true | false,
        --     hover = {
        --         enabled = true,
        --         delay = 200,
        --         reveal = {'close'}
        --     },
        --     sort_by = 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
        --         -- add custom logic
        --         return buffer_a.modified > buffer_b.modified
        --     end 
    }
})
