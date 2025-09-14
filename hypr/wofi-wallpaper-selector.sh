#!/usr/bin/env bash
# Configuration
WALLPAPER_DIR="$HOME/Pictures/"  # Change this to your wallpaper directory

# Generate menu items from the wallpaper directory
generate_menu() {
    # Add random/shuffle option
    # Add all wallpapers
    for img in "$WALLPAPER_DIR"/*.{jpg,jpeg,png,gif}; do
        # Skip if no matches found
        [[ -f "$img" ]] || continue

        # Output menu item (just the filename)
        echo "$(basename "$img")"
    done
}

# Use wofi to display a list of wallpapers
selected=$(generate_menu | wofi --show dmenu \
    -n \
    --prompt "Select Wallpaper" \

    --conf ~/.config/wofi/config \
    --style ~/.config/wofi/style.css \
    --insensitive \
    --sort-order=default \
  )

# Set wallpaper if one was selected
if [ -n "$selected" ]; then
    # Check if random wallpaper was selected
    if [[ "$selected" == "!Random Wallpaper" ]]; then
        # Select a random wallpaper from the directory
        original_path=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | shuf -n 1)
    else
        # Find the corresponding original file in the wallpaper directory
        original_path=$(find "$WALLPAPER_DIR" -type f -name "${selected}" | head -n1)
    fi

    # Ensure a valid wallpaper was found before proceeding
    if [ -n "$original_path" ]; then
        # Set wallpaper using matugen
        matugen image "$original_path"
	swww 'img "$original_path" --transition-type any'

        # Save the selection for persistence
        echo "$original_path" > "$HOME/.cache/current_wallpaper"

        # Optional: Notify user
        notify-send "Wallpaper" "Wallpaper has been updated" -i "$original_path"
    else
        notify-send "Wallpaper Error" "Could not find the original wallpaper file."
    fi
fi
