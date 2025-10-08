#!/bin/bash
[ "$(id -u)" -eq 0 ] && last -F | head -n 5 || sudo last -F | head -n 5
