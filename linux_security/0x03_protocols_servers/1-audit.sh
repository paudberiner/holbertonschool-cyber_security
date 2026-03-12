#!/bin/bash
grep -v "ˆ#" /etc/ssh/sshd_config | grep -Ev "ˆ$"  | awk 'NF' | snort