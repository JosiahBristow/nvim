return {
  'xeluxee/competitest.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  config = function()
    -- default language: c, cpp, rust, java, python, compiler and interpreter needed
    require('competitest').setup({
      -- runner_ui = {
      --  interface = 'split',
      -- },
      compile_command = {
        cpp = { exec = 'g++', args = { '$(FNAME)', '-std=c++20', '-g', '-o', '$(FNOEXT)' } },
        -- some_lang = { exec = 'some_compiler', args = { '$(FNAME)' } },
      },
      run_command = {
        cpp = { exec = './$(FNOEXT)' },
        python = { exec = 'python3', args = { '$(FNAME)' } }, -- if windows, delete this line
        -- some_lang = { exec = 'some_interpreter', args = { '$(FNAME)' } },
      },
      maximum_time = 2000,
      -- view_output_diff = true,
      template_file = {
        cpp = "~/Competitive Programming/template/head.cpp",
        py = "~/Competitive Programming/template/head.py",
      },
      -- CWD -> current working directory PROBLEM -> 	problem name
      -- details https://github.com/xeluxee/competitest.nvim#receive-modifiers
      received_problems_path = "$(HOME)/Competitive Programming/$(JUDGE)/$(CONTEST)/$(PROBLEM)/main.$(FEXT)",
      received_contests_directory = "$(HOME)/Competitive Programming/$(JUDGE)/$(CONTEST)",
      received_contests_problems_path = "$(PROBLEM)/main.$(FEXT)",
    })
    local wk = require("which-key")
    wk.register({
      t = {
        name = "Test",
        t = { "<cmd>CompetiTest run<CR>", "Run" },
        e = { "<cmd>CompetiTest edit_testcase<CR>", "Edit" },
        a = { "<cmd>CompetiTest add_testcase<CR>", "Add" },
        d = { "<cmd>CompetiTest delete_testcase<CR>", "Del" },
        r = { "<cmd>CompetiTest receive testcases<CR>", "Receive testcases" },
        p = { "<cmd>CompetiTest receive problem<CR>", "Receive problem" },
        c = { "<cmd>CompetiTest receive contest<CR>", "Receive contest" },
        u = { "<cmd>CompetiTest show_ui<CR>", "Show ui" },
        n = { "<cmd>CompetiTest run_no_compile<CR>", "Run No Compile" },
      }
    }, { prefix = "<leader>" })
  end
}
