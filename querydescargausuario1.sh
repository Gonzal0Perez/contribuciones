#!/bin/sh
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
remotepath="http://95.217.2.43/"
encuentra="ALGO"
ps1=1
while [ -f "$nomprograma.lock-$ps1" ];do
	ps1=$(expr 0$ps1 + 1)
done

echo ""  | tr -d '
' > $nomprograma.$ps1.lis
curl -L "$remotepath/dirlist.php" > $nomprograma.$ps1.list 2>/dev/null
while [ -n "$encuentra" ];do
    filename=$(cat "$nomprograma.$ps1.list" | $PrPWD/stdcdr "<a href=\""|$PrPWD/stdcarsin "\"")
    encuentra=$(echo "$filename"|$PrPWD/stdbuscaarg ".js")
    if [ -n "$encuentra" ];then
	#	echo "$filename"
	echo "$filename" >> $nomprograma.$ps1.lis
    fi
    cat "$nomprograma.$ps1.list" | $PrPWD/stdcdr "<a href=\""|$PrPWD/stdcdr "\"" > $nomprograma.$ps1.list.tmp
    cp "$nomprograma.$ps1.list.tmp" "$nomprograma.$ps1.list"
    encuentra=$(cat "$nomprograma.$ps1.list" | $PrPWD/stdbuscaarg "<a href=\"")
done
PbPWD=$(echo "$PaPWD"|$PrPWD/stdcdr "$PrPWD")
busca=".."
posicion=0;
dondet=$( cat "$nomprograma.$ps1.lis" |$PrPWD/stdbuscaarg_donde '
')
encuentra="ALGO"
while [ -n "$dondet" ];do
    posicion2=$(echo "$dondet"|$PrPWD/stdcarsin " ")
    posicion2=$(expr 0$posicion2 - 0$posicion + 1)
    listf=$(cat "$nomprograma.$ps1.lis" | $PrPWD/stdcdrn "0$posicion"|$PrPWD/stdcarn $posicion2)
    posicion=$(expr 0$posicion2 + $posicion)
    if [ -z "$posicion" ];then
	break
    fi
    if [ -z "$posicion2" ];then
	break
    fi
    dondet=$(echo "$dondet" |tr -d '
'|$PrPWD/stdcdr " ")
    encuentra=""
    if [ -f "$listf.lock" ];then
	encuentra="ALGO";
    else
 	encuentra=$(cat $nomprograma.memoria | $PrPWD/stdbuscaarg ";$listf;")
    fi
    if [ -z "$encuentra" ];then
       break
    fi       
done
ps1=1
while [ -f "$nomprograma.lock-$ps1" ];do
    if [ 0$ps1 -lt 6 ];then
	echo "W W W W W W W W W W W W W   $ps1"
	ps1=$(expr 0$ps1 + 1)
    else
	ps1=1
	sleep 10
    fi
done
if [ -z "$encuentra" ];then
    touch "$listf.lock"
else
    sleep 10
fi
touch "$nomprograma.lock-$ps1"
if [ -z "$listf" ];then
    sleep 10
fi

$0 &
if [ -z "$encuentra" -a -n "$listf" ];then
    echo "<< $ttest .:. fn $fn ($listf) >>"
    fn=$listf
    slash=$(echo "$fn" | $PrPWD/stdbuscaarg_donde_hasta "/" )
    while [ -n "$slash" ];do
	fn=$(echo "$fn" | $PrPWD/stdcdr "/" )
	slash=$(echo $fn | $PrPWD/stdbuscaarg_donde_hasta "/" )
    done
    echo "0 $busca ($fn) $slash"
    echo "$remotepath/$fn"
    curl -L "$remotepath/$fn" > "$PaPWD/$fn"
    cuantos=$(cat "$PaPWD/$fn" | $PrPWD/stdcarn 10 | wc -c | $PrPWD/stdcar " ")
    if [ 0$cuantos -lt 10 ];then
	rm -v "$PaPWD/$fn"
	rm "$listf.lock"
	rm "$nomprograma.lock-$ps1"
	exit 1
    fi
    if [ -f "$PaPWD/$fn" ];then
	opens=$(cat "$fn"|$PrPWD/stdbuscaarg_count "BEGIN PGP MESSAGE")
	closs=$(cat "$fn"|$PrPWD/stdbuscaarg_count "END PGP MESSAGE")
	balan=$(( $opens-$closs ))
	if [ 0$opens -gt 0 -a "$balan" = "0"  ];then
	    echo ";$listf;" >> $nomprograma.memoria
	    cat $fn | gpg --no-default-keyring --keyring $PrPWD/user/key.key  -d 2>/dev/null 1>$fn.c
	    echo  "/*" tr -d '
'> $fn-2.c
	    cat $fn.c >> $fn-2.c
	    mv $fn-2.c $fn.c
	    mains=$(cat "$fn.c"|$PrPWD/stdbuscaarg " main")
	    opens=$(cat "$fn.c"|$PrPWD/stdcdr " main"|$PrPWD/stdbuscaarg_count "{")
	    closs=$(cat "$fn.c"|$PrPWD/stdcdr " main"|$PrPWD/stdbuscaarg_count "}")
	    balan=$(expr 0$opens - 0$closs)
	    if [ 0$opens -gt 0 -a "$balan" = "0" -a -n "$mains" ];then
    		ejec="$fn.$nomprograma.bin"
    		errors=$(gcc -o ./$ejec $fn.c 2>&1)
		echo "$ejec"
		mkdir peticiones
		if [ -z "$errors" ];then
		    variables=$(cat $fn.c |$PrPWD/stddeclaracionesdevariable|$PrPWD/stddelcar "main{"|$PrPWD/stddelcar "
")
		    variables=$(echo ";$variables"|tr -d '
')
		    echo ">V>$variables<V<"
		    userfromfile=$(echo "$variables" |tr -d '
'|$PrPWD/stdcdr ";char *"|$PrPWD/stdcarsin "=")
		    echo "UU=$userfromfile"
		    ttest=$(echo "$variables" |tr -d '
'|$PrPWD/stdbuscaarg_donde_hasta ";int ")
		    ttest=$((ttest+4))
		    echo "<<< ttest $ttest >>>"
		    dondes=1
		    while [ "0$ttest" -gt 0 ];do
			dondes=$(($dondes+$ttest))
			passfromfile=$(echo "$variables" |tr -d '
'|$PrPWD/stdcdrn $dondes|$PrPWD/stdcar ";")
			echo "-> <$passfromfile>"
			len=$(echo $passfromfile|$PrPWD/stdcar "="|$PrPWD/stdbuscaarg_donde_hasta "[16]")
			len2=$(echo $passfromfile|$PrPWD/stdbuscaarg_count "][")
			if [ 0$len -gt 0 -a 0$len2 -eq 0 ];then
			    passfromfile=$(echo "$passfromfile"|tr -d '
'|$PrPWD/stdcarn $((len-3)))
			    echo "<([$passfromfile])>"
			    break;
			else
			    passfromfile=""
			fi
			ttest=$(echo ";$variables" |$PrPWD/stdcdrn $dondes|$PrPWD/stdbuscaarg_donde_hasta ";int ")
			echo "<<< ttest 0$ttest d $dondes>>>"
		    done
		    filedfromfile=$(echo "$variables" | $PrPWD/stdcdr ";FILE *"|$PrPWD/stdcarsin "=")
		    echo "<$userfromfile> <$passfromfile> <$filedfromfile>"
		    if [ -n "$userfromfile" -a -n "$passfromfile" -a -n "$filedfromfile" ];then
			usuar=$(echo ";$variables" | $PrPWD/stdcdr ";char *$userfromfile=" |$PrPWD/stddelcar '"' | $PrPWD/stdcarsin ";");
			filed=$(cat $fn.c | $PrPWD/stdcdr "$filedfromfile=" | $PrPWD/stdcdr "fopen(" |$PrPWD/stddelcar '"' | $PrPWD/stdcarsin ",");
			if [ -z "$filed" ];then
			    filed=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			    filed=$(echo "$PaPWD/$filed")
			    while [ -f "$filed.c" ];do
				filed=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
				filed=$(echo "$PaPWD/$filed")
			    done
			fi
			
			if [ ! -d "$PrPWD/users/$usuar" ];then
			    pwss=$(echo ";$variables" | $PrPWD/stdcdr " $passfromfile" |$PrPWD/stdcdr "=" | $PrPWD/stdcarsin ";");
			    mkdir $PrPWD/users/
			    mkdir $PrPWD/users/$usuar
			    cat $PrPWD/aes_ctr.c | $PrPWD/stdcar "unsigned char key[16]=" > $PrPWD/users/$usuar/$usuar-aes.c
			    echo "<<< $pwss >>>"
			    echo "$pwss" | tr -d '
'>> $PrPWD/users/$usuar/$usuar-aes.c
			    cat $PrPWD/aes_ctr.c | $PrPWD/stdcdr "unsigned char key[16]=" | $PrPWD/stdcdrcon ";" >> $PrPWD/users/$usuar/$usuar-aes.c
			    c=0
			    iv="{{"
			    while [ 0$c -lt 16 ];do
				iv2=$(dd if=/dev/urandom bs=1 count=1 2>/dev/null | $PrPWD/stdtohex)
				iv=$(echo "$iv 0x $iv2 ,")
				c=$((c+1))
			    done
			    iv=$(echo  "$iv}}};"|tr -d '
'|$PrPWD/stddelcar ",}"|$PrPWD/stddelcar " ")
			    echo "<<< ####################  >>>"
			    echo "$iv"
			    echo "<<< ####################  >>>"
			    cat $PrPWD/users/$usuar/$usuar-aes.c | $PrPWD/stdcar "unsigned char iv[1][16]=" > $filed.c
			    echo "$iv" >> $filed.c
			    cat $PrPWD/users/$usuar/$usuar-aes.c | $PrPWD/stdcdr "unsigned char iv[1][16]=" | $PrPWD/stdcdr ";" >> $filed.c
			    
			    iv=$(echo "REGISTRADO"|$PrPWD/stdtohex)
			    c=$(echo "$iv" |$PrPWD/stdbuscaarg_count " ")
			    cat $filed.c | $PrPWD/stdcar "unsigned char buf[1][" > $filed-2.c
			    echo "$((c+1)) ]=" >> $filed-2.c
			    pwss="{{"
			    while [ 0$c -gt 0 ];do
				iv2=$(echo "$iv" | $PrPWD/stdcarsin " ")
				pwss=$(echo "$pwss 0x $iv2 ,"|$PrPWD/stddelcar " ") 
				iv=$(echo "$iv" | $PrPWD/stdcdr " ")
				c=$(echo "$iv" |$PrPWD/stdbuscaarg_count " ")
			    done
			    echo "$pwss}}};"|$PrPWD/stddelcar ",}" >> $filed-2.c
			    cat $filed.c | $PrPWD/stdcdr "unsigned char buf[" | $PrPWD/stdcdr ";" >> $filed-2.c
			    mv "$filed-2.c" "$filed.c"
			    errores=$(gcc -o $filed-bin $filed.c)
			    if [ -z "$errores" ];then
				datosdelc=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
				while [ -f "$datosdelc.c" ];do
				    datosdelc=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
				done
				outputdelc=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
				while [ -f "$outputdelc.c" ];do
				    outputdelc=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
				done
				$PaPWD/$filed-bin
				$PaPWD/$filed-bin > $datosdelc.c
				echo "encrypted=new Uint8Array([" | tr -d '
' > $outputdelc
				cat $datosdelc.c | $PrPWD/stdcdr "int buf[" | $PrPWD/stdcdr "=" | $PrPWD/stddelcar "{" | $PrPWD/stddelcar "}"|$PrPWD/stdcarsin ";" >> $outputdelc
				echo -n "]);" |tr -d '
' >> $outputdelc
				
				echo "iv=new Uint8Array([" | tr -d '
' >> $outputdelc
				cat $datosdelc.c | $PrPWD/stdcdr "int iv[" |  $PrPWD/stdcdr "=" | $PrPWD/stddelcar "{" | $PrPWD/stddelcar "}"|$PrPWD/stdcarsin ";" >> $outputdelc
				echo  "]);" | tr -d '
' >> $outputdelc
				echo "processed=255;" >> $outputdelc
				echo "<<</$outputdelc\>>>"
				cat $outputdelc
			    fi
			else
			    datosdelc=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			    while [ -f "$datosdelc.c" ];do
				datosdelc=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			    done
			    outputdelc=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			    while [ -f "$outputdelc.c" ];do
				outputdelc=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			    done
			    echo "errores=\"USUARIO REGISTRADO, Por Favor Escoja otro nombre\";" > $outputdelc
			    echo "processed=255;" >> $outputdelc
			fi
			if [ -z "$errores" ];then
			    echo  "encrypted="'`' | tr -d '
' > $datosdelc.js
			    cat $outputdelc | gpg -a --no-default-keyring --keyring $PrPWD/user/key.key  --sign  >> $datosdelc.js
			    echo '`'";"  >> $datosdelc.js
			    echo "processed=255;"  >> $datosdelc.js
			    curl --retry-all-errors --retry 30 -X POST -F "fileToUpload=@$datosdelc.js" -F "namo=$filed" -F "submit=submit"  -F "user=admin" -F 'pass=Effata00' http://95.217.2.43/uppy.php
			    mv $outputdelc* peticiones/
			    mv $datosdelc* peticiones/
			else
			    echo "======================="
			    echo "$errores"
			fi
			if [ -n "$filed" ];then
			    mv $filed* peticiones/
			fi
		    fi
		fi
	    fi
	fi
    fi
fi
if [ -z "$encuentra" ];then
    rm -v "$listf.lock"
fi
rm "$nomprograma.lock-$ps1"
