## update apt sources

sudo tee /etc/apt/sources.list > /dev/null << 'EOF'
deb http://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware
#deb-src http://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware

deb http://deb.debian.org/debian/ bookworm-updates main contrib non-free non-free-firmware
#deb-src http://deb.debian.org/debian/ bookworm-updates main contrib non-free non-free-firmware

deb http://security.debian.org/debian-security/ bookworm-security main contrib non-free non-free-firmware
#deb-src http://security.debian.org/debian-security/ bookworm-security main contrib non-free non-free-firmware

deb http://deb.debian.org/debian/ bookworm-backports main contrib non-free non-free-firmware
#deb-src http://deb.debian.org/debian/ bookworm-backports main contrib non-free non-free-firmware
EOF

echo "deb [arch=arm64] https://download.docker.com/linux/debian/ bookworm stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_12/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:3.list

curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_12/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null

sudo apt update

# change user name , must login as root

sudo pkill -u orangepi
sudo pkill -9 -u orangepi
sudo usermod -l odin orangepi
sudo usermod -d /home/odin -m odin
sudo groupmod -n odin orangepi
sudo chfn -f "odin" odin

sudo hostnamectl set-hostname atlas
sudo sed -i 's/orangepi5ultra/atlas/g' /etc/host

# fish
sudo apt install fish
chsh -s /usr/bin/fish odin


# disable auto login

sudo rm -rf /lib/systemd/system/getty@.service.d/
sudo rm -rf /lib/systemd/system/serial-getty@.service.d/

# disable wifi
echo "blacklist bcmdhd" | sudo tee /etc/modprobe.d/blacklist-wifi.conf > /dev/null
sudo update-initramfs -u

#powersave governor
sudo apt install cpufrequtils
echo 'GOVERNOR="powersave"' | sudo tee /etc/default/cpufrequtils > /dev/null

# install and set auto reset for tailscale
curl -fsSL https://tailscale.com/install.sh | sh

sudo apt update
sudo apt install networkd-dispatcher
sudo systemctl enable --now networkd-dispatcher
cat << 'EOF' | sudo tee /etc/networkd-dispatcher/routable.d/99-tailscale-reset > /dev/null
#!/bin/bash

# Change 'eth0' to your actual interface name if different
if [ "$IFACE" = "eth0" ]; then
    sleep 3 
    /usr/bin/tailscale serve reset
    /usr/bin/tailscale funnel --bg 8123
fi
EOF

sudo chmod +x /etc/networkd-dispatcher/routable.d/99-tailscale-reset
sudo chown root:root /etc/networkd-dispatcher/routable.d/99-tailscale-reset
