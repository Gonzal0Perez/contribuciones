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
cd $PrPWD
PrPWD2=$PWD
PrPWD=$PrPWD2
cd $PaPWD
#echo "$nomprograma.."
listados="";
listado="";
qrpath="/root/QRCode/src/";
lista1=$(echo "$PrPWD/users/input/unencrypted/" | $PrPWD/listadodirectorio_files_from_std_extension_c )
lista2=$(echo -n "$lista1
$lista0" )
lista0=$lista2
salta=$(expr $presalta + 1)
busca=".."
posicion=0;
dondes=$( echo "$lista0" |$PrPWD/stdbuscaarg_donde "
")
encuentra="ALGO"
while [ -n "$dondes" -a -n "$encuentra" ];do
    listf=$(echo "$lista0" | $PrPWD/stdcdrn "0$posicion"|$PrPWD/stdcarsin '
')
    posicion=$(echo "$dondes" |$PrPWD/stdcarsin " ")
    posicion=$(expr 0$posicion + 1)
    dondes=$(echo "$dondes" |$PrPWD/stdcdr " ")
    chacha=""
    if [ -n "$listf" ];then
	chacha=$(cat "$listf"|$PrPWD/chacha20)
    fi
    if [ -f "$listf.lock" ];then
	encuentra="ALGO"
	continue
    fi
    encuentra=$(cat $nomprograma.memoria | $PrPWD/stdbuscaarg ";$listf;$chacha;")
done
if [ -z "$encuentra" ];then
    echo ";$listf;$chacha;" >> $nomprograma.memoria
fi
ps1=1
while [ -f "$nomprograma.lock-$ps1" ];do
    if [ 0$ps1 -lt 6 ];then
	#echo "W W W W W W W W W W W W W   $ps1"
	ps1=$(expr 0$ps1 + 1)
    else
	ps1=1
	sleep 1
    fi
done
touch "$nomprograma.lock-$ps1"
touch "$listf.lock"
fn=$listf
remotepath="http://curare2019.ddns.net"
$0 &
if [ -z "$encuentra" -a -n "$listf" ];then
    fn=$listf
    echo "<< fn $fn >>"
    ttest=$(echo -n "$fn" |$PrPWD/stddelcar " ")
    if [ -n "$ttest" ];then
	slash=$(echo "$fn" | $PrPWD/stdbuscaarg_donde_hasta "/" )
	fn2="$fn"
	while [ -n "$slash" ];do
	    fn2=$(echo -n "$fn2" | $PrPWD/stdcdr "/" )
	    slash=$(echo -n "$fn2" | $PrPWD/stdbuscaarg_donde_hasta "/" )
	done
	dirfn=$(echo -n "$fn"|$PrPWD/stdcarsin "/$fn2")
	mkdir "$dirfn/data"
	dirfn=$(echo -n "$dirfn/data" )
    	echo "0 $busca ($fn2) $dirfn"
	len=$(cat "$fn"|wc -c|tr -d ' '|tr -d '
')
	if [ 0$len -gt 0 ];then
	    mains=$(cat "$fn"|$PrPWD/stdbuscaarg " main")
	    opens=$(cat "$fn"|$PrPWD/stdcdr " main"|$PrPWD/stdbuscaarg_count "{")
	    closs=$(cat "$fn"|$PrPWD/stdcdr " main"|$PrPWD/stdbuscaarg_count "}")
	    balan=$(expr 0$opens - $closs)
	    echo "$len $opens-$closs"
	    if [ 0$opens -gt 0 -a "$balan" = "0" -a -n "$mains" ];then
    		ejec="$fn.$nomprograma.bin"
		echo "E: $ejec"
		errores=$(gcc -o "$ejec" "$fn" 2>&1 )
		if [ -z "$errores" ];then
		    utcc=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
		    while [ -f "$dirfn/$utcc.c" ];do
			utcc=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
		    done
		    variables=$(cat "$fn" |$PrPWD/stddeclaracionesdevariable|tr '
' ';')
		    echo "$variables"
		    varos="";
		    varis=$(echo -n ";$variables" |$PrPWD/stdbuscaarg "char *prefix_email")
		    if [ -n "$varis" ];then
			varos="$varos$varis"
			echo "$varos"
		    else
			if [ -n "$fn" ];then
			    rm  "$fn.lock"
			fi
			rm  "$nomprograma.lock-$ps1"
			exit 0
		    fi
		    varis=$(echo -n ";$variables"|$PrPWD/stdbuscaarg "char *prefix_bets")
		    if [ -n "$varis" ];then
			varos="$varos$varis"
			echo "$varos"
		    else
			if [ -n "$fn" ];then
			    rm  "$fn.lock"
			fi
			rm  "$nomprograma.lock-$ps1"
			exit 0
		    fi		    
		    varis=$(echo -n ";$variables"|$PrPWD/stdbuscaarg "char *prefix_dates")
		    if [ -n "$varis" ];then
			varos="$varos$varis"
			echo "$varos"
		    else
			if [ -n "$fn" ];then
			    rm  "$fn.lock"
			fi
			rm  "$nomprograma.lock-$ps1"
			exit 0
		    fi
		    varis=$(echo -n ";$variables"|$PrPWD/stdbuscaarg "char *prefix_numeros")
		    if [ -n "$varis" ];then
			varos="$varos$varis"
			echo "$varos"
		    else
			if [ -n "$fn" ];then
			    rm  "$fn.lock"
			fi
			rm  "$nomprograma.lock-$ps1"
			exit 0
		    fi		    
		    if [ "$varos" = "****" ];then
			email=$(echo -n ";$variables" |$PrPWD/stdcdr ";char *prefix_email=\""|$PrPWD/stdcarsin '"')
			lendates=0;
			lendates=$(echo -n ";$variables" |$PrPWD/stdcdr ";char *prefix_dates[" | $PrPWD/stdcarsin "]")
		        dates=$(echo -n ";$variables" |$PrPWD/stdcdr ";char *prefix_dates["|$PrPWD/stdcdr "="| $PrPWD/stdcarsin ";")
			numeros=$(echo -n ";$variables" |$PrPWD/stdcdr ";char *prefix_numeros"|$PrPWD/stdcdr "="| $PrPWD/stdcarsin ";")
			bets=$(echo -n ";$variables" |$PrPWD/stdcdr ";char *prefix_bets"|$PrPWD/stdcdr "="| $PrPWD/stdcarsin ";")
			aspecas=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			coma=$(echo "$dates"|$PrPWD/stdbuscaarg ",")
			while [ "0$lendates" -gt 0 ];do
			    while [ -f "$PaPWD/$aspecas.c" ];do
				aspecas=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			    done
			    correlativo=$(dd if=/dev/random bs=1 count=6 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " " )
			    correlativod=$(echo "ibase=16;$correlativo"|bc|$PrPWD/stdcarn 10 );
			    while [ -f "$PaPWD/$corelativod" ];do
				correlativo=$(dd if=/dev/random bs=1 count=6 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
				correlativod=$(echo "ibase=16;$correlativo"|bc|$PrPWD/stdcarn 10 );
			    done
			    touch $PaPWD/$correlativo
			    url=$(echo "$email $correlativo" | tr -d '
' |  sha224sum | ~/nube/stdcarsin ' '|~/nube/stdfromhex|base64 | ~/nube/stdcarsin "=" | tr -d '+' | tr -d '/' )
			    urlb="$url.png"
			    len=$(echo "$remotepath/$url.png" |tr -d '
' | wc -c | $PrPWD/stdcarsin ' ')
			    len=$(expr $len + 1)
			    cat $qrpath/qrcode.c | $PrPWD/stdcar " cadena[" > "$PaPWD/$aspecas.c"
			    echo "$len]=\"$remotepath/$url.png\";" >> "$PaPWD/$aspecas.c"
			    cat $qrpath/qrcode.c | $PrPWD/stdcdr " cadena[" | $PrPWD/stdcdr ";" >> "$PaPWD/$aspecas.c"
			    aspectroseclerrores=$(gcc -o "$PaPWD/$aspecas" "$PaPWD/$aspecas.c" -I$qrpath 2>&1 )
			    if [ -z "$aspectroseclerrores" ];then
				$PaPWD/$aspecas > $PaPWD/$aspecas.pbm
				convert $PaPWD/$aspecas.pbm $PaPWD/$aspecas.png
				echo "!!!!!!!!!!!!!! $len"
				echo $correlativo
				datea=$(echo "$dates"|$PrPWD/stdcarsin ",")
				dates=$(echo "$dates"|$PrPWD/stdcdr ",")
				numeroa=$(echo "$numeros"|$PrPWD/stdcarsin ",")
				numeros=$(echo "$numeros"|$PrPWD/stdcdr ",")
				beta=$(echo "$bets"|$PrPWD/stdcarsin ",")
				bets=$(echo "$bets"|$PrPWD/stdcdr ",")
				convert $PrPWD/AB0.png  \( $PaPWD/$aspecas.png -scale 280x280 -geometry +205+105 \) -composite -compose over  -pointsize 22 -fill '#7e5116'  -annotate +100+850 "Evento $(date --date @$datea) \n Apuesta de $beta Fichas \n al Numero $numeroa " $PaPWD/$aspecas-out.png
			    ls -lh $PaPWD/$aspecas-out.png
			    echo "<<<<< $nombre >>>>>>"
			    if [ -n "$nombre" ];then
				curl --retry-all-errors --retry 30 -X POST -F "fileToUpload=@$PaPWD/$shapago" -F "namo=$shapago" -F "submit=submit"  -F "user=admin" -F 'pass=Effata00' http://95.217.2.43/uppy.php
			    fi				
			    curl --retry-all-errors --retry 30 -X POST -F "fileToUpload=@$PaPWD/$aspecas-out.png" -F "namo=$url.png" -F "submit=submit"  -F "user=admin" -F 'pass=Effata00' http://95.217.2.43/uppy.php
			    echo "!!!!!"
			    echo "$correlativod"
			else
			    echo "ERROR EN QRCODE"
			    echo "$aspectroseclerrores" 
			    if [ -n "$fn" ];then
				rm  "$fn.lock"
			    fi
			    rm  "$nomprograma.lock-$ps1"
			    exit 1
			fi
			mkdir $PrPWD/users/output
			mkdir $PrPWD/users/output/unencrypted
			mkdir $PrPWD/users/output/unencrypted/data

			userd="ticketadmin"
			nombre=$(echo "$userd" | tr -d '
' | sha512sum | $PrPWD/stdcarsin ' ')
			touch $PrPWD/users/output/$userd/$nombre.js
			encuentra=$(cat $PrPWD/users/output/$userd/$nombre.js |$PrPWD/stdbuscaarg "var descripcion")
			if [ -z "$encuentra" ];then
			    echo "var descripcion=new Array('')" >> $PrPWD/users/output/$userd/$nombre.js
			fi
			encuentra=$(cat $PrPWD/users/output/$userd/$nombre.js |$PrPWD/stdbuscaarg "$email-$correlativod")
			if [ -z "$encuentra" ];then
			    echo "/*$email-$correlativod*/"  >> $PrPWD/users/output/$userd/$nombre.js
			    
			    echo "descripcion[descripcion.length]=\"$numeroa, $email,$(date --date @$datea),$beta;" >> $PrPWD/users/output/$userd/$nombre.js
			fi
			echo $PrPWD/users/output/$userd/$nombre.js

			userd="$email"
			nombre=$(echo "$userd" | tr -d '
' | sha512sum | $PrPWD/stdcarsin ' ')
			pagoval=$(echo "$pago"|sha512sum|$PrPWD/stdcarsin ' ')
			touch $PrPWD/users/output/unencrypted/$nombre.js
			encuentra=$(cat $PrPWD/users/output/unencrypted/$nombre.js |$PrPWD/stdbuscaarg "var descripcion")
			if [ -z "$encuentra" ];then
			    echo "var descripcion=new Array('')" >> $PrPWD/users/output/unencrypted/$nombre.js
			fi
			encuentra=$(cat $PrPWD/users/output/unencrypted/$nombre.js |$PrPWD/stdbuscaarg "$email-$correlativod")
			if [ -z "$encuentra" ];then
			    echo "/*$email-$correlativod*/"  >> $PrPWD/users/output/unencrypted/$nombre.js
			    echo "descripcion[descripcion.length]=\"$url.png\";" >> $PrPWD/users/output/unencrypted/$nombre.js
			    echo "nombre[nombre.length]=\"$remotepath/$url.png\";" >> $PrPWD/users/output/unencrypted/$nombre.js
			    echo $PrPWD/users/output/unencrypted/$nombre.js
			fi
			cantidad=$(expr 0$cantidad - 1)
			done
			
		    fi
		fi
	    fi
	fi
    fi
fi
if [ -n "$fn" ];then
    rm  "$fn.lock"
fi
rm  "$nomprograma.lock-$ps1"
