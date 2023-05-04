cdrom

text

eula --agreed

lang fr_FR

keyboard fr

rootpw --lock

user --name=root --iscrypted --password=admin123 --groups=wheel

firewall --enabled --ssh

authselect select sssd

selinux --enforcing

timezone UTC

bootloader --location=mbr

zerombr

respective architecture.
clearpart --all --initlabel

part /boot --fstype xfs --size=1024 --label=BOOTFS
part /boot/efi --fstype vfat --size=1024 --label=EFIFS
part pv.01 --size=100 --grow

volgroup sysvg --pesize=4096 pv.01

logvol swap --fstype swap --name=lv_swap --vgname=sysvg --size=1024 --label=SWAPFS
logvol / --fstype xfs --name=lv_root --vgname=sysvg --size=12288 --label=ROOTFS
logvol /home --fstype xfs --name=lv_home --vgname=sysvg --size=4096 --label=HOMEFS --fsoptions=nodev,nosuid
logvol /opt --fstype xfs --name=lv_opt --vgname=sysvg --size=2048 --label=OPTFS --fsoptions=nodev
logvol /tmp --fstype xfs --name=lv_tmp --vgname=sysvg --size=4096 --label=TMPFS --fsoptions=nodev,noexec,nosuid
logvol /var --fstype xfs --name=lv_var --vgname=sysvg --size=4096 --label=VARFS --fsoptions=nodev
logvol /var/log --fstype xfs --name=lv_log --vgname=sysvg --size=4096 --label=LOGFS --fsoptions=nodev,noexec,nosuid
logvol /var/log/audit --fstype xfs --name=lv_audit --vgname=sysvg --size=4096 --label=AUDITFS --fsoptions=nodev,noexec,nosuid

services --enabled=NetworkManager,sshd

skipx

%packages --ignoremissing --excludedocs
@core
-iwl*firmware
%end

%post
dnf makecache
dnf install epel-release -y
dnf makecache
dnf install -y sudo open-vm-tools perl
echo "root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/root
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers
%end

reboot --eject