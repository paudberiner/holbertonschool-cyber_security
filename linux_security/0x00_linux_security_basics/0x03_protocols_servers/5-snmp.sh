#!/bin/bash
onesixtyone -c /etc/snmp/snmpd.conf $1 | grep "public"