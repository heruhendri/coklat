#!/bin/bash

# Mendapatkan tanggal dari server
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`

# Warna teks
red() { echo -e "\\033[32;1m${*}\\033[0m"; }

# Membersihkan dan membuat folder
rm -r /usr/local/sbin
mkdir /usr/local/sbin
clear

# Fungsi bar loading
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
    tput cnorm
}

# Fungsi untuk mengunduh dan mengekstrak file
res1() {
    wget https://github.com/hokagelegend9999/coklat/raw/refs/heads/main/Cdy/menu.zip
    unzip menu.zip
    chmod +x menu/*
    mv menu/* /usr/local/sbin
    rm -rf menu
    rm -rf menu.zip
}

# Eksekusi perintah tertentu
netfilter-persistent
clear

# Tampilan antarmuka pengguna
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m          UPDATE SCRIPT        \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e "  \033[1;91m update script service\033[1;37m"
fun_bar 'res1'
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""

# Menambahkan fungsi menu
menu() {
    clear
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e " \e[1;97;101m          MENU         \e[0m"
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e ""
    echo -e "  \033[1;92m1.\033[1;37m Option 1"
    echo -e "  \033[1;92m2.\033[1;37m Option 2"
    echo -e "  \033[1;92m3.\033[1;37m Option 3"
    echo -e ""
    read -n 1 -s -r -p "Select an option [1-3] and press Enter: " option
    case $option in
        1)
            echo -e "\033[1;92mOption 1 selected\033[0m"
            # Add your command for option 1 here
            ;;
        2)
            echo -e "\033[1;92mOption 2 selected\033[0m"
            # Add your command for option 2 here
            ;;
        3)
            echo -e "\033[1;92mOption 3 selected\033[0m"
            # Add your command for option 3 here
            ;;
        *)
            echo -e "\033[1;91mInvalid option. Exiting...\033[0m"
            exit 1
            ;;
    esac
}

# Memanggil menu setelah proses selesai
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu
