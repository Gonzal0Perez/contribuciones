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
if [ -d "$PrPWD/users/output" ];then
    listados=$(echo $PrPWD/users/output|$PrPWD/listadodirectorio_dirs_from_std|$PrPWD/stdbuscaarg_donde '
')
    listado=$(echo $PrPWD/users/output|$PrPWD/listadodirectorio_dirs_from_std)
    salta=0;
    while [ -n "$listados" ];do
	presalta=$(echo -n "$listados" | $PrPWD/stdcar " ")
	dirn=$(echo -n "$listado"|$PrPWD/stdcdrn 0$salta | $PrPWD/stdcarn $presalta)
	lista1=$(echo "$dirn" | $PrPWD/listadodirectorio_files_from_std )
	lista2=$(echo -n "$lista1
$lista0" )
	lista0=$lista2
	salta=$(expr 0$presalta + 1)
	listados=$(echo -n "$listados" | $PrPWD/stdcdr " ")
    done
else
    sleep 10
    $0 &
    exit
fi
busca=".."
posicion=0;
dondes=$( echo "$lista0" |$PrPWD/stdbuscaarg_donde "
")
encuentra="ALGO"
#echo  ">:<"
while [ -n "$dondes" -a -n "$encuentra" ];do
    
    listf=$(echo "$lista0" | $PrPWD/stdcdrn "0$posicion"|$PrPWD/stdcarsin '
')
    posicion=$(echo "$dondes" |$PrPWD/stdcarsin " ")
    posicion=$(expr 0$posicion + 1)
    dondes=$(echo "$dondes" |$PrPWD/stdcdr " ")
    chacha=""
    if [ -n "$listf" ];then
	chacha=$(cat "$listf"|sha512sum)
    fi
    encuentra=$(cat $nomprograma.memoria | $PrPWD/stdbuscaarg ";$listf;$chacha;")
    if [ -z "$encuentra" ];then
	echo ";$listf;$chacha;" >> $nomprograma.memoria
    fi
    if [ -z "$encuentra" -a -n "$listf" ];then
	fn=$listf
	echo "<< fn .$fn. >>"
	ttest=$(echo -n "$fn" |$PrPWD/stddelcar " ")
	if [ -n "$ttest" ];then
	    original=$fn
	    slash=$(echo "$fn" | $PrPWD/stdbuscaarg_donde_hasta "/" )
	    fn2="$fn"
	    while [ -n "$slash" ];do
		fn2=$(echo -n "$fn2" | $PrPWD/stdcdr "/" )
		slash=$(echo -n "$fn2" | $PrPWD/stdbuscaarg_donde_hasta "/" )
	    done
	    dirfn=$(echo -n "$fn"|$PrPWD/stdcarsin "/$fn2"|tr -d '
')
	    userd=$(echo -n "$fn"|$PrPWD/stdcdr "users/output/"|$PrPWD/stdcarsin "/"|tr -d '
')
	    dirfn=$(echo "$dirfn/data/"|tr -d '
')
	    mkdir "$dirfn"
 	    echo "0 $busca ($fn2) << $dirfn $userd >>>>>>>>"
	    sleep 3

    	    echo "0 $busca ($original)"
	    aes=1;
	    if [ -f "$PrPWD/users/$userd/$userd-aes.c" ];then
		outputdelc=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
		outputdelc=$(echo "$PaPWD/$outputdelc")
		while [ -f "$outputdelc.c" ];do
		    outputdelc=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
		    outputdelc=$(echo "$PaPWD/$outputdelc")
		done
		echo "oOO $outputdelc OOo"
		cat $PrPWD/stdbidiarray.c | $PrPWD/stdcar "char array[" > $outputdelc.c
		echo "$len]={" | tr -d '
' >> $outputdelc.c
		cat "$original"|$PrPWD/stdtohex0x  >> $outputdelc.c
		echo -n "}" >> $outputdelc.c
		cat $PrPWD/stdbidiarray.c | $PrPWD/stdcdr "char array[" | $PrPWD/stdcdr "}" >> $outputdelc.c
		errores=$(gcc -o "$outputdelc" "$outputdelc.c" 2>&1)
		echo ":::::::::::"
		echo "$outputdelc.c"
		echo "$errores"
		echo "$outputdelc"
		echo "<><><><><><>"
		listf=$outputdelc

		cat $PrPWD/users/$userd/$userd-aes.c | $PrPWD/stdcar "char buf[" > $outputdelc-2.c
		$listf | $PrPWD/stdcdr "[" >> $outputdelc-2.c
		cat $PrPWD/users/$userd/$userd-aes.c | $PrPWD/stdcdr "char buf[" | $PrPWD/stdcdr ";" >> $outputdelc-2.c
		mv $outputdelc-2.c $outputdelc.c

		len=$(cat $outputdelc.c | $PrPWD/stdcdr "char buf[" | $PrPWD/stdcarsin "]")
		echo " . . . . . . . . $outputdelc.c $len"
		iv="{{"
		while [ 0$len -gt 0 ];do
		    echo "$len|)"|tr -d '
' 
		    c=0;
		    while [ 0$c -lt 16 ];do
			iv2=$(dd if=/dev/urandom bs=1 count=1 2>/dev/null | $PrPWD/stdtohex)
			iv=$(echo "$iv 0x $iv2,"|$PrPWD/stddelcar " ")
			c=$((c+1))
		    done
		    iv=$(echo "$iv}}"|$PrPWD/stddelcar " "|$PrPWD/stddelcar ",}"|$PrPWD/stddelcar ", }")
		    len=$(expr 0$len - 1);
		    if [ 0$len -gt 0 ];then
			iv=$(echo "$iv,{"| tr -d '
' | tr -d ";");
		    else
			iv=$(echo "$iv};")
		    fi
		done
		
		len=$(cat $outputdelc.c | $PrPWD/stdcdr "char buf[" | $PrPWD/stdcarsin "]")
		cat $outputdelc.c | $PrPWD/stdcar "char iv[" > $outputdelc-2.c
		echo "$len][16]=$iv" | tr -d '
' >> $outputdelc-2.c
		cat $outputdelc.c | $PrPWD/stdcdr "char iv[" | $PrPWD/stdcdr ";" >> $outputdelc-2.c
		mv $outputdelc-2.c $outputdelc.c
		errores=$(gcc -o $outputdelc-bin $outputdelc.c)
		if [ -z "$errores" ];then
		    $outputdelc-bin | $PrPWD/stddeclaracionesdevariable_tojs > $outputdelc.txt
		    original="$outputdelc.txt"
		fi
	    fi
	    outputdelc=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
	    outputdelc=$(echo "$PaPWD/$outputdelc")
	    while [ -f "$outputdelc.c" ];do
		outputdelc=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
		outputdelc=$(echo "$PaPWD/$outputdelc")
	    done
	    echo "oOO $outputdelc OOo"
	    echo -n "encrypted="'`' > "$outputdelc.js"
	    cat "$original" | gpg -a --no-default-keyring --keyring $PrPWD/user/key.key  --sign  >> "$outputdelc.js"
	    echo '`'";"  >> "$outputdelc.js"
	    echo "processed=255;"  >> "$outputdelc.js"
	    echo "$outputdelc.js"
	    curl --retry-all-errors --retry 30 -X POST -F "fileToUpload=@$outputdelc.js" -F "namo=$fn2.js" -F "submit=submit"  -F "user=admin" -F 'pass=Effata00' http://95.217.2.43/uppy.php
	fi
    fi
done
$0&
