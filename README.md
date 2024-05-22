# 🚀 `ts-comments.nvim`

Tiny plugin to enhance Neovim's native comments:

- Easily override the comment string for a given **treesitter** language
- Supports different comment strings for different **treesitter** node types
- Relaxed rules for uncommenting
- Add proper whitespace when needed
- Supports multiple commentstrings for the same language.
  The first one is used for adding comments.
  All are used for uncommenting.

## ⚡️ Requirements

- Neovim >= 0.10.0

## 📦 Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "folke/ts-comments.nvim",
  opts = {},
  event = "VeryLazy",
  enabled = vim.fn.has("nvim-0.10.0") == 1,
}
```

## ⚙️ Configuration

Default configuration:

<!-- config:start -->

```lua
{
  lang = {
    astro = "<!-- %s -->",
    c = "// %s",
    cpp = "// %s",
    css = "/* %s */",
    cue = "// %s",
    c_sharp = "// %s",
    gleam = "// %s",
    glimmer = "{{! %s }}",
    go = "// %s",
    graphql = "# %s",
    handlebars = "{{! %s }}",
    hcl = "# %s",
    html = "<!-- %s -->",
    ini = "; %s",
    javascript = {
      "// %s",
      "/* %s */",
      call_expression = "// %s",
      jsx_attribute = "// %s",
      jsx_element = "{/* %s */}",
      jsx_fragment = "{/* %s */}",
      spread_element = "// %s",
      statement_block = "// %s",
    },
    lua = { "-- %s", "--- %s" }, -- langs can have multiple commentstrings
    php = "// %s",
    rego = "# %s",
    rescript = "// %s",
    ruby = "# %s",
    sql = "-- %s",
    svelte = "<!-- %s -->",
    terraform = "# %s",
    tsx = {
      "// %s", -- default commentstring when no treesitter node matches
      "/* %s */", -- will be used for uncommenting
      call_expression = "// %s", -- specific commentstring for call_expression
      jsx_attribute = "// %s",
      jsx_element = "{/* %s */}",
      jsx_fragment = "{/* %s */}",
      spread_element = "// %s",
      statement_block = "// %s",
    },
    twig = "{# %s #}",
    typescript = "// %s",
    vim = '" %s',
    vue = "<!-- %s -->",
  },
}
```

<!-- config:end -->

## 🔗 Related

- [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)

