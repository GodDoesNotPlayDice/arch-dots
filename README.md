<div align="center">
    <h1>⛩️ Arch Hyprland Rice</h1>
    <p><b>Catppuccin Mocha • Waifu Aesthetic • Performance</b></p>
</div>

<br>

## 🎨 Tech Stack

This environment is designed to be lightweight, aesthetic, and highly functional for software development.

| Component | Choice | Details |
|-----------|--------|---------|
| **OS** | Arch Linux | Zen Kernel (`linux-zen`) |
| **WM** | Hyprland | Wayland Compositor |
| **Terminal** | Kitty | GPU Accelerated + Waifu Fetch |
| **Bar** | Waybar | Custom Modules (Updates, Hardware) |
| **Launcher** | Rofi | Dmenu mode / App Launcher |
| **Shell** | Zsh | With plugins & autocomplete |
| **Login (DM)** | SDDM | `sugar-candy` theme |
| **Bootloader** | GRUB | `catppuccin-mocha` theme |
| **Audio** | Pipewire | `cava` Visualizer |
| **Files** | Yazi / Thunar | Terminal & GUI Managers |
| **Editor** | VS Code / Neovim | Dev Environment |

---

## ⚡ Installation Guide

Follow these steps to deploy the complete system onto a fresh Arch Linux installation.

### 1. Prerequisites
You need `git`, `stow`, and an AUR helper (like `yay`) installed.

```bash
sudo pacman -S git stow base-devel
# Install yay if you haven't already
git clone [https://aur.archlinux.org/yay.git](https://aur.archlinux.org/yay.git) && cd yay && makepkg -si && cd ..
```

### 2. Clone the Repository
Clone this into your Documents folder (critical for maintaining directory structure).

```bash
git clone [https://github.com/YOUR_USERNAME/dotfiles.git](https://github.com/YOUR_USERNAME/dotfiles.git) ~/Documents/dotfiles
cd ~/Documents/dotfiles
```

### 3. Install Packages
Restore all software automatically using the included package lists.

```bash
# 1. Official Packages (Pacman)
sudo pacman -S --needed - < pacman_pkgs.txt

# 2. AUR Packages (Yay)
yay -S --needed - < aur_pkgs.txt
```

### 4. Deploy Dotfiles (User Config)
We use GNU Stow to create symlinks for the user configuration (.config).

```
# Ensure you are inside ~/Documents/dotfiles
stow -t ~ .
```
This will apply configurations for Hyprland, Waybar, Kitty, Neofetch, Rofi, Cava, etc.

## 🛠️ System Configuration (Manual)
⚠️ Important: Global configurations (/etc/) are not managed by Stow for security reasons. You must copy them manually from the system-configs backup folder included in this repo.

### A. Restore GRUB (Bootloader)
Copy the theme and configuration file.
```bash
# 1. Copy the Catppuccin theme
sudo mkdir -p /usr/share/grub/themes/
sudo cp -r ~/Documents/dotfiles/system-configs/grub_themes/catppuccin-mocha-grub-theme /usr/share/grub/themes/

# 2. Restore configuration (/etc/default/grub)
sudo cp ~/Documents/dotfiles/system-configs/grub_backup /etc/default/grub

# 3. Apply changes
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
### B. Restore SDDM (Login Screen)
Configure the sugar-candy theme.
```bash
# 1. Copy SDDM configuration
sudo cp ~/Documents/dotfiles/system-configs/sddm.conf /etc/sddm.conf
# (Or if using sddm.conf.d, copy that folder instead)

# 2. Copy Sugar Candy theme config (Background, etc.)
sudo mkdir -p /usr/share/sddm/themes/sugar-candy/
sudo cp ~/Documents/dotfiles/system-configs/sugar-candy-theme/theme.conf /usr/share/sddm/themes/sugar-candy/theme.conf
```
## 📂 Repository Structure
```bash
~/Documents/dotfiles
├── .config/               # User Configurations (Stowed)
│   ├── hypr/
│   ├── waybar/
│   ├── kitty/
│   ├── neofetch/
│   ├── rofi/
│   └── ...
├── system-configs/        # System Backups (Manual Copy)
│   ├── grub_backup        # GRUB Config file
│   ├── grub_themes/       # GRUB Theme folder
│   ├── sddm.conf          # SDDM Config file
│   └── sugar-candy-theme/ # Login visual config
├── pacman_pkgs.txt        # Official software list
├── aur_pkgs.txt           # AUR software list
└── README.md
```
## ⌨️ Keybindings
```bash
Key,Action
Super + Q,Open Terminal (Kitty)
Super + C,Close Window
Super + Space,Open Launcher (Rofi)
Super + F,Toggle Fullscreen
Super + V,Toggle Floating Window
Super + M,Panic: Kill Music (MPV)
Super + Shift + S,Screenshot (Grim + Slurp)
Super + Shift + E,Power Menu (Wlogout)
```