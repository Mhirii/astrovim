return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = "right",
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_hidden = true,
        hide_by_name = {
          "node_modules",
        },
        always_show = { -- remains visible even if other settings would normally hide it
          ".env",
          "wrangler.toml",
        },
      },
    },
  },
}
