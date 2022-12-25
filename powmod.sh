#  uint64_t x = pow_mod(a,d,n);
#d="1aeac5a6400c075f5153a4fc1beda215bac2226a1a46ac46c84f812b2d8c5eed3f77912fe962c7d4f821cafdc180b8f72cef335dd819792e416b27c81de219447112df74003d29d50186897f111ea63bc80d623afe1f756bc419e2e32dce316aacf99955097cdf51cacbb5fd561f691047554638bd8f9341aaa854efdbd5d9de89e88926a4dbf3bd5f5b7be7d0fcfabb7a4a7976ed450a952bae369a13ca9414016e49916723e6c2258e7f1a2d94d52facc11640826cf0878303d59e7a73042a2153786d8121c30939d764b8b72f16b67f32c853035d807ed12e1afefd5c6ac6904e1da6926c89fa0c865f71005186d5acf49d0505deba5d3521376aaa812bb5"
e="10001"
#p="f596f1c1f90b4655d5989bd39b6d75c06ed616af974e0951832c0eb159e832b84a826511b8442674253bc470f1b7e6fe9756f400fb37f9600391d20d35aa0a592f1832c9b549c09fdcdb3b9f0aaeba5c415105a18c7dc9b864154bc637677512cccb36e2131964334f6ac795a2257fb75dd5f865a075a4027b0f6fbc406c8f4f"
#q="f7a7ce67d37b27dd5818dcf948155f8388a8f8f87811a6f24398a2b4be8ae776d93887197a2795c47fc96fe261ede09f6af64c4bab6d8b5e0d99d8c4fc340f9ca68055d0037daa9cf416761f3394dd7559a14507440f7fc91a16b636a5aaca2b59458dd00af1b1391e3c5bd567003dcc54a1b22415650f66e20f6b9d30445897"
#c="ed959ebcedfa41b15854e557050f348ea16bfdcd33fc39f9318e10fc9c83dc5623d0fe9184744d5c3a4b56c40f417d765c2374315ab03a3090db527b24eef916a9f416b77b5e4cd2b54529f23ae0fb5c3d22a90652596ba5fee27c80b23aee4612b254d68d14d1716709b7263d773b537c35904a9a6764c0de1ba3310520925898d8631cf05e518f4eaf1145de66b948f78777239ed60bfbdd3a10f29b7d332a9b23527d35d83bffb297a7d9b626e46c87e5701279ab08915e233df331553e94c2ca9f2eca3bed1dbf47382d5414f99e6fca1bb1753cb4fc30749fef6ded8855f0fe1d398cca737733eaa534e5958edf5e018b14d364b98be4b3fe573247af99"
#u="559b7b87041b37cc9a3c732bbe5ec69d1f401a46218decb3b94be56a8860e524a50465620e6c0625481870cdd6c8704fc6696779e3058f027fb17fcbaf1db36bddda6b9ad649ca9bc7e87b1fb4f4085592376f9800e706e072ea706c869fcfc99fd7c792b51ff8a0673ba97c7d0eabc8b219799a8a7d5901fc2b8591311023ad"
#d="409455D2EC22E3057533216E991CD15E871F582F6B1B1E000B8F4EB6BBEF7F36FAC986E9CA00DAAC1F31450F0AC00FB9E895C937E858628B7D91A3F4707AEC62746A402519B233B434CFB44C863574653C712EC91D9E78895E466CFE8954ED7D59DA4969CBA88D42AB3330F0EAEDA67020FB921F2678F31BA27D300013713986A6989AECBB336F367E331D145C1B7257343E54D72F749622298A93A52A664CC5F4D4EE3439155FE8CB097A2C370CD597FCDBE918AF574B84B081DAAFD6387673BEBDA9C45BC5CD63B19E66E0D5E59B661C606E7EF3674065098E4FB21EB0A05C53A0BA67E487AA5D91A0C62AC00DA2D458D09236DE28109F544EF60544734BE1"
#c="B314B25FD0C12DF58B3BC9DC3970C42F3C2291888140883A8949EE5A92ECA05C101760FF034E16F1E4BB9C1C2149B856AEDF2FBF4498EF5D6716AAF5FA7DD540A7959D6953BCFA8B6E60B4871D7A3048253A655FBEA0534527F07F283C71401866858168FB791AC23BD4C5DF9FAD8A1F4BD7CAEEC3DC5BA9ABD3BBCB3FEB4715202EF6654CC33DE7D845D72197318707F7891E6A2B8360974B23814E0C2AAABD66BD302B1E6608831736B1B895279130066AD4A528E34CA83CD3F4FFB875433E9D7A7E4D8A9F6E525B78EDA7E25BEFCBEC739EE7B8781E5081DEED6958890F1FC14AFFE158644B81408CDFA0B11D62035CD9D25BC582967EC3E80DA69120649D"

aa=$(./stdcarsin "*" | ./stdcarsin " " )
r=1
x="$d"
echo "T >$aa<" 1>&2
echo ${#aa}  1>&2
divisor=$c

while [ -n "$x" ];do
    xand=$(echo "$x" | ./bn2cdr | ./bn2and 1 )
    if [ "$xand" = "00000001" ];then
	r=$(echo $r | ./bn2mul $aa)
	if [ $(echo $r | ./bn2cmp $divisor) -gt 0 ];then
	    divid=$r
	    #   c              a         /        b
	    cociente=$(echo $divid | ./bn2div $divisor )
	    #  t              b          *        c
	    resto1=$(echo $divisor | ./bn2mul $cociente )
	    #        a         -        t
	    r=$(echo 0$divid | ./bn2sub 0$resto1)
	fi
    fi
    aa=$(echo $aa | ./bn2mul $aa )
    if [ $(echo $aa | ./bn2cmp $c) -gt 0 ];then
	divid=$aa
	#   c              a         /        b
	cociente=$(echo $divid | ./bn2div $divisor )
	#  t              b          *        c
	resto1=$(echo $divisor | ./bn2mul $cociente )
	#            a         -        t
	aa=$(echo $divid | ./bn2sub 0$resto1 )
    fi
    x=$(echo "$x" | ./bn2shiftr ) #./bn2div 2)
    if [ -z "$x" ];then
	break
    fi
    echo -n "."  1>&2 #c=${#c} cociente=${#cociente} resto1=${#resto1} aa=${#aa}"
done
echo "$r"
echo ${#r} ${#c} 1>&2

aa=$r
r=1
x="$e"
echo "T $aa"  1>&2
while [ -n "$x" -a "$x" != "0" ];do
    xand=$(echo "$x" | ./bn2cdr | ./bn2and 1 )
    if [ "$xand" = "00000001" ];then
	r=$(echo $r | ./bn2mul $aa)
	if [ $(echo $r | ./bn2cmp $divisor) -gt 0 ];then
	    divid=$r
	    #   c              a         /        b
	    cociente=$(echo $divid | ./bn2div $divisor )
	    #  t              b          *        c
	    resto1=$(echo $divisor | ./bn2mul $cociente )
	    #        a         -        t
	    r=$(echo 0$divid | ./bn2sub 0$resto1)
	fi
    fi
    aa=$(echo $aa | ./bn2mul $aa )
    if [ $(echo $aa | ./bn2cmp $c) -gt 0 ];then
	divid=$aa
	#   c              a         /        b
	cociente=$(echo $divid | ./bn2div $divisor )
	#  t              b          *        c
	resto1=$(echo $divisor | ./bn2mul $cociente )
	#            a         -        t
	aa=$(echo $divid | ./bn2sub 0$resto1 )
    fi
    x=$(echo "$x" | ./bn2shiftr ) #./bn2div 2)
    echo -n "${#x} "  1>&2 #c=${#c} cociente=${#cociente} resto1=${#resto1} aa=${#aa}"
done
echo "D $r" 1>&2
echo ${#r} ${#c}
