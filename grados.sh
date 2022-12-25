#!/bin/bash
fn=""
PaPWD="$PWD"
stdcdr="stdcdr"
stdcdrd=""
while [ ! -f "$stdcdrd$stdcdr" ];do
    stdcdrd=$(echo "../$stdcdrd")
done
PrPWD=$stdcdrd
pasa=0
nomprograma=$0
slash=$(echo "$nomprograma"| $PrPWD/stdbuscaarg_donde_hasta "/" )
while [ -n "$slash" ];do
    nomprograma=$(echo "$nomprograma"| $PrPWD/stdcdr "/" )
    slash=$(echo "$nomprograma" | $PrPWD/stdbuscaarg_donde_hasta "/" )
done
while [ 1 ];do
    python3 $PrPWD/chach20.py
    cp -fv grados.js $PrPWD/users/output/unencrypted/
    cat $PrPWD/data/grados-log.txt | grep grados | tr -d ';' | tr -d '
' | sed "s/var grados=/ /g" > set
    curl --retry-all-errors --retry 30 -X POST -F "fileToUpload=@set" -F "namo=set" -F "submit=submit"  -F "user=admin" -F 'pass=Effata00' http://95.217.2.43/uppy.php
sleep 61
done
