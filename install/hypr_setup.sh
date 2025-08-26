echo "Setting up hyprpm."
hyprpm update

echo "hyprpm updated"

hyprpm add https://github.com/hyprwm/hyprland-plugins
hyprpm enable "borders-plus-plus"
hyprpm reload

swww img "~/Pictures/nothing.jpg"

wal -i "~/Pictures/nothing.jpg"

hyprctl reload