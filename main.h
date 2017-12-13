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