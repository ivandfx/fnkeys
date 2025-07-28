#!/bin/bash

show_logo() {
cat << "EOF"

███████╗███╗   ██╗██╗  ██╗███████╗██╗   ██╗███████╗
██╔════╝████╗  ██║██║ ██╔╝██╔════╝╚██╗ ██╔╝██╔════╝
█████╗  ██╔██╗ ██║█████╔╝ █████╗   ╚████╔╝ ███████╗
██╔══╝  ██║╚██╗██║██╔═██╗ ██╔══╝    ╚██╔╝  ╚════██║
██║     ██║ ╚████║██║  ██╗███████╗   ██║   ███████║
╚═╝     ╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝
ivandfx 2025

EOF
}

install_fnkeys_fix() {
    if [ "$(id -u)" -ne 0 ]; then
        sudo -v
    fi

    sudo mkdir -p /usr/local/sbin

    echo "#!/bin/bash
echo -n 0 | tee /sys/module/hid_apple/parameters/fnmode" | sudo tee /usr/local/sbin/FnKeysFix.sh > /dev/null

    sudo chmod +x /usr/local/sbin/FnKeysFix.sh

    echo "[Unit]
Description=Function Keys Fix - ivandfx 2025
After=multi-user.target

[Service]
Type=simple
ExecStart=/usr/local/sbin/FnKeysFix.sh

[Install]
WantedBy=multi-user.target" | sudo tee /etc/systemd/system/FnKeys_patch.service > /dev/null

    sudo systemctl daemon-reload
    sudo systemctl enable FnKeys_patch.service
    sudo /usr/local/sbin/FnKeysFix.sh

    echo -e "\n✅ FnKeys patch installed and applied.\n"
    read -p "Press enter to return to menu..."
    show_menu
}

uninstall_fnkeys_fix() {
    sudo systemctl disable FnKeys_patch.service
    sudo rm -f /etc/systemd/system/FnKeys_patch.service
    sudo rm -f /usr/local/sbin/FnKeysFix.sh
    sudo systemctl daemon-reload

    if [ -e /sys/module/hid_apple/parameters/fnmode ]; then
        echo -n 1 | sudo tee /sys/module/hid_apple/parameters/fnmode > /dev/null
        echo -e "✅ FnKeys setting reverted to default (fnmode=1).\n"
    fi

    echo -e "✅ FnKeys patch uninstalled.\n"
    read -p "Press enter to return to menu..."
    show_menu
}

show_menu() {
    clear
    show_logo
    echo
    echo "1) Install FnKeys Fix"
    echo "2) Uninstall FnKeys Fix"
    echo "3) Exit"
    echo
    read -p "Choose an option [1-3]: " choice
    case $choice in
        1) install_fnkeys_fix ;;
        2) uninstall_fnkeys_fix ;;
        3) echo "Goodbye!" ; clear ; exit 0 ;;
        *) echo "Invalid option." ; sleep 1 ; show_menu ;;
    esac
}

show_menu
