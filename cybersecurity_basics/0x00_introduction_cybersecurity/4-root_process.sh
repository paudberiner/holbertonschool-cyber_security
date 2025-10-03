#!/bin/bash
ps aux | grep -E "^$1[[:space:]]" | grep -vE ' +0 +0( |$)'
