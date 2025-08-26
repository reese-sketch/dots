cd "~/dots/dots"

clear

echo "moving files from ~/dots/dots to ~/.config"
sleep 3s


ls -l

cp "fastfetch/config.jsonc" "~/.config/fastfetch/config.jsonc"

cp "wal-templates/colors-hyprland.conf" "~/.config/wal/templates/colors-hyprland.conf"
cp "hypr/hyprland.conf" "~/.config/hypr/hyprland.conf"
cp "hypr/display.conf" "~/.config/hypr/display.conf"
cp "kitty/kitty.conf" "~/.config/kitty/kitty.conf"
cp "waybar/config" "~/.config/waybar/config"
cp "waybar/style.css" "~/.config/waybar/style.css"

cp ".bashrc" "~/"

cd "~/"
ls -a -l

cd "~/.config"

ls -a -l
