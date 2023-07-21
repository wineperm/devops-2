#1. Прочитал.
#2. Не могут. Права доступа и владелех по жеским ссылкам один, при смене меняется везде. Потому что жесткие ссылки это записи указывающие на один файл.
#3. Сделал.
#4. Disk /dev/sdb: 3 GiB, 3221225472 bytes, 6291456 sectors
#Disk model: VMware Virtual S
#Units: sectors of 1 * 512 = 512 bytes
#Sector size (logical/physical): 512 bytes / 512 bytes
#I/O size (minimum/optimal): 512 bytes / 512 bytes
#Disklabel type: gpt
#Disk identifier: D55CB171-48AC-5844-8C53-50A863D16B58
#5. #Disk /dev/sdc: 3 GiB, 3221225472 bytes, 6291456 sectors
#Disk model: VMware Virtual S
#Units: sectors of 1 * 512 = 512 bytes
#Sector size (logical/physical): 512 bytes / 512 bytes
#I/O size (minimum/optimal): 512 bytes / 512 bytes
#Disklabel type: gpt
#Disk identifier: D55CB171-48AC-5844-8C53-50A863D16B58
#6. Собрал Raid-1
#7. Собрал Raid-2
#8. qwerty@virtual-machine:~/git/devops-2$ sudo pvdisplay
# --- Physical volume ---
#  PV Name               /dev/sda3
#  VG Name               vgubuntu
#  PV Size               <19,50 GiB / not usable 4,00 MiB
#  Allocatable           yes 
#  PE Size               4,00 MiB
#  Total PE              4990
#  Free PE               8
#  Allocated PE          4982
#  PV UUID               wobe1S-DR1C-nGdD-tSWH-GvLz-n1rU-4fvMyj
#   
#  --- Physical volume ---
#  PV Name               /dev/md0
#  VG Name               vg01
#  PV Size               <2,00 GiB / not usable 0   
#  Allocatable           yes 
#  PE Size               4,00 MiB
#  Total PE              511
#  Free PE               511
#  Allocated PE          0
#  PV UUID               YZNeqG-m1kU-2gCR-rsr0-tUlT-g3Mo-5hXNYP
#   
#  --- Physical volume ---
#  PV Name               /dev/md1
#  VG Name               vg01
#  PV Size               1,99 GiB / not usable 0   
#  Allocatable           yes 
#  PE Size               4,00 MiB
#  Total PE              510
#  Free PE               485
#  Allocated PE          25
#  PV UUID               gcIXVs-faLP-TZqd-XeFe-2TBW-2Qds-VyYngP
#9. qwerty@virtual-machine:~/git/devops-2$ sudo vgdisplay 
#  --- Volume group ---
#  VG Name               vgubuntu
#  System ID             
#  Format                lvm2
#  Metadata Areas        1
#  Metadata Sequence No  3
#  VG Access             read/write
#  VG Status             resizable
#  MAX LV                0
#  Cur LV                2
#  Open LV               2
#  Max PV                0
#  Cur PV                1
#  Act PV                1
#  VG Size               19,49 GiB
#  PE Size               4,00 MiB
#  Total PE              4990
#  Alloc PE / Size       4982 / 19,46 GiB
#  Free  PE / Size       8 / 32,00 MiB
#  VG UUID               4bxGmG-dV54-605X-1uFI-YLUR-1Dqd-2Scymm
#10.qwerty@virtual-machine:~/git/devops-2$ sudo lvs -o +devices
#  LV     VG       Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert Devices        
#  lv01   vg01     -wi-ao---- 100,00m                                                     /dev/md1(0)    
#  root   vgubuntu -wi-ao---- <17,47g                                                     /dev/sda3(0)   
#  swap_1 vgubuntu -wi-ao----   1,99g                                                     /dev/sda3(4472)
#11. Создал.
#12. Смотрировал.   
#13. qwerty@virtual-machine:~/git/devops-2$ ll /tmp/new/
#total 24820
#drwxr-xr-x  3 root root     4096 июл  7 17:08 ./
#drwxrwxrwt 21 root root     4096 июл  7 17:06 ../
#drwx------  2 root root    16384 июл  7 17:04 lost+found/
#-rw-r--r--  1 root root 25388376 июл  7 15:16 test.gz
#14.root@virtual-machine:/tmp/new# lsblk
#NAME                MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINTS
#loop0                 7:0    0  63,4M  1 loop  /snap/core20/1950
#loop1                 7:1    0  63,4M  1 loop  /snap/core20/1974
#loop2                 7:2    0  73,9M  1 loop  /snap/core22/806
#loop3                 7:3    0  73,9M  1 loop  /snap/core22/766
#loop4                 7:4    0     4K  1 loop  /snap/bare/5
#loop5                 7:5    0   245M  1 loop  /snap/firefox/2850
#loop6                 7:6    0 244,5M  1 loop  /snap/firefox/2800
#loop7                 7:7    0 346,3M  1 loop  /snap/gnome-3-38-2004/119
#loop8                 7:8    0 349,7M  1 loop  /snap/gnome-3-38-2004/140
#loop9                 7:9    0 466,5M  1 loop  /snap/gnome-42-2204/111
#loop10                7:10   0  53,3M  1 loop  /snap/snapd/19361
#loop11                7:11   0   304K  1 loop  /snap/snapd-desktop-integration/49
#loop12                7:12   0  91,7M  1 loop  /snap/gtk-common-themes/1535
#loop13                7:13   0  53,3M  1 loop  /snap/snapd/19457
#loop14                7:14   0  12,3M  1 loop  /snap/snap-store/959
#loop15                7:15   0  45,9M  1 loop  /snap/snap-store/638
#loop16                7:16   0 485,5M  1 loop  /snap/gnome-42-2204/120
#loop17                7:17   0   452K  1 loop  /snap/snapd-desktop-integration/83
#sda                   8:0    0    20G  0 disk  
#├─sda1                8:1    0     1M  0 part  
#├─sda2                8:2    0   513M  0 part  /boot/efi
#└─sda3                8:3    0  19,5G  0 part  
#  ├─vgubuntu-root   253:0    0  17,5G  0 lvm   /var/snap/firefox/common/host-hunspell
#  │                                            /
#  └─vgubuntu-swap_1 253:1    0     2G  0 lvm   [SWAP]
#sdb                   8:16   0     3G  0 disk  
#├─sdb1                8:17   0     2G  0 part  
#│ └─md0               9:0    0     2G  0 raid1 
#└─sdb2                8:18   0  1023M  0 part  
#  └─md1               9:1    0     2G  0 raid0 
#    └─vg01-lv01     253:2    0   100M  0 lvm   /tmp/new
#sdc                   8:32   0     3G  0 disk  
#├─sdc1                8:33   0     2G  0 part  
#│ └─md0               9:0    0     2G  0 raid1 
#└─sdc2                8:34   0  1023M  0 part  
#  └─md1               9:1    0     2G  0 raid0 
#    └─vg01-lv01     253:2    0   100M  0 lvm   /tmp/new
#15. qwerty@virtual-machine:/tmp/new$ gzip -t /tmp/new/test.gz
#qwerty@virtual-machine:/tmp/new$ echo $?
#0
#16. pvmove -v /dev/md126 /dev/md127
#  Archiving volume group "vol_group1" metadata (seqno 2).
#  Creating logical volume pvmove0
#  activation/volume_list configuration setting not defined: Checking only host tags for vol_group1/lv01.
#  Moving 25 extents of logical volume vol_group1/lv01.
#  activation/volume_list configuration setting not defined: Checking only host tags for vol_group1/lv01.
#  Creating vol_group1-pvmove0
#  Loading table for vol_group1-pvmove0 (253:3).
#  Loading table for vol_group1-lv01 (253:2).
#  Suspending vol_group1-lv01 (253:2) with device flush
#  Resuming vol_group1-pvmove0 (253:3).
#  Resuming vol_group1-lv01 (253:2).
#  Creating volume group backup "/etc/lvm/backup/vol_group1" (seqno 3).
#  activation/volume_list configuration setting not defined: Checking only host tags for vol_group1/pvmove0.
#  Checking progress before waiting every 15 seconds.
#  /dev/md126: Moved: 8,00%
#  /dev/md126: Moved: 100,00%
#  Polling finished successfully.
#17.mdadm --manage /dev/md127 --fail /dev/sdb1
#18. [ 1724.135550] md/raid1:md127: Disk failure on sdb1, disabling device.
#               md/raid1:md127: Operation continuing on 1 devices.
#19. root@virtual-machine:/tmp/new# gzip -t /tmp/new/test.gz
#root@virtual-machine:/tmp/new# echo $?
#0

