if command -v yay &> /dev/null; then
	echo "yay is already installed."
else
	echo "yay is not installed. Installing..."
	sudo pacman -S --needed git base-devel
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
	cd ..
	rm -rf yay
	echo "yay has been installed successfully."
fi
echo "installing requirement"
yay -S --needed - < requirement
echo "creating default dirs"
xdg-user-dirs-update
echo "setting up configs"
cp -r .config/* ~/.config/
echo "SUPER+W and set a wallpaper, then reboot"
