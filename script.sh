#!/usr/bin/env bash

disk=/dev/sda
boot=$disk"1"
root=$disk"2"

main() {
	parted --script $disk mklabel gpt
	parted --script $disk mkpart boot 1048576b 269484031b
	parted --script $disk set 1 boot on
	parted --script $disk mkpart root 269484032b 17449353215b
	mkfs.fat -F 32 $boot
	mkfs.ext4 -F $root
	parted --script $disk unit b print
	mount $root /mnt
	mount --mkdir $boot /mnt/boot
	pacman -Sy --noconfirm archlinux-keyring
	pacstrap /mnt base linux linux-firmware networkmanager bash bash-completion vim git
	genfstab -t PARTUUID /mnt > /mnt/etc/fstab
}

main
