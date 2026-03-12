#!/bin/bash
nmap -p 2049 --script=nfs-showmount $1 | grep -e "\/\|NFS"