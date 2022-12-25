p="0000F53CD269D025E37611B0387F19528428A5A22EE1E313BBD8D7C61C5BA57E1D2CEA414296482867E5FA24CD4B7400AFCB4860BCEA88D54B445DBC86A794FCAE203C44A790900446C6D4496723241B62D1DDF3B5718FF4841B6EB9AAA75785BF1D67B03F61EF121A950F8D17BD19BF5CFE7BF83FBFA783EA523AE3B2DBBC30D0125C41780D7D57C34F60093255E006658292AC1D24AB72D0EDB33550251BB5CCAD7C00CFC78EC3E3AB6EA558F33FB5381C9EC6A8DDF1205BDF534CF2BBD1DCAB3C6D6F"
q="93E55937EFC150B1B8D5D581EE6FC542D8523E0B36BF81EB58BF5B4E2990B3279091DEDE52D9002012C51E9541BE761B742A0B29141FFA521925E06CCED53ACC849A9D2704F37EEDDCE7A1CBF4FCC3D28DD5E64FD5412E362B0EAC0F0EC2A3FFA61EDC72290324A1C01AD75B1AB039C10F33A008E48778F5519D1D5DEB6414EB518267723283496317E2719854CBE692FCF92B9F81A7BBAD7A3D2449B028ADC0177770779F6DD81CF7AFA629FBF7379ADD8D0CB5532701623AB6FCA57A10406645E7"
e="10001"
d="1579B23EF2963897C812F4C6F77AE259F1957DBBCD4B6D64DF13F7950AD0B66F0959CEA53474091CB6A5C89F37ABCA346AF35DB2CABF2529222FB42725B9CDD5E38E3587E098916A7E8945C1F7FD7C9A870638896E48CB5DCC6B818E9ED4F2CE3520A74A4FE06C33C55C2B04B4EDA8E86FFC7E174D28F32780F64450D0F24281352FCFCB1822AF16EAD80491D57EF770C03E2C291E610BF1B0E2DA42088A46DF4DE5C9A596DACE52DA062A90E2D265C6113934CCAB71B6BD711ABFB2F1D8FB4E3812480F357DD915E2F4FDE202F7CE0BC817D2DF99751E4A9DCDA3FACF337533C71AE328A4364D615ED1E6451E5A92659349BA30A8DF6CF5D462D7D3C543EDA793A92D6E1E80F2D0C3E40CFBDFE1684BBF8CA103B713A46E0BF7C35A5240CEEE22567329F45EF085EB4152A1F5CE1D3F1D3A4042F5C62E20CBD4A1115BA3AFF62E7C9F70D229E3A96775E28EC047686A5C49E71AE05D3286681B7B55DE49BBEAB11AA02096ABEEC48A7F44C0F7353F5EB47F8E5B9BAE89CF03F612DADD24E2C02E591699"
n=""
PaPWD="$PWD"
stdcdr="stdcdr"
stdcdrd=""
while [ ! -f "$stdcdrd$stdcdr" ];do
    stdcdrd=$(echo "../$stdcdrd")
done
PrPWD=$stdcdrd
base=$($PrPWD/stdcarsin "*" | $PrPWD/stdcarsin " " )
n=$(echo -n "$p*$q"|$PrPWD/bignum_mul)
cmp3=$(echo "$base=$n"| $PrPWD/bignum_cmp )
temp1=$(echo "$base"| wc -c| $PrPWD/stdcarsin " " )
while [ "$cmp3" != ">" ];do
    echo "$cmp3"
    temp1=$((temp1-1))
    base=$(echo "$base" | $PrPWD/stdcarn $temp1)
    echo $base $temp1 $cmp3
    cmp3=$(echo "$base=$n"| $PrPWD/bignum_cmp_m )
done

n=$(echo -n "$p*$q"|$PrPWD/bignum_mul)
echo "T >$base<" 1>&2
echo n
echo $n
echo d
echo $d
echo base
echo $base
echo e
echo $e
r=1
exponen="$e"
sleep 10

echo "$base ^$exponen mod $n"
while [ -n "$exponen" ];do
    exponenand=$(echo "$exponen" | $PrPWD/bignum_cdr | $PrPWD/bignum_and 1 )
    echo  "$exponenand =  00000001" >&2
    if [ "$exponenand" = "00000001" ];then
	echo mul r a 1>&2
	#     r=r*a
	echo "r=$r * $base"  1>&2
	r=$(echo "00$r*$base"|$PrPWD/bignum_mul)
	echo rrr $r  1>&2
	cmp3=$(echo "$r=$n"| $PrPWD/bignum_cmp_m )
	echo "$cmp3"  1>&2
	if [ "$cmp3" = "<" ];then
	    echo "r=r%n"  1>&2
	    echo "$r % $n"  1>&2
	    coc=$(echo "$r/$n"|$PrPWD/bignum_div)
	    echo $coc  1>&2
	    temp1=$(echo "$coc*$n"|$PrPWD/bignum_mul)
	    echo t $temp1   1>&2
	    r=$(echo "$r-$temp1"|$PrPWD/bignum_sub)
	    echo r $r   1>&2
	fi
    fi
    exponen=$(echo "$exponen" | $PrPWD/bignum_shiftr )
    echo "base=base*base"   1>&2
    echo $base   1>&2
    base=$(echo -n "$base*$base"|$PrPWD/bignum_mul)
    echo $base   1>&2
    echo "base%n"   1>&2
    cmp3=$(echo "$base=$n"| $PrPWD/bignum_cmp_m )
    if [ "$cmp3" = "<" ];then
	coc=$(echo -n "$base/$n"|$PrPWD/bignum_div)
	temp1=$(echo -n "$coc*$n"|$PrPWD/bignum_mul)
	echo t $temp1   1>&2
	base=$(echo -n "$base-$temp1"|$PrPWD/bignum_sub)
    fi
    echo -n .
done

echo "r =================="
echo $r
echo "_________________________________________"
sleep 5

base=$r
r=1
exponen=$d

echo "$base ^$exponen mod $n"
while [ -n "$exponen" ];do
    exponenand=$(echo "$exponen" | $PrPWD/bignum_cdr | $PrPWD/bignum_and 1 )
    echo  "$exponenand =  00000001" >&2
    if [ "$exponenand" = "00000001" ];then
	echo mul r a 1>&2
	#     r=r*a
	echo "r=$r * $base"  1>&2
	r=$(echo "00$r*$base"|$PrPWD/bignum_mul)
	echo rrr $r  1>&2
	cmp3=$(echo "$r=$n"| $PrPWD/bignum_cmp_m )
	echo "$cmp3"  1>&2
	if [ "$cmp3" = "<" ];then
	    echo "r=r%n"  1>&2
	    echo "$r % $n"  1>&2
	    coc=$(echo "$r/$n"|$PrPWD/bignum_div)
	    echo $coc  1>&2
	    temp1=$(echo "$coc*$n"|$PrPWD/bignum_mul)
	    echo t $temp1   1>&2
	    r=$(echo "$r-$temp1"|$PrPWD/bignum_sub)
	    echo r $r   1>&2
	fi
    fi
    exponen=$(echo "$exponen" | $PrPWD/bignum_shiftr )
    echo "base=base*base"   1>&2
    echo $base   1>&2
    base=$(echo -n "$base*$base"|$PrPWD/bignum_mul)
    echo $base   1>&2
    echo "base%n"   1>&2
    cmp3=$(echo "$base=$n"| $PrPWD/bignum_cmp_m )
    if [ "$cmp3" = "<" ];then
	coc=$(echo -n "$base/$n"|$PrPWD/bignum_div)
	temp1=$(echo -n "$coc*$n"|$PrPWD/bignum_mul)
	echo t $temp1   1>&2
	base=$(echo -n "$base-$temp1"|$PrPWD/bignum_sub)
    fi
    echo -n .
done

echo "r =================="
echo $r
echo
echo ${#r} ${#c} 1>&2
