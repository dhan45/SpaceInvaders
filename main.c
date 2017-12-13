#include "myLib.h"
#include "main.h"
#include "game.h"
#include "bg.h"
#include "splash.h"
#include "spaceSprites1.h"
#include "gameOver.h"
#include "smiley.h"
//laskdjfq3489iowehfAL;SKJFPQ3489OIUEFJVQ43OIW;AELKSURJFOIAW;ELKSDJFAWOE;LFJCWIOAESKLDZJFCAS;LKJ.F,
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
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = CBB(0) | SBB(31) | BG_SIZE0;

	DMANow(3, spaceSprites1Pal, SPRITE_PALETTE, spaceSprites1PalLen/2);
    DMANow(3, spaceSprites1Tiles, &CHARBLOCKBASE[4], spaceSprites1TilesLen/2);  

   	hideSprites();
    goToSplash();

	while(1) 
	{
		oldButtons = buttons;
		buttons = BUTTONS;

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
		REG_BG0HOFS = hOff;
	    REG_BG0VOFS = vOff;
		timer++;
		waitForVblank();
	}
}

void goToSplash() {
	loadPalette(splashPal);
	DMANow(3, splashTiles, &CHARBLOCKBASE[0], splashTilesLen/2);
	DMANow(3, splashMap, &SCREENBLOCKBASE[31], splashMapLen/2);
	
	shadowOAM[S].attr0 = 120;
    shadowOAM[S].attr1 = 106;
    shadowOAM[S].attr2 = SPRITEOFFSET(4, 7);
    
    shadowOAM[T].attr0 = 120;
    shadowOAM[T].attr1 = 112;
    shadowOAM[T].attr2 = SPRITEOFFSET(4, 9);

    shadowOAM[A].attr0 = 120;
    shadowOAM[A].attr1 = 118;
    shadowOAM[A].attr2 = SPRITEOFFSET(4, 0);

    shadowOAM[R].attr0 = 120;
    shadowOAM[R].attr1 = 124;
    shadowOAM[R].attr2 = SPRITEOFFSET(4, 8);

    shadowOAM[T2].attr0 = 120;
    shadowOAM[T2].attr1 = 130;
    shadowOAM[T2].attr2 = SPRITEOFFSET(4, 9);

    DMANow(3, shadowOAM, OAM, 4 * 128);

    //;LAKSDJF;LASDKJFAOWIEJFA;SLKDFJL;DKASDLKFJPOWEIQURJPQ48O3IWELUJFVAO;EKWLSJDFMOI4WALEKSDJFDKLS;FJ
    REG_BLDMOD = BG0_B | OBJ_A | BACKDROP_B | NORMAL_TRANS;

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
	if (BUTTON_PRESSED(BUTTON_START)) {
		initGame();
		hideSprites();
		goToGame();
	}
	if(timer % 5 == 0)
	{
	    ghost_blend --;
	    if(signal % 2) ghost_blend = 16;
	    REG_COLEV = WEIGHTOFA(ghost_blend) | WEIGHTOFB(16-ghost_blend);
	}

}

void goToGame() {
	REG_BLDMOD = 0;
	state = GAMESCREEN;
}

void updateGame() {
	update();
	pixelate();

	if(timer % 10 == 0) {
		hOff++;
	    vOff++;
	}
    if (BUTTON_PRESSED(BUTTON_START)) {
    	goToPause();
    }
}

void goToPause() {
	REG_BLDMOD = BG0_B | OBJ_A | BACKDROP_B | NORMAL_TRANS;
	
	int center = 240/2 - 5*3;
	int i = 0;
    
    shadowOAM[P].attr0 = 75;
    shadowOAM[P].attr1 = center + 6*i++;
    shadowOAM[P].attr2 = SPRITEOFFSET(4, 6);
    
    shadowOAM[A].attr0 = 75;
    shadowOAM[A].attr1 = center + 6*i++;
    shadowOAM[A].attr2 = SPRITEOFFSET(4, 0);

    shadowOAM[U].attr0 = 75;
    shadowOAM[U].attr1 = center + 6*i++;
    shadowOAM[U].attr2 = SPRITEOFFSET(4, 10);

    shadowOAM[S].attr0 = 75;
    shadowOAM[S].attr1 = center + 6*i++;
    shadowOAM[S].attr2 = SPRITEOFFSET(4, 7);

    shadowOAM[E].attr0 = 75;
    shadowOAM[E].attr1 = center + 6*i++;
    shadowOAM[E].attr2 = SPRITEOFFSET(4, 2);

    DMANow(3, shadowOAM, OAM, 4 * 128);
	
	state = PAUSESCREEN;
}

void updatePause() {
    if (BUTTON_PRESSED(BUTTON_START)) {
    	goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
    	goToSplash();
    }
    if(timer % 15 == 0)
	{
	    ghost_blend --;
	    if(ghost_blend < 0) ghost_blend = 16;
	    REG_COLEV = WEIGHTOFA(ghost_blend) | WEIGHTOFB(16-ghost_blend);
	}
}

void goToWin() {
	REG_BLDMOD = BG0_B | OBJ_A | BACKDROP_B | NORMAL_TRANS;
	hOff = 0;
	vOff = 0;
	loadPalette(smileyPal);
	DMANow(3, smileyTiles, &CHARBLOCKBASE[0], smileyTilesLen/2);
	DMANow(3, smileyMap, &SCREENBLOCKBASE[31], smileyMapLen/2);
	state = WINSCREEN;
}

void updateWin() {
    if (BUTTON_PRESSED(BUTTON_START)) {
		goToSplash();
	}
}

void goToLose() {
	REG_BLDMOD = BG0_B | OBJ_A | BACKDROP_B | NORMAL_TRANS;
	REG_COLEV = WEIGHTOFA(5) | WEIGHTOFB(16-5);
	hOff = 0;
	vOff = 0;
	loadPalette(gameOverPal);
	DMANow(3, gameOverTiles, &CHARBLOCKBASE[0], gameOverTilesLen/2);
	DMANow(3, gameOverMap, &SCREENBLOCKBASE[31], gameOverMapLen/2);



	state = LOSESCREEN;
}

void updateLose() {
	updateAliens();
	pixelateAliens();

	if (BUTTON_PRESSED(BUTTON_START)) {
		goToSplash();
	}
}

void hideSprites()
{
	for(int i = 0; i < 128; i++) {
		shadowOAM[i].attr0 = ATTR0_HIDE;
	}
	DMANow(3, shadowOAM, OAM, 4 * 128);

}

void delay(int a) {
	volatile int b = 0;
	for (int i = 0; i < 1000*a; i++) {
		b++;
	}
}

