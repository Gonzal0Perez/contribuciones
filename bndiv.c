/*

Big number library - arithmetic on multiple-precision unsigned integers.

This library is an implementation of arithmetic on arbitrarily large integers.

The difference between this and other implementations, is that the data structure
has optimal memory utilization (i.e. a 1024 bit integer takes up 128 bytes RAM),
and all memory is allocated statically: no dynamic allocation for better or worse.

Primary goals are correctness, clarity of code and clean, portable implementation.
Secondary goal is a memory footprint small enough to make it suitable for use in
embedded applications.


The current state is correct functionality and adequate performance.
There may well be room for performance-optimizations and improvements.

*/

#include <stdio.h>
//#include <stdbool.h>
//#include <assert.h>
#include <stdint.h>
#include <strings.h>
#include <string.h>
#include <stdlib.h>
       #include <sys/types.h>
       #include <sys/stat.h>
       #include <fcntl.h>
       #include <unistd.h>

//#include "bn.h"
#define DTYPE                    uint32_t
#define DTYPE_TMP                uint32_t

#ifndef WORD_SIZE
#define WORD_SIZE 4
#endif

  /* sprintf format string */
  #define SPRINTF_FORMAT_STR       "%02x"
  #define SSCANF_FORMAT_STR        "%0x"
  #define MAX_VAL                  ((DTYPE_TMP)0xFFFFFFFF)

/* Size of big-numbers in bytes */
#define BN_ARRAY_SIZE    (2048 / WORD_SIZE)
enum { SMALLER = -1, EQUAL = 0, LARGER = 1 };

/* Data-holding structure: array of DTYPEs */
struct bn {
  //DTYPE array[BN_ARRAY_SIZE];
  DTYPE *array;
};

/* Functions for shifting number in-place. */
static void _lshift_one_bit(struct bn* a);
static void _rshift_one_bit(struct bn* a);
static void _lshift_word(struct bn* a, int nwords);
static void _rshift_word(struct bn* a, int nwords);

/* Public / Exported functions. */
void bignum_init(struct bn* n) {
 //require(n, "n is null");
  int i;
  i=0;
  n->array=calloc(BN_ARRAY_SIZE, sizeof(DTYPE));
  while(i < BN_ARRAY_SIZE) {
    n->array[i] = 0;
    i++;
  }
}


void bignum_assign(struct bn* dst, struct bn* src) {
 //require(dst, "dst is null");
 //require(src, "src is null");
  int i;
  for (i = 0; i < BN_ARRAY_SIZE; ++i) {
    dst->array[i] = src->array[i];
  }
}


void bignum_from_int(struct bn* n, DTYPE_TMP i) {
 //require(n, "n is null");
  bignum_init(n);
  /* Endianness issue if machine is not little-endian? */
#ifdef WORD_SIZE
 #if (WORD_SIZE == 1)
  n->array[0] = (i & 0x000000ff);
  n->array[1] = (i & 0x0000ff00) >> 8;
  n->array[2] = (i & 0x00ff0000) >> 16;
  n->array[3] = (i & 0xff000000) >> 24;
 #elif (WORD_SIZE == 2)
  n->array[0] = (i & 0x0000ffff);
  n->array[1] = (i & 0xffff0000) >> 16;
 #elif (WORD_SIZE == 4)
  n->array[0] = i;
  DTYPE_TMP num_32 = 32;
  DTYPE_TMP tmp = i >> num_32; /* bit-shift with U64 operands to force 64-bit results */
  //  n->array[1] = tmp;
 #endif
#endif
}


int bignum_to_int(struct bn* n) {
 //require(n, "n is null");
  int ret = 0;
  /* Endianness issue if machine is not little-endian? */
#if (WORD_SIZE == 1)
  ret += n->array[0];
  ret += n->array[1] << 8;
  ret += n->array[2] << 16;
  ret += n->array[3] << 24;  
#elif (WORD_SIZE == 2)
  ret += n->array[0];
  ret += n->array[1] << 16;
#elif (WORD_SIZE == 4)
  ret += n->array[0];
#endif
  return ret;
}


void bignum_from_string(struct bn* n, char* str, int nbytes) {
 //require(n, "n is null");
 //require(str, "str is null");
 //require(nbytes > 0, "nbytes must be positive");
 //require((nbytes & 1) == 0, "string format must be in hex -> equal number of bytes");
  bignum_init(n);
  char tmps[(2*WORD_SIZE)+1];
  DTYPE tmp;                        /* DTYPE is defined in bn.h - uint{8,16,32,64}_t */
  int i = nbytes;// - (2 * WORD_SIZE); /* index into string */
  int j = 0;                        /* index into array */

  /* reading last hex-byte "MSB" from string first -> big endian */
  /* MSB ~= most significant byte / block ? :) */
  //printf("\n---- %s %d %d ---------\n" , str, sizeof(n->array), nbytes);
  int ntmps, ntmps2;
  bzero(tmps, (2*WORD_SIZE)+1);
  int pasa=0;
  while (i > 0) {
    pasa=0;
    //printf("--------- %d %d ", i, j);
    tmp = 0;
    if(nbytes<8) ntmps=2*WORD_SIZE-1;
    else ntmps=2*WORD_SIZE;
    ntmps2=1;
    while(ntmps>=0 && ntmps2<=nbytes && (i-ntmps) >=0) {
      tmps[ntmps]=str[i-ntmps2];
      //printf("\n---- c %c n %d n2 %d i %d \n" , str[i-ntmps2], ntmps, ntmps2, i-ntmps2);
      ntmps--;
      ntmps2++;
      pasa=1;
    }
    //    if(ntmps>0)ntmps-=1;
    while(ntmps>=0) {
      tmps[ntmps]='0';
      ntmps--;
    }
    if(pasa>0) {
      sscanf(tmps, "%08x", &tmp);
      //printf("\n c1 %c c2 %c s %s d %d x %x \n", str[i-1], str[i], tmps, tmp, tmp);
      n->array[j] = tmp;
      j=j+1;               /* step one element forward in the array. */
    }
    i=i-(2*WORD_SIZE);// -= (2 * WORD_SIZE); /* step WORD_SIZE hex-byte(s) back in the string. */
    //    printf(":: %d \n", i);
  }
  if(i<0) {
    i=i+(2*WORD_SIZE);
    ntmps=(2*WORD_SIZE);
    bzero(tmps, (2*WORD_SIZE)+1);
    while(i>=0) {
      tmps[ntmps]=str[i];
      //printf("\n---- c %c n %d n2 %d \n" , tmps[ntmps], ntmps);
      ntmps--;
      i--;
    }
    while(ntmps>=0) {
      tmps[ntmps]='0';
      ntmps--;
    }      
    sscanf(tmps, "%08x", &tmp);
    //printf("\n c1 %c c2 %c s %s d %d x %x \n", str[i-1], str[i], tmps, tmp, tmp);
    n->array[j] = tmp;
  }
  //printf("--------- %d %d /n", i, j);
}




void bignum_to_string(struct bn* n, char* str, int nbytes)
{
  int j = BN_ARRAY_SIZE; /* index into array - reading "MSB" first -> big-endian */
  int jj=0;
  int i = 0;                 /* index into string representation. */

  /* reading last array-element "MSB" first -> big endian */
  while(n->array[j]==0) {
    j--;
  }
  while ((j >= 0) && j>=jj) { //&& (nbytes > (i + 1))) {
    sprintf(&str[i], "%08x", n->array[j]);
    //    printf("%08x(%d.%d) \n", n->array[j], j, i);
    i+=(2*WORD_SIZE);//= (2 * WORD_SIZE); /* step WORD_SIZE hex-byte(s) forward in the string. */
    j -= 1;               /* step one element back in the array. */
  }
  /* Count leading zeros: */
  //printf(" << >");
  j = 0;
  while (str[j] == '0' && j<=nbytes) {
    //    printf("\n<< %c %d/%d >>", str[j], j, strlen(str)); 
    j += 1;
  }
   
  // Move string j places ahead, effectively skipping leading zeros 
  if(j>0){
    i=0;
    while(i<nbytes){
      str[i] = str[i + j];
      i++;
    }
  }
  // Zero-terminate string 
  //printf(" <<%d %d>", i, j);
  
  str[i] = 0;
}


int bignum_is_zero(struct bn* n) {
 //require(n, "n is null");
  int i;
  for (i = 0; i < BN_ARRAY_SIZE; ++i) {
    if (n->array[i]) {
      return 0;
    }
  }
  return 1;
}



void bignum_dec(struct bn* n) {
 //require(n, "n is null");
  DTYPE tmp; /* copy of n */
  DTYPE res;

  int i;
  for (i = 0; i < BN_ARRAY_SIZE; ++i) {
    tmp = n->array[i];
    res = tmp - 1;
    n->array[i] = res;
    if (!(res > tmp)) {
      break;
    }
  }
}


void bignum_inc(struct bn* n) {
 //require(n, "n is null");
  DTYPE res;
  DTYPE_TMP tmp; /* copy of n */
  int i;
  for (i = 0; i < BN_ARRAY_SIZE; ++i) {
    tmp = n->array[i];
    res = tmp + 1;
    n->array[i] = res;

    if (res > tmp) {
      break;
    }
  }
}



void bignum_and(struct bn* a, struct bn* b, struct bn* c) {
 //require(a, "a is null");
 //require(b, "b is null");
 //require(c, "c is null");

  int i;
  for (i = 0; i < BN_ARRAY_SIZE; ++i) {
    c->array[i] = (a->array[i] & b->array[i]);
  }
}


void bignum_or(struct bn* a, struct bn* b, struct bn* c) {
 //require(a, "a is null");
 //require(b, "b is null");
 //require(c, "c is null");

  int i;
  for (i = 0; i < BN_ARRAY_SIZE; ++i) {
    c->array[i] = (a->array[i] | b->array[i]);
  }
}


void bignum_xor(struct bn* a, struct bn* b, struct bn* c) {
 //require(a, "a is null");
 //require(b, "b is null");
 //require(c, "c is null");

  int i;
  for (i = 0; i < BN_ARRAY_SIZE; ++i) {
    c->array[i] = (a->array[i] ^ b->array[i]);
  }
}


int bignum_cmp(struct bn* a, struct bn* b) {
 //require(a, "a is null");
 //require(b, "b is null");

  int i = BN_ARRAY_SIZE-1;
  while(a->array[i] < 1 && b->array[i]<1) {
    i--;
  }
  do {
    //i -= 1; /* Decrement first, to start with last array element */
    if (a->array[i] > b->array[i]) {
      return LARGER;
    } else if (a->array[i] < b->array[i]) {
      return SMALLER;
    }
    i--;
  }  while (i > 0 /*!= 0*/ );
  return EQUAL;
}


void bignum_add(struct bn* a, struct bn* b, struct bn* c) {
 //require(a, "a is null");
 //require(b, "b is null");
 //require(c, "c is null");
  DTYPE_TMP tmp;
  int carry = 0;
  int i;
  char buf[100];
  bzero(buf, sizeof(buf));
  bignum_to_string(a, buf, sizeof(buf));
  printf("\n A %s ", buf, strlen(buf));

  bzero(buf, sizeof(buf));
  bignum_to_string(b, buf, sizeof(buf));
  printf("\n B %s ", buf, strlen(buf));

  bignum_init(c);
  
  //for (i = BN_ARRAY_SIZE-1; i>=0; --i) {
  i=0;
  while(a->array[i]<1 && b->array[i]<1) i++;
  while(i<BN_ARRAY_SIZE) {
    //  for (i = 0; i < BN_ARRAY_SIZE; ++i) {
    tmp = (DTYPE_TMP)a->array[i] + b->array[i] + carry;
    carry = (tmp > MAX_VAL);
    c->array[i] = (tmp & MAX_VAL);
    i++;
  }
  bzero(buf, sizeof(buf));
  bignum_to_string(c, buf, sizeof(buf));
  printf("\n C %s ", buf, strlen(buf));

}


void bignum_sub(struct bn* a, struct bn* b, struct bn* c) {
 //require(a, "a is null");
 //require(b, "b is null");
 //require(c, "c is null");

  DTYPE_TMP res;
  DTYPE_TMP tmp1;
  DTYPE_TMP tmp2;
  int borrow = 0;
  int i;
  int ii=BN_ARRAY_SIZE-1;
  i=0;
  while(a->array[ii]<1) {
    ii--;
  }
  while(i < BN_ARRAY_SIZE && i<ii) {
  // for (i = 0; i < BN_ARRAY_SIZE; ++i) {
  // for (i = BN_ARRAY_SIZE-1; i>=0; --i) {
    tmp1 = (DTYPE_TMP)a->array[i] + (MAX_VAL + 1); /* + number_base */
    tmp2 = (DTYPE_TMP)b->array[i] + borrow;;
    borrow=0;
    res = (tmp1 - tmp2);
    printf("A %x B %x a %d b %d i %d bo %d \n", a->array[i], b->array[i], tmp1, tmp2, i, borrow);
    c->array[i] = (DTYPE)(res & MAX_VAL); /* "modulo number_base" == "% (number_base - 1)" if number_base is 2^N */
    borrow = (res <= MAX_VAL);
    i++;
  }
}


void bignum_mul(struct bn* a, struct bn* b, struct bn* c) {
 //require(a, "a is null");
 //require(b, "b is null");
 //require(c, "c is null");

  struct bn row;
  struct bn bnmtmp;
  int i, j;

  bignum_init(c);

  for (i = 0; i < BN_ARRAY_SIZE; ++i) {
    bignum_init(&row);

    for (j = 0; j < BN_ARRAY_SIZE; ++j) {
      if (i + j < BN_ARRAY_SIZE) {
        bignum_init(&bnmtmp);
        DTYPE_TMP intermediate = ((DTYPE_TMP)a->array[i] * (DTYPE_TMP)b->array[j]);
        bignum_from_int(&bnmtmp, intermediate);
        _lshift_word(&bnmtmp, i + j);
        bignum_add(&bnmtmp, &row, &row);
      }
    }
    printf("> ");
    bignum_add(c, &row, c);
  }
}


void bignum_div(struct bn* a, struct bn* b, struct bn* c) {
  //require(a, "a is null");
  //require(b, "b is null");
  //require(c, "c is null");
  struct bn current;
  struct bn denom;
  struct bn tmp;
  char buf[100];
  bignum_init(&current);
  bignum_init(&denom);
  bignum_init(&tmp);
  bignum_from_int(&current, 1);               // int current = 1;
  printf("F");

  bignum_assign(&denom, b);                   // denom = b
  bignum_assign(&tmp, a);                     // tmp   = a

  const DTYPE_TMP half_max = 1 + (DTYPE_TMP)(MAX_VAL / 2);
  int overflow = 0;
  
  while (bignum_cmp(&denom, a) != LARGER) {    // while (denom <= a) {
    if (denom.array[BN_ARRAY_SIZE -1 ] >= half_max) {
      overflow = 1;
      printf("!!!");
      break;
    }
    _lshift_one_bit(&current);                //   current <<= 1;
    _lshift_one_bit(&denom);                  //   denom <<= 1;


  }
  
  if (!overflow) {
    _rshift_one_bit(&denom);                  // denom >>= 1;
    _rshift_one_bit(&current);                // current >>= 1;
  }
  printf("<");
  bignum_init(c);                             // int answer = 0;

  while (!bignum_is_zero(&current)) {          // while (current != 0)
    printf(">");
    if (bignum_cmp(&tmp, &denom) != SMALLER) { //   if (dividend >= denom)
      bignum_sub(&tmp, &denom, &tmp);         //     dividend -= denom;
      bignum_or(c, &current, c);              //     answer |= current;
    }
    _rshift_one_bit(&current);                //   current >>= 1;
    _rshift_one_bit(&denom);                  //   denom >>= 1;

    
    /*
    bignum_to_string(&tmp, buf, sizeof(buf));
    printf("\n < D %s %d > ", buf, strlen(buf));      
    */
  printf("d ");
  }                                           // return answer;
}


void bignum_lshift(struct bn* a, struct bn* b, int nbits)
{
 //require(a, "a is null");
 //require(b, "b is null");
 //require(nbits >= 0, "no negative shifts");

  bignum_assign(b, a);
  /* Handle shift in multiples of word-size */
  const int nbits_pr_word = (WORD_SIZE * 8);
  int nwords = nbits / nbits_pr_word;
  if (nwords != 0)
  {
    _lshift_word(b, nwords);
    nbits -= (nwords * nbits_pr_word);
  }

  if (nbits != 0)
  {
    int i;
    for (i = (BN_ARRAY_SIZE - 1); i >= 0; --i)
    {
      b->array[i] = (b->array[i] << nbits) | (b->array[i - 1] >> ((8 * WORD_SIZE) - nbits));
    }
    b->array[i] <<= nbits;
  }
}


void bignum_rshift(struct bn* a, struct bn* b, int nbits)
{
 //require(a, "a is null");
 //require(b, "b is null");
 //require(nbits >= 0, "no negative shifts");
  
  bignum_assign(b, a);
  /* Handle shift in multiples of word-size */
  const int nbits_pr_word = (WORD_SIZE * 8);
  int nwords = nbits / nbits_pr_word;
  if (nwords != 0)
  {
    _rshift_word(b, nwords);
    nbits -= (nwords * nbits_pr_word);
  }

  if (nbits != 0)
  {
    int i;
    for (i = 0; i < (BN_ARRAY_SIZE - 1); ++i)
    {
      b->array[i] = (b->array[i] >> nbits) | (b->array[i + 1] << ((8 * WORD_SIZE) - nbits));
    }
    b->array[i] >>= nbits;
  }
  
}

void bignum_divmod(struct bn* a, struct bn* b, struct bn* c, struct bn* d)
{
  /*
    Puts a%b in d
    and a/b in c

    mod(a,b) = a - ((a / b) * b)

    example:
      mod(8, 3) = 8 - ((8 / 3) * 3) = 2
  */
 //require(a, "a is null");
 //require(b, "b is null");
 //require(c, "c is null");

  struct bn tmp;

  /* c = (a / b) */
  bignum_div(a, b, c);

  /* tmp = (c * b) */
  bignum_mul(c, b, &tmp);

  /* c = a - tmp */
  bignum_sub(a, &tmp, d);
}



void bignum_mod(struct bn* a, struct bn* b, struct bn* c)
{
  /*
    Take divmod and throw away div part
  */
 //require(a, "a is null");
 //require(b, "b is null");
 //require(c, "c is null");

  struct bn tmp;

  bignum_divmod(a,b,&tmp,c);
}


/*
void bignum_pow(struct bn* a, struct bn* b, struct bn* c)
{
 //require(a, "a is null");
 //require(b, "b is null");
 //require(c, "c is null");

  struct bn tmp;

  bignum_init(c);

  if (bignum_cmp(b, c) == EQUAL)
  {
    // Return 1 when exponent is 0 -- n^0 = 1
    bignum_inc(c);
  } else {
    // Copy a -> tmp 
    bignum_assign(&tmp, a);

    bignum_dec(b);
 
    // Begin summing products: 
    while (!bignum_is_zero(b))
    {

      // c = tmp * tmp 
      bignum_mul(&tmp, a, c);
      // Decrement b by one 
      bignum_dec(b);

      bignum_assign(&tmp, c);
    }

    // c = tmp 
    bignum_assign(c, &tmp);
  }
}
*/

void bignum_isqrt(struct bn *a, struct bn* b)
{
 //require(a, "a is null");
 //require(b, "b is null");

  struct bn low, high, mid, tmp;

  bignum_init(&low);
  bignum_assign(&high, a);
  bignum_rshift(&high, &mid, 1);
  bignum_inc(&mid);

  while (bignum_cmp(&high, &low) > 0) 
  {
    bignum_mul(&mid, &mid, &tmp);
    if (bignum_cmp(&tmp, a) > 0) 
    {
      bignum_assign(&high, &mid);
      bignum_dec(&high);
    }
    else 
    {
      bignum_assign(&low, &mid);
    }
    bignum_sub(&high,&low,&mid);
    _rshift_one_bit(&mid);
    bignum_add(&low,&mid,&mid);
    bignum_inc(&mid);
  }
  bignum_assign(b,&low);
}


/* Private / Static functions. */

static void _rshift_word(struct bn* a, int nwords)
{
  // Naive method: 
 //require(a, "a is null");
 //require(nwords >= 0, "no negative shifts");

  int i;
  if (nwords >= BN_ARRAY_SIZE)
  {
    for (i = 0; i < BN_ARRAY_SIZE; ++i)
    {
      a->array[i] = 0;
    }
    return;
  }

  for (i = 0; i < BN_ARRAY_SIZE - nwords; ++i)
  {
    a->array[i] = a->array[i + nwords];
  }
  for (; i < BN_ARRAY_SIZE; ++i)
  {
    a->array[i] = 0;
  }
}

static void _lshift_word(struct bn* a, int nwords)
{
 //require(a, "a is null");
 //require(nwords >= 0, "no negative shifts");

  int i;
  /* Shift whole words */
  for (i = (BN_ARRAY_SIZE - 1); i >= nwords; --i)
  {
    a->array[i] = a->array[i - nwords];
  }
  /* Zero pad shifted words. */
  for (; i >= 0; --i)
  {
    a->array[i] = 0;
  }  
}


static void _lshift_one_bit(struct bn* a) {
  //require(a, "a is null");
  int i;
  for (i = (BN_ARRAY_SIZE - 1); i > 0; --i) {
    a->array[i] = (a->array[i] << 1) | (a->array[i - 1] >> ((8 * WORD_SIZE) - 1));
  }
  a->array[0] <<= 1;
}


static void _rshift_one_bit(struct bn* a) {
 //require(a, "a is null");
  int i;
  for (i = 0; i < (BN_ARRAY_SIZE ); ++i) {
    a->array[i] = (a->array[i] >> 1) | (a->array[i + 1] << ((8 * WORD_SIZE) - 1));
  }
  a->array[BN_ARRAY_SIZE - 1] >>= 1;
}



void factorial(struct bn* nfac, struct bn* res)
{
  struct bn Atmp;
  char buf[BN_ARRAY_SIZE+1];
  /* Copy n -> tmp */
  printf("\n.....");
  bignum_init(&Atmp);
  Atmp.array[BN_ARRAY_SIZE]=0;
  Atmp.array[0]=0;
  bignum_assign(&Atmp, nfac);
  
  /* Decrement n by one */
  bignum_dec(nfac);
  
  int c=0;
  //Begin summing products: 
  while (!bignum_is_zero(nfac)) {    
    printf(". %d", c);
    bzero(buf, sizeof(buf));
    bignum_to_string(nfac, buf, 10 );
    printf("\n %s %d  fac -_-_-_-_", buf, strlen(buf));
   // res = tmp * n 
    bignum_mul(&Atmp, nfac, res);
    // n -= 1
    bignum_dec(nfac);
    // tmp = res 
    bignum_assign(&Atmp, res);
    c++;
  }
  // res = tmp 
  
  bignum_assign(res, &Atmp);
}





int main() {
  FILE *f = fopen("/dev/urandom", "r");
  printf(" Abierto");
  int buff[128];
  int bff[2];
  bzero(bff, 2);
  struct bn Anum;
  struct bn Bnum;
  struct bn numero;
  struct bn resulta;
  struct bn resultb;
  char buffs[2049];
  char buff8[9];
  char bufffs[2048];
  bzero(buffs, 2048 );
  bzero(bufffs, 2048 );
  bzero(buff8, 9 );
  char buf[8192];
  //  bignum_from_string(&Anum, "50", 3);
  
  bignum_init(&Anum);
  bignum_from_string(&Anum,"1000", 4);
  //  bignum_from_int(&Anum, 65535);
  bzero(buf, sizeof(buf));
  bignum_to_string(&Anum, buf, sizeof(buf));
  printf("\n A %s ", buf, strlen(buf));
  
  bignum_init(&Bnum);
  bignum_from_string(&Bnum, "fffffffff", 9 );
  bzero(buf, sizeof(buf));
  bignum_to_string(&Bnum, buf, sizeof(buf));  
  printf(" B %s %d -_-_-_-_", buf, strlen(buf));  
  
  bignum_init(&resulta);
  bignum_sub(&Bnum, &Anum, &resulta);
  bignum_to_string(&resulta, buf, sizeof(buf));
  printf("\n RESTA %s %d  -=-=-=-=-=-=-=-=-", buf, strlen(buf));
  
  bignum_add(&Bnum, &Anum, &resulta);
  bignum_to_string(&resulta, buf, sizeof(buf));
  printf("\n SUMA %s %d  -=-=-=-=-=-=-=-=-", buf, strlen(buf));
  
  bignum_init(&resulta);
  bignum_div(&Bnum, &Anum, &resulta);
  bignum_to_string(&resulta, buf, sizeof(buf));
  printf("\n DIV %s %d  -=-=-=-=-=-=-=-=-", buf, strlen(buf));
  
  //  factorial(&Anum, &resulta);
  // bignum_to_string(&resulta, buf, sizeof(buf));
  // printf("\n %s %d  -=-=-=-=-=-=-=-=-", buf, strlen(buf));
  /*
  bignum_to_string(&resulta, bufffs, sizeof(numero.array));
  bignum_to_string(&resulta, buf, sizeof(buf));
  printf("\nfactorial(100) using bignum = %s\n", buf);
  */
  /*    
  printf(" leyendo dev");
  int n=0;
  while (n<128) {
    fread( bff, sizeof(int),1, f);
    buff[n]=bff[0];
    bzero(bff, 2);
    n++;
  }
  fclose(f);
  bzero(buffs, 2048 );
  bzero(bufffs, 2048 );
  bzero(buff8, 9 );
  n=0;
  int nn=0;
  while(n<=128) {
    sprintf(buff8, "%.08x", buff[n]);
    //    printf("%.08x ", buff[n]);
    nn=0;
    while(buff8[nn]!=0) {
      buffs[(n*8)+nn]= buff8[nn];
      nn++;
    }
    //    printf("\n %.08x (%d) %s", buff[n], n, buffs);
    n++;
  }
  printf(" ____________ %s %d %d", buffs, strlen(buffs), n);
  bignum_from_string(&numero, buffs, strlen(buffs));
  //  _lshift_word(&numero, 2);
  bignum_to_string(&numero, bufffs, sizeof(numero.array));
  printf("\n %s %d  -----------", bufffs, strlen(bufffs));*/
}
