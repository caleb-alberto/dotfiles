return {
    "nvim-telescope/telescope.nvim", 

    tag = "0.1.8",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function() 
        require('telescope').setup({})
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {desc = "Search [F]iles"})
        vim.keymap.set('n', '<leader>gf', builtin.git_files, {desc = "Git [F]iles"})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, {desc = "Grep [S]earch"})
        vim.keymap.set('n', '<leader>ph', builtin.help_tags, {desc = "Search [H]elp"})
    end
}
