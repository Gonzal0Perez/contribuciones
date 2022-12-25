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
#cspiceloc=" /media/A/nube/comp/cspice" #ntfs
#cspiceloc=" $PrPWD/cspice/cspiceosx/cspiceosx" #apfs
cspiceloc="/root/cspice" #linux
cd $PrPWD
PrPWD2=$PWD
PrPWD=$PrPWD2
SWESRC="/root/sweephi"
cd $PaPWD
#echo "$nomprograma.."
listados="";
listado="";
if [ -d "$PrPWD/users/input" ];then
    listados=$(echo $PrPWD/users/input|$PrPWD/listadodirectorio_dirs_from_std|$PrPWD/stdbuscaarg_donde '
')
    listado=$(echo $PrPWD/users/input|$PrPWD/listadodirectorio_dirs_from_std)
    salta=0;
    while [ -n "$listados" ];do
	presalta=$(echo -n "$listados" | $PrPWD/stdcar " ")
	dirn=$(echo -n "$listado"|$PrPWD/stdcdrn 0$salta | $PrPWD/stdcarn $presalta)
	lista1=$(echo "$dirn" | $PrPWD/listadodirectorio_files_from_std_extension_c )
	lista2=$(echo -n "$lista1
$lista0" )
	lista0=$lista2
	salta=$(expr $presalta + 1)
	listados=$(echo -n "$listados" | $PrPWD/stdcdr " ")
    done
fi
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
    if [ 0$ps1 -lt 3 ];then
	#echo "W W W W W W W W W W W W W   $ps1"
	ps1=$(expr 0$ps1 + 1)
    else
	ps1=1
	sleep 1
    fi
done
touch "$nomprograma.lock-$ps1"
touch "$listf.lock"
#echo "$listf.lock"
if [ -z "$listf" ];then sleep 15;fi
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
		    variables=$(echo $(cat "$fn" ; echo ";") |$PrPWD/stddeclaracionesdevariable|tr '
' ';')
		    echo "$variables"
		    varos="";
		    varis=$(echo -n ";$variables" |$PrPWD/stdbuscaarg "time_t prefix_")
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
		    varis=$(echo -n ";$variables"|$PrPWD/stdbuscaarg "double prefix_latitud=")
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
		    varis=$(echo -n ";$variables"|$PrPWD/stdbuscaarg "double prefix_longitud=")
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
		    varis=$(echo -n ";$variables"|$PrPWD/stdbuscaarg "float prefix_timezone=")
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
			fechan=$(echo -n ";$variables" |$PrPWD/stdcdr ";time_t "|$PrPWD/stdcarsin ";"|$PrPWD/stdcarsin "=")
			fecha=$(echo -n ";$variables" |$PrPWD/stdcdr "$fechan="|$PrPWD/stdcarsin ";")
			latitud=$(echo -n ";$variables"|$PrPWD/stdcdr "double prefix_latitud="|$PrPWD/stdcarsin ";")
			longitud=$(echo -n ";$variables"|$PrPWD/stdcdr "double prefix_longitud="|$PrPWD/stdcarsin ";")
			timezone=$(echo -n ";$variables"|$PrPWD/stdcdr "float prefix_timezone="|$PrPWD/stdcarsin ";")
			utcc=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			while [ -f "$dirfn/$utcc.c" ];do
			    utcc=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			done
			cat $PrPWD/tmtoutcdate.c | $PrPWD/stdcar "time_t t=" > "$dirfn/$utcc.c"
			echo -n "$fecha;" >> "$dirfn/$utcc.c"
			cat $PrPWD/tmtoutcdate.c |  $PrPWD/stdcdr "time_t t=" | $PrPWD/stdcdr ";" >> "$dirfn/$utcc.c"
			timeerrores=$(gcc -o "$dirfn/$utcc" "$dirfn/$utcc.c" -lm 2>&1 )
			if [ -z "$timeerrores" ];then
			    timed=$("$dirfn/$utcc")
			    yeard=$(echo "$timed"|$PrPWD/stdcarsin "/"|$PrPWD/stddelcar " ")
			    mond=$(echo "$timed"|$PrPWD/stdcdr "/"|$PrPWD/stdcarsin "/"|$PrPWD/stddelcar " ")
			    dayd=$(echo "$timed"|$PrPWD/stdcdr "/"|$PrPWD/stdcdr "/"|$PrPWD/stdcarsin " "|$PrPWD/stddelcar " ")
			    horad=$(echo "$timed"|$PrPWD/stdcdr "/"|$PrPWD/stdcdr " "|$PrPWD/stdcarsin ":"|$PrPWD/stddelcar " ")
			    mind=$(echo "$timed"|$PrPWD/stdcdr "/"|$PrPWD/stdcdr ":"|$PrPWD/stdcarsin " "|$PrPWD/stddelcar " ")
			    echo "..:: $timed ::.."
			else
			    "ERROR PROCESANDO CADENA DE FECHA"
			    if [ -n "$fn" ];then
				rm  "$fn.lock"
			    fi
			    rm  "$nomprograma.lock-$ps1"
			    exit 1
			fi
			
			aspecas=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			while [ -f "$PaPWD/$aspecas.c" ];do
			    aspecas=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			done
			cat $cspiceloc/planetas_std.c | $PrPWD/stdcar " obstim[" > "$PaPWD/$aspecas.c"
			len=$(echo "$timed" | wc -c | $PrPWD/stdcar " ")
			echo "$len]=\"$timed\";" >> "$PaPWD/$aspecas.c"
			cat $cspiceloc/planetas_std.c | $PrPWD/stdcdr " obstim[" | $PrPWD/stdcdr ";" >> "$PaPWD/$aspecas.c"
			aspectroseclerrores=$(gcc -o "$PaPWD/$aspecas" "$PaPWD/$aspecas.c" -lcspice -L$cspiceloc/lib -lm 2>&1 )
			if [ -z "$aspectroseclerrores" ];then
			    cad=$("$PaPWD/$aspecas"|$PrPWD/stddeclaracionesdevariable)
			    echo "$cad"
			    echo "$PaPWD/$aspecas"
			    et=$(echo ";$cad" |  $PrPWD/stdcdr "double prefix_et=" | $PrPWD/stdcarsin ";")
			    planetas_array=$(echo ";$cad"|$PrPWD/stdcdr "char prefix_planet_names"|$PrPWD/stdcarsin ";")
			    positions_array=$(echo ";$cad"|$PrPWD/stdcdr "double prefix_RA"|$PrPWD/stdcarsin ";")
			    declinations_array=$(echo ";$cad"|$PrPWD/stdcdr "double prefix_DEC"|$PrPWD/stdcarsin ";")
			else
			    echo "ERROR EN CSPICE"
			    echo "$aspectroseclerrores" 
			    if [ -n "$fn" ];then
				rm  "$fn.lock"
			    fi
			    rm  "$nomprograma.lock-$ps1"
			    exit 1
			fi

			#................................................
			aspecas=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			while [ -f "$PaPWD/$aspecas.c" ];do
			    aspecas=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			done
			cat $cspiceloc/luna_oculating.c | $PrPWD/stdcar " obstim[" > "$PaPWD/$aspecas.c"
			len=$(echo "$timed" | wc -c | $PrPWD/stdcar " ")
			echo "$len]=\"$timed\";" >> "$PaPWD/$aspecas.c"
			cat $cspiceloc/luna_oculating.c | $PrPWD/stdcdr " obstim[" | $PrPWD/stdcdr ";" >> "$PaPWD/$aspecas.c"
			aspectroseclerrores=$(gcc -o "$PaPWD/$aspecas" "$PaPWD/$aspecas.c" -lcspice -L$cspiceloc/lib -lm 2>&1 )
			if [ -z "$aspectroseclerrores" ];then
			    cad=$("$PaPWD/$aspecas")
			    nodo=$(echo ";$cad" |  $PrPWD/stdcdr "double nodo=" | $PrPWD/stdcarsin ";")
			    len=$(echo "$planetas_array"|$PrPWD/stdcdr "[" |$PrPWD/stdcarsin "]" )
			    len=$(expr $len + 1)
			    planetas_array=$(echo "$planetas_array"|$PrPWD/stdcdr "{" |$PrPWD/stdcarsin "}" );
			    planetas_array=$(echo "[$len][10]={$planetas_array, {'N','O','D','O',0} };");
			    positions_array=$(echo "$positions_array"|$PrPWD/stdcdr "{" |$PrPWD/stdcarsin "}" );
			    positions_array=$(echo "[$len]={ $positions_array, $nodo };")
			    declinations_array=$(echo "$declinations_array"|$PrPWD/stdcdr "{" |$PrPWD/stdcarsin "}" );
			    declinations_array=$(echo "[$len]={ $declinations_array, 0 };")
			    echo "et=$et"
			    echo "PLA ASC=$planetas_array"
			    echo "POS ASC=$positions_array"
			    echo "resul de NODO: $nodo"
			else
			    echo "ERROR EN CSPICE (NODO)"
			    echo "$aspectroseclerrores"
			    if [ -n "$fn" ];then
				rm  "$fn.lock"
			    fi
			    rm  "$nomprograma.lock-$ps1"
			    exit 1
			fi

			#...................................
			aspecas=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			while [ -f "$PaPWD/$aspecas.c" ];do
			    aspecas=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			done
			cat $SWESRC/swe_ecl_a.c | $PrPWD/stdcar "double positions" > "$PaPWD/$aspecas.c"
			echo "$positions_array;" >> "$PaPWD/$aspecas.c"
			cat $SWESRC/swe_ecl_a.c | $PrPWD/stdcdr "double positions" | $PrPWD/stdcdr ";" >> "$PaPWD/$aspecas.c"
			
			cat "$PaPWD/$aspecas.c" | $PrPWD/stdcar "char planets" > "$PaPWD/$aspecas-1.c"
			echo "$planetas_array;" >> "$PaPWD/$aspecas-1.c"
			cat "$PaPWD/$aspecas.c" | $PrPWD/stdcdr "char planets" | $PrPWD/stdcdr ";" >> "$PaPWD/$aspecas-1.c"
			mv "$PaPWD/$aspecas-1.c" "$PaPWD/$aspecas.c"
			
			cat "$PaPWD/$aspecas.c" | $PrPWD/stdcar "double aspects" > "$PaPWD/$aspecas-1.c"
			echo "[13]={0, 15, 30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180}; " >> "$PaPWD/$aspecas-1.c"
			cat "$PaPWD/$aspecas.c" | $PrPWD/stdcdr "double aspects" | $PrPWD/stdcdr ";" >> "$PaPWD/$aspecas-1.c"
			mv "$PaPWD/$aspecas-1.c" "$PaPWD/$aspecas.c"
			
			cat "$PaPWD/$aspecas.c" | $PrPWD/stdcar "double toleranc" > "$PaPWD/$aspecas-1.c"
			echo "[13]={4.50, 1, 1, 1, 2, 1, 3, 1, 3, 1, 1, 1, 4.5};" >> "$PaPWD/$aspecas-1.c"
			cat "$PaPWD/$aspecas.c" | $PrPWD/stdcdr "double toleranc" | $PrPWD/stdcdr ";" >> "$PaPWD/$aspecas-1.c"
			mv "$PaPWD/$aspecas-1.c" "$PaPWD/$aspecas.c"
			aspectroseclerrores=$(gcc -o "$PaPWD/$aspecas" "$PaPWD/$aspecas.c" -lm 2>&1 )
			if [ -z "$aspectroseclerrores" ];then
			    "$PaPWD/$aspecas" > "$PaPWD/$aspecas.variables"
			    cat $PrPWD/stddeclaracionesdevariable.c | $PrPWD/stdcar "char prefix" > "$PaPWD/$aspecas-variables.c"
			    echo "[12]={'a','s','c','e','n','c','i','o','n','a','l','_'};" >> "$PaPWD/$aspecas-variables.c"
			    cat $PrPWD/stddeclaracionesdevariable.c | $PrPWD/stdcdr "char prefix" | $PrPWD/stdcdr ";" >> "$PaPWD/$aspecas-variables.c"
			    gcc -o "$PaPWD/$aspecas-variables" "$PaPWD/$aspecas-variables.c"
			    aspectosasc=$(cat "$PaPWD/$aspecas.variables"|"$PaPWD/$aspecas-variables"|tr -d '
')			    
			    echo "ASC ASP <.<.(.(..  $aspectosasc  ..).).>.>"
			else
			    echo "ERROR EN ASPECTOS"
			    echo "$aspectroseclerrores"
			    if [ -n "$fn" ];then
				rm  "$fn.lock"
			    fi
			    rm  "$nomprograma.lock-$ps1"
			    exit 1
			fi
			
			ffc=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			while [ -f "$dirfn/$ffc.c" ];do
			    ffc=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			done
			echo ">>>>.....    $ffc"
			cat $PrPWD/ASC.c | $PrPWD/stdcar "double obslon=" > "$dirfn/$ffc.c"
			echo "$longitud ;" >> "$dirfn/$ffc.c"
			cat $PrPWD/ASC.c | $PrPWD/stdcdr "double obslon=" | $PrPWD/stdcdr ";" >> "$dirfn/$ffc.c"
			cat "$dirfn/$ffc.c" | $PrPWD/stdcar "double obslat=" > "$dirfn/$ffc-1.c"
			echo "$latitud ;" >> "$dirfn/$ffc-1.c"
			cat "$dirfn/$ffc.c" | $PrPWD/stdcdr "double obslat=" | $PrPWD/stdcdr ";"  >> "$dirfn/$ffc-1.c"
			cat "$dirfn/$ffc-1.c" | $PrPWD/stdcar "double et=" > "$dirfn/$ffc.c"
			echo "$et ; // <-- A " >> "$dirfn/$ffc.c"
			cat "$dirfn/$ffc-1.c" | $PrPWD/stdcdr "double et=" | $PrPWD/stdcdr ";"  >> "$dirfn/$ffc.c"
			cat "$dirfn/$ffc.c" | $PrPWD/stdcar "double tz=" > "$dirfn/$ffc-1.c"
			echo "$timezone ;" >> "$dirfn/$ffc-1.c"
			cat "$dirfn/$ffc.c" | $PrPWD/stdcdr "double tz=" | $PrPWD/stdcdr ";"  >> "$dirfn/$ffc-1.c"
			mv "$dirfn/$ffc-1.c" "$dirfn/$ffc.c"
			ascendenteerrores=$(gcc -o "$dirfn/$ffc" "$dirfn/$ffc.c" -lm 2>&1 )
			if [ -z "$ascendenteerrores" ];then
			    tjdf=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			    while [ -f "$dirfn/$tjdf.c" ];do
				tjdf=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			    done
			    cat $PrPWD/utctojd.c | $PrPWD/stdcar "int Y=" > "$dirfn/$tjdf.c"
			    echo "$yeard ;" >> "$dirfn/$tjdf.c"
			    cat $PrPWD/utctojd.c | $PrPWD/stdcdr "int Y=" | $PrPWD/stdcdr ";" >> "$dirfn/$tjdf.c"
			    
			    cat "$dirfn/$tjdf.c" | $PrPWD/stdcar "int M=" > "$dirfn/$tjdf-1.c"
			    echo "$mond ;" >> "$dirfn/$tjdf-1.c"
			    cat "$dirfn/$tjdf.c" | $PrPWD/stdcdr "int M=" | $PrPWD/stdcdr ";"  >> "$dirfn/$tjdf-1.c"
			    
			    cat "$dirfn/$tjdf-1.c" | $PrPWD/stdcar "int D=" > "$dirfn/$tjdf.c"
			    echo "$dayd ; // <-- A " >> "$dirfn/$tjdf.c"
			    cat "$dirfn/$tjdf-1.c" | $PrPWD/stdcdr "int D=" | $PrPWD/stdcdr ";"  >> "$dirfn/$tjdf.c"
			    
			    cat "$dirfn/$tjdf.c" | $PrPWD/stdcar "double H=" > "$dirfn/$tjdf-1.c"
			    echo "$horad ;" >> "$dirfn/$tjdf-1.c"
			    cat "$dirfn/$tjdf.c" | $PrPWD/stdcdr "double H=" | $PrPWD/stdcdr ";"  >> "$dirfn/$tjdf-1.c"
			    
			    cat "$dirfn/$tjdf-1.c" | $PrPWD/stdcar "double N=" > "$dirfn/$tjdf.c"
			    echo "$mind ; //<-" >> "$dirfn/$tjdf.c"
			    cat "$dirfn/$tjdf-1.c" | $PrPWD/stdcdr "double N=" | $PrPWD/stdcdr ";"  >> "$dirfn/$tjdf.c"
			    
			    utctojulianerror=$(gcc -o "$dirfn/$tjdf" "$dirfn/$tjdf.c" -lm 2>&1 )
			    echo "E:::: < { $utctojulianerror } >:>:>:>:>      $tjdf "
			    tjd=$("$dirfn/$tjdf")			    
			fi
			
			swecl=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			while [ -f "$PaPWD/$swecl.c" ];do
			    swecl=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			done
			cat $SWESRC/swe_ecl.c | $PrPWD/stdcar "double geo_lon=" > "$PaPWD/$swecl.c"
			echo "$longitud ;" >> "$PaPWD/$swecl.c"
			cat $SWESRC/swe_ecl.c | $PrPWD/stdcdr "double geo_lon=" | $PrPWD/stdcdr ";" >> "$swecl.c"
			cat "$PaPWD/$swecl.c" | $PrPWD/stdcar "double geo_lat=" > "$PaPWD/$swecl-1.c"
			echo "$latitud ;" >> "$PaPWD/$swecl-1.c"
			cat "$PaPWD/$swecl.c" | $PrPWD/stdcdr "double geo_lat=" | $PrPWD/stdcdr ";"  >> "$PaPWD/$swecl-1.c"
			cat "$PaPWD/$swecl-1.c" | $PrPWD/stdcar "double tjd=" > "$PaPWD/$swecl.c"
			echo "$tjd ; // <-- A " >> "$PaPWD/$swecl.c"
			cat "$PaPWD/$swecl-1.c" | $PrPWD/stdcdr "double tjd=" | $PrPWD/stdcdr ";"  >> "$PaPWD/$swecl.c"
			posicioneclipticoserrores=$(gcc -o $PaPWD/$swecl $PaPWD/$swecl.c -lswe -lm -ldl -L$SWESRC/ -I$SWESRC/ 2>&1 )			
			if [ -z "$posicioneclipticoserrores" ];then
			    echo "E:< { $posicioneclipticoserrores } > $swecl"
			    cad=$("$PaPWD/$swecl"|tr '
' ';')
			    echo "ASCECL $cad"
			    ecl_planetas_array=$(echo ";$cad"|$PrPWD/stdcdr ";char planets_names"|$PrPWD/stdcarsin ";")
			    ecl_positions_array=$(echo ";$cad"|$PrPWD/stdcdr ";double RA"|$PrPWD/stdcarsin ";")
		            ecl_declinations_array=$(echo ";$cad"|$PrPWD/stdcdr ";double DECL"|$PrPWD/stdcarsin ";")
			    ascecl=$(echo ";$cad"|$PrPWD/stdcdr "casas_RA"|$PrPWD/stdcdr "={"|$PrPWD/stdcarsin ",")
			else
			    echo "$posicioneclipticoserrores"
			    echo "gcc -o $PaPWD/$swecl $PaPWD/$swecl.c -lm -lswe -L$SWESRC/ -I$SWESRC/ 2>&1"
			    if [ -n "$fn" ];then
				rm  "$fn.lock"
			    fi
			    rm  "$nomprograma.lock-$ps1"
			    exit
			fi
			aspececl=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			while [ -f "$PaPWD/$aspececl.c" ];do
			    aspececl=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			done
			echo "ECLPOSARRAY $ecl_positions_array ;"
			
			cat $SWESRC/swe_ecl_a.c | $PrPWD/stdcar "double positions" > "$PaPWD/$aspececl.c"
			echo "$ecl_positions_array ;" >> "$PaPWD/$aspececl.c"
			cat $SWESRC/swe_ecl_a.c | $PrPWD/stdcdr "double positions" | $PrPWD/stdcdr ";" >> "$PaPWD/$aspececl.c"
			
			cat "$PaPWD/$aspececl.c" | $PrPWD/stdcar "char planets" > "$PaPWD/$aspececl-1.c"
			echo "$ecl_planetas_array;" >> "$PaPWD/$aspececl-1.c"
			cat "$PaPWD/$aspececl.c" | $PrPWD/stdcdr "char planets" | $PrPWD/stdcdr ";" >> "$PaPWD/$aspececl-1.c"
			
			cat "$PaPWD/$aspececl-1.c" | $PrPWD/stdcar "double aspects" > "$PaPWD/$aspececl.c"
			echo "[13]={0, 15, 30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180}; " >> "$PaPWD/$aspececl.c"
			cat "$PaPWD/$aspececl-1.c" | $PrPWD/stdcdr "double aspects" | $PrPWD/stdcdr ";" >> "$PaPWD/$aspececl.c"
			mv "$PaPWD/$aspececl.c" "$PaPWD/$aspececl-1.c"
			
			cat "$PaPWD/$aspececl-1.c" | $PrPWD/stdcar "double toleranc" > "$PaPWD/$aspececl.c"
			echo "[13]={7, 1, 1, 1, 3, 1, 7, 1, 7, 1, 1, 1, 7};" >> "$PaPWD/$aspececl.c"
			cat "$PaPWD/$aspececl-1.c" | $PrPWD/stdcdr "double toleranc" | $PrPWD/stdcdr ";" >> "$PaPWD/$aspececl.c"
			aspectoseclipticoserrores=$(gcc -o "$dirfn/$aspececl" "$PaPWD/$aspececl.c" -lm 2>&1 )
			if [ -z "$aspectoseclipticoserrores" ];then
			    "$dirfn/$aspececl" > "$dirfn/$aspececl.variables"
			    cat $PrPWD/stddeclaracionesdevariable.c | $PrPWD/stdcar "char prefix" > "$dirfn/$aspececl-variables.c"
			    echo "[10]={'e','c','l','i','p','t','i','c','o','_'};" >> "$dirfn/$aspececl-variables.c"
			    cat $PrPWD/stddeclaracionesdevariable.c | $PrPWD/stdcdr "char prefix" | $PrPWD/stdcdr ";" >> "$dirfn/$aspececl-variables.c"
			    gcc -o "$dirfn/$aspececl-variables" "$dirfn/$aspececl-variables.c"
			    aspectosecl=$(cat "$dirfn/$aspececl.variables"|"$dirfn/$aspececl-variables"|tr -d '
')
#			    echo "ECL <.<.(.(..  $aspectosecl  ..).).>.>"
			else
			    gcc -o "$dirfn/$aspececl" "$PaPWD/$aspececl.c" -lm 2>&1
			fi
			
			# ...............................................
			aspececl=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			while [ -f "$dirfn/$aspececl.c" ];do
			    aspececl=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			done

			echo "AspAsc     $aspectoasc"
			
			cat $PrPWD/aspectospordispositor.c | $PrPWD/stdcar " ascencional_planets[" > "$dirfn/$aspececl.c"
			echo "$aspectosasc ;"  | $PrPWD/stdcdr " ascencional_planets[" | $PrPWD/stdcar ";" >> "$dirfn/$aspececl.c"
			cat $PrPWD/aspectospordispositor.c | $PrPWD/stdcdr " ascencional_planets[" | $PrPWD/stdcdr ";" >> "$dirfn/$aspececl.c"
			
			cat "$dirfn/$aspececl.c" | $PrPWD/stdcar " ecliptico_planets[" > "$dirfn/$aspececl-1.c"
			echo "$aspectosecl;"  | $PrPWD/stdcdr " ecliptico_planets[" | $PrPWD/stdcar ";" >> "$dirfn/$aspececl-1.c"
			cat "$dirfn/$aspececl.c" | $PrPWD/stdcdr " ecliptico_planets[" | $PrPWD/stdcdr ";" >> "$dirfn/$aspececl-1.c"
			mv "$dirfn/$aspececl-1.c" "$dirfn/$aspececl.c"
			
			# . . . . .
			cat "$dirfn/$aspececl.c" | $PrPWD/stdcar " positions_ecliptico[" > "$dirfn/$aspececl-1.c"
			echo "$ecl_positions_array ;" | $PrPWD/stdcdr "[" >> "$dirfn/$aspececl-1.c"
			cat "$dirfn/$aspececl.c" | $PrPWD/stdcdr " positions_ecliptico[" | $PrPWD/stdcdr ";" >> "$dirfn/$aspececl-1.c"
			mv "$dirfn/$aspececl-1.c" "$dirfn/$aspececl.c"
			cat "$dirfn/$aspececl.c" | $PrPWD/stdcar " planets_names[" > "$dirfn/$aspececl-1.c"
			echo "$ecl_planetas_array ;"  | $PrPWD/stdcdr "[" >> "$dirfn/$aspececl-1.c"
			cat "$dirfn/$aspececl.c" | $PrPWD/stdcdr " planets_names[" | $PrPWD/stdcdr ";" >> "$dirfn/$aspececl-1.c"

			cat "$dirfn/$aspececl-1.c" | $PrPWD/stdcar " ecliptico_aspects[" > "$dirfn/$aspececl.c"
			echo "$aspectosecl;"  | $PrPWD/stdcdr " ecliptico_aspects[" | $PrPWD/stdcar ";" >> "$dirfn/$aspececl.c"
			cat "$dirfn/$aspececl-1.c" | $PrPWD/stdcdr " ecliptico_aspects[" | $PrPWD/stdcdr ";" >> "$dirfn/$aspececl.c"

			cat "$PaPWD/$aspececl.c" | $PrPWD/stdcar "double ascendente=" > "$PaPWD/$aspececl-1.c"
			echo "$ascecl ;" >> "$PaPWD/$aspececl-1.c"
			cat "$PaPWD/$aspececl.c" | $PrPWD/stdcdr "double ascendente=" | $PrPWD/stdcdr ";" >> "$PaPWD/$aspececl-1.c"
			mv "$dirfn/$aspececl-1.c" "$dirfn/$aspececl.c"
			
			aspectospordispositorerrores=$(gcc -o "$dirfn/$aspececl" "$dirfn/$aspececl.c" -lm 2>&1 )
			echo "$dirfn/$aspececl"
			if [ -z "$aspectospordispositorerrores" ];then
			    "$dirfn/$aspececl" > "$dirfn/$aspececl.variables"
			    cat $PrPWD/stddeclaracionesdevariable.c | $PrPWD/stdcar "char prefix" > "$dirfn/$aspececl-variables.c"
			    echo "[11]={'d','i','s','p','o','s','i','t','o','r','_'};" >> "$dirfn/$aspececl-variables.c"
			    cat $PrPWD/stddeclaracionesdevariable.c | $PrPWD/stdcdr "char prefix" | $PrPWD/stdcdr ";" >> "$dirfn/$aspececl-variables.c"
			    gcc -o "$dirfn/$aspececl-variables" "$dirfn/$aspececl-variables.c"
			    aspectosdisp=$(cat "$dirfn/$aspececl.variables"|"$dirfn/$aspececl-variables"|tr -d '
')
#			    echo "<.<.(.(..  $aspectosdisp  ..).).>.>"
			else
			    echo "         *** **** *** $aspectospordispositorerrores   ******"
			    if [ -n "$fn" ];then
				rm  "$fn.lock"
			    fi
			    rm  "$nomprograma.lock-$ps1"
			    exit 1
			fi
			
			#.............................................................

			

			# ...............................................
			aspececl=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			while [ -f "$dirfn/$aspececl.c" ];do
			    aspececl=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			done
			
			cat $PrPWD/casasporplaneta.c | $PrPWD/stdcar " planets[" > "$dirfn/$aspececl.c"
			echo "$aspectosasc;"  | $PrPWD/stdcdr " ascencional_planet_names[" | $PrPWD/stdcar ";" >> "$dirfn/$aspececl.c"
			cat $PrPWD/casasporplaneta.c | $PrPWD/stdcdr " planets[" | $PrPWD/stdcdr ";" >> "$dirfn/$aspececl.c"
			
			cat "$dirfn/$aspececl.c" | $PrPWD/stdcar " positions" > "$dirfn/$aspececl-1.c"
			echo "$positions_array;" >> "$dirfn/$aspececl-1.c"
			cat "$dirfn/$aspececl.c" | $PrPWD/stdcdr " positions[" | $PrPWD/stdcdr ";" >> "$dirfn/$aspececl-1.c"
			
			mv "$dirfn/$aspececl-1.c" "$dirfn/$aspececl.c"
			casasporplanetaerrores=$(gcc -o "$dirfn/$aspececl" "$dirfn/$aspececl.c" -lm 2>&1 )
			echo "$dirfn/$aspececl"
			if [ -z "$casasporplanetaerrores" ];then
			    "$dirfn/$aspececl" > "$dirfn/$aspececl.variables"
			    cat $PrPWD/stddeclaracionesdevariable.c | $PrPWD/stdcar "char prefix" > "$dirfn/$aspececl-variables.c"
			    echo "[11]={'c','a','s','a','_','a','s','c','e','n','_'};" >> "$dirfn/$aspececl-variables.c"
			    cat $PrPWD/stddeclaracionesdevariable.c | $PrPWD/stdcdr "char prefix" | $PrPWD/stdcdr ";" >> "$dirfn/$aspececl-variables.c"
			    gcc -o "$dirfn/$aspececl-variables" "$dirfn/$aspececl-variables.c"
			    casasporplanetasc=$(cat "$dirfn/$aspececl.variables"|"$dirfn/$aspececl-variables"|tr -d '
')
#			    echo "<.<.(.(..  $casasporplanetasc  ..).).>.>"
			else
			    echo "         *** **** ***     $aspectosasc .............."
			    echo "         *** **** *** $casasporplanetaerrores   ******"
			fi
			aspececl=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			while [ -f "$dirfn/$aspececl.c" ];do
			    aspececl=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			done
			
			cat $PrPWD/casasporplaneta.c | $PrPWD/stdcar " planets[" > "$dirfn/$aspececl.c"
			echo "$aspectosecl;"  | $PrPWD/stdcdr " ecliptico_planet_names[" | $PrPWD/stdcar ";" >> "$dirfn/$aspececl.c"
			cat $PrPWD/casasporplaneta.c | $PrPWD/stdcdr " planets[" | $PrPWD/stdcdr ";" >> "$dirfn/$aspececl.c"
			
			cat "$dirfn/$aspececl.c" | $PrPWD/stdcar " positions" > "$dirfn/$aspececl-1.c"
			echo "$ecl_$positions_array;" >> "$dirfn/$aspececl-1.c"
			cat "$dirfn/$aspececl.c" | $PrPWD/stdcdr " positions[" | $PrPWD/stdcdr ";" >> "$dirfn/$aspececl-1.c"
			
			mv "$dirfn/$aspececl-1.c" "$dirfn/$aspececl.c"
			casasporplanetaerrores=$(gcc -o "$dirfn/$aspececl" "$dirfn/$aspececl.c" -lm 2>&1 )
			echo "$dirfn/$aspececl"
			if [ -z "$casasporplanetaerrores" ];then
			    "$dirfn/$aspececl" > "$dirfn/$aspececl.variables"
			    cat $PrPWD/stddeclaracionesdevariable.c | $PrPWD/stdcar "char prefix" > "$dirfn/$aspececl-variables.c"
			    echo "[11]={'c','a','s','a','_','e','c','l','i','p','_'};" >> "$dirfn/$aspececl-variables.c"
			    cat $PrPWD/stddeclaracionesdevariable.c | $PrPWD/stdcdr "char prefix" | $PrPWD/stdcdr ";" >> "$dirfn/$aspececl-variables.c"
			    gcc -o "$dirfn/$aspececl-variables" "$dirfn/$aspececl-variables.c"
			    casasporplanetaecl=$(cat "$dirfn/$aspececl.variables"|"$dirfn/$aspececl-variables"|tr -d '
')
#			    echo "<.<.(.(..  $casasporplanetecl  ..).).>.>"
			else
			    echo "         *** **** *** $casasporplanetaerrores   ******"
			fi			
			#.............................................................


			#________________________________________________________________
			aspececl=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			while [ -f "$PaPWD/$aspececl.c" ];do
			    aspececl=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			done
			
			cat $PrPWD/aspectoscasaplaneta.c | $PrPWD/stdcar "double positions" > "$PaPWD/$aspececl.c"
			echo "$ecl_positions_array;" >> "$PaPWD/$aspececl.c"
			cat $PrPWD/aspectoscasaplaneta.c | $PrPWD/stdcdr "double positions" | $PrPWD/stdcdr ";" >> "$PaPWD/$aspececl.c"
			
			cat "$PaPWD/$aspececl.c" | $PrPWD/stdcar "double ascendente=" > "$PaPWD/$aspececl-1.c"
			echo "$ascecl ;" >> "$PaPWD/$aspececl-1.c"
			cat "$PaPWD/$aspececl.c" | $PrPWD/stdcdr "double ascendente=" | $PrPWD/stdcdr ";" >> "$PaPWD/$aspececl-1.c"
			mv -v "$PaPWD/$aspececl-1.c" "$PaPWD/$aspececl.c"
			
			cat "$PaPWD/$aspececl.c" | $PrPWD/stdcar "char planets" > "$PaPWD/$aspececl-1.c"
			echo "$ecl_planetas_array;" >> "$PaPWD/$aspececl-1.c"
			cat "$PaPWD/$aspececl.c" | $PrPWD/stdcdr "char planets" | $PrPWD/stdcdr ";" >> "$PaPWD/$aspececl-1.c"
			
			cat "$PaPWD/$aspececl-1.c" | $PrPWD/stdcar "double aspects" > "$PaPWD/$aspececl.c"
			echo "[13]={0, 15, 30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180}; " >> "$PaPWD/$aspececl.c"
			cat "$PaPWD/$aspececl-1.c" | $PrPWD/stdcdr "double aspects" | $PrPWD/stdcdr ";" >> "$PaPWD/$aspececl.c"
			mv -v "$PaPWD/$aspececl.c" "$PaPWD/$aspececl-1.c"
			
			cat "$PaPWD/$aspececl-1.c" | $PrPWD/stdcar "double toleranc" > "$PaPWD/$aspececl.c"
			echo "[13]={7, 1, 1, 1, 3, 1, 7, 1, 7, 1, 1, 1, 7};" >> "$PaPWD/$aspececl.c"
			cat "$PaPWD/$aspececl-1.c" | $PrPWD/stdcdr "double toleranc" | $PrPWD/stdcdr ";" >> "$PaPWD/$aspececl.c"
			aspectoseclipticoserrores=$(gcc -o "$dirfn/$aspececl" "$PaPWD/$aspececl.c" -lm 2>&1 )
			if [ -z "$aspectoseclipticoserrores" ];then
			    "$dirfn/$aspececl" > "$dirfn/$aspececl.variables"
			    cat $PrPWD/stddeclaracionesdevariable.c | $PrPWD/stdcar "char prefix" > "$dirfn/$aspececl-variables.c"
			    echo "[22]={'e','c','l','i','p','t','i','c','o','_', 'c', 'a', 's', 'a', '_', 'p', 'l', 'a', 'n', 'e', 't', 'a'};" >> "$dirfn/$aspececl-variables.c"
			    cat $PrPWD/stddeclaracionesdevariable.c | $PrPWD/stdcdr "char prefix" | $PrPWD/stdcdr ";" >> "$dirfn/$aspececl-variables.c"
			    gcc -o "$dirfn/$aspececl-variables" "$dirfn/$aspececl-variables.c"
			    aspectosecasaplaneta=$(cat "$dirfn/$aspececl.variables"|"$dirfn/$aspececl-variables"|tr -d '
')
#			    echo "<.<.(.(..  $aspectosecasaplaneta  ..).).>.>"
			else
			    gcc -o "$dirfn/$aspececl" "$PaPWD/$aspececl.c" -lm 2>&1
			    echo "$PaPWD/$aspececl.c"
			    if [ -n "$fn" ];then
				rm  "$fn.lock"
			    fi
			    rm  "$nomprograma.lock-$ps1"
			    exit 1
			fi
			
			# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
			
			userd=$(echo -n "$fn"|$PrPWD/stdcdr "users/input/"|$PrPWD/stdcarsin "/")
			echo "uuuuUUUUU   $userd UUUUuuuu "
			mkdir $PrPWD/users/input
			mkdir $PrPWD/users/input/$userd
			mkdir peticiones
			mv "$dirfn/$ffc.c" peticiones/
			if [ -n "$timeerrores" -o -n "$aspectroseclerrores" -o -n "$ascendenteerrores" -o -n "$utctojulianerror" -o -n "$posicioneclipticoserrores" -o -n "$aspectoseclipticoserrores" ];then
			    echo "FORMATO DE FECHA: $timeerrores ERROR EN CALCULO DE POSICION ASCENCIONAL: $aspectroseclerrores ERROR EN CALCULO DE ASCENDENTE: $ascendenteerrores ERROR EN CONVERSION DE UTC A JD: $utctojulianerror ERROR EN CALCULO DE POSICION ECLIPTICA: $posicioneclipticoserrores ERROR EN CALCULO DE ASPECTOS: $aspectoseclipticoserrores"
			    exit 1
			else
			    aspececl=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			    while [ -f "$dirfn/$aspececl.c" ];do
				aspececl=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			    done
			    cat $PrPWD/aspectospordispositor.c | $PrPWD/stdcar "char ascencional_planets" > "$dirfn/$aspececl.c"
			    echo "$aspectosasc"| ../stdcdr "char ascencional_planets"|../stdcar ";" >> "$dirfn/$aspececl.c"
			    cat $PrPWD/aspectospordispositor.c | $PrPWD/stdcdr "char ascencional_planets" | $PrPWD/stdcdr ";" >> "$dirfn/$aspececl.c"
			    ett=$(echo "$et" | "$dirfn/$ffc")
			    echo "<<< $ett >>>"
			    ASC=$(echo "$ett" | $PrPWD/stdcdr ";ASC(ramc)=" | $PrPWD/stdcarsin ";"|$PrPWD/stddelcar " ")
			    DASC=$(echo "$ett" | $PrPWD/stdcdr ";DECLASC=" | $PrPWD/stdcarsin ";")
			    e=$(echo "$ett" | $PrPWD/stdcdr "e=" | $PrPWD/stdcarsin ";")
			    MC=$(echo "$ett" | $PrPWD/stdcdr ";MC=" | $PrPWD/stdcarsin ";")
			    ARMC=$(echo "$ett" | $PrPWD/stdcdr ";RAMC(p)=" | $PrPWD/stdcarsin ";")
			    echo "$userd;$fecha;$latitud;$longitud;"|tr -d '
' | sha512sum| $PrPWD/stdcarsin ' '
			    tooutputc=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			    while [ -f "$PaWD/$tooutputc.c" ];do
				tooutputc=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			    done
			    cat $PrPWD/plgn.c | $PrPWD/stdcar "char ascencional_planet_names" > "$PaPWD/$tooutputc.c"
			    echo "$aspectosasc"| ../stdcdr "char ascencional_planet_names"|../stdcar ";" >> "$PaPWD/$tooutputc.c"
			    cat $PrPWD/plgn.c | $PrPWD/stdcdr "char ascencional_planet_names" | $PrPWD/stdcdr ";" >> "$PaPWD/$tooutputc.c"

			    cat $PaPWD/$tooutputc.c | $PrPWD/stdcar "double planetas_ascencional" > "$PaPWD/$tooutputc-ii.c"
			    echo "$positions_array ;" >> "$PaPWD/$tooutputc-ii.c"
			    cat "$PaPWD/$tooutputc.c" | $PrPWD/stdcdr "double planetas_ascencional" | $PrPWD/stdcdr ";" >> "$PaPWD/$tooutputc-ii.c"
			    mv  "$PaPWD/$tooutputc-ii.c"  "$PaPWD/$tooutputc.c"

			    cat $PaPWD/$tooutputc.c | $PrPWD/stdcar "char output" > "$PaPWD/$tooutputc-ii.c"
			    cuantos=$(echo "$PaPWD/$tooutputc"|$PrPWD/stdcarsin '
' | wc -c | $PrPWD/stdcarsin ' ')
			    echo "[$cuantos]=\"$PaPWD/$tooutputc\";" >> "$PaPWD/$tooutputc-ii.c"
			    cat "$PaPWD/$tooutputc.c" | $PrPWD/stdcdr "char output" | $PrPWD/stdcdr ";" >> "$PaPWD/$tooutputc-ii.c"
			    
			    cat $PaPWD/$tooutputc-ii.c | $PrPWD/stdcar "double ASC=" > "$PaPWD/$tooutputc.c"
			    echo "$ascecl ;"|../stdcar '
' >> "$PaPWD/$tooutputc.c"
			    cat $PaPWD/$tooutputc-ii.c | $PrPWD/stdcdr "double ASC=" | $PrPWD/stdcdr ";" >> "$PaPWD/$tooutputc.c"

			    cat "$PaPWD/$tooutputc.c" | $PrPWD/stdcdr "char output" | $PrPWD/stdcdr ";" >> "$PaPWD/$tooutputc-ii.c"

			    #..................................
			    mv "$PaPWD/$tooutputc.c"  "$PaPWD/$tooutputc-ii.c" 
			    cat $PaPWD/$tooutputc-ii.c | $PrPWD/stdcar "char aspects[" > "$PaPWD/$tooutputc.c"
			    echo "$aspectosasc ;"  | $PrPWD/stdcdr "aspects[" | $PrPWD/stdcar ";" >> "$PaPWD/$tooutputc.c"
			    cat $PaPWD/$tooutputc-ii.c | $PrPWD/stdcdr "char aspects[" | $PrPWD/stdcdr ";" >> "$PaPWD/$tooutputc.c"
			    #----------------------
			    
			    cat $PaPWD/$tooutputc.c | $PrPWD/stdcar "char ascencional_planets" > "$PaPWD/$tooutputc-ii.c"
			    echo "$aspectosasc"| ../stdcdr "char ascencional_planets"|../stdcar ";" >> "$PaPWD/$tooutputc-ii.c"
			    cat $PaPWD/$tooutputc.c | $PrPWD/stdcdr "char ascencional_planets" | $PrPWD/stdcdr ";" >> "$PaPWD/$tooutputc-ii.c"
			    cp $PaPWD/$tooutputc-ii.c $PaPWD/$tooutputc.c
			    gcc -o $PaPWD/$tooutputc $PaPWD/$tooutputc.c -lm
			    $PaPWD/$tooutputc > $PaPWD/$tooutputc.sh
			    bash $PaPWD/$tooutputc.sh
			    base64imgasce=$(cat $tooutputc.gif | base64 | tr -d '
' )
			    base64imgasc="data:image/gif;base64,$base64imgasce"
			    cuantos=$(echo "$base64imgasc"|wc -c | $PrPWD/stdcarsin ' ' )
			    base64imgasce=$(echo "char base64imasc[$cuantos]=\"$base64imgasc\";")

			    #radix ecliptico
			    tooutputc=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			    while [ -f "$PaPWD/$tooutputc.c" ];do
				tooutputc=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			    done
			    cat $PrPWD/plgn.c | $PrPWD/stdcar "char ascencional_planet_names" > "$PaPWD/$tooutputc.c"
			    echo "$aspectosecl" | ../stdcdr "char ecliptico_planet_names"|../stdcar ";" >> "$PaPWD/$tooutputc.c"
			    cat $PrPWD/plgn.c | $PrPWD/stdcdr "char ascencional_planet_names" | $PrPWD/stdcdr ";" >> "$PaPWD/$tooutputc.c"

			    #..................................
			    mv "$PaPWD/$tooutputc.c"  "$PaPWD/$tooutputc-ii.c" 
			    cat $PaPWD/$tooutputc-ii.c | $PrPWD/stdcar "char aspects[" > "$PaPWD/$tooutputc.c"
			    echo "$aspectosecl ;"  | $PrPWD/stdcdr "aspects[" | $PrPWD/stdcar ";" >> "$PaPWD/$tooutputc.c"
			    cat $PaPWD/$tooutputc-ii.c | $PrPWD/stdcdr "char aspects[" | $PrPWD/stdcdr ";" >> "$PaPWD/$tooutputc.c"
			    #----------------------
			    
			    cat $PaPWD/$tooutputc.c | $PrPWD/stdcar "double planetas_ascencional" > "$PaPWD/$tooutputc-ii.c"
			    echo "$ecl_positions_array ;" >> "$PaPWD/$tooutputc-ii.c"
			    cat "$PaPWD/$tooutputc.c" | $PrPWD/stdcdr "double planetas_ascencional" | $PrPWD/stdcdr ";" >> "$PaPWD/$tooutputc-ii.c"
			    mv  "$PaPWD/$tooutputc-ii.c"  "$PaPWD/$tooutputc.c"

			    cat $PaPWD/$tooutputc.c | $PrPWD/stdcar "char output" > "$PaPWD/$tooutputc-ii.c"
			    cuantos=$(echo "$PaPWD/$tooutputc"|$PrPWD/stdcarsin '
' | wc -c | $PrPWD/stdcarsin ' ')
			    echo "[$cuantos]=\"$PaPWD/$tooutputc\";" >> "$PaPWD/$tooutputc-ii.c"
			    cat "$PaPWD/$tooutputc.c" | $PrPWD/stdcdr "char output" | $PrPWD/stdcdr ";" >> "$PaPWD/$tooutputc-ii.c"
			    
			    cat $PaPWD/$tooutputc-ii.c | $PrPWD/stdcar "double ASC=" > "$PaPWD/$tooutputc.c"
			    echo "$ascecl ;"|../stdcar '
' >> "$PaPWD/$tooutputc.c"
			    cat $PaPWD/$tooutputc-ii.c | $PrPWD/stdcdr "double ASC=" | $PrPWD/stdcdr ";" >> "$PaPWD/$tooutputc.c"
			    cat $PaPWD/$tooutputc.c | $PrPWD/stdcar "char ascencional_planets" > "$PaPWD/$tooutputc-ii.c"
			    echo "$aspectosecl"| ../stdcdr "char ecliptico_planets"|../stdcar ";" >> "$PaPWD/$tooutputc-ii.c"
			    cat $PaPWD/$tooutputc.c | $PrPWD/stdcdr "char ascencional_planets" | $PrPWD/stdcdr ";" >> "$PaPWD/$tooutputc-ii.c"
			    cp $PaPWD/$tooutputc-ii.c $PaPWD/$tooutputc.c
			    gcc -o $PaPWD/$tooutputc $PaPWD/$tooutputc.c -lm
			    $PaPWD/$tooutputc > $PaPWD/$tooutputc.sh
			    bash $PaPWD/$tooutputc.sh
			    base64imgecl=$(cat $tooutputc.gif | base64  | tr -d '
' )
			    base64imgasc="data:image/png;base64,$base64imgecl"
			    cuantos=$(echo "$base64imgasc"|wc -c | $PrPWD/stdcarsin ' ' )
			    base64imgecl=$(echo "char base64imecl[$cuantos]=\"$base64imgasc\";")

			    tooutputc=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			    while [ -f "$PrPWD/users/tooutput/$userd/$tooutputc.c" ];do
				tooutputc=$(dd if=/dev/random bs=1 count=10 2>/dev/null |$PrPWD/stdtohex|$PrPWD/stddelcar " ")
			    done
			    echo "#include <stdio.h>" > $PrPWD/users/tooutput/$userd/data/$tooutputc.c
			    echo "#include <time.h>" >>  $PrPWD/users/tooutput/$userd/data/$tooutputc.c
			    echo "int main(int argc, char *argv[]) {time_t fecha=$fecha;double latitud=$latitud; double longitud=$longitud; double ascendente=$ascecl;double ascendente_ascencional=$ASC;double armc=$ARMC;double mid_coeli=$MC;double et=$et;double tjd=$tjd;double planetas_ascencional$positions_array; $aspectosasc; $aspectosecasaplaneta; double planetas_ecliptico$ecl_positions_array;$aspectosecl;$aspectosdisp;$casasporplanetasc;$casasporplanetaecl; $base64imgasce ; $base64imgecl ; }" >>         $PrPWD/users/tooutput/$userd/data/$tooutputc.c
			    cp $PrPWD/users/tooutput/$userd/data/$tooutputc.c $PrPWD/users/tooutput/$userd/$tooutputc.c
			    cat $PrPWD/users/tooutput/$userd/data/$tooutputc.c|../stddeclaracionesdevariable_tojs > $PrPWD/users/tooutput/$userd/$tooutputc.js
			    echo "$PrPWD/users/tooutput/$userd/$tooutputc.js"
			fi
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
