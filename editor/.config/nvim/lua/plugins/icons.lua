-- vscode-icons-style colors for mini.icons (colors taken from the vscode-icons
-- extension's SVGs; pale ones darkened to stay readable on a white background)
local colors = {
  -- files / extensions
  ts = "#007acc", js = "#c7a600", json = "#c7a600", py = "#3776ab",
  md = "#42a5f5", html = "#e44d26", css = "#1572b6", sh = "#a68a00",
  go = "#00acd7", lua = "#3b6ea5", java = "#5382a1", rs = "#a04f12",
  yaml = "#cb171e", c = "#005f91", cpp = "#984c93", toml = "#9c4221",
  docker = "#00acd3", git = "#dd4c35", npm = "#c12127", text = "#829ec2",
  config = "#6d8f9b",
  -- folders
  folder = "#c09553", src = "#0fa958", node = "#6a9f3a", github = "#6e6e6e",
  test = "#e57373", docs = "#42a5f5", dist = "#f0a000", public = "#4caf50",
  assets = "#8d8d8d", components = "#f39c12", vscode = "#5594bf",
}

local function define_highlights()
  for name, fg in pairs(colors) do
    vim.api.nvim_set_hl(0, "VsIcon_" .. name, { fg = fg })
  end
end

local function hl(name) return { hl = "VsIcon_" .. name } end

return {
  "nvim-mini/mini.icons",
  opts = function(_, opts)
    define_highlights()
    vim.api.nvim_create_autocmd("ColorScheme", { callback = define_highlights })

    local ext = {
      ts = "ts", tsx = "ts", js = "js", jsx = "js", mjs = "js", cjs = "js",
      json = "json", jsonc = "json", py = "py", md = "md", html = "html",
      css = "css", scss = "css", sh = "sh", bash = "sh", zsh = "sh",
      go = "go", lua = "lua", java = "java", rs = "rs", yaml = "yaml",
      yml = "yaml", c = "c", h = "c", cpp = "cpp", hpp = "cpp", toml = "toml",
      txt = "text", conf = "config", ini = "config",
    }
    local files = {
      [".gitignore"] = "git", [".gitattributes"] = "git", [".gitmodules"] = "git",
      ["package.json"] = "npm", ["package-lock.json"] = "npm",
      ["Dockerfile"] = "docker", ["docker-compose.yml"] = "docker",
    }
    local dirs = {
      src = "src", node_modules = "node", [".git"] = "git", [".github"] = "github",
      test = "test", tests = "test", docs = "docs", dist = "dist", build = "dist",
      public = "public", config = "config", assets = "assets",
      components = "components", [".vscode"] = "vscode",
    }

    opts.extension = opts.extension or {}
    for k, v in pairs(ext) do opts.extension[k] = hl(v) end
    opts.file = opts.file or {}
    for k, v in pairs(files) do opts.file[k] = hl(v) end
    opts.directory = opts.directory or {}
    for k, v in pairs(dirs) do opts.directory[k] = hl(v) end
    opts.default = vim.tbl_deep_extend("force", opts.default or {}, {
      directory = hl("folder"),
    })
  end,
}
