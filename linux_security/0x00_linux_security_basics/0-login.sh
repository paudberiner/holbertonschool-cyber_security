#!/bin/bash
( sudo -n last -F 2>/dev/null || last -F ) | head -n 5
