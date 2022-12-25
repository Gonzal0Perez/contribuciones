#include <string.h>
#include <stdio.h>
#include <stdlib.h>

static unsigned char separador=';';

static const unsigned char search[8255]=" ;1INCH ;1INCHB ;1INCHBTC ;1INCHDOWN ;1INCHUP ;AAVE ;AAVEB ;AAVEBKRW ;AAVEDOWN ;AAVEUP ;ACH ;ACHB ;ACM ;ACMB ;ADA ;ADAA ;ADAB ;ADADOWN ;ADAE ;ADAG ;ADAP ;ADAR ;ADAT ;ADAUP ;ADAUSDC ;ADX ;ADXB ;ADXE ;AEBN ;AEBT ;AEET ;AERGOB ;AERGOBTC ;AGIB ;AGIE ;AGIX ;AGLD ;AGLDB ;AION ;AIONB ;AKRO ;ALCX ;ALCXB ;ALGO ;ALGOB ;ALGOBIDR ;ALGOT ;ALGOUSDC ;ALICE ;ALICEB ;ALICEBID ;ALICEBNB ;ALICEBTC ;ALICETRY ;ALPACA ;ALPACAB ;ALPACABN ;ALPACABT ;ALPHA ;ALPHAB ;ALPHABNB ;ALPHABTC ;AMBB ;AMBE ;AMPB ;ANC ;ANCB ;ANKR ;ANKRB ;ANKRT ;ANKRUSDC ;ANT ;ANTB ;ANY ;ANYB ;API3 ;API3B ;APPC ;ARDR ;ARKB ;ARKE ;ARNB ;ARNE ;ARPA ;ARPAB ;ASR ;ASRB ;ASTB ;ASTE ;ATAB ;ATM ;ATMB ;ATOM ;ATOMB ;ATOMBIDR ;ATOMT ;ATOMUSDC ;AUCTION ;AUCTIONB ;AUD ;AUDB ;AUDIO ;AUDIOB ;AUDIOBTC ;AUDUSDC ;AUTO ;AUTOB ;AVAB ;AVAX ;AVAXB ;AVAXBIDR ;AXS ;AXSA ;AXSB ;AXSE ;B ;BADGER ;BADGERB ;BADGERBT ;BAKE ;BAKEB ;BAL ;BALB ;BAND ;BANDB ;BAT ;BATB ;BATE ;BATP ;BATT ;BATUSDC ;BCC ;BCCB ;BCCE ;BCDB ;BCDE ;BCH ;BCHAB ;BCHABC ;BCHABCB ;BCHABCBT ;BCHABCPA ;BCHABCT ;BCHABCUSDC ;BCHB ;BCHDOWN ;BCHE ;BCHP ;BCHSV ;BCHSVBTC ;BCHSVPAX ;BCHSVT ;BCHSVUSDC ;BCHT ;BCHUP ;BCHUSDC ;BCNB ;BCNE ;BCPT ;BCPTT ;BCPTUSDC ;BDOT ;BEAM ;BEAR ;BEARB ;BEL ;BELB ;BELT ;BETA ;BETAB ;BETH ;BGBPUSDC ;BICO ;BICOB ;BIFI ;BIFIB ;BKRW ;BKRWB ;BLZ ;BLZB ;BLZE ;BNB ;BNBA ;BNBB ;BNBBEAR ;BNBBEARB ;BNBBULL ;BNBBULLB ;BNBD ;BNBDOWN ;BNBE ;BNBG ;BNBI ;BNBN ;BNBP ;BNBR ;BNBT ;BNBUP ;BNBUSDC ;BNBUSDP ;BNBUSDS ;BNBZ ;BNT ;BNTB ;BNTE ;BNX ;BNXB ;BOND ;BONDB ;BOTB ;BQXB ;BQXE ;BRDB ;BRDE ;BTC ;BTCA ;BTCB ;BTCD ;BTCDOWN ;BTCE ;BTCG ;BTCI ;BTCN ;BTCP ;BTCR ;BTCST ;BTCSTB ;BTCSTBTC ;BTCT ;BTCUP ;BTCUSDC ;BTCUSDP ;BTCUSDS ;BTCV ;BTCZ ;BTG ;BTGB ;BTGE ;BTS ;BTSB ;BTSE ;BTT ;BTTB ;BTTC ;BTTCUSDC ;BTTE ;BTTP ;BTTT ;BTTUSDC ;BULL ;BULLB ;BURGER ;BURGERB ;BURGERBN ;BUSD ;BUSDB ;BUSDD ;BUSDI ;BUSDN ;BUSDR ;BUSDV ;BUSDZ ;BZRX ;BZRXB ;C98 ;C98B ;CAKE ;CAKEB ;CDTB ;CDTE ;CELO ;CELOB ;CELR ;CELRB ;CFX ;CFXB ;CHAT ;CHESS ;CHESSB ;CHESSBNB ;CHESSBTC ;CHR ;CHRB ;CHRE ;CHZ ;CHZB ;CHZE ;CHZG ;CHZT ;CITY ;CITYB ;CKB ;CKBB ;CLOAKBTC ;CLOAKETH ;CLV ;CLVB ;CMTB ;CMTE ;CNDB ;CNDE ;COCOS ;COCOSB ;COCOSBNB ;COCOSBTC ;COCOSTRY ;COMP ;COMPB ;COS ;COSB ;COTI ;COTIB ;COVERB ;COVERETH ;CREAMB ;CREAMBNB ;CRV ;CRVB ;CRVE ;CTK ;CTKB ;CTSI ;CTSIB ;CTXC ;CTXCB ;CVC ;CVCB ;CVCE ;CVP ;CVPB ;CVPE ;CVX ;CVXB ;DAI ;DAIB ;DAR ;DARB ;DASH ;DASHB ;DATA ;DATAB ;DCR ;DCRB ;DEGO ;DEGOB ;DENT ;DENTB ;DEXE ;DEXEB ;DF ;DFB ;DFET ;DGB ;DGBB ;DGDB ;DGDE ;DIA ;DIAB ;DLTB ;DLTE ;DNT ;DNTB ;DNTE ;DOCK ;DOCKB ;DODO ;DODOB ;DOGE ;DOGEB ;DOGEBIDR ;DOGEUSDC ;DOT ;DOTA ;DOTB ;DOTDOWN ;DOTE ;DOTG ;DOTN ;DOTR ;DOTT ;DOTUP ;DREP ;DUSK ;DUSKB ;DUSKUSDC ;DYDX ;DYDXB ;EASY ;EDOB ;EDOE ;EGLD ;EGLDB ;ELF ;ELFB ;ELFE ;ENGB ;ENGE ;ENJ ;ENJB ;ENJE ;ENJG ;ENJT ;ENS ;ENSB ;EOS ;EOSA ;EOSB ;EOSBEAR ;EOSBEARB ;EOSBULL ;EOSBULLB ;EOSDOWN ;EOSE ;EOSP ;EOST ;EOSUP ;EOSUSDC ;EPS ;EPSB ;ERD ;ERDB ;ERDP ;ERDUSDC ;ERN ;ERNB ;ETC ;ETCB ;ETCE ;ETCG ;ETCP ;ETCT ;ETCUSDC ;ETH ;ETHA ;ETHB ;ETHBEAR ;ETHBEARB ;ETHBULL ;ETHBULLB ;ETHD ;ETHDOWN ;ETHE ;ETHG ;ETHN ;ETHP ;ETHR ;ETHT ;ETHUP ;ETHUSDC ;ETHUSDP ;ETHZ ;EUR ;EURB ;EVXB ;EVXE ;EZBT ;EZET ;FARM ;FARMB ;FET ;FETB ;FIDA ;FIDAB ;FIL ;FILB ;FILDOWN ;FILUP ;FIO ;FIOB ;FIRO ;FIS ;FISB ;FIST ;FLM ;FLMB ;FLOW ;FLOWB ;FLUX ;FLUXB ;FOR ;FORB ;FORTH ;FORTHB ;FORTHBTC ;FRONT ;FRONTB ;FRONTBTC ;FRONTETH ;FTM ;FTMA ;FTMB ;FTME ;FTMP ;FTMR ;FTMT ;FTMUSDC ;FTT ;FTTB ;FUEL ;FUN ;FUNB ;FUNE ;FXS ;FXSB ;GALA ;GALAB ;GASB ;GBP ;GBPB ;GHST ;GHSTB ;GLMB ;GLME ;GLMR ;GLMRB ;GNO ;GNOB ;GNTB ;GNTE ;GOBN ;GOBT ;GRSB ;GRSE ;GRT ;GRTB ;GRTE ;GRTT ;GTC ;GTCB ;GTO ;GTOB ;GTOE ;GTOP ;GTOT ;GTOUSDC ;GVTB ;GVTE ;GXS ;GXSB ;GXSE ;HARD ;HARDB ;HBAR ;HBARB ;HC ;HCBT ;HCET ;HEGICB ;HEGICETH ;HIGH ;HIGHB ;HIVE ;HIVEB ;HNT ;HNTB ;HOT ;HOTB ;HOTE ;HOTT ;HSRB ;HSRE ;ICNB ;ICNE ;ICP ;ICPB ;ICPE ;ICPR ;ICPT ;ICX ;ICXB ;ICXE ;IDEX ;IDEXB ;ILV ;ILVB ;IMX ;IMXB ;INJ ;INJB ;INSB ;INSE ;IOST ;IOSTB ;IOTA ;IOTAB ;IOTX ;IOTXB ;IQB ;IQBN ;IRIS ;IRISB ;JASMY ;JASMYB ;JASMYBNB ;JASMYBTC ;JASMYETH ;JOE ;JOEB ;JST ;JSTB ;JUV ;JUVB ;KAVA ;KAVAB ;KEEP ;KEEPB ;KEY ;KEYB ;KEYE ;KLAY ;KLAYB ;KMD ;KMDB ;KMDE ;KNC ;KNCB ;KNCE ;KP3R ;KP3RB ;KSM ;KSMA ;KSMB ;LAZIO ;LAZIOB ;LAZIOBTC ;LAZIOEUR ;LAZIOTRY ;LEND ;LENDB ;LENDBKRW ;LINA ;LINAB ;LINK ;LINKB ;LINKBKRW ;LINKDOWN ;LINKT ;LINKUP ;LINKUSDC ;LIT ;LITB ;LOKA ;LOKAB ;LOOM ;LPT ;LPTB ;LRC ;LRCB ;LRCE ;LRCT ;LSK ;LSKB ;LSKE ;LTC ;LTCB ;LTCDOWN ;LTCE ;LTCG ;LTCN ;LTCP ;LTCR ;LTCT ;LTCUP ;LTCUSDC ;LTO ;LTOB ;LUNA ;LUNAB ;LUNABIDR ;LUNB ;LUNE ;MANA ;MANAB ;MANABIDR ;MASK ;MASKB ;MATIC ;MATICAUD ;MATICB ;MATICBID ;MATICBNB ;MATICBRL ;MATICBTC ;MATICETH ;MATICEUR ;MATICGBP ;MATICRUB ;MATICTRY ;MBL ;MBLB ;MBOX ;MBOXB ;MC ;MCB ;MCBN ;MCBT ;MCO ;MCOB ;MCOE ;MDAB ;MDAE ;MDT ;MDTB ;MDX ;MDXB ;MFT ;MFTB ;MFTE ;MINA ;MINAB ;MIR ;MIRB ;MITH ;MKR ;MKRB ;MLN ;MLNB ;MODB ;MODE ;MOVR ;MOVRB ;MTHB ;MTHE ;MTL ;MTLB ;MTLE ;NANO ;NANOB ;NASB ;NASE ;NAVB ;NAVE ;NBS ;NBSB ;NCASHBNB ;NCASHBTC ;NCASHETH ;NEAR ;NEARB ;NEBL ;NEO ;NEOB ;NEOE ;NEOP ;NEOR ;NEOT ;NEOUSDC ;NKN ;NKNB ;NMR ;NMRB ;NPXS ;NPXSUSDC ;NU ;NUA ;NUB ;NUBN ;NUBT ;NULS ;NULSB ;NUR ;NXSB ;NXSE ;OAXB ;OAXE ;OCEAN ;OCEANB ;OCEANBNB ;OCEANBTC ;OG ;OGBT ;OGN ;OGNB ;OMG ;OMGB ;OMGE ;ONE ;ONEB ;ONEE ;ONEP ;ONET ;ONEUSDC ;ONG ;ONGB ;ONT ;ONTB ;ONTE ;ONTP ;ONTT ;ONTUSDC ;OOKI ;OOKIB ;ORN ;ORNB ;OSTB ;OSTE ;OXT ;OXTB ;PAX ;PAXB ;PAXE ;PAXG ;PAXGB ;PAXT ;PEOPLE ;PEOPLEB ;PEOPLEBT ;PERL ;PERLUSDC ;PERP ;PERPB ;PHBB ;PHBP ;PHBT ;PHBUSDC ;PHXB ;PHXE ;PIVX ;PLA ;PLAB ;PNT ;PNTB ;POAB ;POAE ;POEB ;POEE ;POLS ;POLSB ;POLY ;POLYB ;POND ;PONDB ;PORTO ;PORTOBTC ;PORTOEUR ;PORTOTRY ;POWR ;POWRB ;PPTB ;PPTE ;PROM ;PROMB ;PROS ;PSG ;PSGB ;PUNDIX ;PUNDIXET ;PYR ;PYRB ;QI ;QIB ;QIBN ;QIBT ;QKCB ;QKCE ;QLCB ;QLCE ;QNT ;QNTB ;QSPB ;QSPE ;QTUM ;QTUMB ;QUICK ;QUICKB ;QUICKBNB ;QUICKBTC ;RAD ;RADB ;RAMP ;RAMPB ;RARE ;RAREB ;RAY ;RAYB ;RCNB ;RCNE ;RDNB ;RDNE ;REEF ;REEFB ;REEFBIDR ;REN ;RENB ;RENBTCBT ;RENBTCET ;REPB ;REQ ;REQB ;REQE ;RGT ;RGTB ;RIF ;RIFB ;RLC ;RLCB ;RLCE ;RNDR ;RNDRB ;ROSE ;ROSEB ;RPXB ;RPXE ;RSR ;RSRB ;RUNE ;RUNEB ;RVN ;RVNB ;RVNT ;SALT ;SAND ;SANDB ;SANDBIDR ;SANTOS ;SANTOSBR ;SANTOSBT ;SANTOSTR ;SC ;SCB ;SCBT ;SCET ;SCRT ;SCRTB ;SFP ;SFPB ;SHIB ;SHIBB ;SHIBDOGE ;SKL ;SKLB ;SKYB ;SKYE ;SLP ;SLPB ;SLPE ;SLPT ;SNGLSBTC ;SNGLSETH ;SNMB ;SNME ;SNTB ;SNTE ;SNX ;SNXB ;SOL ;SOLA ;SOLB ;SOLE ;SOLG ;SOLR ;SOLT ;SOLUSDC ;SPARTABN ;SPELL ;SPELLB ;SPELLBTC ;SRM ;SRMB ;SSVB ;SSVE ;STEEMBNB ;STEEMBTC ;STEEMETH ;STMX ;STMXB ;STORJ ;STORJB ;STORJBTC ;STORJETH ;STORM ;STORMBNB ;STORMBTC ;STORMETH ;STPT ;STPTB ;STRAT ;STRATB ;STRATBNB ;STRATBTC ;STRATETH ;STRAX ;STRAXB ;STRAXBTC ;STRAXETH ;STX ;STXB ;SUBB ;SUBE ;SUN ;SUNB ;SUPER ;SUPERB ;SUPERBTC ;SUSD ;SUSDB ;SUSDE ;SUSHI ;SUSHIB ;SUSHIBNB ;SUSHIBTC ;SUSHIDOWN ;SUSHIUP ;SWRV ;SWRVB ;SXP ;SXPA ;SXPB ;SXPDOWN ;SXPE ;SXPG ;SXPT ;SXPUP ;SYS ;SYSB ;SYSE ;TCT ;TCTB ;TFUEL ;TFUELBNB ;TFUELBTC ;TFUELPAX ;TFUELT ;TFUELUSDC ;THETA ;THETAB ;THETABNB ;THETABTC ;THETAETH ;THETAEUR ;TKO ;TKOB ;TLM ;TLMB ;TLMT ;TNBB ;TNBE ;TNTB ;TNTE ;TOMO ;TOMOB ;TOMOUSDC ;TORN ;TORNB ;TRB ;TRBB ;TRIBE ;TRIBEB ;TRIBEBNB ;TRIBEBTC ;TRIG ;TROY ;TROYB ;TRU ;TRUB ;TRUR ;TRX ;TRXA ;TRXB ;TRXDOWN ;TRXE ;TRXN ;TRXP ;TRXT ;TRXUP ;TRXUSDC ;TRXX ;TUSD ;TUSDB ;TUSDBT ;TUSDE ;TVK ;TVKB ;TWT ;TWTB ;UFTB ;UFTE ;UMA ;UMAB ;UNFI ;UNFIB ;UNI ;UNIA ;UNIB ;UNIDOWN ;UNIE ;UNIUP ;USDC ;USDCB ;USDCT ;USDP ;USDPB ;USDS ;USDSB ;USDSBUSDS ;USDST ;USDSUSDC ;UST ;USTB ;UTK ;UTKB ;VEN ;VENB ;VENE ;VET ;VETB ;VETE ;VETG ;VETT ;VGX ;VGXB ;VGXE ;VIAB ;VIAE ;VIBB ;VIBE ;VIDT ;VIDTB ;VITE ;VOXEL ;VOXELB ;VOXELBNB ;VOXELBTC ;VOXELETH ;VTHO ;VTHOB ;WABI ;WAN ;WANB ;WANE ;WAVES ;WAVESB ;WAVESBNB ;WAVESBTC ;WAVESETH ;WAVESPAX ;WAVESRUB ;WAVEST ;WAVESUSDC ;WAXP ;WAXPB ;WBTC ;WIN ;WINB ;WINE ;WING ;WINGB ;WINGSBTC ;WINGSETH ;WINT ;WINUSDC ;WNXM ;WNXMB ;WPRB ;WPRE ;WRX ;WRXB ;WRXE ;WTC ;WTCB ;WTCE ;XEC ;XECB ;XEM ;XEMB ;XEME ;XLM ;XLMB ;XLMDOWN ;XLME ;XLMP ;XLMT ;XLMUP ;XLMUSDC ;XMR ;XMRB ;XMRE ;XNO ;XNOB ;XNOE ;XRP ;XRPA ;XRPB ;XRPBEAR ;XRPBEARB ;XRPBULL ;XRPBULLB ;XRPDOWN ;XRPE ;XRPG ;XRPN ;XRPP ;XRPR ;XRPT ;XRPUP ;XRPUSDC ;XTZ ;XTZB ;XTZDOWN ;XTZE ;XTZT ;XTZUP ;XVG ;XVGB ;XVGE ;XVS ;XVSB ;XZC ;XZCB ;XZCE ;XZCX ;YFI ;YFIB ;YFIDOWN ;YFIE ;YFII ;YFIIB ;YFIUP ;YGG ;YGGB ;YOYO ;ZEC ;ZECB ;ZECE ;ZECP ;ZECT ;ZECUSDC ;ZEN ;ZENB ;ZENE ;ZIL ;ZILB ;ZILE ;ZRX ;ZRXB ;ZRXE ;";
static unsigned int longitudes[1238];
static unsigned int aciertos[1238];
int main(int argc,char *argv[]) {
  unsigned int i=0;
  unsigned int j=0;
  unsigned long l=0;
  unsigned char k=1; //indicador de imprimir
  i=0;
  j=sizeof(aciertos)/sizeof(int);
  while(i<j) {
    aciertos[i]=0;
    i++;
  }

  i=0;
  j=0;
  longitudes[0]=0;
  while(i<sizeof(search)) {
    if(search[i]==separador) {
      longitudes[j]=i;
      j++;
    }
    i++;
  }

  j=0;
  unsigned char lea[2];
  while(fread(lea, sizeof(char), 1, stdin)>0) {
    i=0;
    j=0;
    k=1;
    while(j< (sizeof(longitudes)/sizeof(int))) {
      if(lea[0] != search[longitudes[j]+1+aciertos[j]]) {
	aciertos[j]=0;
      }
      if(lea[0] == search[longitudes[j]+1+aciertos[j]]) {
	aciertos[j]=aciertos[j]+1;
	k=0;
	if(aciertos[j]==longitudes[j+1]-1-longitudes[j]) {
	  k=2;
	  if(l>aciertos[j]) {
	    printf("%ld", l-aciertos[j]);
	  } else printf("0");
	  break;
	}
      }
      j=j+1;
    }
    if(k==2) {
      break;
    }
    l=l+1;
  }
  return  0;
}