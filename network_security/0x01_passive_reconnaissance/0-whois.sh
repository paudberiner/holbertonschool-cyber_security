#!/bin/bash
whois "$1" | awk -F': *' '
function T(s){ sub(/^[[:space:]]+/,"",s); sub(/[[:space:]]+$/,"",s); return s }
$1 ~ /^Registrant /{ k=substr($1,12); k=gensub(/ /,"","g",k); R[k]=T($2) }
$1 ~ /^Admin /{      k=substr($1,7);  k=gensub(/ /,"","g",k); A[k]=T($2) }
$1 ~ /^Tech /{       k=substr($1,6);  k=gensub(/ /,"","g",k); Tt[k]=T($2) }
END{
  split("Name|Organization|Street|Email|City|State/Province|PostalCode|Country|Phone|PhoneExt|Fax|FaxExt", f, "|");
  for(i=1;i<=12;i++){k=f[i];v=R[k];  printf((k=="Street"?"Registrant%s, %s\n":"Registrant%s,%s\n"),k,v)}
  for(i=1;i<=12;i++){k=f[i];v=A[k];  printf((k=="Street"?"Admin%s, %s\n":"Admin%s,%s\n"),k,v)}
  for(i=1;i<=12;i++){k=f[i];v=Tt[k]; printf((k=="Street"?"Tech%s, %s\n":"Tech%s,%s\n"),k,v)}
}
'
