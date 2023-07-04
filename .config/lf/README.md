## Screenshots

![ss-1](https://ik.imagekit.io/rayshold/dotfiles/_config/lf/lf-01.webp?updatedAt=1688455979366)|![ss-2](https://ik.imagekit.io/rayshold/dotfiles/_config/lf/lf-02.webp?updatedAt=1688455978299) 
|---|---|

## Requirements

1. golang
2. imagemagick (for .svg previews)
3. gs (for pdf previews)
4. ffmpeg (for video file thumbnails)

## Image Preview

On X-ORG either use [ueberzug](https://github.com/seebye/ueberzug) or [ctpv](https://github.com/NikitaIvanovV/ctpv)

On Wayland only option I know is [kitty](https://github.com/kovidgoyal/kitty)

**Add following line to _.bashrc | .zshrc | config.fish_ to make image preview work**
```
alias lf='~/.config/lf/scripts/lfrun'
```

Checkout their [wiki](https://github.com/gokcehan/lf/wiki/Previews#image-previews) for more information

## Icons

**To set icons shown in screenshot add following line to _.bashrc | .zshrc | config.fish_**
```
source ~/.config/lf/icons/icons
```

