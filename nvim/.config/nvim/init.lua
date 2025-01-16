require("alexj.core")
require("alexj.lazy")

-- Floating Terminal Setup
function FloatingTerminal()
  local current_file = vim.fn.expand('%:p') -- Get the full path of the current buffer
  local buf = vim.api.nvim_create_buf(false, true) -- Create a new buffer
  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = math.floor(vim.o.columns * 0.8),
    height = math.floor(vim.o.lines * 0.8),
    col = math.floor(vim.o.columns * 0.1),
    row = math.floor(vim.o.lines * 0.1),
    style = 'minimal',
    border = 'rounded'
  })

  local term_job_id = vim.fn.termopen(vim.o.shell, {
    on_exit = function()
      -- Close the terminal buffer when the process exits
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  })

  vim.cmd('startinsert') -- Enter insert mode
  vim.fn.chansend(term_job_id, "python " .. current_file .. "\n") -- Run the Python command
end

vim.api.nvim_set_keymap('n', '<leader>t', ':lua FloatingTerminal()<CR>', { noremap = true, silent = true })
