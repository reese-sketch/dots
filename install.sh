echo "-------------------------------------------------"
echo " ....  ..... ..... ..... ..... .     ..... ..... "
echo " .   . .   .   .   .       .   .     .     .     "
echo " .   . .   .   .   .....   .   .     ..... ..... "
echo " .   . .   .   .   .       .   .     .         . "
echo " ....  ....    .   .     ..... ..... ..... ..... "
echo "-------------------------------------------------"

echo "Installing git"

sudo pacman -S git clang meson cpio cmake pkg-config gcc


echo "downloading dotfiles"
git clone "https://github.com/reese-sketch/dotfiles.git"
cd dotfiles

sudo pacman -S ttf-jetbrains-mono-nerd waybar rofi python-pywal swww fastfetch
echo "dotfiles downloaded"
sleep 0.2
echo "running pacman -Sy just in case"
sudo pacman -Sy

sleep 0.2

echo "Moving files from dotfiles to your .config"

mkdir ~/.config/fastfetch
echo "made directory fastfetch in .config"

cp ~/dots/fastfetch/config.jsonc ~/.config/fastfetch/
echo "moved config.jsonc to fastfetch folder"

hyprctl monitors all

read -p "What display do you want in display.conf? (IMPORTANT: THIS WILL BE YOUR MONITOR)" display

echo $display >> ~/dots/hypr/display.conf

echo ", 0x0, 1" >> ~/dots/hypr/display.conf

echo "Display configuration appended to display.conf"

echo "Setting up hyprpm."
hyprpm update
hyprpm add https://github.com/hyprwm/hyprland-plugins
hyprpm enable borders-plus-plus
hyprpm reload


cp /hypr/hyprland.conf ~/.config/hypr/hyprland.conf
cp /hypr/display.conf ~/
echo "moved config to hyprland.conf"

hyprctl reload



echo "testing Pywal color updates."
mkdir ~/.config/rofi
cp ~/dots/wallpapers/nothing.jpg ~/Pictures/nothing.jpg
$wall = "~/Pictures/nothing.jpg"
## !! MOVE HYPRLAND COLOR CONFIG!!
cp ~/dots/wal-templates/hyprland-colors.conf ~/wal/templates/hyprland-colors.conf
## also wallpaper function in .bashrc
swww img "$wall" && wal -i "$wall" && mv ~/.cache/wal/colors-rofi-dark.rasi ~/.config/rofi/config.rasi && echo "wallpaper updated"
mkdir ~/.config/waybar
mkdir ~/.config/kitty

cp  ~/dots/kitty/kitty.conf ~/.config/kitty/kitty.conf
cp ~/dots/waybar/config ~/.config/waybar/config.jsonc
cp ~/dots/waybar/style.css ~/.config/waybar/style.css

echo "Changes complete. press SUPER + Shift + E to exit hyprland and log back in."
