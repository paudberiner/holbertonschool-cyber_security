#!/bin/bash
[ -z "$1" ] && echo "Usage: $0 <password>" && exit 1 || openssl dgst -sha512 -hex <<< "$1$(openssl rand -hex 8)" | awk '{print $2}' > 3_hash.txt