return {
  {
    "Civitasv/cmake-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
    ft = { "c", "cpp", "cmake" },
    config = function()
      require("cmake-tools").setup {
        cmake_command = "cmake",
        cmake_regenerate_on_save = true, -- Saves CMakeLists.txt file only if mofified.
        cmake_build_directory = "build",
        cmake_build_directory_prefix = "", -- when cmake_build_directory is "", this option will be activated
        cmake_generate_options = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1", "-G", "Ninja" },
        cmake_soft_link_compile_commands = true, -- if softlink compile commands json file
        cmake_compile_commands_from_lsp = false, -- automatically set compile commands location using lsp
        cmake_build_options = {},
        cmake_console_size = 10, -- cmake output window height
        cmake_console_position = "belowright", -- "belowright", "aboveleft", ...
        cmake_show_console = "always", -- "always", "only_on_error"
        cmake_kits_path = nil, -- global cmake kits path
        cmake_variants_message = {
          short = { show = true },
          long = { show = true, max_length = 40 },
        },

        cmake_dap_configuration = {
          name = "cpp",
          type = "codelldb",
          request = "launch",
          stopOnEntry = false,
          runInTerminal = true,
          console = "integratedTerminal",
        },
        cmake_always_use_terminal = false, -- if true, use terminal for generate, build, clean, install, run, etc, except for debug, else only use terminal for run, use quickfix for others
        cmake_quickfix_opts = {
          -- quickfix settings for cmake, quickfix will be used when `cmake_always_use_terminal` is false
          show = "always", -- "always", "only_on_error"
          position = "belowright", -- "bottom", "top"
          size = 10,
        },

        cmake_terminal_opts = {
          -- terminal settings for cmake, terminal will be used for run when `cmake_always_use_terminal` is false or true, will be used for all tasks except for debug when `cmake_always_use_terminal` is true
          name = "Main Terminal",
          prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
          split_direction = "horizontal", -- "horizontal", "vertical"
          split_size = 11,

          -- Window handling
          single_terminal_per_instance = true, -- Single viewport, multiple windows
          single_terminal_per_tab = true, -- Single viewport per tab
          keep_terminal_static_location = true, -- Static location of the viewport if avialable

          -- Running Tasks
          start_insert_in_launch_task = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
          start_insert_in_other_tasks = false, -- If you want to enter terminal with :startinsert upon launching all other cmake tasks in the terminal. Generally set as false
          focus_on_main_terminal = false, -- Focus on cmake terminal when cmake task is launched. Only used if cmake_always_use_terminal is true.
          focus_on_launch_terminal = false, -- Focus on cmake launch terminal when executable target in launched.
        },
      }
    end,
  },
}
