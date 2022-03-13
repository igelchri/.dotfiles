#!/bin/bash
#set -e
##################################################################################################################
# Author 	: Erik Dubois
# Website   : https://www.erikdubois.be
# Website	: https://www.arcolinux.info
# Website	: https://www.arcolinux.com
# Website	: https://www.arcolinuxd.com
# Website	: https://www.arcolinuxb.com
# Website	: https://www.arcolinuxiso.com
# Website	: https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
 
sudo pacman -S --noconfirm --needed exa bat fd stow micro fish 

echo "################################################################"
echo "################### core software installed"
echo "################################################################"

# Linux Zen und Nvidia

sudo pacman -S --noconfirm --needed  linux-zen linux-zen-headers nvidia-dkms lib32-nvidia-utils  lib32-opencl-nvidia nvidia-utils

echo "################################################################"
echo "################### Linux Zen und Nvidia installiert"
echo "################################################################"


###############################################################################################


echo "################################################################"
echo "################### end"
echo "################################################################"