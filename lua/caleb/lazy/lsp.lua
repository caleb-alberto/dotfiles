return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',  -- LSP source for nvim-cmp
      'hrsh7th/nvim-cmp',  -- Completion plugin
      'hrsh7th/cmp-buffer',  -- Buffer completions
      'hrsh7th/cmp-path',  -- Path completions
      'hrsh7th/cmp-nvim-lua',  -- Lua completions
      'saadparwaiz1/cmp_luasnip',  -- Snippet completions
      'L3MON4D3/LuaSnip',  -- Snippet engine
      'williamboman/mason.nvim',  -- Optional: automatic language server installation
      'williamboman/mason-lspconfig.nvim', -- Bridges Mason and LSP config
    },
    config = function()
      -- Set up nvim-cmp.
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'luasnip' },
        }
      })

      -- Reserve space in the gutter
      vim.opt.signcolumn = 'yes'

      -- Set up Mason
      require('mason').setup()

      -- Ensure language servers are installed
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls', 'ts_ls', 'pyright', 'rust_analyzer', 'clangd'}
      })

      -- Extend capabilities for nvim-cmp
      local lspconfig_defaults = require('lspconfig').util.default_config
      lspconfig_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lspconfig_defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
      )

      -- Set up LSP servers
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({cmd = {"/run/current-system/sw/bin/lua-language-server"}})
      lspconfig.ts_ls.setup({})
      lspconfig.pyright.setup({})
      lspconfig.clangd.setup({
                cmd = { "/run/current-system/sw/bin/clangd", "--background-index" },
                filetypes = { "c", "cpp", "objc", "objcpp", "h", "hpp" },
                root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".clangd", ".git"),
                settings = {
                    clangd = {
                        fallbackFlags = { "-std=c++14" },
                    },
                }, 
            })
      lspconfig.rust_analyzer.setup({})

      -- LSP keymaps when a server is attached
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local opts = { buffer = event.buf }

          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end, opts)
          vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
        end,
      })
    end,
  },
}
