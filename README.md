# Step 1 - Create box "mylinux". 
# 2  CentOS/7
# 3  Add 4 disks. "sdb", "sdc', "sdd", "sde"
		NAME      MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINT
		sda         8:0    0   40G  0 disk
		└─sda1      8:1    0   40G  0 part  /
		sdb         8:16   0  500M  0 disk
		sdc         8:32   0  500M  0 disk
		sdd         8:48   0  500M  0 disk
		sde         8:64   0  500M  0 disk

# 4  Create RAID1 with name md1, use disks: "sdb" and "sdc" 
		NAME      MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINT
		sda         8:0    0   40G  0 disk
		└─sda1      8:1    0   40G  0 part  /
		sdb         8:16   0  500M  0 disk
		└─md1       9:1    0  500M  0 raid1
		  ├─md1p1 259:0    0    1M  0 md
		  ├─md1p2 259:1    0    1M  0 md
		  ├─md1p3 259:2    0    1M  0 md
		  ├─md1p4 259:3    0    1M  0 md
		  └─md1p5 259:4    0    1M  0 md
		sdc         8:32   0  500M  0 disk
		└─md1       9:1    0  500M  0 raid1
		  ├─md1p1 259:0    0    1M  0 md
		  ├─md1p2 259:1    0    1M  0 md
		  ├─md1p3 259:2    0    1M  0 md
		  ├─md1p4 259:3    0    1M  0 md
		  └─md1p5 259:4    0    1M  0 md
		sdd         8:48   0  500M  0 disk
		└─md1       9:1    0  500M  0 raid1
		  ├─md1p1 259:0    0    1M  0 md
		  ├─md1p2 259:1    0    1M  0 md
		  ├─md1p3 259:2    0    1M  0 md
		  ├─md1p4 259:3    0    1M  0 md
		  └─md1p5 259:4    0    1M  0 md
		sde         8:64   0  500M  0 disk
# 5  Add disk "sdd" to the RAID as spare
		mdadm --detail /dev/md1
		/dev/md1:
				   Version : 0.90
			 Creation Time : Fri May  7 12:46:52 2021
				Raid Level : raid1
				Array Size : 511936 (499.94 MiB 524.22 MB)
			 Used Dev Size : 511936 (499.94 MiB 524.22 MB)
			  Raid Devices : 2
			 Total Devices : 3
		   Preferred Minor : 1
			   Persistence : Superblock is persistent

			   Update Time : Fri May  7 12:47:20 2021
					 State : clean
			Active Devices : 2
		   Working Devices : 3
			Failed Devices : 0
			 Spare Devices : 1

		Consistency Policy : resync

					  UUID : 862d58e2:0de226c1:fcf98ad4:a490e48c (local to host mylinux)
					Events : 0.29

			Number   Major   Minor   RaidDevice State
			   0       8       16        0      active sync   /dev/sdb
			   1       8       32        1      active sync   /dev/sdc

			   2       8       48        -      spare   /dev/sdd

#     Create new 5 partitions by sgdisk script:
	DEVICE='/dev/md1'
	for i in {1..5} ; do  sgdisk -n ${i}:0:+1M $DEVICE ; done


		Model: Linux Software RAID Array (md)
		Disk /dev/md1: 524MB
		Sector size (logical/physical): 512B/512B
		Partition Table: gpt
		Disk Flags:

		Number  Start   End     Size    File system  Name  Flags
		 1      1049kB  2097kB  1049kB
		 2      2097kB  3146kB  1049kB
		 3      3146kB  4194kB  1049kB
		 4      4194kB  5243kB  1049kB
		 5      5243kB  6291kB  1049kB
		 
