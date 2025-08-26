cd "$HOME/dots/dots"
clear
echo "moving files from ~/dots/dots to ~/.config"
sleep 1s
ls -l
mv "$HOME/dots/dots/fastfetch/config.jsonc" "$HOME/.config/fastfetch/config.jsonc"
ls -a "$HOME/.config/fastfetch/"
mv "$HOME/dots/dots/wal-templates/colors-hyprland.conf" "$HOME/.config/wal/templates/colors-hyprland.conf"
ls -a "$HOME/.config/wal/templates/"
mv "$HOME/dots/dots/hypr/hyprland.conf" "$HOME/.config/hypr/hyprland.conf"
ls -a "$HOME/.config/hypr/"
mv "$HOME/dots/dots/hypr/display.conf" "$HOME/.config/hypr/display.conf"
ls -a "$HOME/.config/hypr/"
mv "$HOME/dots/dots/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"
mv "$HOME/dots/dots/waybar/config" "$HOME/.config/waybar/config"
mv "$HOME/dots/dots/waybar/style.css" "$HOME/.config/waybar/style.css"
cp ".bashrc" "$HOME"
cd "$HOME"
ls -a -l
cd "$HOME/.config"
ls -a -l