#!/bin/bash

echo "FnKeys must be run as root. Please use sudo."
if [ "$(id -u)" -ne 0 ]; then
sudo -v
fi

read -p "FnKeys will make your function keys stop working as media controls. Do you want to continue? (y/n): " confirm
if [[ "$confirm" =~ ^[nN]$ ]]; then
    echo "Operation canceled."
    exit 1
fi

echo "#!/bin/bash
echo -n 0 | sudo tee /sys/module/hid_apple/parameters/fnmode" | sudo tee /usr/local/sbin/FnKeysFix.sh > /dev/null

sudo chmod +x /usr/local/sbin/FnKeysFix.sh

echo "[Unit]
Description=Function Keys Fix - ivandfx 2025
After=multi-user.target

[Service]
Type=simple
ExecStart=/usr/local/sbin/FnKeysFix.sh

[Install]
WantedBy=multi-user.target" | sudo tee /etc/systemd/system/Serike_FN_patch.service > /dev/null

sudo systemctl daemon-reload
sudo systemctl enable Serike_FN_patch.service

read -p "Changes will only apply after rebooting. Do you want to reboot now? (y/n): " response
if [[ "$response" =~ ^[yY]$ ]]; then
    sudo reboot
else
    echo "Reboot skipped. Remember to reboot manually to apply changes."
fi
