local highlights = function(hl, c)
  hl["@string.documentation"] = { fg = c.yellow }
  -- hl["@comment.documentation"] = { fg = "#636da6", italic = false, style = { italic = false } }

  -- Smali
  hl["@parameter.builtin"] = { fg = "#efc890" }

  -- Rust
  hl["@lsp.typemod.function.defaultLibrary.rust"] = { link = "@function" }
  hl["@lsp.typemod.method.defaultLibrary.rust"] = { link = "@method" }
  hl["@lsp.type.selfTypeKeyword.rust"] = { link = "@variable.builtin" }
  hl["@lsp.type.decorator.rust"] = { link = "@attribute" }
  hl["@lsp.type.deriveHelper.rust"] = { link = "@attribute" }
  hl["@lsp.type.generic.rust"] = { link = "@variable" }
  hl["@lsp.type.formatSpecifier.rust"] = { link = "@punctuation.special" }
  hl["@lsp.type.variable.rust"] = { link = "@variable" }
  hl["@lsp.type.escapeSequence"] = { link = "@string.escape" }
  hl["@lsp.type.selfKeyword"] = { link = "@variable.builtin" }
  hl["@lsp.typemod.variable.constant.rust"] = { link = "@constant" }
  hl["@lsp.typemod.keyword.async.rust"] = { link = "@keyword.coroutine" }
  hl["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" }
  hl["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" }
  -- why are these so bad?
  hl["@lsp.type.keyword.cs"] = {}
  hl["@lsp.type.keyword.go"] = {}
  hl["@lsp.type.keyword.rust"] = {}
  hl["@lsp.type.keyword.zig"] = {}
  hl["@lsp.type.type.zig"] = {}
  hl["@lsp.typemod.keyword.injected"] = { link = "@keyword" }

  hl["@lsp.type.operator"] = { link = "@operator" }
end

return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
    config = function()
      local transparency = function() return not vim.g.neovide end

      require("tokyonight").setup {
        on_highlights = highlights,
        transparent = transparency(),
        hide_inactive_statusline = true,
        dim_inactive = false,
        lualine_bold = true,
        style = "night",
        styles = {

          sidebars = "transparent",
          floats = "dark",
          comments = { italic = false },
          keywords = { italic = false, bold = true },
          functions = { italic = false, bold = true },
          variables = { italic = false, bold = false },
        },
      }
    end,
  },

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
