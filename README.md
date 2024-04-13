<h1 align="center" >🌌 norrsken.nvim</h1>

<p align="center"><a href="https://norrsken.dev/">Norrsken</a> colorscheme for <a href="https://neovim.io/">NEOVIM</a> written in Lua</p>

![norrsken.nvim](./assets/showcase.png)

## ✔️ Requirements

- Neovim >= 0.9.2
- Treesitter (optional)

## #️ Supported Plugins

- [LSP](https://github.com/neovim/nvim-lspconfig)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-compe](https://github.com/hrsh7th/nvim-compe)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
- [NeoTree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [BufferLine](https://github.com/akinsho/nvim-bufferline.lua)
- [Git Signs](https://github.com/lewis6991/gitsigns.nvim)
- [Lualine](https://github.com/hoob3rt/lualine.nvim)
- [LSPSaga](https://github.com/glepnir/lspsaga.nvim)
- [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow)
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)

## ⬇️ Installation

Install via package manager

```lua
-- Using Packer:
use 'webhooked/norrsken.nvim'
```

```vim
" Using Vim-Plug:
Plug 'webhooked/norrsken.nvim'
```

## 🚀 Usage

```lua
-- Lua:
vim.cmd[[colorscheme norrsken]]
```

```vim
" Vim-Script:
colorscheme norrsken
```

If you are using [`lualine`](https://github.com/hoob3rt/lualine.nvim), you can also enable the provided theme:

> Make sure to set theme as 'norrsken-nvim' as norrsken already exists in lualine built in themes

```lua
require('lualine').setup {
  options = {
    -- ...
    theme = 'norrsken-nvim'
    -- ...
  }
}
```

If you are using [LazyVim](https://github.com/LazyVim/LazyVim), you can add this to your plugins/colorscheme.lua file:

```
return {
  -- add norrsken
  { "webhooked/norrsken.nvim" },

  -- Configure LazyVim to load norrsken
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "norrsken",
    },
  },
}
```

## 🔧 Configuration

The configuration must be run before `colorscheme` command to take effect.
If you're using Lua:

```lua
local norrsken = require("norrsken")
norrsken.setup({
  -- customize norrsken color palette
  colors = {
      bg = "#191920",
      fg = "#f8f8f8",
      selection = "#707077",
      comment = "#707077",
      flare = "#ff2e18",
      shimmer = "#b5b5fe",
      glow = "#f9fc45",
      aurora = "#67f0ab",
      twilight = "#7e7dfd",
      nebula = "#4fe1c5",
      sky = "#37d3e0",
      bright_red = "#ff999e",
      bright_green = "#67f0ab",
      bright_yellow = "#f9fc45",
      bright_blue = "#37d3e0",
      bright_magenta = "#7e7dfd",
      bright_cyan = "#4fe1c5",
      bright_white = "#ffffff",
      menu = "#191920",
      visual = "#202026",
      gutter_fg = "#202026",
      nontext = "#202026",
      white = "#b2b2b2",
      black = "#191920",
  },
  -- show the '~' characters after the end of buffers
  show_end_of_buffer = true, -- default false
  -- use transparent background
  transparent_bg = true, -- default false
  -- set custom lualine background color
  lualine_bg_color = "#101012", -- default nil
  -- set italics
  italics {
    comments = true, -- default false
    keywords = true, -- default false
  },
  -- overrides the default highlights with table see `:h synIDattr`
  overrides = {},
  -- You can use overrides as table like this
  -- overrides = {
  --   NonText = { fg = "white" }, -- set NonText fg to white
  --   NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
  --   Nothing = {} -- clear highlight of Nothing
  -- },
  -- Or you can also use it like a function to get color from theme
  -- overrides = function (colors)
  --   return {
  --     NonText = { fg = colors.white }, -- set NonText fg to white of theme
  --   }
  -- end,
})
```
