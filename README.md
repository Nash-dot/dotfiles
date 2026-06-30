# *title(not decided)*
<!-- imagepath -->
### First Rice. Learned everything along the way.
I recently switched to Linux and decided the best way to learn was to throw myself into ricing. I referred [diinki's](https://youtu.be/jFz5gLqv-FM?si=roDH6UC9dYuVbEZI) tutorial which turned into days of figuring things out piece by piece. This is the result.

Built on Pop!_OS, which meant adapting most resources (written for Arch-based systems) to work on a Debian base. If you're on a Debian-based system, this might save you some time.

# *Setup:*
  - OS: Pop!_OS is 24.04 LTS
  - WM: Sway.(SwayFX once Pop!_OS updates wayland-server)
  - Terminal: Kitty
  - Font: Maple Mono NF
  - Bar: Waybar
  - Launcher: Wofi
  - File manager: Nemo
  - Network menu: Orbit
  - Notification daemon: Mako
  - GTK Theme: diinki-retro-dark
  - Lockscreen: Swaylock
  
## Installation
  
### Install dependencies
 
```bash
   sudo apt install sway waybar wofi kitty mako swaylock \
   nemo pavucontrol brightnessctl \
   grim slurp pulseaudio-utils
```
   
### Allow brightnessctl without sudo
    
```bash
   sudo usermod -aG video $USER
``` 
   Log out and back in for this to take effect.
    
### Clone this repo
    
```bash
   git clone https://github.com/Nash-dot/dotfiles
   cd ~/dotfiles
```
   
### Copy configs and scripts
 
```bash
   cp -r config/* ~/.config/
   cp -r scripts/* ~/.local/bin/
```
 
### Set up auto-tiling
 
```bash
   pip3 install autotiling --break-system-packages
   
```
   
### Install Orbit (network manager)
 
   Orbit is a native network manager. Install it from [LifeOfATitan/orbit](https://github.com/LifeOfATitan/orbit).

 
### Install the font
 
   Download `MapleMono-NF-TTF.zip` from the [Maple Mono releases page](https://github.com/subframe7536/maple-font/releases), extract it, and move the fonts to `/usr/share/fonts/`. Then refresh the font cache:
 
```bash
   fc-cache -fv
```
 
### Install the GTK theme
 
   The `diinki-retro-dark` theme is included in this repo under `gtk_theme/`.
 
```bash
   cp -r gtk_theme/diinki-retro-dark ~/.themes/
gsettings set org.gnome.desktop.interface gtk-theme "diinki-retro-dark"
```
 
### Reload Sway / reboot
 
```bash
   swaymsg reload
```
 

## Credits
 
- [diinki](https://youtu.be/jFz5gLqv-FM?si=roDH6UC9dYuVbEZI) — original ricing tutorial and `diinki-retro-dark` GTK theme
- [O
