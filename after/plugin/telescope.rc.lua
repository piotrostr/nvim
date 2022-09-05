local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
        ["v"] = actions.select_vertical,
        ["s"] = actions.select_horizontal,
        ["t"] = actions.select_tab,
      },
    },
  },
  extensions = {
    file_browser = {
      hidden = true,
      initial_mode = 'normal',
      startinsert = false,
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          ["%"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["D"] = fb_actions.remove,
          ["R"] = fb_actions.rename,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case"
    }
  },
}

telescope.load_extension("file_browser")
telescope.load_extension("fzf")

vim.keymap.set('n', ';f',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)
vim.keymap.set('n', ';r', function()
  builtin.live_grep()
end)
vim.keymap.set('n', '\\\\', function()
  builtin.buffers()
end)
vim.keymap.set('n', ';t', function()
  builtin.help_tags()
end)
vim.keymap.set('n', ';;', function()
  builtin.resume()
end)
vim.keymap.set('n', ';d', function()
  builtin.diagnostics()
end)
vim.keymap.set("n", ";s", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
  })
end)
