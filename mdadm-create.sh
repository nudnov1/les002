#!/usr/bin/env bash

# 1. Create RAID 1
mdadm --create /dev/md/raid1_tst --level=1 --raid-device=2 /dev/sdb /dev/sdc
# 2. #Add disk to raid:
mdadm --add /dev/md/raid1_tst /dev/sdd