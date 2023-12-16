notes


milkv-duo board has static address 192.168.42.1 to SSH
ssh in at root@192.168.42.1 password:milkv


To confirm:
sudo dmesg | grep usb0
returns something like: [12075.843694] rndis_host 1-2.2:1.0 enx4a2f1e666665: renamed from usb0

ip addr show enx4a2f1e666665
returns something like:     inet 192.168.42.209/24 brd 192.168.42.255 scope global dynamic noprefixroute enx4a2f1e666665
us 1 for the last enrty and ping to check


export MILKV_BOARD=milkv-duo
source milkv/boardconfig-milkv-duo.sh

source build/milkvsetup.sh
defconfig cv1800b_milkv_duo_sd

menuconfig

clean_all
build_all
pack_sd_image


lsbk and find the sd card
unmount sd (keep connected) and dd image to sd
sudo dd if=/out/milkv-duo-xxxxx-xxx.img of=/dev/XXX bs=1M status=progress conv=fsync