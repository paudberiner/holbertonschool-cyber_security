#!/bin/bash
ps aux | grep -E "^$1[[:space:]]" | grep -v " 0 0 "
