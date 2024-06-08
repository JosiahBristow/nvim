return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local wk = require("which-key")
      wk.register({
        f = {
          name = "file",
          f = { "<cmd>Telescope find_files<cr>", "Find File" },
          r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
          g = { "<cmd>Telescope live_grep<cr>", "Serch In Text" },
        }
      }, { prefix = "<leader>" })
    end
  },
}
