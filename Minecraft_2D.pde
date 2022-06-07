BlockID BID; //<>//
Block block;
Items block_item;
Menu menu;
Player player;
Inventory mainI;
Worldgen wgen;

PImage gamebg;
PImage mainbg;

String TITLE = "2D Minecraft by Noel and Marlon";


void setup() {
  size(1760, 880);
  //frameRate(99999999999999L);
  BID = new BlockID();
  wgen = new Worldgen(); // Worldgeneration WIP
  block = new Block(BID.blockname[2]); // Name of the Ground Block
  block_item = new Items();
  menu = new Menu("Mcicon512x512");
  player = new Player(180, height-240, 1, 2, 80); //x-Koordinate, y-Koordinate, Sprintgeschwindigtkeit, Gehen, Sprung
  mainI = new Inventory(3); //Größe - Hotbar,

  gamebg = loadImage("/data/images/background.png");
  gamebg.resize(width, height);

  mainbg = loadImage("/data/images/mainmenubg.png");
  mainbg.resize(width, height);
}

void draw() {
  /* Main Menu */
  if (menu.menunav == 1) {
    image(mainbg, 0, 0);
    menu.mainnav();
  }

  /* In-Game */
  if (menu.menunav == 2) {
    image(gamebg, 0, 0);
    block.display(0, height - block.bsize);
    wgen.grid();
    player.display();
    fps();
    menu.pause();
    //println(player.asee + " | " + player.alsee);
  }
}

void fps() {
  textFont(menu.DFMC);
  textSize(50);
  textAlign(0, 0);
  fill(255);
  text((int) (frameRate), 20, 50);
}

void mousePressed() {
  player.blocksel();
}


void keyPressed() {
  if (menu.menunav == 1) {
    if (keyCode == ESC) {
      key = 0;
    }
  }

  if (menu.menunav == 2) {
    if (keyCode == ESC) {
      key = 0;
      menu.ppressed = true;
      mainI.inv = false;
    }

    /* Player Movement */
    if (keyCode == 65) {
      player.left = true;
    }
    if (keyCode == 68) {
      player.right = true;
    }
    if (keyCode == 32 || keyCode == 87) {
      player.up = true;
    }
    if (keyCode == 17) {
      player.down = true;
    }
    if (keyCode == 16) {
      player.sprint = 2.5;
    }

    /* Inventar ON/OFF */
    if (keyCode == 69 && mainI.inv == false && player.asee == true) {
      mainI.inv = true;
    } else if (keyCode == 69 && mainI.inv == true) {
      mainI.inv = false;
    }

    /* Hotbar ON/OFF */
    if (keyCode == TAB && player.alsee == -1 && mainI.inv == false) {
      player.asee = false;
    }
    if (keyCode == TAB && player.alsee == 1 && mainI.inv == false) {
      player.asee = true;
    }

    /* Hotbar Keys */
    if (keyCode == 49) {
      mainI.shbx = mainI.hbx;
    } else if (keyCode == 50) {
      mainI.shbx = mainI.hbx+44;
    } else if (keyCode == 51) {
      mainI.shbx = mainI.hbx+44*2;
    } else if (keyCode == 52) {
      mainI.shbx = mainI.hbx+44*3;
    } else if (keyCode == 53) {
      mainI.shbx = mainI.hbx+44*4;
    } else if (keyCode == 54) {
      mainI.shbx = mainI.hbx+44*5;
    } else if (keyCode == 55) {
      mainI.shbx = mainI.hbx+44*6;
    } else if (keyCode == 56) {
      mainI.shbx = mainI.hbx+44*7;
    } else if (keyCode == 57) {
      mainI.shbx = mainI.hbx+44*8;
    }
  }
}

void keyReleased() {
  if (menu.menunav == 2) {
    menu.ppressed = false;
    if (keyCode == 65) {
      player.left = false;
    }

    /* Player Movement */
    if (keyCode == 68) {
      player.right = false;
    }
    if (keyCode == 32 || keyCode == 87) {
      player.up = false;
      player.hold = false;
    }
    if (keyCode == 17) {
      player.down = false;
    }
    if (keyCode == 16) {
      player.sprint = player.walk;
    }

    /* Hotbar ON/OFF */
    if (keyCode == TAB) {
      player.alsee *= -1;
    }
  }
}
