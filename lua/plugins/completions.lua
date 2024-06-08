return {
  {
    "hrsh7th/cmp-nvim-lsp",
    lazy = true,
  },
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node
      -- keymaps
      vim.keymap.set({ "i" }, "<C-L>", function() ls.expand() end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-K>", function() ls.jump(1) end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true })
      -- snippets
      ls.add_snippets("lua", {
        s("which-key", {
          t({ [[local wk = require("which-key")]], "wk.register({" }),
          t({ "", "  " }),
          i(0, "keymaps"),
          t({ "", [[}, {prefix = "]] }),
          i(1, "prefix"),
          t([[" })]]),
        })
      })
      ls.add_snippets("cpp", {
        s("fuc", {
          t({ "auto " }),
          i(1, "fuc"),
          t({ [[ = [&](]] }),
          i(2, "args"),
          t({ [[) -> ]] }),
          i(3, "type"),
          t({ [[ {]], "" }),
          t({ [[    ]] }),
          i(0, "content"),
          t({ "", [[};]] }),
        })
      })
      ls.add_snippets("c", {
        s("fuc", {
          t({ "auto " }),
          i(1, "fuc"),
          t({ [[ = [&](]] }),
          i(2, "args"),
          t({ [[) -> ]] }),
          i(3, "type"),
          t({ [[ {]], "" }),
          t({ [[    ]] }),
          i(0, "content"),
          t({ "", [[};]] }),
        })
      })
      ls.add_snippets("rust", {
        s("fuc", {
          t({ "auto " }),
          i(1, "fuc"),
          t({ [[ = [&](]] }),
          i(2, "args"),
          t({ [[) -> ]] }),
          i(3, "type"),
          t({ [[ {]], "" }),
          t({ [[    ]] }),
          i(0, "content"),
          t({ "", [[};]] }),
        })
      })
      ls.add_snippets("python", {
        s("fuc", {
          t({ "auto " }),
          i(1, "fuc"),
          t({ [[ = [&](]] }),
          i(2, "args"),
          t({ [[) -> ]] }),
          i(3, "type"),
          t({ [[ {]], "" }),
          t({ [[    ]] }),
          i(0, "content"),
          t({ "", [[};]] }),
        })
      })
    end
  },
  {
    "hrsh7th/nvim-cmp",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
        })
      })
    end,
  }
}
