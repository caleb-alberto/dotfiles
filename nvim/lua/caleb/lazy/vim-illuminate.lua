return {
    {
        "RRethy/vim-illuminate",
        lazy = false, -- Load on startup
        config = function()
            -- Default configuration for vim-illuminate
            require("illuminate").configure({
                delay = 120, -- Delay in ms before highlighting references
                filetypes_denylist = { "NvimTree", "packer", "lazy" }, -- Ignore these filetypes
                providers = { "lsp", "treesitter", "regex" }, -- Use these providers
            })

            -- Keymaps for navigating references
            vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>lua require"illuminate".goto_next_reference(false)<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<C-j>', '<cmd>lua require"illuminate".goto_prev_reference(false)<CR>', { noremap = true, silent = true })

            -- Highlight customization for subtle bordered effect
            vim.cmd([[
                hi def IlluminatedWordText guibg=#2e3440 guifg=NONE gui=underline
                hi def IlluminatedWordRead guibg=#2e3440 guifg=NONE gui=underline
                hi def IlluminatedWordWrite guibg=#2e3440 guifg=NONE gui=bold,underline
            ]])
        end,
    },
}
