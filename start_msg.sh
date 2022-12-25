#!/bin/bash
fn=""
PaPWD="$PWD"
PrPWD="/root/nube"
pasa=0
nomprograma=$0
slash=$(echo "$nomprograma"| $PrPWD/stdbuscaarg_donde_hasta "/" )
while [ -n "$slash" ];do
    nomprograma=$(echo "$nomprograma"| $PrPWD/stdcdr "/" )
    slash=$(echo "$nomprograma" | $PrPWD/stdbuscaarg_donde_hasta "/" )
done
cd $PrPWD
PrPWD2=$PWD
PrPWD=$PrPWD2
cd $PaPWD
echo "$PrPWD"
echo "$nomprograma"
echo "$nomprograma..   - - -    $PrPWD - - - -  bash $PrPWD/querydescargausuario1.sh"
sleep 1
namo="descargausuarioreg"
screen -dmS $namo
sleep 1
screen -S $namo -X stuff  "bash $PrPWD/querydescargausuario1.sh"
screen -S $namo -X stuff  $'\r'
namo="descargausuariobyet"
screen -dmS $namo
sleep 1
screen -S $namo -X stuff  "bash $PrPWD/querydescargausuario3.sh"
screen -S $namo -X stuff  $'\r'
namo="descargausuariowh"
screen -dmS $namo
sleep 1
screen -S $namo -X stuff  "bash $PrPWD/querydescargausuario3wh.sh"
screen -S $namo -X stuff  $'\r'
namo="buscausuario"
screen -dmS $namo
sleep 1
screen -S $namo -X stuff  "bash $PrPWD/querybuscacsusuario3.sh"
screen -S $namo -X stuff  $'\r'
namo="buscausuarioreg"
screen -dmS $namo
sleep 1
screen -S $namo -X stuff  "bash $PrPWD/querybuscacsusuario1.sh"
screen -S $namo -X stuff  $'\r'
namo="hazindice"
screen -dmS $namo
sleep 1
screen -S $namo -X stuff  "bash $PrPWD/querybuscacshacerindice.sh"
screen -S $namo -X stuff  $'\r'
