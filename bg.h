
//{{BLOCK(bg)

//======================================================================
//
//	bg, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 25 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 800 + 2048 = 3360
//
//	Time-stamp: 2017-03-09, 03:07:34
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BG_H
#define GRIT_BG_H

#define bgTilesLen 800
extern const unsigned short bgTiles[400];

#define bgMapLen 2048
extern const unsigned short bgMap[1024];

#define bgPalLen 512
extern const unsigned short bgPal[256];

#endif // GRIT_BG_H

//}}BLOCK(bg)
