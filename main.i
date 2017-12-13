# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2
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
# 3 "main.c" 2
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
# 4 "main.c" 2
# 1 "bg.h" 1
# 22 "bg.h"
extern const unsigned short bgTiles[400];


extern const unsigned short bgMap[1024];


extern const unsigned short bgPal[256];
# 5 "main.c" 2
# 1 "splash.h" 1
# 22 "splash.h"
extern const unsigned short splashTiles[5376];


extern const unsigned short splashMap[1024];


extern const unsigned short splashPal[256];
# 6 "main.c" 2
# 1 "spaceSprites1.h" 1
# 21 "spaceSprites1.h"
extern const unsigned short spaceSprites1Tiles[2400];


extern const unsigned short spaceSprites1Pal[256];
# 7 "main.c" 2
# 1 "gameOver.h" 1
# 22 "gameOver.h"
extern const unsigned short gameOverTiles[1616];


extern const unsigned short gameOverMap[1024];


extern const unsigned short gameOverPal[256];
# 8 "main.c" 2
# 1 "smiley.h" 1
# 22 "smiley.h"
extern const unsigned short smileyTiles[1744];


extern const unsigned short smileyMap[1024];


extern const unsigned short smileyPal[256];
# 9 "main.c" 2

int ghost_blend = 16;

enum {SPLASHSCREEN, GAMESCREEN, PAUSESCREEN, LOSESCREEN, WINSCREEN};

enum {S = 10, T = 11, A = 12, R = 13, T2 = 14, P = 15, U = 16, E = 17};

int state;

int hOff = 0;
int vOff = 0;

int signal = 0;

unsigned int buttons;
unsigned int oldButtons;


OBJ_ATTR shadowOAM[128];

int timer;


int main()
{
 *(unsigned short *)0x4000000 = 0 | (1<<8) | (1 << 12);
    *(volatile unsigned short*)0x4000008 = 0 << 2 | 31 << 8 | 0<<14;

 DMANow(3, spaceSprites1Pal, ((unsigned short*)(0x5000200)), 512/2);
    DMANow(3, spaceSprites1Tiles, &((charblock *)0x6000000)[4], 4800/2);

    hideSprites();
    goToSplash();

 while(1)
 {
  oldButtons = buttons;
  buttons = *(volatile unsigned int *)0x04000130;

  switch(state)
  {
   case SPLASHSCREEN:
    updateSplash();
    break;
   case GAMESCREEN:
    updateGame();
    break;
   case PAUSESCREEN:
    updatePause();
    break;
   case LOSESCREEN:
    updateLose();
    break;
   case WINSCREEN:
    updateWin();
    break;
  }
  *(volatile unsigned short *)0x04000010 = hOff;
     *(volatile unsigned short *)0x04000012 = vOff;
  timer++;
  waitForVblank();
 }
}

void goToSplash() {
 loadPalette(splashPal);
 DMANow(3, splashTiles, &((charblock *)0x6000000)[0], 10752/2);
 DMANow(3, splashMap, &((screenblock *)0x6000000)[31], 2048/2);

 shadowOAM[S].attr0 = 120;
    shadowOAM[S].attr1 = 106;
    shadowOAM[S].attr2 = (4)*15+(7);

    shadowOAM[T].attr0 = 120;
    shadowOAM[T].attr1 = 112;
    shadowOAM[T].attr2 = (4)*15+(9);

    shadowOAM[A].attr0 = 120;
    shadowOAM[A].attr1 = 118;
    shadowOAM[A].attr2 = (4)*15+(0);

    shadowOAM[R].attr0 = 120;
    shadowOAM[R].attr1 = 124;
    shadowOAM[R].attr2 = (4)*15+(8);

    shadowOAM[T2].attr0 = 120;
    shadowOAM[T2].attr1 = 130;
    shadowOAM[T2].attr2 = (4)*15+(9);

    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 4 * 128);


    *(unsigned short*)0x4000050 = (1 << 8) | (1 << 4) | (1 << 13) | (1 << 6);

 state = SPLASHSCREEN;
}

void updateSplash() {
 hOff = 0;
 vOff = 0;
 if (timer % 30 == 0) {
  signal++;
 }
 if (signal % 2) {
  hideSprites();
 } else {
  goToSplash();
 }
 if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  initGame();
  hideSprites();
  goToGame();
 }
 if(timer % 5 == 0)
 {
     ghost_blend --;
     if(signal % 2) ghost_blend = 16;
     *(unsigned short*)0x4000052 = (ghost_blend) | ((16-ghost_blend) << 8);
 }

}

void goToGame() {
 *(unsigned short*)0x4000050 = 0;
 state = GAMESCREEN;
}

void updateGame() {
 update();
 pixelate();

 if(timer % 10 == 0) {
  hOff++;
     vOff++;
 }
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
     goToPause();
    }
}

void goToPause() {
 *(unsigned short*)0x4000050 = (1 << 8) | (1 << 4) | (1 << 13) | (1 << 6);

 int center = 240/2 - 5*3;
 int i = 0;

    shadowOAM[P].attr0 = 75;
    shadowOAM[P].attr1 = center + 6*i++;
    shadowOAM[P].attr2 = (4)*15+(6);

    shadowOAM[A].attr0 = 75;
    shadowOAM[A].attr1 = center + 6*i++;
    shadowOAM[A].attr2 = (4)*15+(0);

    shadowOAM[U].attr0 = 75;
    shadowOAM[U].attr1 = center + 6*i++;
    shadowOAM[U].attr2 = (4)*15+(10);

    shadowOAM[S].attr0 = 75;
    shadowOAM[S].attr1 = center + 6*i++;
    shadowOAM[S].attr2 = (4)*15+(7);

    shadowOAM[E].attr0 = 75;
    shadowOAM[E].attr1 = center + 6*i++;
    shadowOAM[E].attr2 = (4)*15+(2);

    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 4 * 128);

 state = PAUSESCREEN;
}

void updatePause() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
     goToGame();
    }
    if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
     goToSplash();
    }
    if(timer % 15 == 0)
 {
     ghost_blend --;
     if(ghost_blend < 0) ghost_blend = 16;
     *(unsigned short*)0x4000052 = (ghost_blend) | ((16-ghost_blend) << 8);
 }
}

void goToWin() {
 *(unsigned short*)0x4000050 = (1 << 8) | (1 << 4) | (1 << 13) | (1 << 6);
 hOff = 0;
 vOff = 0;
 loadPalette(smileyPal);
 DMANow(3, smileyTiles, &((charblock *)0x6000000)[0], 3488/2);
 DMANow(3, smileyMap, &((screenblock *)0x6000000)[31], 2048/2);
 state = WINSCREEN;
}

void updateWin() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  goToSplash();
 }
}

void goToLose() {
 *(unsigned short*)0x4000050 = (1 << 8) | (1 << 4) | (1 << 13) | (1 << 6);
 *(unsigned short*)0x4000052 = (5) | ((16-5) << 8);
 hOff = 0;
 vOff = 0;
 loadPalette(gameOverPal);
 DMANow(3, gameOverTiles, &((charblock *)0x6000000)[0], 3232/2);
 DMANow(3, gameOverMap, &((screenblock *)0x6000000)[31], 2048/2);



 state = LOSESCREEN;
}

void updateLose() {
 updateAliens();
 pixelateAliens();

 if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
  goToSplash();
 }
}

void hideSprites()
{
 for(int i = 0; i < 128; i++) {
  shadowOAM[i].attr0 = (2 << 8);
 }
 DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 4 * 128);

}

void delay(int a) {
 volatile int b = 0;
 for (int i = 0; i < 1000*a; i++) {
  b++;
 }
}
