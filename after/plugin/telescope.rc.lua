local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    initial_mode = 'normal',
    startinsert = false,
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
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["%"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["D"] = fb_actions.remove,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
  },
}

telescope.load_extension("file_browser")

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
vim.keymap.set('n', ';e', function()
  builtin.diagnostics()
end)
vim.keymap.set("n", ";s", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    layout_config = { height = 60 }
  })
end)
