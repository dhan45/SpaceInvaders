#include "myLib.h"
#include "main.h"
#include "game.h"
#include "splash.h"
#include "bg.h"
#include "spaceSprites1.h"
#include <stdlib.h>

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
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = CBB(0) | SBB(31) | BG_SIZE0;
	

	loadPalette(bgPal);
    DMANow(3, bgTiles, &CHARBLOCKBASE[0], bgTilesLen/2);
    DMANow(3, bgMap, &SCREENBLOCKBASE[31], bgMapLen/2);

    aliensRemaining = 50;
    srand(counter++);	

    //PLAYER
    player.height = 8;
    player.width = 13;
    player.row = 160 - player.height;
    player.col = 240/2 - player.width/2;
    player.rd = 0;
    player.cd = 0;
    player.life = 3;
    player.active = 1;

    //ALIENS
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

    //BONUS ALIEN
    bonus.height = 8;
    bonus.width = 16;
    bonus.row = 16;
    bonus.col = 200 - bonus.width;
    bonus.rd = 0;
    bonus.cd = -1;
    bonus.points = 240;
    bonus.life = 1;
    bonus.active = 0;

    //PLAYER BULLETS
    for (int i = 0; i < bulletLength; i++) {
	    pBullet[i].height = 4;
	    pBullet[i].width = 1;
	    pBullet[i].rd = -2;
	    pBullet[i].cd = 0;
	    pBullet[i].active = 0;
	}

	//ALIEN BULLETS
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
	} if (BUTTON_PRESSED(BUTTON_A)) {
		playerShoot();
	} else if(BUTTON_HELD(BUTTON_LEFT)) {
		player.cd = -1;
		player.col += player.cd;
	} else if (BUTTON_HELD(BUTTON_RIGHT)) {
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

//PIXELATE!!!
void pixelateAliens() 
{
	for (int i = 0; i < 10; i++) {
		if (alien[i].active) {
			if(flip % 2) {
				shadowOAM[HIGH + i].attr0 = alien[i].row | ATTR0_WIDE;
				shadowOAM[HIGH + i].attr1 = alien[i].col;
				shadowOAM[HIGH + i].attr2 = SPRITEOFFSET(0, 10);
			} else {
				shadowOAM[HIGH + i].attr0 = alien[i].row | ATTR0_WIDE;
				shadowOAM[HIGH + i].attr1 = alien[i].col;
				shadowOAM[HIGH + i].attr2 = SPRITEOFFSET(0, 12);
			}
		} else {
			shadowOAM[HIGH + i].attr0 = ATTR0_HIDE;
		}
	}
	for (int i = 0; i < 20; i++) {
		if (alien[10 + i].active) {
			if(flip % 2) {
				shadowOAM[MID + i].attr0 = alien[10 + i].row | ATTR0_WIDE;
				shadowOAM[MID + i].attr1 = alien[10 + i].col;
				shadowOAM[MID + i].attr2 = SPRITEOFFSET(0, 6);
			} else {
				shadowOAM[MID + i].attr0 = alien[10 + i].row | ATTR0_WIDE;
				shadowOAM[MID + i].attr1 = alien[10 + i].col;
				shadowOAM[MID + i].attr2 = SPRITEOFFSET(0, 8);
			}
		} else {
			shadowOAM[MID + i].attr0 = ATTR0_HIDE;
		}
	}
	for (int i = 0; i < 20; i++) {
		if (alien[30 + i].active) {
			if(flip % 2) {
				shadowOAM[LOW + i].attr0 = alien[30 + i].row | ATTR0_WIDE;
				shadowOAM[LOW + i].attr1 = alien[30 + i].col;
				shadowOAM[LOW + i].attr2 = SPRITEOFFSET(0, 2);
			} else {
				shadowOAM[LOW + i].attr0 = alien[30 + i].row | ATTR0_WIDE;
				shadowOAM[LOW + i].attr1 = alien[30 + i].col;
				shadowOAM[LOW + i].attr2 = SPRITEOFFSET(0, 4);
			}
		} else {
			shadowOAM[LOW + i].attr0 = ATTR0_HIDE;
		}
	}
	if (bonus.active) {
		shadowOAM[BONUS_ALIEN].attr0 = bonus.row | ATTR0_WIDE;
		shadowOAM[BONUS_ALIEN].attr1 = bonus.col;
		shadowOAM[BONUS_ALIEN].attr2 = SPRITEOFFSET(0, 0);
	} else {
		shadowOAM[BONUS_ALIEN].attr0 = ATTR0_HIDE;
	}
}

void pixelatePlayer() {
	shadowOAM[PLAYER1].attr0 = player.row | ATTR0_WIDE;
	shadowOAM[PLAYER1].attr1 = player.col;
	shadowOAM[PLAYER1].attr2 = SPRITEOFFSET(2,3);
}

void pixelatePlayerBullet() {
	for (int i = 0; i < bulletLength; i++) {
		if (pBullet[i].active) {
			shadowOAM[PLAYERBULLETS + i].attr0 = pBullet[i].row;
			shadowOAM[PLAYERBULLETS + i].attr1 = pBullet[i].col;
			shadowOAM[PLAYERBULLETS + i].attr2 = SPRITEOFFSET(2,11);
		} else {
			shadowOAM[PLAYERBULLETS + i].attr0 = ATTR0_HIDE;
		}
	}
}

void pixelateAlienBullet() {
	for (int i = 0; i < alienBulletLength; i++) {
		if (aBullet[i].active) {
			if (!counter % 2) {
				shadowOAM[ALIENBULLETS + i].attr0 = aBullet[i].row;
				shadowOAM[ALIENBULLETS + i].attr1 = aBullet[i].col;
				shadowOAM[ALIENBULLETS + i].attr2 = SPRITEOFFSET(2,10);
			} else {
				shadowOAM[ALIENBULLETS + i].attr0 = aBullet[i].row;
				shadowOAM[ALIENBULLETS + i].attr1 = aBullet[i].col;
				shadowOAM[ALIENBULLETS + i].attr2 = SPRITEOFFSET(2,9);
			}
		} else {
			shadowOAM[ALIENBULLETS + i].attr0 = ATTR0_HIDE;
		}
	}
}

void pixelateScore(int score)
{
	if (score > 99) {
		shadowOAM[0].attr0 = 8;
		shadowOAM[0].attr1 = 24;
		shadowOAM[0].attr2 = SPRITEOFFSET(5,score/100);
	}
	if (score > 9) {
		shadowOAM[1].attr0 = 8;
		shadowOAM[1].attr1 = 30;
		shadowOAM[1].attr2 = SPRITEOFFSET(5,(score%100)/10);
	}
	shadowOAM[2].attr0 = 8;
	shadowOAM[2].attr1 = 36;
	shadowOAM[2].attr2 = SPRITEOFFSET(5,(score%10));
}

void pixelateLife(int life)
{
	shadowOAM[3].attr0 = 8 | ATTR0_WIDE;
	shadowOAM[3].attr1 = 160;
	shadowOAM[3].attr2 = SPRITEOFFSET(2,3);
	shadowOAM[4].attr0 = 8 | ATTR0_WIDE;
	shadowOAM[4].attr1 = 176;
	shadowOAM[4].attr2 = SPRITEOFFSET(2,3);
	shadowOAM[5].attr0 = 8 | ATTR0_WIDE;
	shadowOAM[5].attr1 = 192;
	shadowOAM[5].attr2 = SPRITEOFFSET(2,3);
	if (life < 3) {
		shadowOAM[5].attr0 = ATTR0_HIDE;
	}
	if (life < 2) {
		shadowOAM[4].attr0 = ATTR0_HIDE;
	}
	if (life < 1) {
		shadowOAM[3].attr0 = ATTR0_HIDE;
	}
}

void pixelate() {
	pixelateAlienBullet();
	pixelatePlayerBullet();
	pixelateAliens();
	pixelatePlayer();
	pixelateScore(score);
	pixelateLife(player.life);
	DMANow(3, shadowOAM, OAM, 4 * 128);
}

void hideSprites1()
{
	for(int i = 0; i < 128; i++) {
		shadowOAM[i].attr0 = ATTR0_HIDE;
	}
	DMANow(3, shadowOAM, OAM, 4 * 128);

}