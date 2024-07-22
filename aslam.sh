#! /usr/bin/bash

echo ""
echo "    
  _             _        _                 
 | | _____     / \   ___| | __ _ _ __ ___  
 | |/ / __|   / _ \ / __| |/ _` | '_ ` _ \ 
 |   < (__   / ___ \\__ \ | (_| | | | | | |
 |_|\_\___| /_/   \_\___/_|\__,_|_| |_| |_|
 "
echo ""

greetings(){
    echo "Welcome `tput setaf 1` $USER! `tput sgr0`. You are using `tput setaf 6` LIVE SUBDOMAINS FINDER `tput sgr0` coded by `tput setaf 3` Aslam  `tput sgr0`" 
    echo "Please make sure you have `tput setaf 4`'assetfinder'`tput sgr0` and `tput setaf 4`'httprobe'`tput sgr0` installed in your system"
}
greetings
echo ""

spinner() {
    local pid=$!
    local delay=0.1
    local spinstr='.....'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

while true; do
    read -p "Enter Your Domain: " test
    
    echo -n "Finding subdomains..."
    assetfinder $test > subs &
    spinner
    
    echo -n "Checking live subdomains..."
    cat subs | httprobe > live &
    spinner
    
    sort -u live > sorted
    cat sorted
    
    read -p "$(echo -e "\e[33mDo you want to continue with another domain? (yes/no):\e[0m ")" continue

    if [ "$continue" != "yes" ]; then
        echo -e "\e[31m
░█▀▀░█░█░█▀█░█▀█░█░█░░░█░█░█▀█░█░█░░░█▀▀░█▀█░█▀▄░░░█░█░▀█▀░█▀▀░▀█▀░▀█▀░░░█▀█░█░█░█▀▄░░░█▀█░█▀█░█▀▀░█▀▀
░░█░░█▀█░█▀█░█░█░█▀▄░░░░█░░█░█░█░█░░░█▀▀░█░█░█▀▄░░░▀▄▀░░█░░▀▀█░░█░░░█░░░░█░█░█░█░█▀▄░░░█▀▀░█▀█░█░█░█▀▀
░░▀░░▀░▀░▀░▀░▀░▀░▀░▀░░░░▀░░▀▀▀░▀▀▀░░░▀░░░▀▀▀░▀░▀░░░░▀░░▀▀▀░▀▀▀░▀▀▀░░▀░░░░▀▀▀░▀▀▀░▀░▀░░░▀░░░▀░▀░▀▀▀░▀▀▀
\e[0m"
        echo ""
        break
    fi
done
