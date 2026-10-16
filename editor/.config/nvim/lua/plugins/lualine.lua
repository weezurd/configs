-- Status bar styled after VS Code Light Modern (bar #f8f8f8, text #3b3b3b)
local bar = { fg = "#3b3b3b", bg = "#f8f8f8" }
local mid = { fg = "#3b3b3b", bg = "#e8e8e8" }

local function mode(color)
  return { a = { fg = "#ffffff", bg = color, gui = "bold" }, b = mid, c = bar }
end

return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.options.theme = {
      normal = mode("#005fb8"),
      insert = mode("#16825d"),
      visual = mode("#af00db"),
      replace = mode("#d13438"),
      command = mode("#bf8803"),
      inactive = { a = bar, b = bar, c = bar },
    }
  end,
}
