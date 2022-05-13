Worldgen wgen; //<>//
Block block;
Menu menu;
Player player;
Inventory mainI;
PImage gamebg;
PImage mainbg;
String TITLE = "2D Minecraft from Noel and Marlon";

void setup() {
  size(1800, 900);
  wgen = new Worldgen(width);
  block = new Block("grass");
  menu = new Menu("Mcicon512x512");
  player = new Player(180, height-240, 1, 2, 80); //x-Koordinate, y-Koordinate, Sprintgeschwindigtkeit, Gehen, Sprung
  mainI = new Inventory(3); //Größe - Hotbar, 
  gamebg = loadImage("/data/images/background.png");
  gamebg.resize(width, height-50);
  mainbg = loadImage("/data/images/mainmenubg.png");
  mainbg.resize(width, height);
}

void draw() {
  if (menu.menunav == 1) {
    image(mainbg, 0, 0);
    menu.mainnav();
  }

  if (menu.menunav == 2) {
    image(gamebg, 0, 0);
    wgen.bgen();
    player.grid();
    player.grid2();
    player.blocksel();
    player.display();
    fps();
    menu.pause();
    //menu.pausepressed();
  }
}

void fps() {
  textFont(menu.DFMC);
  textSize(50);
  textAlign(0, 0);
  fill(255);
  text((int) (frameRate), 20, 50);
}

void keyPressed() {
  if (menu.menunav == 2) {
    if (keyCode == ESC) {
      key = 0;
    }
  }
  if (menu.menunav == 2) {
    if (keyCode == ESC) {
      key = 0;
      menu.ppressed = true;
    }
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
      player.walk = 1;
    }
    if (keyCode == 16) {
      player.sprint = 2.5;
    }
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
    if (keyCode == 68) {
      player.right = false;
    }
    if (keyCode == 32 || keyCode == 87) {
      player.up = false;
      player.hold = false;
    }
    if (keyCode == 17) {
      player.down = false;
      player.walk = 2;
    }
    if (keyCode == 16) {
      player.sprint = player.walk;
    }
  }
}