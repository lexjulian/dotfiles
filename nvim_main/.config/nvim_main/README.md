
# Neovim Config 📝✨

Welcome to my minimal Neovim configuration! This repo showcases a simplified yet powerful setup for Neovim, emphasizing productivity with a clean plugin set. This is a departure from my previous, more extensive config and is tailored for an efficient, distraction-free workflow.

## ⚡️ Features

- **Minimal plugins for maximum productivity**
- **Clean and distraction-free setup**
- **Seamless navigation, editing, and coding experience**

## ✨ Plugins

Here's a breakdown of the plugins used in this config:

1. **[nvim-autopairs](https://github.com/windwp/nvim-autopairs)** - Automatically inserts matching pairs (e.g., `()`, `{}`).
2. **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** - Auto-completion plugin to make coding more efficient.
3. **[conform.nvim](https://github.com/stevearc/conform.nvim)** - A simple and fast code formatter.
4. **[ray-x/go.nvim](https://github.com/ray-x/go.nvim)** - Go development plugin with LSP integration for Go.
5. **[harpoon](https://github.com/ThePrimeagen/harpoon)** - Quick navigation between files for a faster workflow.
6. **LSP (Language Server Protocol)** - Native LSP support for Neovim to provide IDE-like features such as linting, code actions, and more.
7. **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** - Fast and customizable status line.
8. **[onedark.nvim](https://github.com/navarasu/onedark.nvim)** - One Dark color scheme for a pleasant coding experience.
9. **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** - Fuzzy file finder, buffer switcher, and more.
10. **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Syntax highlighting with Treesitter.
11. **[undotree](https://github.com/mbbill/undotree)** - Visualize and interact with the undo history.

## 🚀 Installation

### Prerequisites
Ensure you have Neovim 0.5 or higher installed. Refer to [Neovim's official guide](https://github.com/neovim/neovim/wiki/Installing-Neovim) for installation instructions.

### Setup

1. Clone this repository:
    ```bash
    git clone https://github.com/lexjulian/dotfiles.git ~/dotfiles
    ```
2. Navigate to your Neovim configuration:
    ```bash
    cd ~/dotfiles
    ```
3. Rename or move your previous configuration(nvim_web) if needed:
    ```bash
    mv ~/.config/nvim ~/.config/nvim_old
    ```
4. Symlink or copy the new nvim configuration:
    ```bash 
    ln -s ~/dotfiles/nvim_main ~/.config/nvim
    ```
5. Launch Neovim and run `:Lazy` to install plugins [lazy.nvim](https://github.com/folke/lazy.nvim)).

## 🛠 Configuration Overview

This config focuses on simplicity with minimal plugins. Key highlights include:

- **Auto-completion** via `nvim-cmp` for an enhanced coding experience.
- **Syntax highlighting** with Treesitter for clearer, context-aware code display.
- **Harpoon** for quick file navigation.
- **Lualine** status line for a polished look and useful info at a glance.
- **Telescope** for quick file and buffer searches.
- **Onedark theme** for an elegant, easy-on-the-eyes appearance.

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to fork, create a pull request, or open an issue.

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
