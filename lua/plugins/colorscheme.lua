return {
  {
    "rmehri01/onenord.nvim",
    lazy = false, --false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      require("onenord").setup() -- You can pass in your personal settings here.
      -- vim.cmd.colorscheme("night-owl")
    end,
  },
}
