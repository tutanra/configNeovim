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
