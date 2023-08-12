#Restore Nvidia 535 driver on ubuntu 22.04.3 LTS
#Maybe help anyone

# errors
# Driver from Nvidia website 535 (.run) have error when build modules
# cat /var/log/nvidia-installer.log
# cc: error: unrecognized command-line option '-ftrivial-auto-var-init=zero'
#
# system can't start driver 535 from repo, nvidia-smi - error connect to driver

#conditions:
# enter in recovery mode 6.2.0-26-generic kernel from grub
# establish network connections from restore menu
# check dpkg conflicts from restore menu
# go to root

#BE CAREFUL with nvidia deb-s delete, I CANT START OS after grub
# delete old repo drivers
apt remove --purge nvidia-compute-utils-535 nvidia-dkms-535 nvidia-firmware-535-535.86.05 nvidia-kernel-common-535  nvidia-kernel-source-535 nvidia-prime nvidia-settings  nvidia-utils-535 xserver-xorg-video-nvidia-535

#if you install from nvidia .run then :
./NVIDIA-Linux-x86_64-535.86.05.run --uninstall

#clear not need garbage and old kernels. For me:
apt-get remove linux-headers-6.2.0-26_6.2.0-26.26_all.deb
apt-get remove linux-headers-5.15.0-27
apt-get remove linux-headers-generic-hwe-22.0 #wtf is dat?

#delete kernel-headers
apt-get remove --purge linux-headers-$(uname -r)

#and install again
apt-get install linux-headers-$(uname -r)

#install driver from ubuntu repo, waiting initramfs, dkms and other
apt-get install nvidia-driver-535

#AND THEN one more time
update-initramfs -u