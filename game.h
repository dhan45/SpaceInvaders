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