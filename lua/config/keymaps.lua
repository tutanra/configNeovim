-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

-- Redefine Ctrl+s to save with the custom function
vim.api.nvim_set_keymap("n", "<C-s>", ":lua SaveFile()<CR>", { noremap = true, silent = true })
-- Custom save function
function SaveFile()
  -- Check if a buffer with a file is open
  if vim.fn.empty(vim.fn.expand("%:t")) == 1 then
    vim.notify("No file to save", vim.log.levels.WARN)
    return
  end

  local filename = vim.fn.expand("%:t") -- Get only the filename
  local success, err = pcall(function()
    vim.cmd("silent! write") -- Try to save the file without showing the default message
  end)

  if success then
    vim.notify(filename .. " Saved!") -- Show only the custom message if successful
  else
    vim.notify("Error: " .. err, vim.log.levels.ERROR) -- Show the error message if it fails
  end
end

-- Delete all buffers but the current one
vim.keymap.set(
  "n",
  "<leader>bq",
  '<Esc>:%bdelete|edit #|normal`"<Return>',
  { desc = "Delete other buffers but the current one" }
)

-- Code Companion
vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>oa", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])

-- Delete all marks
vim.keymap.set("n", "<leader>md", function()
  vim.cmd("delmarks!")
  vim.cmd("delmarks A-Z0-9")
  vim.notify("All marks deleted")
end, { desc = "Delete all marks" })

-- Creación de ejecución de una aplicación node
local job = nil
vim.api.nvim_create_user_command("NodeStart", function()
  if job then
    job:kill(15)
  end
  job = vim.system({ "npm", "start" }, {}, function(out)
    if out.code > 0 then
      vim.notify("Error en ejecución", out.stderr)
    end
  end)
end, {})

vim.api.nvim_create_user_command("NodeStop", function()
  -- Check if the job exists before trying to kill it
  if job then
    job:kill(15)
  else
    vim.notify("No hay un proceso Node en ejecución.")
  end
end, {})
vim.keymap.set({ "n" }, "<F5>", ":NodeStart<CR>", {})
vim.keymap.set({ "n" }, "<S-F5>", ":NodeStop<CR>", {})
vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
  callback = function()
    -- Only try to kill the job if it actually exists
    if job then
      job:kill(15)
    end
  end,
})
