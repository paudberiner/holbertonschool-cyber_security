#!/bin/bash
whois $1 | awk -F ':' '/^Registration | ^Admin | ^Tech | ^Registrant / {print $1 ": " $2}' > "$1_whois_info.csv"