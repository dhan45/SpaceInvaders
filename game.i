# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "myLib.h" 1



typedef unsigned short u16;
# 40 "myLib.h"
extern unsigned short *videoBuffer;

extern unsigned short *frontBuffer;
extern unsigned short *backBuffer;



void loadPalette(const unsigned short* palette);
void initialize();

void waitForVblank();
void flipPage();
# 72 "myLib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 82 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile void* destination, unsigned int control);






typedef volatile struct
{
        volatile const void *src;
        volatile void *dst;
        volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 208 "myLib.h"
typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 265 "myLib.h"
typedef struct{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
}OBJ_ATTR;

typedef struct {
    int row;
    int col;
} Sprite;
# 2 "game.c" 2
# 1 "main.h" 1
void goToSplash();
void updateSplash();
void goToGame();
void updateGame();
void goToPause();
void updatePause();
void goToLose();
void updateLose();
void goToWin();
void updateWin();
void hideSprites();
void delay(int i);

typedef struct
{
 int row;
 int col;
    int rdel;
    int cdel;
 int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int currFrame;
} MOVOBJ;
# 3 "game.c" 2
# 1 "game.h" 1
typedef struct
{
 int height;
 int width;
 int row;
 int col;
 int rd;
 int cd;
 int points;
 int front;
 int life;
 int active;
} CHARACTER;

typedef struct
{
 int height;
 int width;
 int row;
 int col;
 int rd;
 int cd;
 int active;
} BULLET;

void update();
void initGame();
void updatePlayer();
void playerShoot();
void updateBullet(BULLET* b);
char collision(BULLET* b, CHARACTER* c);
void updateAliens();
void updateAlienAtk();
void alienShoot();
void updateAlienBullet(BULLET* b);
int getScore();
void pixelateAliens();
void pixelatePlayer();
void pixelateAlienBullet();
void pixelatePlayerBullet();
void pixelateScore(int score);
void pixelateLife(int life);
void pixelate();
# 4 "game.c" 2
# 1 "splash.h" 1
# 22 "splash.h"
extern const unsigned short splashTiles[5376];


extern const unsigned short splashMap[1024];


extern const unsigned short splashPal[256];
# 5 "game.c" 2
# 1 "bg.h" 1
# 22 "bg.h"
extern const unsigned short bgTiles[400];


extern const unsigned short bgMap[1024];


extern const unsigned short bgPal[256];
# 6 "game.c" 2
# 1 "spaceSprites1.h" 1
# 21 "spaceSprites1.h"
extern const unsigned short spaceSprites1Tiles[2400];


extern const unsigned short spaceSprites1Pal[256];
# 7 "game.c" 2
# 1 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 1 3
# 10 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 3
# 1 "/opt/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 11 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 15 "/opt/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "/opt/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 16 "/opt/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/opt/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/opt/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/opt/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 1 "/opt/devkitARM/arm-none-eabi/include/sys/features.h" 1 3
# 6 "/opt/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 17 "/opt/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 12 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 2 3




# 1 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 1 3 4
# 216 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 3 4

# 216 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 328 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 17 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 2 3

# 1 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 1 3
# 13 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "/opt/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 14 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 1 3 4
# 149 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 15 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitARM/arm-none-eabi/include/sys/_types.h" 1 3
# 12 "/opt/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/opt/devkitARM/arm-none-eabi/include/machine/_types.h" 1 3






# 1 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3
# 27 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 41 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 63 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 89 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 120 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 146 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 168 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 186 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 200 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 8 "/opt/devkitARM/arm-none-eabi/include/machine/_types.h" 2 3
# 13 "/opt/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3
# 1 "/opt/devkitARM/arm-none-eabi/include/sys/lock.h" 1 3




# 1 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stdint.h" 3 4
# 1 "/opt/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 13 "/opt/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 14 "/opt/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int8_t int8_t ;
typedef __uint8_t uint8_t ;




typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int16_t int16_t ;
typedef __uint16_t uint16_t ;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int32_t int32_t ;
typedef __uint32_t uint32_t ;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int64_t int64_t ;
typedef __uint64_t uint64_t ;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 74 "/opt/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 84 "/opt/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 94 "/opt/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 104 "/opt/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 153 "/opt/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int intmax_t;
# 162 "/opt/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long unsigned int uintmax_t;






typedef __intptr_t intptr_t;
typedef __uintptr_t uintptr_t;
# 10 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stdint.h" 2 3 4
# 6 "/opt/devkitARM/arm-none-eabi/include/sys/lock.h" 2 3

typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

extern void __libc_lock_init(_LOCK_T *lock);
extern void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_close(_LOCK_T *lock);
extern void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);
# 14 "/opt/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3


typedef long _off_t;



typedef int __dev_t;



typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



__extension__ typedef long long _off64_t;







typedef long _fpos_t;
# 55 "/opt/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef signed int _ssize_t;
# 67 "/opt/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 1 3 4
# 357 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 68 "/opt/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;
# 16 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 38 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 91 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 115 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 179 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (* _read) (struct _reent *, void *, char *, int)
                                          ;
  int (* _write) (struct _reent *, void *, const char *, int)

                                   ;
  _fpos_t (* _seek) (struct _reent *, void *, _fpos_t, int);
  int (* _close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 285 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 317 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 569 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];

  int _current_category;
  const char *_current_locale;

  int __sdidinit;

  void (* __cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;



  struct _atexit *_atexit;
  struct _atexit _atexit0;



  void (**(_sig_func))(int);




  struct _glue __sglue;
  __FILE __sf[3];
};
# 762 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);





  struct _reent * __getreent (void);
# 19 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 45 "/opt/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 1 3 4
# 46 "/opt/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3
# 20 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitARM/arm-none-eabi/include/machine/stdlib.h" 1 3
# 21 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 29 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;




typedef struct
{
  long long int quot;
  long long int rem;
} lldiv_t;




typedef int (*__compar_fn_t) (const void *, const void *);







int __locale_mb_cur_max (void);



void abort (void) __attribute__ ((__noreturn__));
int abs (int);
int atexit (void (*__func)(void));
double atof (const char *__nptr);



int atoi (const char *__nptr);
int _atoi_r (struct _reent *, const char *__nptr);
long atol (const char *__nptr);
long _atol_r (struct _reent *, const char *__nptr);
void * bsearch (const void * __key, const void * __base, size_t __nmemb, size_t __size, __compar_fn_t _compar)



                                ;
void * calloc (size_t __nmemb, size_t __size) ;
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((__noreturn__));
void free (void *) ;
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);
char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);




long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void * malloc (size_t __size) ;
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *restrict, const char *restrict, size_t);
int _mbtowc_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *restrict, const char *restrict, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
size_t wcstombs (char *restrict, const wchar_t *restrict, size_t);
size_t _wcstombs_r (struct _reent *, char *restrict, const wchar_t *restrict, size_t, _mbstate_t *);
# 124 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 3
void qsort (void * __base, size_t __nmemb, size_t __size, __compar_fn_t _compar);
int rand (void);
void * realloc (void * __r, size_t __size) ;




void srand (unsigned __seed);
double strtod (const char *restrict __n, char **restrict __end_PTR);
double _strtod_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR);



float strtof (const char *restrict __n, char **restrict __end_PTR);







long strtol (const char *restrict __n, char **restrict __end_PTR, int __base);
long _strtol_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long strtoul (const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);

int system (const char *__string);
# 161 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 3
void _Exit (int __status) __attribute__ ((__noreturn__));
# 180 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * __itoa (int, char *, int);
char * __utoa (unsigned, char *, int);
# 211 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 3
long long atoll (const char *__nptr);







long long llabs (long long);
lldiv_t lldiv (long long __numer, long long __denom);
long long strtoll (const char *restrict __n, char **restrict __end_PTR, int __base);







unsigned long long strtoull (const char *restrict __n, char **restrict __end_PTR, int __base);
# 246 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t) ;
void * _calloc_r (struct _reent *, size_t, size_t) ;
void _free_r (struct _reent *, void *) ;
void * _realloc_r (struct _reent *, void *, size_t) ;
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);
# 279 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 3
extern long double strtold (const char *restrict, char **restrict);




# 8 "game.c" 2


# 9 "game.c"
CHARACTER player;
CHARACTER alien[50];
CHARACTER bonus;
BULLET pBullet[2];
BULLET aBullet[5];
int alienLength = sizeof(alien)/sizeof(alien[0]);
int bulletLength = sizeof(pBullet)/sizeof(pBullet[0]);
int alienBulletLength = sizeof(aBullet)/sizeof(aBullet[0]);

OBJ_ATTR shadowOAM[128];
enum {HIGH = 10, MID = 20, LOW = 40, BONUS_ALIEN = 61, PLAYER1 = 62, PLAYERBULLETS = 63, ALIENBULLETS = 65};

int flip = 0;
int counter;
int drop = 0;
int aliensRemaining;

int score = 0;

void initGame()
{
 *(unsigned short *)0x4000000 = 0 | (1<<8) | (1 << 12);
    *(volatile unsigned short*)0x4000008 = 0 << 2 | 31 << 8 | 0<<14;


 loadPalette(bgPal);
    DMANow(3, bgTiles, &((charblock *)0x6000000)[0], 800/2);
    DMANow(3, bgMap, &((screenblock *)0x6000000)[31], 2048/2);

    aliensRemaining = 50;
    srand(counter++);


    player.height = 8;
    player.width = 13;
    player.row = 160 - player.height;
    player.col = 240/2 - player.width/2;
    player.rd = 0;
    player.cd = 0;
    player.life = 3;
    player.active = 1;


    int center = 240/2 - 16*5;
    for (int i = 0; i < 10; i++) {
     alien[i].height = 8;
     alien[i].width = 8;
     alien[i].row = 24;
     alien[i].col = center+4+16*(i%10);
     alien[i].rd = 4;
     alien[i].cd = 1;
     alien[i].points = 40;
     alien[i].front = 0;
     alien[i].active = 1;
    }
    for (int i = 0; i < 20; i++) {
     alien[10 + i].height = 8;
     alien[10 + i].width = 11;
     alien[10 + i].row = 40 + 16*(i/10);
     alien[10 + i].col = center+2+16*(i%10);
     alien[10 + i].rd = 4;
     alien[10 + i].cd = 1;
     alien[10 + i].points = 20;
     alien[10 + i].front = 0;
     alien[10 + i].active = 1;
    }
    for (int i = 0; i < 20; i++) {
     alien[30 + i].height = 8;
     alien[30 + i].width = 12;
     alien[30 + i].row = 72 + 16*(i/10);
     alien[30 + i].col = center+2+16*(i%10);
     alien[30 + i].rd = 4;
     alien[30 + i].cd = 1;
     alien[30 + i].points = 10;
     alien[30 + i].front = 1*(i/10);
     alien[30 + i].active = 1;
    }


    bonus.height = 8;
    bonus.width = 16;
    bonus.row = 16;
    bonus.col = 200 - bonus.width;
    bonus.rd = 0;
    bonus.cd = -1;
    bonus.points = 240;
    bonus.life = 1;
    bonus.active = 0;


    for (int i = 0; i < bulletLength; i++) {
     pBullet[i].height = 4;
     pBullet[i].width = 1;
     pBullet[i].rd = -2;
     pBullet[i].cd = 0;
     pBullet[i].active = 0;
 }


 for (int i = 0; i < alienBulletLength; i++) {
     aBullet[i].height = 7;
     aBullet[i].width = 3;
     aBullet[i].rd = 2;
     aBullet[i].cd = 0;
     aBullet[i].active = 0;
 }
}

void update()
{
 counter++;
 updatePlayer();
 for (int i = 0; i < bulletLength; i++) {
  updateBullet(&pBullet[i]);
 }
 updateAliens();
 updateAlienAtk();
 for (int i = 0; i < alienBulletLength; i++) {
  updateAlienBullet(&aBullet[i]);
 }
}

void updatePlayer()
{
 if (player.col <= 0) {
  player.cd = 0;
 }
 if (player.col >= 239) {
  player.cd = 0;
 } if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
  playerShoot();
 } else if((~(*(volatile unsigned int *)0x04000130) & ((1<<5)))) {
  player.cd = -1;
  player.col += player.cd;
 } else if ((~(*(volatile unsigned int *)0x04000130) & ((1<<4)))) {
  player.cd = 1;
  player.col += player.cd;
 }
}

void playerShoot()
{
 for (int i = 0; i < bulletLength; i++) {
  if (!pBullet[i].active) {
   pBullet[i].active = 1;
   pBullet[i].row = player.row;
   pBullet[i].col = player.col + (player.width/2);
   break;
  }
 }
}

void updateBullet(BULLET* b)
{
 if (b->active) {
  b->row += b->rd;
  if (collision(b, &bonus)) {
   bonus.active = 0;
   b->active = 0;
   score += bonus.points;
  }
  for (int i = 0; i < 50; i++) {
   if (alien[i].active) {
    if (collision(b, &alien[i])) {
     alien[i].active = 0;
     b->active = 0;
     aliensRemaining--;
     if (i < 10) {
      score += alien[i].points;
     } else if (i < 30) {
      score += alien[i].points;
     } else {
      score += alien[i].points;
     }

    }
   }
  }
  if (!aliensRemaining) {
   hideSprites1();
   goToWin();
  }

 }
 if (b->row < 0) {
  b->active = 0;
 }
}

char collision(BULLET* b, CHARACTER* c)
{
 if (c->active) {
  if (b->row <= c->row + c->height && b->row + b->height >= c->row
   && b->col + b->width >= c->col && b->col <= c->col + c->width) {
   return 1;
  }
 }
 return 0;
}

void updateAliens()
{
 if (counter % 40 == 0) {
  if (drop) {
   for (int i = 0; i < alienLength; i++) {
    if (alien[i].active) {
     alien[i].row += alien[i].rd;
     alien[i].cd *= -1;
    }
   }
   drop = 0;
   flip++;
  } else if (!drop) {
   for (int i = 0; i < alienLength; i++) {
    if (alien[i].active) {
     alien[i].col += alien[i].cd;
    }
   }
   for (int i = 0; i < alienLength; i++) {
    if (alien[i].active) {
     if (alien[i].col >= 240 - (alien[i].width + 1)|| alien[i].col <= 0 + 1) {
      drop = 1;
      break;
     }
    }
   }
   flip++;
  }
 }
 if (bonus.active == 0) {
  if (counter%((rand()%3 + 1) * 1000) == 0) {
   bonus.active = 1;
  }
 }
 if (bonus.active) {
  if (counter % 2 == 0) {
   bonus.col += bonus.cd;
   if (bonus.col >= 240 - bonus.width || bonus.col <= 0) {
    bonus.active = 0;
    bonus.cd *= -1;
   }
  }
 }
}

void updateAlienAtk()
{
 for (int i = 0; i < alienLength; i++) {
  if (alien[i].active == 0 && alien[i].front) {
   alien[i-10].front = 1;
   alien[i].front = 0;
  }
  if (alien[i].front) {
   if (!(rand() % 1234)) {
    alienShoot(&alien[i]);
   }
  }
 }
}

void alienShoot(CHARACTER* a)
{
 for (int i = 0; i < alienBulletLength; i++) {
  if (!aBullet[i].active) {
   aBullet[i].active = 1;
   aBullet[i].row = a->row + a->height - a->height;
   aBullet[i].col = a->col + (a->width/2) - 1;
   break;
  }
 }
}

void updateAlienBullet(BULLET* b)
{
 if (b->active) {
  b->row += b->rd;
  if (collision(b, &player)) {
   player.life -= 1;
   b->active = 0;
   if(!player.life) {
    hideSprites1();
    goToLose();
   }
  }
  if (b->row + b->height >= 160) {
   b->active = 0;
  }
 }
}

int getScore()
{
 return score;
}


void pixelateAliens()
{
 for (int i = 0; i < 10; i++) {
  if (alien[i].active) {
   if(flip % 2) {
    shadowOAM[HIGH + i].attr0 = alien[i].row | (1 << 14);
    shadowOAM[HIGH + i].attr1 = alien[i].col;
    shadowOAM[HIGH + i].attr2 = (0)*15+(10);
   } else {
    shadowOAM[HIGH + i].attr0 = alien[i].row | (1 << 14);
    shadowOAM[HIGH + i].attr1 = alien[i].col;
    shadowOAM[HIGH + i].attr2 = (0)*15+(12);
   }
  } else {
   shadowOAM[HIGH + i].attr0 = (2 << 8);
  }
 }
 for (int i = 0; i < 20; i++) {
  if (alien[10 + i].active) {
   if(flip % 2) {
    shadowOAM[MID + i].attr0 = alien[10 + i].row | (1 << 14);
    shadowOAM[MID + i].attr1 = alien[10 + i].col;
    shadowOAM[MID + i].attr2 = (0)*15+(6);
   } else {
    shadowOAM[MID + i].attr0 = alien[10 + i].row | (1 << 14);
    shadowOAM[MID + i].attr1 = alien[10 + i].col;
    shadowOAM[MID + i].attr2 = (0)*15+(8);
   }
  } else {
   shadowOAM[MID + i].attr0 = (2 << 8);
  }
 }
 for (int i = 0; i < 20; i++) {
  if (alien[30 + i].active) {
   if(flip % 2) {
    shadowOAM[LOW + i].attr0 = alien[30 + i].row | (1 << 14);
    shadowOAM[LOW + i].attr1 = alien[30 + i].col;
    shadowOAM[LOW + i].attr2 = (0)*15+(2);
   } else {
    shadowOAM[LOW + i].attr0 = alien[30 + i].row | (1 << 14);
    shadowOAM[LOW + i].attr1 = alien[30 + i].col;
    shadowOAM[LOW + i].attr2 = (0)*15+(4);
   }
  } else {
   shadowOAM[LOW + i].attr0 = (2 << 8);
  }
 }
 if (bonus.active) {
  shadowOAM[BONUS_ALIEN].attr0 = bonus.row | (1 << 14);
  shadowOAM[BONUS_ALIEN].attr1 = bonus.col;
  shadowOAM[BONUS_ALIEN].attr2 = (0)*15+(0);
 } else {
  shadowOAM[BONUS_ALIEN].attr0 = (2 << 8);
 }
}

void pixelatePlayer() {
 shadowOAM[PLAYER1].attr0 = player.row | (1 << 14);
 shadowOAM[PLAYER1].attr1 = player.col;
 shadowOAM[PLAYER1].attr2 = (2)*15+(3);
}

void pixelatePlayerBullet() {
 for (int i = 0; i < bulletLength; i++) {
  if (pBullet[i].active) {
   shadowOAM[PLAYERBULLETS + i].attr0 = pBullet[i].row;
   shadowOAM[PLAYERBULLETS + i].attr1 = pBullet[i].col;
   shadowOAM[PLAYERBULLETS + i].attr2 = (2)*15+(11);
  } else {
   shadowOAM[PLAYERBULLETS + i].attr0 = (2 << 8);
  }
 }
}

void pixelateAlienBullet() {
 for (int i = 0; i < alienBulletLength; i++) {
  if (aBullet[i].active) {
   if (!counter % 2) {
    shadowOAM[ALIENBULLETS + i].attr0 = aBullet[i].row;
    shadowOAM[ALIENBULLETS + i].attr1 = aBullet[i].col;
    shadowOAM[ALIENBULLETS + i].attr2 = (2)*15+(10);
   } else {
    shadowOAM[ALIENBULLETS + i].attr0 = aBullet[i].row;
    shadowOAM[ALIENBULLETS + i].attr1 = aBullet[i].col;
    shadowOAM[ALIENBULLETS + i].attr2 = (2)*15+(9);
   }
  } else {
   shadowOAM[ALIENBULLETS + i].attr0 = (2 << 8);
  }
 }
}

void pixelateScore(int score)
{
 if (score > 99) {
  shadowOAM[0].attr0 = 8;
  shadowOAM[0].attr1 = 24;
  shadowOAM[0].attr2 = (5)*15+(score/100);
 }
 if (score > 9) {
  shadowOAM[1].attr0 = 8;
  shadowOAM[1].attr1 = 30;
  shadowOAM[1].attr2 = (5)*15+((score%100)/10);
 }
 shadowOAM[2].attr0 = 8;
 shadowOAM[2].attr1 = 36;
 shadowOAM[2].attr2 = (5)*15+((score%10));
}

void pixelateLife(int life)
{
 shadowOAM[3].attr0 = 8 | (1 << 14);
 shadowOAM[3].attr1 = 160;
 shadowOAM[3].attr2 = (2)*15+(3);
 shadowOAM[4].attr0 = 8 | (1 << 14);
 shadowOAM[4].attr1 = 176;
 shadowOAM[4].attr2 = (2)*15+(3);
 shadowOAM[5].attr0 = 8 | (1 << 14);
 shadowOAM[5].attr1 = 192;
 shadowOAM[5].attr2 = (2)*15+(3);
 if (life < 3) {
  shadowOAM[5].attr0 = (2 << 8);
 }
 if (life < 2) {
  shadowOAM[4].attr0 = (2 << 8);
 }
 if (life < 1) {
  shadowOAM[3].attr0 = (2 << 8);
 }
}

void pixelate() {
 pixelateAlienBullet();
 pixelatePlayerBullet();
 pixelateAliens();
 pixelatePlayer();
 pixelateScore(score);
 pixelateLife(player.life);
 DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 4 * 128);
}

void hideSprites1()
{
 for(int i = 0; i < 128; i++) {
  shadowOAM[i].attr0 = (2 << 8);
 }
 DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 4 * 128);

}
