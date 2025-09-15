$config_path = "$user/.config";

clear
echo "dotfiles ^_^" ;


echo "checking for yay on local machine";

if [ -x '/bin/yay' ]; then

	echo "yay installed!";

else

	echo "yay missing!";

	echo "installing yay (latest) from the AUR";

	sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si;

fi;


	echo "installing dependencies";

	echo "installing peaclock, matugen, kitty, swww, wofi, cava, fastfetch, doas";

	echo "configuring doas is easy. edit /etc/doas.conf with 'sudo vim /etc/doas.conf' and append 'permit nopass :wheel'. you'll never have to use sudo again! (setup is insecure for multi-user, visit https://wiki.archlinux.org/title/Doas#Configuration to properly configure doas)";

	yay -S --noconfirm;

	sudo pacman -S wofi swww kitty hyprland cava --noconfirm;

	yay -S matugen doas peaclock waybar-cava --noconfirm;


	echo "installing dots!"

	cp -r ./ $config_dir/;

	echo "removing copied 'install.sh' and 'readme.md'";

	rm $config_dir/install.sh;

	rm $config_dir/readme.md;

	hyprctl reload;

	echo "Setting up wallpapers";

	mkdir $user/Pictures/;

	cp wallpapers/* $user/Pictures/;

	chmod +x $config_dir/hypr/wofi-wallpaper-selector.sh;

	matugen image $user/Pictures/lain2.jpg;
	
	hyprctl reload;

	echo "Setting up waybar";

	hyprctl dispatch exec waybar;

	echo "moving .bashrc to $user's directory";

	mv .bashrc $user/.bashrc;

	echo "these dotfiles come with a bash function to access the configurations. it's modular and can be edited easily! open a new terminal and type 'rice'. ^_^"

	sleep 1;


	echo "install complete!";


