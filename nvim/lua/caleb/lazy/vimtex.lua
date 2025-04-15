return {
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    vim.g.vimtex_quickfix_enabled = 1
    vim.g.vimtex_quickfix_ignore_filters = {
      "Underfull",
      "Overfull",
      "LaTeX Warning:.*",
    }
    vim.g.vimtex_quickfix_open_on_warning = 0
    vim.g.vimtex_view_method = "zathura"
  end
}
