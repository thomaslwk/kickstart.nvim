local function safe_buffer_previous()
  if vim.bo.filetype ~= 'neo-tree' then
    vim.cmd 'bprevious'
  end
end

local function safe_buffer_next()
  if vim.bo.filetype ~= 'neo-tree' then
    vim.cmd 'bnext'
  end
end

return {
  -- Use jk to escape
  vim.keymap.set('i', 'jk', '<ESC>', {}),

  -- Use Shift+H to go to the previous buffer
  --  vim.keymap.set('n', 'H', ':bprevious<CR>', { desc = 'Go to previous buffer' }),
  -- Use Shift+L to go to the next buffer
  -- vim.keymap.set('n', 'L', ':bnext<CR>', { desc = 'Go to next buffer' }),
  -- Function to conditionally navigate buffers

  -- Keymaps with conditional checks
  vim.keymap.set('n', 'H', safe_buffer_previous, { desc = 'Go to previous buffer (unless in Neo-tree)' }),
  vim.keymap.set('n', 'L', safe_buffer_next, { desc = 'Go to next buffer (unless in Neo-tree)' }),

  -- Close the current buffer but don't close window
  vim.keymap.set('n', '<leader>qd', ':bdelete<CR>', { noremap = true, silent = true })

}
