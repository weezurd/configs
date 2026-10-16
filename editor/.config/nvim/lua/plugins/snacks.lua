return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        files = { hidden = true }, -- Find Files includes dotfiles (toggle with <A-h>)
        explorer = {
          hidden = true, -- explorer shows dotfiles (toggle with H)
          -- The explorer is a picker whose list window maps <C-p> to "list_up";
          -- make it open Find Files like everywhere else.
          win = {
            list = {
              keys = {
                ["<c-p>"] = { function() LazyVim.pick("files")() end, desc = "Find Files (Root Dir)" },
              },
            },
          },
        },
      },
    },
  },
}
