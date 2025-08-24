#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
fastfetch
alias ls='ls -lZn --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
(cat /home/reese/.cache/wal/sequences)

wallpaper() {

	swww img "$1" && wal -i "$1" && mv ~/.cache/wal/colors-rofi-dark.rasi ~/.config/rofi/config.rasi && echo "wallpaper updated"
}

hypr() {
	vim ~/.config/hypr/hyprland.conf
}

way() {
	vim -c ":vs ~/.config/waybar/config" ~/.config/waybar/style.css
}
