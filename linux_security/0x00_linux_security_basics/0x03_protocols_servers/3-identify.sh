#!/bin/bash
lynis audit system --no-colors | grep -E "Suggestion|Warning|Vulnerable"