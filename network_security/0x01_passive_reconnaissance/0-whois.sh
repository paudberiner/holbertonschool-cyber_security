#!/bin/bash
whois "$1" | awk -F':[[:space:]]*' '
function trim(s){ sub(/^[[:space:]]+/,"",s); sub(/[[:space:]]+$/,"",s); return s }
{
  key = $1; val = trim($2)
  if ( key ~ /^(Registrant|Admin|Tech) (Name|Organization|Street|Email|City|State\/Province|Postal Code|Country|Phone|Phone Ext|Fax|Fax Ext)$/ ) {
    split(key, tmp, " "); role = tmp[1]
    rest = substr(key, length(role)+2)
    csvkey = rest; gsub(/ /,"",csvkey)
    if (role == "Registrant") R[csvkey] = val
    else if (role == "Admin") A[csvkey] = val
    else if (role == "Tech")  T[csvkey] = val
  }
}
END {
  split("Name|Organization|Street|Email|City|State/Province|PostalCode|Country|Phone|PhoneExt|Fax|FaxExt", F, "|")
  print_block("Registrant", R)
  print_block("Admin",      A)
  print_block("Tech",       T)
}
function safe(v){ return (v=="" ? "" : v) }
function print_line(prefix, field, value,   label) {
  label = prefix field
  if (field == "Street") print label ", " safe(value); else print label "," safe(value)
}
function print_block(prefix, arr,   i,k,v){
  for (i=1;i<=12;i++){ k=F[i]; v=arr[k]; print_line(prefix,k,v) }
}
'
