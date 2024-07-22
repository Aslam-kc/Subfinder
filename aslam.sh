#! /usr/bin/bash
echo ""
echo "    
  _             _        _                 
 | | _____     / \   ___| | __ _ _ __ ___  
 | |/ / __|   / _ \ / __| |/ _` | '_ ` _ \ 
 |   < (__   / ___ \\__ \ | (_| | | | | | |
 |_|\_\___| /_/   \_\___/_|\__,_|_| |_| |_|
                                                                                                                                                                                                                                                
echo "
greetings(){
echo "Welcome `tput setaf 1` $USER! `tput sgr0`. You are using `tput setaf 6` LIVE SUBDOMAINS FINDER `tput sgr0` coded by `tput setaf 3` Aslam  `tput sgr0`" 
echo "Please make sure you have `tput setaf 4`'assetfinder'`tput sgr0` and `tput setaf 4`'httprobe'`tput sgr0` installed in your system"
}
greetings
echo ""
read -p "Enter Your Domain :" test       
assetfinder $test > subs
cat subs | httprobe > live
sort -u live > sorted
cat sorted
echo ""
echo "
░▀█▀░█░█░█▀█░█▀█░█░█░░░█░█░█▀█░█░█░░░█▀▀░█▀█░█▀▄░░░█░█░▀█▀░█▀▀░▀█▀░▀█▀░░░█▀█░█░█░█▀▄░░░█▀█░█▀█░█▀▀░█▀▀
░░█░░█▀█░█▀█░█░█░█▀▄░░░░█░░█░█░█░█░░░█▀▀░█░█░█▀▄░░░▀▄▀░░█░░▀▀█░░█░░░█░░░░█░█░█░█░█▀▄░░░█▀▀░█▀█░█░█░█▀▀
░░▀░░▀░▀░▀░▀░▀░▀░▀░▀░░░░▀░░▀▀▀░▀▀▀░░░▀░░░▀▀▀░▀░▀░░░░▀░░▀▀▀░▀▀▀░▀▀▀░░▀░░░░▀▀▀░▀▀▀░▀░▀░░░▀░░░▀░▀░▀▀▀░▀▀▀
"


