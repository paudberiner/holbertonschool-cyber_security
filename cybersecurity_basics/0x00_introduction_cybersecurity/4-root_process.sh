#!/bin/bash
ps -u "$1" -o user,pid,%cpu,%mem,vsz,rss,tty,stat,start,time,command --no-headers | grep -vE ' +0 +0( |$)'
