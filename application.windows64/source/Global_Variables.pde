//Assigning a variable name to an image
PImage img;
PImage logo;
PImage back;
PImage next;
PImage highscore;
PImage helpmenu;
PImage play;
PImage check;
PImage red;
PImage yellow;
PImage green;
PImage blue;
PImage help1;
PImage help2;
PImage exit1;
PImage exit2;
PImage exit3;
PImage sound1;
PImage sound2;
PImage gold;
PImage silver;
PImage bronze;

//Assigning a variable name to a font
PFont f;
PFont f2;
PFont f3;
PFont f4;
PFont f5;
PFont f6;
PFont f7;

int i = 1;//Variable for overall switch case
int g =1;//Variable for each player's turn switch case
int c;//Y coordinate of check mark image
int numplayers;//Sets number of players playing
int diceroll;//Random integer for dice rolling
int playerPos =0;//Player position 1
int playerPos1 = 0;//Player position 2
int playerPos2 = 0;//Player position 3
int playerPos3 = 0;//Player position 4
int playerturn;//Player's turn
int b = 0;//Helps for switching player turns
int q =0;//Number of moves made by player 1
int q1 =0;//Number of moves made by player 2
int q2 =0;//Number of moves made by player 3
int q3 =0;//Number of moves made by player 4
int count = 0;//Delay for turning on help menu and exit button
int climb =0;//Delay for going up ladder
int fall = 0;//Delay for going down ladder
int winner =0;//Sets which player won
int r1=0;//X coordinate of first end game rectangle
int r2=0;//X coordinate of second end game rectangle
int laddercount=0;//Delay for rewinding sound
int snakecount=0;//Delay for rewinding sound
int score;//Score of winner at end of the game

boolean twoplay = false;//Is it two players
boolean threeplay = false;//Is it three players
boolean fourplay = false;//Is it four players
boolean gameplaying = false;//Allows mouseReleased to work
boolean on =true;//Turns on winner screen
boolean v = false;//Allows pieces to move
boolean done =false;//Starts end game animation
boolean up =false;//Playing ladder sound
boolean down =false;//Playing snake sound
boolean gamebuttons = false;//Turns on help and exit button in game
boolean help = false;//Help menu enabled
boolean game=true;//Check if the game is currently playing

PImage[] dice = new PImage[6]; //Image array
int [] squareX = {56, 168, 280, 392, 504, 504, 392, 280, 168, 56, 56, 168, 280, 392, 504, 504, 392, 280, 168, 56, 56, 168, 280, 392, 504, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};//Array of x coordinates
int [] squareY = {504, 504, 504, 504, 504, 392, 392, 392, 392, 392, 280, 280, 280, 280, 280, 168, 168, 168, 168, 168, 56, 56, 56, 56, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};//Array of y coordinates
String[] winnerscore;//Array of winner score

import ddf.minim.*;//Need to load the MINIM library
Minim minim;//Create a MINIM object
AudioPlayer ladder;//Ladder sound
AudioPlayer snake;//Snake sound
AudioPlayer endgame;//End of the game sound