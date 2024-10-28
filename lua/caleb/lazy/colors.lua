function ColorMyPencils(color)
	color = color or "zenbones"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {

	{
		"erikbackman/brightburn.vim",
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		opts = {},
	},
    {
        "aktersnurra/no-clown-fiesta.nvim",
        name = "no-clown-fiesta",
        lazy = false,
        config = function()
            -- You can set options for the colorscheme here if needed
            require("no-clown-fiesta").setup({
                styles = {
                    comments = { italic = true }, -- Example of setting italic for comments
                    functions = { bold = true }, -- Example of making functions bold
                    keywords = { italic = true }, -- Example of setting italic for keywords
                    variables = { italic = false }, -- Example of regular variables
                    -- Add more styles as needed
                },
            })

            -- Call your custom function to apply colors and settings
        end,
    },
    {
        "zenbones-theme/zenbones.nvim", -- Correct repository for zenbones.nvim
        name = "zenbones",
        lazy = false,
        dependencies = {
            "rktjmp/lush.nvim"
        },
        config = function()
            -- Optional: Set global Neovim options related to the theme
            vim.opt.background = "light" -- or "dark" depending on your preference
            ColorMyPencils()
        end,
    },
	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		config = function()
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = false,
				bold = true,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					operators = false,
					folds = false,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = false,
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
				transparent = true, -- Enable this to disable setting the background color
				terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
				styles = {
					-- Style to be applied to different syntax groups
					-- Value is any valid attr-list value for `:help nvim_set_hl`
					comments = { italic = false },
					keywords = { italic = false },
					-- Background styles. Can be "dark", "transparent" or "normal"
					sidebars = "dark", -- style for sidebars, see below
					floats = "dark", -- style for floating windows
				},
			})
		end
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require('rose-pine').setup({
				disable_background = true,
				styles = {
					italic = false,
				},
			})
		end
	},

	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
		end,
	},

}
