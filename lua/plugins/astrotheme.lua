return {
  "AstroNvim/astrotheme",
  opts = {
    style = {
      transparent = false, -- Bool value, toggles transparency.
      inactive = false, -- Bool value, toggles inactive window color.
      float = true, -- Bool value, toggles floating windows background colors.
      neotree = true, -- Bool value, toggles neo-trees background color.
      border = true, -- Bool value, toggles borders.
      title_invert = false, -- Bool value, swaps text and background colors.
      italic_comments = false, -- Bool value, toggles italic comments.
      simple_syntax_colors = false, -- Bool value, simplifies the amounts of colors used for syntax highlighting.
    },
    plugins = { -- Allows for individual plugin overrides using plugin name and value from above.
      ["bufferline.nvim"] = false,
    },
  },
}
