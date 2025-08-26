cd "~/dots/dots"

clear

echo "moving files from ~/dots/dots to ~/.config"
sleep 3s


ls -l

cp "fastfetch/config.jsonc" "~/.config/fastfetch/config.jsonc"

cp "wal-templates/colors-hyprland.conf" "$HOME/.config/wal/templates/colors-hyprland.conf"
cp "hypr/hyprland.conf" "$HOME/.config/hypr/hyprland.conf"
cp "hypr/display.conf" "$HOME/.config/hypr/display.conf"
cp "kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"
cp "waybar/config" "$HOME/.config/waybar/config"
cp "waybar/style.css" "$HOME/.config/waybar/style.css"

cp ".bashrc" "$HOME"

cd "$HOME"
ls -a -l

cd "$HOME/.config"

ls -a -l
