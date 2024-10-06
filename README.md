
# 💻 Alex's Dotfiles

Welcome to my personal dotfiles collection! This repository contains the configurations I use for my Arch Linux setup, fine-tuned across various tools to create a smooth, efficient, and visually appealing workflow. Feel free to explore, fork, or use any part of it in your own setup.

## 🚀 Tools & Configurations

Here’s a breakdown of what’s included:

### ⚙️ Terminal & Shell
- **Alacritty** (`alacritty/.config/alacritty`)
  - Minimalist and fast terminal emulator.

- **Tmux** (`tmux`)
  - Terminal multiplexer for managing multiple sessions.
  - Custom session clearing script.

- **Bash** (`bashrc`)
  - Bash configuration, including a way to clear session panes for tmux.

- **Kitty** (`kitty/.config/kitty`)
  - Pre-configured for a smooth terminal experience.

### 🖼️ Desktop Environment
- **i3** (`i3/.config/i3`)
  - Lightweight window manager, customized backgrounds and layouts.

- **Polybar** (`polybar/.config`)
  - Customizable status bar for i3.
  - Adjusted font size for better readability on the new laptop.

- **Picom** (`picom/.config/picom`)
  - Compositor for i3, providing window transparency and other effects.

### 🎨 UI Tweaks
- **Rofi** (`rofi/.config/rofi`)
  - Application launcher and window switcher with minimal design.

- **Fastfetch** (`fastfetch/.config/fastfetch`)
  - System information tool with adjusted padding and logo positioning.

### 📝 Neovim & Text Editing
- **Neovim** (`nvim_web/.config/nvim_web`)
  - My Neovim configuration focused on web development.
  - Plugins managed with Lazy.nvim.

### 🛠️ Miscellaneous
- **Scripts** (`scripts/scripts`)
  - Custom scripts to streamline workflows and system prep.

## 📦 Installation

To use these dotfiles, clone the repository and symlink the config files to the appropriate directories.

```bash
git clone https://github.com/alexj/dotfiles.git
cd dotfiles
# Example for Alacritty
ln -s $(pwd)/alacritty/.config/alacritty ~/.config/alacritty
```

Feel free to modify the commands based on the tool you’re configuring.

## 🌟 Features

- **Lightweight & Fast**: Configurations focused on performance.
- **Minimal UI**: Clean and distraction-free environment.
- **Custom Scripts**: Automation for everyday tasks.

## 🔧 System Setup
- **OS**: Arch Linux with Hyprland.
- **WM**: Hyprland
- **Terminal**: Alacritty & Kitty
- **Shell**: Zsh with Powerlevel10k

## 📜 License
Feel free to use and modify these configurations. Contributions are welcome!
