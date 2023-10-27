![repo-size](https://img.shields.io/github/repo-size/ImRayy/dotfiles?style=for-the-badge&logo=github&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41)
![size](https://img.shields.io/github/languages/code-size/ImRayy/dotfiles?style=for-the-badge&logo=gnu-bash&color=ee999f&logoColor=D9E0EE&labelColor=302D41)
![last-commit](https://img.shields.io/github/last-commit/ImRayy/dotfiles?style=for-the-badge&logo=git&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41)

## Screenshots

**Hyprland** 
![hyprland-everforest](https://ik.imagekit.io/rayshold/dotfiles/_config/hypr/hyprland-everforest.webp?updatedAt=1698346799068)
> Everforest

![hyprland-catppuccin ](https://ik.imagekit.io/rayshold/dotfiles/hyprland.webp?updatedAt=1680764325650)
> Catppuccin Mocha


## Contents

- [hyprland](https://github.com/ImRayy/dotfiles/tree/master/.config/hypr)
- [bspwm](https://github.com/ImRayy/dotfiles/tree/master/.config/bspwm)
- [waybar](https://github.com/ImRayy/dotfiles/tree/master/.config/waybar)
- [polybar](https://github.com/adi1090x/polybar-themes)
- [rofi](https://github.com/ImRayy/dotfiles/tree/master/.config/rofi)
- [eww](https://github.com/ImRayy/dotfiles/tree/master/.config/eww/applets)
- [kitty](https://github.com/ImRayy/dotfiles/tree/master/.config/kitty)
- [wezterm](https://github.com/ImRayy/dotfiles/tree/master/.config/wezterm)
- [zsh](https://github.com/ImRayy/dotfiles/tree/master/.config/zsh)
- [fish](https://github.com/ImRayy/dotfiles/tree/master/.config/fish)
- [starship](https://github.com/ImRayy/dotfiles/blob/master/.config/starship.toml)
- [neofetch](https://github.com/ImRayy/dotfiles/blob/master/.config/neofetch)
- [lf](https://github.com/ImRayy/dotfiles/blob/master/.config/lf)
- [dunst](https://github.com/ImRayy/dotfiles/blob/master/.config/dunst)
- [swaync](https://github.com/ImRayy/dotfiles/tree/master/.config/swaync)
- [neovim](https://github.com/ImRayy/dotfiles/blob/master/.config/nvim)
- [mpv](https://github.com/ImRayy/dotfiles/tree/master/.config/mpv)

## Fonts, Icons, Colorschemes & More

<details>
<summary><b><code>Hyprland Stuff</code></b></summary>
    <ul>
        <li>sww</li>
        <li>grim</li>
        <li>slurp</li>
        <li>swaylock</li>
        <li>wf-recorder</li>
        <li>cliphist</li>
        <li>hyprpicker</li>
        <li>polkit-gnome</li>
    </ul>
</details>
<details>
<summary><b><code>Fonts</code></b></summary>
    <ul>
        <li>Cartograph CF</li>
        <li>CaskaydiaCove Nerd Font</li> 
        <li>Open Sans</li>
        <li>Font Awesome</li>
    </ul>
</details>
<details>
<summary><b><code>Color schemes</code></b></summary>
    <ul>
        <li>Catppuccin  Mocha</li>
        <li>Everforest</li>
        <li>Nightowl</li>
    </ul>
</details>
<details>
<summary><b><code>Icons</code></b></summary>
    <ul>
        <li><b>Mouse Cursor: </b>Bibata Modern Ice</li>
        <li><b>Apps: </b>Papirus</li>
    </ul>
</details>
<details>
<summary><b><code>Apps</code></b></summary>
    <ul>
        <li><b>📁 File Manager: </b>lf (tui) & nemo (gui)</li>
        <li><b>🧑‍💻 Code Editor: </b>Neovim & Vscode like most</li>
        <li><b>📽 Video Player: </b>MPV</li>
        <li><b>🎵 Music Player: </b>Tauon Music Box</li>
        <li><b>🗿 Emoji Picker: </b>rofi-emoji</li>
        <li><b>📔 Note Taking: </b>Obsidian, Neovim (with <code>telekasten.nvim</code> plugin)</li>
    </ul>
</details>
<br>

## Tips
<details>
<summary><code><b>Change Colorscheme</b></code></summary>
<br>
There isn't an easy script to change the colorscheme yet, but in the future, if the list of colorschemes grows, I'll make sure to include one. For now, you can manually change the colorscheme of each component. Follow along...
<h4>Waybar</h4>
Edit <code>~/.config/hypr/startup.conf</code> and replace <code>~/.config/waybar/launch.sh [--everforest/--nightowl]</code>, Why Nightowl? Well, it's my own colorscheme inspired by Catppuccin Mocha and the color palette of Tailwind CSS. Maybe in the future, I'll change it. For now, I couldn't think of any other names.

<h4>Neovim</h4>
Just change <code>vim.cmd.colorscheme("everforest")</code> this line in <code>~/.config/nvim/init.lua</code> to whatever colorscheme you prefer or use <code>Telescope colorscheme</code> to check or switch between available colorschemes.

<h4>Swaync</h4>
Uncomment either of lines in <code>~/.config/swaync/style.css</code>

<pre>
<code >
/* @import "./colorschemes/nightowl.css"; */
@import "./colorschemes/everforest.css";
</code>
</pre>

<h4>Kitty</h4>
With kitty I'm using unmodified Catppuccin Mocha theme, not nightowl

Change <code>include themes/everforest.conf</code> in <code>~/.config/kitty/kitty.conf</code>

<h4>Hyprland</h4>
I haven't made major color changes in Hyprland, but there are two variables you can modify in <code>~/.config/hypr/hyprland.conf</code>. <code>$active_border</code> & <code>$inactive_border</code>

<h4>zsh</h4>
Even though it's not necessary to change the zsh colorscheme if you're using the same colorscheme as your terminal, if you still want to, add any of the following to <code>~/.config/zsh/zsh_plugins</code> > <code>single_file_plugins=()</code>
<ul>
<li><code>catppuccin/zsh-syntax-highlighting/main/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh</code></li>
<li><code>sainnhe/dotfiles/master/.zsh-theme/everforest-dark.zsh</code></li>
</ul>
</details>


## Misc
You can download all the missing files from the following drives, such as `~/.config/neofetch/images`, wallpapers etc.

[![MEGA](https://img.shields.io/badge/MEGA-D9272E?logo=mega&style=for-the-badge)](https://mega.nz/folder/b4xzlJaA#7ThCdDHl5FgxrBs00MmcSQ)
