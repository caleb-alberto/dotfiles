return {
    {
        "iruzo/matrix-nvim",
        name = "matrix",
        lazy = false;
        config = function()
        end
    },
    {
        "blazkowolf/gruber-darker.nvim",
        name = "gruber-darker",
        lazy = false;
        config = function ()
        end
    },
    {
        "ficcdaf/ashen.nvim",
        name = "ashen",
        lazy = false;
        config = function()
        end
    },
    {
        "mellow-theme/mellow.nvim",
        name = "mellow",
        lazy = false;
        config = function()
        end
    },
	{
		"erikbackman/brightburn.vim",
        name = "brightburn";
        lazy = false;
        config = function()
        end
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
                    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" }),
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
            vim.opt.background = "dark" -- or "dark" depending on your preference
        end,
    },
	{
		"morhetz/gruvbox",
		name = "gruvbox",
        priority = 1000,
        lazy = false,
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
        name = "everforest",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
		end,
	},

}
