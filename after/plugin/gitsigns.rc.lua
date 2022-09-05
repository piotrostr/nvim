require('gitsigns').setup {
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Actions

    -- git add
    map({ 'n', 'v' }, 'gha', ':Gitsigns stage_hunk<CR>')

    -- git restore
    map({ 'n', 'v' }, 'ghr', ':Gitsigns reset_hunk<CR>')

    -- git add whole file
    map('n', 'ghA', gs.stage_buffer)

    -- git reset whole file
    map('n', 'ghR', gs.reset_buffer)
    map('n', 'ghu', gs.undo_stage_hunk)

    -- show diff in nice popup
    map('n', 'ghd', gs.preview_hunk)

    -- show blame in nice popup
    map('n', 'ghb', function() gs.blame_line { full = true } end)

    -- compare the whole file
    map('n', 'ghc', function() gs.diffthis('~') end)

    -- Text object
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
