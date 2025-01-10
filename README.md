# My Dotfiles

These are my personal configuration files for Arch Linux, designed to optimize productivity and maintain a minimalist system. The setup is managed with [GNU Stow](https://www.gnu.org/software/stow/), enabling easy deployment and modular organization.


## Installation

### Prerequisites

1. Ensure you have **GNU Stow** installed:
   ```bash
   sudo pacman -S stow
   ```

2. Clone this repository:
    ```bash
    git clone https://github.com/lexjulian/dotfiles.git ~/dotfiles
    cd ~/dotfiles
    ```

3. Use `stow` to symlink the desired configuration:
    ```bash
    stow <folder-name>
    ```

    For example, to copy the `kitty` config.
    ```bash
    stow kitty
    ```

4. To remove a configuration, simply run:
    ```bash
    stow -D <folder-name>
    ```

## Recommendations
1. Make sure to backup your original configuration files before symlinking.

2. Test configurations in a virtual machine or container before deploying them on your main system.

## Contributions
Feel free to fork and customize these dotfiles to suit your preferences. Pull requests and contributions are always welcome!
