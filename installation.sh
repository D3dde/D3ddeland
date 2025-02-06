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
echo "setting pywalfox"
sudo pywalfox install
echo "setting up spicetify"
spicetify
mkdir ~/.config/spotify/prefs
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
spicetify backup apply
curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.sh | sh
echo "setting up configs"
cp -r .config/* ~/.config/
echo "SUPER+W and set a wallpaper, install pywalfox extension, reboot"
