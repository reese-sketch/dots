#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
fastfetch
alias ls='ls -lZn --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

rice() {
	if [[ $1 == 'about' ]];
       	then
		clear

		echo "hello world!" && sleep 0.5
		echo "rice by @uxiecodeine on tiktok ^_^" && sleep 0.5
		echo "clone the repository @ github.com/reese-sketch/dots" && sleep 0.5
		
		sleep 1
		fastfetch	

		
		
	elif [[ $1 == 're' ]];
	then
		echo "refreshing configurations."

		hyprctl reload

		killall -SIGUSR2 waybar
		
		killall -SIGUSR2 dunst

		echo "refresh complete."
	
	elif [[ $1 == 'hypr' ]];
	then
		clear
		echo "opening hyprland configuration at ~/.config/hypr/hyprland.conf" && sleep 0.5

		vim -o ~/.config/hypr/hyprland.conf
	
	elif [[ $1 == 'way' ]];
	then
		clear
		echo "opening waybar config at ~/.config/waybar/config"
		echo "opening waybar style.css at ~/.config/waybar/style.css" && sleep 0.5

		vim -o ~/.config/waybar/config ~/.config/waybar/style.css

	elif [[ $1 == 'mgen' ]];
	then
		echo "opening matugen config at ~/.config/matugen/config.toml" && sleep 0.5

		vim -o ~/.config/matugen/config.toml


	else

		echo "rice ctl "
		echo "usage: "
		echo "about -- show creator info & credits "
		echo "hypr  -- configure hyprland .conf file "
		echo "way   -- configure waybar style.css and config "
		echo "mgen  -- configure matugen config.toml "
		echo "re    -- refresh your configuration files"
		


	fi

}

showoff() {
	hyprctl dispatch exec kitty cmatrix && sleep 0.1
	hyprctl dispatch exec kitty peaclock && sleep 0.1 
	hyprctl dispatch exec kitty yazi
	clear
	vim
}
