echo "-------------------------------------------------"
echo " ....  ..... ..... ..... ..... .     ..... ..... "
echo " .   . .   .   .   .       .   .     .     .     "
echo " .   . .   .   .   .....   .   .     ..... ..... "
echo " .   . .   .   .   .       .   .     .         . "
echo " ....  ....    .   .     ..... ..... ..... ..... "
echo "-------------------------------------------------"

echo "Installing git"

sudo pacman -S git


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

mv fastfetch/config.jsonc ~/.config/fastfetch/
echo "moved config.jsonc to fastfetch folder"

hyprctl monitors all

read -p "What display do you want in display.conf? (IMPORTANT: THIS WILL BE YOUR MONITOR)" display

echo $display >> /hypr/display.conf

echo ", 0x0, 1" >> /hypr/display.conf

echo "Display configuration appended to display.conf"

echo "Setting up hyprpm."

hyprpm add https://github.com/hyprwm/hyprland-plugins

hyprpm update

hyprpm enable borders-plus-plus


mv /hypr/hyprland.conf ~/.config/hypr/hyprland.conf
mv /hypr/display.conf ~/
echo "moved config to hyprland.conf"

hyprctl reload



echo "testing Pywal color updates."
mkdir ~/.config/rofi
mv /wallpapers/nothing.jpg ~/Pictures/nothing.jpg
$wall ="" ~/Pictures/nothing.jpg"
swww img "$wall" && wal -i "$wall" && mv ~/.cache/wal/colors-rofi-dark.rasi ~/.config/rofi/config.rasi && echo "wallpaper updated"
mkdir ~/.config/waybar
mv /waybar/config ~/.config/waybar/config.jsonc
mv /waybar/style.css ~/.config/waybar/style.css

echo "Changes complete. press SUPER + Shift + E to exit hyprland and log back in."
