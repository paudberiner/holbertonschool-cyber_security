#!/bin/bash
ps aux | awk -v u="$1" 'NR>1 && $1==u && $5!=0 && $6!=0'
