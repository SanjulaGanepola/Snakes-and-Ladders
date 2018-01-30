void setup() { // define a reference to an image object  void setup(){
  size(800, 600);

  //Load and resize images
  img = loadImage("Images/light.png");
  img.resize(800, 600);
  logo = loadImage("Images/logo.png");
  logo.resize(300, 150);
  check = loadImage("Images/checkmark.png");
  check.resize(50, 50);

  //Load and resize pieces
  red = loadImage("Images/red.png");
  yellow = loadImage("Images/yellow.png");
  green = loadImage("Images/green.png");
  blue = loadImage("Images/blue.png");
  red.resize(30, 50);
  yellow.resize(30, 50);
  green.resize(30, 50);
  blue.resize(30, 50);

  //Load and resize game buttons
  play = loadImage("Images/Play.png");
  play.resize(65, 65);

  next = loadImage("Images/Next.png");
  next.resize(65, 65);
  back = loadImage("Images/Back.png");
  back.resize(65, 65);
  highscore = loadImage("Images/High Score.png");
  highscore.resize(65, 65);
  exit1 = loadImage("Images/Exit.png");
  exit1.resize(65, 65);
  exit2 = loadImage("Images/Exit.png");
  exit2.resize(45, 45);
  exit3 = loadImage("Images/Exit.png");
  exit3.resize(65, 65);
  sound1 = loadImage("Images/Sound.png");
  sound1.resize(65, 65);
  sound2 = loadImage("Images/Sound.png");
  sound2.resize(45, 45);
  help1 = loadImage("Images/Help.png");
  help1.resize(65, 65);
  help2 = loadImage("Images/Help.png");
  help2.resize(45, 45);
  helpmenu = loadImage("Images/Help Menu.png");
  helpmenu.resize(400, 400);

  //Load and resize medal images
  gold = loadImage("Images/Gold.png");
  gold.resize(30, 45);
  silver = loadImage("Images/Silver.png");
  silver.resize(30, 45);
  bronze = loadImage("Images/Bronze.png");
  bronze.resize(30, 45);


  //Load and resize dice images from array
  dice[0] = loadImage("Images/die_face_1.png");
  dice[1] = loadImage("Images/die_face_2.png");
  dice[2] = loadImage("Images/die_face_3.png");
  dice[3] = loadImage("Images/die_face_4.png");
  dice[4] = loadImage("Images/die_face_5.png");
  dice[5] = loadImage("Images/die_face_6.png");
  for (int i = 0; i<6; i++) {
    dice[i].resize(60, 60);
  }

  //Assigning a desired font
  f = createFont("Arial", 50);
  f2 = createFont("Arial", 25);
  f3 = createFont("Arial", 35);
  f4 = createFont("Arial", 20);
  f5 = createFont("Arial", 30);
  f6 = createFont("Arial", 22);
  f7 = createFont("Arial", 40);

  //Sound
  minim = new Minim(this);//loads minum 
  ladder = minim.loadFile("Images/ladder.mp3");//load the sound into memory
  snake = minim.loadFile("Images/snake.mp3");//load the sound into memory
  endgame = minim.loadFile("Images/winner.mp3");//load the sound into memory


  stroke(0);//Set pen colour
  strokeCap(ROUND);//Round the line endings
  strokeJoin(ROUND);//Round the stroke joints
  strokeWeight(3);//Set stroke weight

  winnerscore = loadStrings("Images/Scores.txt");//load scores from .txt file
}

void draw() {
  switch(i) {//Overall Game

  case 1://Menu Screen

    textFont(f); //Set the current font
    fill(255);
    background(246, 166, 29);//Sets background colour
    image(logo, 248, 30);
    //Draw rectangles for buttons
    rect(225, 180, 350, 75, 15, 15, 15, 15);
    rect(225, 280, 350, 75, 15, 15, 15, 15);
    rect(225, 380, 350, 75, 15, 15, 15, 15);
    rect(225, 480, 350, 75, 15, 15, 15, 15);

    fill(0);
    text("Play", 348, 235);
    text("Instruction", 287, 335);
    text("High Scores", 270, 435);
    text("Exit", 355, 540);
    image(play, 200, 185);
    image(help1, 200, 285);
    image(highscore, 200, 385);
    image(exit1, 200, 485);
    if (mouseX > 225 && mouseX < 575 && mouseY > 180 && mouseY < 265 && mousePressed) {//Play Button
      i = 4;
    } 
    if (mouseX > 225 && mouseX < 575 && mouseY > 280 && mouseY < 355 && mousePressed) {//Instruction Button
      i = 2;
    }
    if (mouseX > 225 && mouseX < 575 && mouseY > 380 && mouseY < 455 && mousePressed) {//High Scores Button
      i = 3;
    }
    if (mouseX > 225 && mouseX < 575 && mouseY > 480 && mouseY < 555 && mousePressed) {//Exit Button
      exit();
    }
    break;
  case 2://Instruction
    background(246, 166, 29);//Sets background colour
    image(back, 10, 10);
    if (mouseX > 0 && mouseX < 85 && mouseY > 0 && mouseY < 75 && mousePressed) {//Back Button
      i = 1;//Menu Screen
    } 
    fill(255);
    rect(225, 35, 350, 75, 10, 10, 10, 10);
    //Instructions for Game
    fill(0);
    textFont(f);
    text("Instruction", 289, 90);
    textFont(f2); //Set the current font
    text("1) Each player starts on the 1st square at the bottom of the board.", 10, 185);
    text("2) Take turns rolling the dice and your piece will move accordingly.", 10, 245);
    text("3) If your piece lands at the bottom of a ladder, you can move up to", 10, 305);
    text("the top of the ladder.", 40, 365);
    text("4) If your piece lands on the head of a snake, you must slide down to", 10, 425);
    text("the bottom of the snake.", 40, 485);    
    text("5) The first player to get to the 25th square is the winner!!!", 10, 545);
    break;

  case 3://High Score
    background(246, 166, 29);//Sets background colour
    image(back, 10, 10);
    if (mouseX > 0 && mouseX < 85 && mouseY > 0 && mouseY < 75 && mousePressed) {//Back Button
      i = 1;//Menu Screen
    } 
    //Draws the chart
    fill(255);
    rect(225, 35, 350, 75, 10, 10, 10, 10);
    rect(40, 250, 720, 300, 20, 20, 20, 20);
    line(400, 250, 400, 550);
    line(40, 300, 760, 300);
    line(40, 350, 760, 350);
    line(40, 400, 760, 400);
    line(40, 450, 760, 450);
    line(40, 500, 760, 500);

    fill(0);
    textFont(f);
    text("High Score", 289, 90);
    textFont(f5); //Set the current font
    text("Rank", 200, 287);
    text("Score", 550, 287);
    text("1", 220, 340);
    text("2", 220, 390);
    text("3", 220, 440);
    text("4", 220, 490);
    text("5", 220, 540);

    //Outputs appropriate scores from .txt file
    text(winnerscore[0], 570, 340); 
    text(winnerscore[1], 570, 390); 
    text(winnerscore[2], 570, 440); 
    text(winnerscore[3], 570, 490); 
    text(winnerscore[4], 570, 540); 


    textFont(f2);
    text("High Scores are given to only the first place player from each match.  ", 30, 145);
    text("You score will be based on the least number of moves the player took.", 20, 180);
    text("Try to reach 25 with the least number of moves!", 135, 212);
    text(" Good Luck!", 330, 240);
    image(gold, 180, 303);
    image(silver, 180, 353);
    image(bronze, 180, 403);
    break;

  case 4://Setup Game

    background(246, 166, 29);//Sets background colour
    image(back, 10, 10);
    if (mouseX > 0 && mouseX < 85 && mouseY > 0 && mouseY < 75 && mousePressed) {//Back Button
      i = 1;//Menu
    } 
    fill(255);
    rect(225, 35, 350, 75, 10, 10, 10, 10);
    fill(0);
    textFont(f);
    text("Game Setup", 262, 90);
    fill(255);
    rect(30, 135, 740, 75, 10, 10, 10, 10);
    rect(30, 283, 740, 75, 10, 10, 10, 10);
    rect(30, 431, 740, 75, 10, 10, 10, 10);
    rect(705, 149, 50, 50);
    rect(705, 297, 50, 50);
    rect(705, 445, 50, 50);
    textFont(f3); //Set the current font
    fill(0);

    text("Two Players:", 50, 187);
    text("Three Players:", 50, 335);
    text("Four Players:", 50, 483);

    image(red, 370, 150);
    image(green, 455, 150);
    image(red, 370, 298);
    image(green, 455, 298);
    image(blue, 545, 298);
    image(red, 370, 446);
    image(green, 455, 446);
    image(blue, 545, 446); 
    image(yellow, 630, 446);

    textFont(f2);
    text("Click the box and press next to continue.", 160, 560);

    if (mouseX > 705 && mouseX <  755 && mouseY >  149 && mouseY <  200 && mousePressed) {//Selects Two Player
      twoplay = true;
      threeplay = false;
      fourplay = false;
    } 
    if (mouseX > 705 && mouseX <  755 && mouseY >  297 && mouseY <  350 && mousePressed) {//Selects Three Player
      threeplay = true;
      twoplay = false;
      fourplay = false;
    } 
    if (mouseX > 70 && mouseX <  755 && mouseY >  445 && mouseY <  500 && mousePressed) {//Selects Four Player
      fourplay = true;
      twoplay = false;
      threeplay = false;
    } 

    if (twoplay == true) {//Ask to confirm two players
      c = 145;
      image(next, 722, 10);
      image(check, 710, c);
      if (mouseX > 722 && mouseX <  800 && mouseY >  0 && mouseY <  75 && mousePressed) {//Two Player Confirm
        i = 5;//Sends to the game
        numplayers = 2;//Sets player number as 2
      }
    }
    if (threeplay == true) {//Ask to confirm three players
      c = 293;
      image(next, 722, 10);
      image(check, 710, c);
      if (mouseX > 722 && mouseX <  800 && mouseY >  0 && mouseY <  75 && mousePressed) {//Three Player Confirm
        i = 5;//Sends it the game
        numplayers = 3;//Sets player number as 3
      }
    }
    if (fourplay == true) {//Ask to confirm four players
      c = 440;
      image(next, 722, 10);
      image(check, 710, c);
      if (mouseX > 722 && mouseX <  800 && mouseY >  0 && mouseY <  75 && mousePressed) {//Four Player Confirm
        i = 5;//Sends to the game
        numplayers = 4;//Sets player number as 4
      }
    }
    break;

  case 5://Game
    if (game==true) {//The game is currently running
      count++;
      if (count>2) {//Delays when the help and the exit buttons pop up
        gamebuttons = true;
      }
      red.resize(25, 35);
      yellow.resize(25, 35);
      green.resize(25, 35);
      blue.resize(25, 35);
      gameplaying = true;
      background(img);
      fill(246, 166, 29);//Sets background colour
      strokeWeight(5);
      textFont(f4);
      line(573, 586, 790, 586);
      line(790, 586, 790, 14);
      line(573, 14, 790, 14);
      strokeWeight(0);
      rect(0, 0, 800, 13);
      rect(0, 0, 12, 600);
      rect(0, 588, 800, 600);
      rect(793, 0, 800, 600);


      strokeWeight(2);
      if ((numplayers == 2) || (numplayers == 3) || (numplayers == 4)) {//If the game is for 2,3,or 4 players
        //Draws Player 1's Display Box
        fill(246, 166, 29);//Sets background colour
        rect(605, 70, 160, 70, 10, 0, 10, 0);
        fill(0);
        line(605, 100, 765, 100);
        text("Player 1:", 615, 93);
        text("Moves: "+q, 615, 127);

        //Draws Player 2's Display Box 
        fill(246, 166, 29);//Sets background colour
        rect(605, 170, 160, 70, 10, 0, 10, 0);
        fill(0);
        line(605, 200, 765, 200);
        text("Player 2:", 615, 193);
        text("Moves: "+q1, 615, 227);

        //Draws red and green piece
        image(red, squareX[playerPos]-20, squareY[playerPos]-20);
        image(green, squareX[playerPos1]+20, squareY[playerPos1]-20);
      }

      if ((numplayers == 3) || (numplayers == 4)) {//If the game is for 3,or 4 players
        //Draws Player 3's Display Box
        fill(246, 166, 29);//Sets background colour
        rect(605, 270, 160, 70, 10, 0, 10, 0);
        fill(0);
        line(605, 300, 765, 300);
        text("Player 3:", 615, 293);
        text("Moves: "+q2, 615, 327);

        //Draws red green and blue piece
        image(red, squareX[playerPos]-20, squareY[playerPos]-20);
        image(green, squareX[playerPos1]+20, squareY[playerPos1]-20);
        image(blue, squareX[playerPos2]-20, squareY[playerPos2]+30);
      }
      if (numplayers == 4) {//If the game is for  4 players
        //Draws Player 4's Display Box
        fill(246, 166, 29);//Sets background colour
        rect(605, 370, 160, 70, 10, 0, 10, 0);
        fill(0);
        line(605, 400, 765, 400);
        text("Player 4:", 615, 393);
        text("Moves: "+q3, 615, 427);

        //Draws red, green, blue, and yellow piece
        image(red, squareX[playerPos]-20, squareY[playerPos]-20);
        image(green, squareX[playerPos1]+20, squareY[playerPos1]-20);
        image(blue, squareX[playerPos2]-20, squareY[playerPos2]+30);
        image(yellow, squareX[playerPos3]+20, squareY[playerPos3]+30);
      }


      fill(246, 166, 29);
      rect(580, 495, 202, 78, 0, 0, 10, 10);//Dice rolling area
      fill(0);

      help1.resize(35, 35);
      sound1.resize(35, 35);
      exit1.resize(35, 35);

      if (gamebuttons==true) {//The help and exit button are on
        if (mouseX > 606 && mouseX <  651 && mouseY > 21 && mouseY < 66) {//If mouse hover over the help button, make it enlarge
          image(help2, 606, 21);
          if (mousePressed) {//For opening the help menu
            help =true;
          }
        } else {//If mouse is not hovering over the help button, don't make it enlarge
          image(help1, 608, 25);
        }

        if (help==true) {//Open the help menu screen
          image(helpmenu, 82, 82);
          textFont(f3);
          text("Help", 246, 128);
          textFont(f2);
          text("Try to get to the 25th square!", 120, 190);

          line(120, 210, 120, 385);
          line(440, 210, 440, 385);
          line(300, 210, 300, 385);
          line(120, 210, 440, 210);
          line(120, 245, 440, 245);
          line(120, 280, 440, 280);
          line(120, 315, 440, 315);
          line(120, 350, 440, 350);
          line(120, 385, 440, 385);

          text("Player", 175, 235);
          text("Position", 328, 235);
          
          if ((numplayers==2) || (numplayers==3) || (numplayers==4)) {//If the game is for 2,3,or 4 players
            text("Player 1", 165, 270);
            text("Player 2", 165, 305);
            text(q, 362, 270);//Number of moves made by player 1
            text(q1, 362, 305);//Number of moves made by player 2
          }
          if ((numplayers==3) || (numplayers==4)) {//If the game is for 3 or 4 players
            text("Player 3", 165, 340);
            text(q2, 362, 340);//Number of moves made by player 3
          }
          if (numplayers==4) {//If the game is for 4 players
            text("Player 4", 165, 375);
            text(q3, 362, 375);//Number of moves made by player 4
          }

          if (playerturn ==1) {//If it is player 1's turn make the box red
            fill(255, 0, 0);
          }
          if (playerturn ==2) {//If it is player 2's turn make the box green
            fill(0, 150, 0);
          }
          if (playerturn ==3) {//If it is player 3's turn make the box blue
            fill(0, 110, 255);
          }
          if (playerturn ==4) {//If it is player 4's turn make the box yellow
            fill(255, 255, 0);
          }
          rect(140, 400, 260, 40, 10, 10, 10, 10);
          fill(0);
          text("It is Player "+playerturn+"'s turn!", 165, 429);//States which player's turn it is

          image(exit2, 456, 90);
          if (mouseX >  456 && mouseX <  501 && mouseY > 90 && mouseY < 135 && mousePressed) {//Exit button to close the help menu
            help=false;//Turns off the help menu
          }
        }


        if (mouseX >  726 && mouseX <  771 && mouseY > 21 && mouseY < 66) {//If mouse hover over the exit button, make it enlarge
          image(exit2, 726, 21);
          if (mousePressed) {//If it is pressed close game
            exit();
          }
        } else {//If the mosue is not hovering over the exit button, don't enlarge
          image(exit1, 728, 25);
        }
      }
      textFont(f2);

      switch(g) {//Case for each player's turn
      case 1:
        playerturn = 1;
        fill(255, 0, 0);
        rect(581, 450, 200, 35, 10, 10, 0, 0);
        fill(0);
        text("Roll Player 1", 615, 478);
        if (mouseX > 652 && mouseX < 712 && mouseY > 504 && mouseY < 564 && mousePressed) {//If mouse is pressed, get a random integer
          v = true;//Allows piece to move
          diceroll = int(random(dice.length));//Random integer
          delay(100);
        } else {//Doesn't allows piece to move
          v=false;
        }
        image(dice[diceroll], 652, 504);//draws random dice face
        if (b==1) {//Goes to next player's turn
          g = 2;//Player 2's turn
        }
        delay(100);
        break;

      case 2:
        playerturn =2;
        fill(0, 150, 0);
        rect(581, 450, 200, 35, 10, 10, 0, 0);
        fill(0);
        text("Roll Player 2", 615, 478);
        if (mouseX > 652 && mouseX < 712 && mouseY > 504 && mouseY < 564 && mousePressed) {//If mouse is pressed, get a random integer
          v = true;//Allows piece to move
          diceroll = int(random(dice.length));//Random integer
          delay(100);
        } else {//Doesn't allows piece to move
          v=false;
        }
        image(dice[diceroll], 652, 504);//Draws random dice face
        if (b==2 && (numplayers == 4 || numplayers == 3)) {//Goes to next player's turn under certain conditions
          g = 3;//Player 3's turn
        } else if (b==2 && numplayers == 2) {//Goes to next player's turn under certain conditions
          g = 1;//Player 1's turn
        }
        break;

      case 3:
        fill(0, 110, 255);
        rect(581, 450, 200, 35, 10, 10, 0, 0);
        playerturn =3;
        fill(0);
        text("Roll Player 3", 615, 478);
        if (mouseX > 652 && mouseX < 712 && mouseY > 504 && mouseY < 564 && mousePressed) {//If mouse is pressed, get a random integer
          v = true;//Allows piece to move
          diceroll = int(random(dice.length));//Random integer
          delay(100);
        } else {//Doesn't allows piece to move
          v=false;
        }
        image(dice[diceroll], 652, 504);//Draws random dice face
        if (b==3 && numplayers == 4) {//Goes to next player's turn under certain conditions
          g = 4;//player 4's turn
        } else if (b==3 && numplayers == 3) {//Goes to next player's turn under certain conditions
          g = 1;//Player 1's turn
        }
        break;

      case 4:
        playerturn =4;
        fill(255, 255, 0);
        rect(581, 450, 200, 35, 10, 10, 0, 0);
        fill(0);
        text("Roll Player 4", 615, 478);
        if (mouseX > 652 && mouseX < 712 && mouseY > 504 && mouseY < 564 && mousePressed) {//If mouse is pressed, get a random integer
          v = true;//Allows piece to move
          diceroll = int(random(dice.length));//Random integer
          delay(100);
        } else {//Doesn't allows piece to move
          v=false;
        }
        image(dice[diceroll], 652, 504);//Draws random dice face
        if (b==4) {//Goes to next player's turn
          g = 1;//Player 1's turn
        }
        break;
      }

      //Ladders for first piece
      if (playerPos==2) {//Checks if piece 1 is on 2th square 
        up=true;//Play ladder sound
        playerPos=2;//Bottom of ladder
        climb++;//Delay the ladder animation//Delay the ladder animation
        if (climb==10) {
          playerPos = 10;//Moves to top of ladder
          climb=0;//Reset fall delay
        }
      }
      if (playerPos==5) {//Checks if piece 1 is on 5th square 
        up=true;//Play ladder sound
        playerPos=5;//Bottom of ladder
        climb++;//Delay the ladder animation
        if (climb==10) {
          playerPos = 16;//Moves to top of ladder       
          climb=0;//Reset fall delay
        }
      }
      if (playerPos==8) {//Checks if piece 1 is on 8th square         
        up=true;//Play ladder sound
        playerPos=8;//Bottom of ladder
        climb++;//Delay the ladder animation
        if (climb==10) {
          playerPos = 17;//Moves to top of ladder        
          climb=0;//Reset fall delay
        }
      }
      if (playerPos==9) {//Checks if piece 1 is on 9th square         
        up=true;//Play ladder sound
        playerPos=9;//Bottom of ladder
        climb++;//Delay the ladder animation
        if (climb==10) {
          playerPos = 11;//Moves to top of ladder        
          climb=0;//Reset fall delay
        }
      }

      //ladders for second piece
      if (playerPos1==2) {//Checks if piece 2 is on 2th square         
        up=true;//Play ladder sound
        playerPos1=2;//Bottom of ladder
        climb++;//Delay the ladder animation
        if (climb==10) {
          playerPos1 = 10;//Moves to top of ladder        
          climb=0;//Reset fall delay
        }
      }
      if (playerPos1==5) {//Checks if piece 2 is on 5th square         
        up=true;//Play ladder sound
        playerPos1=5;//Bottom of ladder   
        climb++;//Delay the ladder animation
        if (climb==10) {
          playerPos1 = 16;//Moves to top of ladder        
          climb=0;//Reset fall delay
        }
      }
      if (playerPos1==8) {//Checks if piece 2 is on 8th square         
        up=true;//Play ladder sound
        playerPos1=8;//Bottom of ladder        
        climb++;//Delay the ladder animation
        if (climb==10) {
          playerPos1 = 17;//Moves to top of ladder        
          climb=0;//Reset fall delay
        }
      }
      if (playerPos1==9) {//Checks if piece 2 is on 9th square         
        up=true;//Play ladder sound
        playerPos1=9;//Bottom of ladder  
        climb++;//Delay the ladder animation    
        if (climb==10) {
          playerPos1 = 11;//Moves to top of ladder        
          climb=0;//Reset fall delay
        }
      }

      //ladders for third piece
      if (playerPos2==2) {//Checks if piece 3 is on 2th square         
        up=true;//Play ladder sound
        playerPos2=2;//Bottom of ladder         
        climb++;//Delay the ladder animation
        if (climb==10) {
          playerPos2 = 10;//Moves to top of ladder        
          climb=0;//Reset fall delay
        }
      }
      if (playerPos2==5) {//Checks if piece 3 is on 5th square         
        up=true;//Play ladder sound
        playerPos2=5;//Bottom of ladder        
        climb++;//Delay the ladder animation
        if (climb==10) {
          playerPos2 = 16;//Moves to top of ladder        
          climb=0;//Reset fall delay
        }
      }
      if (playerPos2==8) {//Checks if piece 3 is on 8th square         
        up=true;//Play ladder sound
        playerPos2=8;//Bottom of ladder          
        climb++;//Delay the ladder animation
        if (climb==10) {
          playerPos2 = 17;//Moves to top of ladder        
          climb=0;//Reset fall delay
        }
      }
      if (playerPos2==9) {//Checks if piece 3 is on 9th square      
        up=true;//Play ladder sound
        playerPos2=9;//Bottom of ladder   
        climb++;//Delay the ladder animation
        if (climb==10) {
          playerPos2 = 11;//Moves to top of ladder        
          climb=0;//Reset fall delay
        }
      }

      //ladders for fourth piece
      if (playerPos3==2) {//Checks if piece 4is on 2th square         
        up=true;//Play ladder sound
        playerPos3=2;//Bottom of ladder
        climb++;//Delay the ladder animation
        if (climb==10) {
          playerPos3 = 10;//Moves to top of ladder        
          climb=0;//Reset fall delay
        }
      }
      if (playerPos3==5) {//Checks if piece 4 is on 5th square         
        up=true;//Play ladder sound
        playerPos3=5;//Bottom of ladder
        climb++;//Delay the ladder animation
        if (climb==10) {
          playerPos3 = 16;//Moves to top of ladder        
          climb=0;//Reset fall delay
        }
      }
      if (playerPos3==8) {//Checks if piece 4 is on 8th square         
        up=true;//Play ladder sound
        playerPos3=8;//Bottom of ladder      
        climb++;//Delay the ladder animation
        if (climb==10) {
          playerPos3 = 17;//Moves to top of ladder        
          climb=0;//Reset fall delay
        }
      }
      if (playerPos3==9) {//Checks if piece 4 is on 9th square       
        up=true;//Play ladder sound
        playerPos3=9;//Bottom of ladder     
        climb++;//Delay the ladder animation
        if (climb==10) {
          playerPos3 = 11;//Moves to top of ladder        
          climb=0;//Reset fall delay
        }
      }

      //Snakes for first piece
      if (playerPos==13) {//Checks if piece 1 is on 13th square   
        down=true;//Play snake sound
        playerPos=13;//Top of snake   
        fall++;//Delay the snake animation
        if (fall==10) {
          playerPos=3;//Bottom of snake    
          fall=0;//Reset fall delay//Reset fall delay
        }
      }
      if (playerPos==18) {//Checks if piece 1 is on 18th square 
        down=true;//Play snake sound
        playerPos=18;//Top of snake                  
        fall++;//Delay the snake animation
        if (fall==10) {
          playerPos=7;//Bottom of snake              
          fall=0;//Reset fall delay
        }
      }
      if (playerPos==23) {//Checks if piece 1 is on 23th square 
        down=true;//Play snake sound
        playerPos=23;//Top of snake                  
        fall++;//Delay the snake animation
        if (fall==10) {
          playerPos=15;//Bottom of snake              
          fall=0;//Reset fall delay
        }
      }
      if (playerPos==21) {//Checks if piece 1 is on 21th square 
        down=true;//Play snake sound
        playerPos=21;//Top of snake                  
        fall++;//Delay the snake animation
        if (fall==10) {
          playerPos=19;//Bottom of snake              
          fall=0;//Reset fall delay
        }
      }
      //Snakes for second piece
      if (playerPos1==13) {//Checks if piece 2 is on 13th square 
        down=true;//Play snake sound
        playerPos1=13;//Top of snake                  
        fall++;//Delay the snake animation
        if (fall==10) {
          playerPos1=3;//Bottom of snake              
          fall=0;//Reset fall delay
        }
      }
      if (playerPos1==18) {//Checks if piece 2 is on 18th square 
        down=true;//Play snake sound
        playerPos1=18;//Top of snake                  
        fall++;//Delay the snake animation
        if (fall==10) {
          playerPos1=7;//Bottom of snake              
          fall=0;//Reset fall delay
        }
      }
      if (playerPos1==23) {//Checks if piece 2 is on 23th square 
        down=true;//Play snake sound
        playerPos1=23;//Top of snake                
        fall++;//Delay the snake animation
        if (fall==10) {
          playerPos1=15;//Bottom of snake              
          fall=0;//Reset fall delay
        }
      }
      if (playerPos1==21) {//Checks if piece 2 is on 21th square 
        down=true;//Play snake sound
        playerPos1=21;//Top of snake                  
        fall++;//Delay the snake animation
        if (fall==10) {
          playerPos1=19;//Bottom of snake              
          fall=0;//Reset fall delay
        }
      }
      //Snakes for third piece
      if (playerPos2==13) {//Checks if piece 3 is on 13th square 
        down=true;//Play snake sound
        playerPos2=13;//Top of snake                  
        fall++;//Delay the snake animation
        if (fall==10) {
          playerPos2=3;//Bottom of snake              
          fall=0;//Reset fall delay
        }
      }
      if (playerPos2==18) {//Checks if piece 3 is on 18th square 
        down=true;//Play snake sound
        playerPos2=18;//Top of snake                  
        fall++;//Delay the snake animation
        if (fall==10) {
          playerPos2=7;//Bottom of snake              
          fall=0;//Reset fall delay
        }
      }
      if (playerPos2==23) {//Checks if piece 3 is on 23th square 
        down=true;//Play snake sound
        playerPos2=23;//Top of snake                  
        fall++;//Delay the snake animation
        if (fall==10) {
          playerPos2=15;//Bottom of snake              
          fall=0;//Reset fall delay
        }
      }
      if (playerPos2==21) {//Checks if piece 3 is on 21th square 
        down=true;//Play snake sound
        playerPos2=21;//Top of snake                  
        fall++;//Delay the snake animation
        if (fall==10) {
          playerPos2=19;//Bottom of snake              
          fall=0;//Reset fall delay
        }
      }
      //Snakes for fourth piece
      if (playerPos3==13) {//Checks if piece 1 is on 13th square 
        down=true;//Play snake sound    
        playerPos3=13;//Top of snake                  
        fall++;//Delay the snake animation
        if (fall==10) {
          playerPos3=3;//Bottom of snake              
          fall=0;//Reset fall delay
        }
      }
      if (playerPos3==18) {//Checks if piece 1 is on 18th square  
        down=true;//Play snake sound      
        playerPos3=18;//Top of snake                  
        fall++;//Delay the snake animation
        if (fall==10) {
          playerPos3=7;//Bottom of snake           
          fall=0;//Reset fall delay
        }
      }
      if (playerPos3==23) {//Checks if piece 1 is on 23th square      
        down=true;//Play snake sound    
        playerPos3=23;//Top of snake                  
        fall++;//Delay the snake animation
        if (fall==10) {
          playerPos3=15;//Bottom of snake              
          fall=0;//Reset fall delay
        }
      }
      if (playerPos3==21) {//Checks if piece 1 is on 21th square     
        down=true;//Play snake sound     
        playerPos3=21;//Top of snake                  
        fall++;//Delay the snake animation
        if (fall==10) {
          playerPos3=19;//Bottom of snake                
          fall=0;//Reset fall delay
        }
      }
      if (up==true) {//Ladder sound
        ladder.play();//Play ladder sound
        laddercount++;//Counter for rewinding
        if (laddercount==10) {
          ladder.rewind();//Rewind lader sound
          laddercount=0;//Reset ladder sound counter
        }
        up=false;//Turns off ladder sound
      }

      if (down==true) {//Snake sound
        snake.play();//Play snake sound
        snakecount++;//Counter for rewinding
        if (snakecount==10) {
          snake.rewind();//Rewind snake sound
          snakecount=0;//Reset snake sound counter
        }
        down=false;//Turns off snake sound
      }
    }
    if (playerPos>=24) {//Checks if player 1's piece is at the end of the board
      playerPos=24;//Draws player one at the last square
      done=true;//Start end game animation
      image(red, 504-20, 56-20);
      game=false;//Game is done
      winner = 1;//States the winner is player 1
    }

    if (playerPos1>=24) {//Checks if player 2's piece is at the end of the board
      playerPos1=24;//Draws player one at the last square
      done=true;//Start end game animation
      image(green, 504+20, 56-20);
      game=false;//Game is done
      winner = 2;//States the winner is player 2
    }
    if (playerPos2>=24) {//Checks if player 3's piece is at the end of the board
      playerPos2=24;//Draws player one at the last square
      done=true;//Start end game animation
      image(blue, 504-20, 56+30);
      game=false;//Game is done
      winner = 3;//States the winner is player 3
    }
    if (playerPos3>=24) {//Checks if player 4's piece is at the end of the board
      playerPos3=24;//Draws player one at the last square
      done=true;//Start end game animation
      image(yellow, 504+20, 56+30);
      game=false;//Game is done
      winner = 4;//States the winner is player 4
    }


    if (done==true) {//Rectangle end game animation
      fill(246, 166, 29);//Sets background colour
      r1 = r1 + 10;//First rectangle increase x coordinate
      r2 = r2 - 10;//Second rectangle decrease x coordinate

      rect(0, 0, r1, 600);
      rect(800, 0, r2, 600); 
      if (r1 == 400 && r2 == -400) {//If the rectangles meet, send to final end game screen
        on =false;
      }
    }

    if (on==false) {//End Game Screen
      endgame.play();//play winner sound
      if (winner==1) {//If the winner is player 1
        score=q;//Set the score to equal the number of moves made to win
      }
      if (winner==2) {//If the winner is player 2
        score=q1;//Set the score to equal the number of moves made to win
      }
      if (winner==3) {//If the winner is player 3
        score=q2;//Set the score to equal the number of moves made to win
      }
      if (winner==4) {//If the winner is player 4
        score=q3;//Set the score to equal the number of moves made to win
      }


      //Congratulation Screen
      background(246, 166, 29);//Sets background colour
      fill(0);
      textFont(f);
      text("Congratulations!!!", 200, 110);
      text("Player "+winner+" has won!", 195, 200);
      textFont(f7);
      text("Vist the high score section to see if you ", 60, 310);
      text("if you have made it on to the leaderboard!", 45, 370);

      fill(255);
      strokeWeight(3);
      rect(80, 460, 300, 75, 10, 10, 10, 10);
      rect(440, 460, 300, 75, 10, 10, 10, 10);
      image(highscore, 55, 465);
      image(exit3, 415, 465);
      fill(0);
      text("High Score", 130, 510);
      text("Exit Game", 490, 510);
      textFont(f2);
      text("*Click High Score or your score will not save!", 300, 580);


      if (mouseX > 80 && mouseX < 380 && mouseY > 460 && mouseY < 535 && mousePressed) {//High Score Button

        if (score < int(winnerscore[0])) {//Check if the new score is less than the current first place score
          winnerscore[4]=winnerscore[3];//Move highscore 3 to 4
          winnerscore[3]=winnerscore[2];//Move highscore 2 to 3
          winnerscore[2]=winnerscore[1];//Move highscore 1 to 2
          winnerscore[1]=winnerscore[0];//moves highscore 0 to 1
          winnerscore[0]= str(score);//Set new score as first place
        } else if (score < int(winnerscore[1])) {//Check if the new score is less than the current second place score
          winnerscore[4]=winnerscore[3];//Move highscore 3 to 4
          winnerscore[3]=winnerscore[2];//Move highscore 2 to 3
          winnerscore[2]=winnerscore[1];//Move highscore 1 to 2
          winnerscore[1]=str(score);//Set new score as second place
        } else if (score < int(winnerscore[2])) {//Check if the new score is less than the current third place score
          winnerscore[4]=winnerscore[3];//Move highscore 3 to 4
          winnerscore[3]=winnerscore[2];//Move highscore 2 to 3
          winnerscore[2]=str(score);//Set new score as third place
        } else if (score < int(winnerscore[3])) {//Check if the new score is less than the current fourth place score
          winnerscore[4]=winnerscore[3];//Move highscore 3 to 4
          winnerscore[3]=str(score);//Set new score as fourth place
        } else if (score < int(winnerscore[4])) {//Check if the new score is less than the current fifth place score
          winnerscore[4]=str(score);//Set new score as fifth place
        }

        saveStrings("Scores.txt", winnerscore);//Save new highscores in .txt file
        i = 6;
      }
      if (mouseX > 440 && mouseX < 770 && mouseY > 460 && mouseY < 535 && mousePressed) {//Exit Button
        exit();
      }
    }
    break;
  case 6://End Game High Score Menu
    saveStrings("Scores.txt", winnerscore);//Save new highscores in .txt file
    background(246, 166, 29);//Sets background colour
    exit1.resize(65, 65);
    image(exit3, 722, 10);

    if (mouseX > 722 && mouseX <  800 && mouseY >  0 && mouseY <  75 && mousePressed) {//Exit Button
      exit();
    }
    //Draws the chart
    fill(255);
    rect(225, 35, 350, 75, 10, 10, 10, 10);
    rect(40, 250, 720, 300, 20, 20, 20, 20);
    line(400, 250, 400, 550);
    line(40, 300, 760, 300);
    line(40, 350, 760, 350);
    line(40, 400, 760, 400);
    line(40, 450, 760, 450);
    line(40, 500, 760, 500);

    fill(0);
    textFont(f);
    text("High Score", 289, 90);
    textFont(f5); //Set the current font
    text("Rank", 200, 287);
    text("Score", 550, 287);
    text("1", 220, 340);
    text("2", 220, 390);
    text("3", 220, 440);
    text("4", 220, 490);
    text("5", 220, 540);

    //Outputs appropriate scores from .txt file
    text(winnerscore[0], 570, 340); 
    text(winnerscore[1], 570, 390); 
    text(winnerscore[2], 570, 440); 
    text(winnerscore[3], 570, 490); 
    text(winnerscore[4], 570, 540); 


    textFont(f2);
    text("High scores are given to only the first place player from each match.", 30, 145);
    text("You score will be based on the least number of moves the player took.", 20, 180);
    text("Try to reach 25 with the least number of moves!", 135, 212);
    text(" Good Luck!", 330, 240);
    image(gold, 180, 303);
    image(silver, 180, 353);
    image(bronze, 180, 403);
    break;
  }
}

void mouseReleased() {
  if (gameplaying == true && v == true) {//Checks if it is an appropriate time to move
    if (playerturn ==1) {//Checks if it is player 1's turn
      playerPos = playerPos + diceroll + 1;//The random dice integer is added to the first player's position
      b = 1;//States current player's turn
      q = q+1;//Adds one to the number of moves made for first player
    } else if (playerturn ==2) {//Checks if it is player 2's turn
      playerPos1 = playerPos1 + diceroll + 1;//The random dice integer is added to the second player's position
      b = 2;//States current player's turn
      q1 = q1+1;//Adds one to the number of moves made for second player
    } else if (playerturn ==3) {//Checks if it is player 3's turn
      playerPos2 = playerPos2 + diceroll + 1;//The random dice integer is added to the third player's position
      b = 3;//States current player's turn
      q2 = q2+1;//Adds one to the number of moves made
    } else if (playerturn ==4) {//Checks if it is player 4's turn for third player
      playerPos3 = playerPos3 + diceroll + 1;//The random dice integer is added to the fourth player's position
      b = 4;//States current player's turn
      q3 = q3+1;//Adds one to the number of moves made for fourth player
    }
  }
}