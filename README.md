# Neovim Configuration

A fast, feature-rich Neovim config built with [Lazy.nvim](https://github.com/folke/lazy.nvim).

## Features

- **Fuzzy Finding**: Telescope + Snacks picker
- **Git Integration**: Gitsigns + Neo-tree git status
- **LSP**: Built-in LSP with mason for automatic LSP/server installation
- **Autocomplete**: nvim-cmp with LSP + Snippets
- **Treesitter**: Syntax highlighting and indentation
- **UI**: Neo-tree, Bufferline, Lualine, Snacks dashboard
- **Copilot**: AI code completion

## Requirements

- Neovim >= 0.9.0
- Git
- ripgrep (for Telescope live grep)
- A Nerd Font (optional, for icons)

## Installation

```bash
mv ~/.config/nvim ~/.config/nvim.bak
git clone https://github.com/yourusername/nvim.git ~/.config/nvim
nvim
```

## Keymaps

### General

| Keymap | Action |
|-------|-------|
| `<Space>` | Disable (leader key) |
| `<C-s>` | Save file |
| `<C-q>` | Quit |
| `x` | Delete char without yanking |
| `<C-d>` | Scroll down and center |
| `<C-u>` | Scroll up and center |
| `n` / `N` | Find and center |

### Buffers

| Keymap | Action |
|-------|-------|
| `<Tab>` | Next buffer |
| `<S-Tab>` | Previous buffer |
| `<leader>x` | Close buffer |
| `<leader>b` | New buffer |

### Windows

| Keymap | Action |
|-------|-------|
| `<leader>v` | Split vertically |
| `<leader>V` | Split horizontally |
| `<leader>se` | Equal splits |
| `<leader>xs` | Close split |
| `<leader>k` | Jump to split above |
| `<leader>j` | Jump to split below |
| `<leader>h` | Jump to split left |
| `<leader>l` | Jump to split right |

### Tabs

| Keymap | Action |
|-------|-------|
| `<leader>to` | New tab |
| `<leader>tx` | Close tab |
| `<leader>tn` | Next tab |
| `<leader>tp` | Previous tab |

### Window Resize

| Keymap | Action |
|-------|-------|
| `<leader><Up>` | Resize -2 |
| `<leader><Down>` | Resize +2 |
| `<leader><Left>` | Resize -2 (vertical) |
| `<leader><Right>` | Resize +2 (vertical) |

### Move Lines

| Keymap | Action |
|-------|-------|
| `M-j` | Move line down |
| `M-k` | Move line up |
| `M-j` | Move line down (visual) |
| `M-k` | Move line up (visual) |

### LSP

| Keymap | Action |
|-------|-------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Go to references |
| `gI` | Go to implementation |
| `gy` | Go to type definition |
| `<leader>rn` | Rename |
| `<leader>ca` | Code action |

### Diagnostics

| Keymap | Action |
|-------|-------|
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<leader>d` | Open float diagnostic |
| `<leader>q` | Open loclist |

### Telescope / Snacks

| Keymap | Action |
|-------|-------|
| `<leader>sh` | Help tags |
| `<leader>sk` | Keymaps |
| `<leader>sf` | Find files |
| `<leader>sg` | Live grep |
| `<leader>sw` | Search word |
| `<leader>sd` | Diagnostics |
| `<leader>sr` | Resume |
| `<leader>s.` | Recent files |
| `<leader>/` | Grep buffer |

### Git

| Keymap | Action |
|-------|-------|
| `<leader>gs` | Git status |
| `<leader>gd` | Git diff |
| `<leader>gc` | Git commit |
| `]c` | Next hunk |
| `[c` | Previous hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |

### Neo-tree

| Keymap | Action |
|-------|-------|
| `<leader>e` | Toggle file explorer |
| `\` | Reveal file in explorer |

### Copilot

| Keymap | Action |
|-------|-------|
| `<C-a>` | Copilot panel (visual) |
| `<leader>cc` | CopilotChat |

### Rust

| Keymap | Action |
|-------|-------|
| `<leader>rr` | Cargo runnables |
| `<leader>rt` | Test signs |
| `<leader>rT` | Run all tests |
| `<leader>rm` | Expand macro |
| `<leader>rc` | Crate graph |

## Plugins

| Plugin | Description |
|--------|-------------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [snacks.nvim](https://github.com/folke/snacks.nvim) | UI enhancements, picker, dashboard |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | File explorer |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP client |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP server installer |
| [rustaceanvim](https://github.com/mrcjkb/rustaceanvim) | Rust enhancements |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocomplete |
| [luasnip](https://github.com/L3MON4D3/LuaSnip) | Snippets |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git integration |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | Buffer tabs |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline |
| [copilot.vim](https://github.com/github/copilot.vim) | GitHub Copilot |
| [CopilotChat.nvim](https://github.com/CopilotC-Nvim/CopilotChat.nvim) | AI chat |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keymap hints |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto pairs |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | TODO highlights |

## LSP Servers

Automatically installed via Mason:

- rust_analyzer
- ts_ls (TypeScript)
- ruff, pylsp, pyright (Python)
- lua_ls (Lua)
- html, cssls, jsonls
- terraformls
- sqlls

## Troubleshooting

### Check Plugins

```vim
:Lazy
```

### Update Plugins

```vim
:Lazy update
```

### Check Health

```vim
:checkhealth
```

### Reload Config

```vim
:source ~/.config/nvim/init.lua
```