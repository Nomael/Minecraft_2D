class Player {
  float px;
  float py;
  int psizey = 160;
  int psizex = 40;
  float sprint;
  float walk;
  float jump;
  float down1 = 3;
  int pricht = 2;
  int gamemode = 1;
  boolean up;
  boolean down;
  boolean left;
  boolean right;
  boolean overblock = false;
  boolean hold = false;
  PImage rcplayer;
  PImage lcplayer;
  PImage rplayer;
  PImage lplayer;

  int ggr = 80;
  int iggr = 80;
  int gcen = 20;

  Player(int x, int y, float psprint, float pwalk, float pjump) {
    this.px = x;
    this.py = y;
    this.sprint = psprint;
    this.walk = pwalk;
    this.jump = pjump;


    lplayer = loadImage("/data/images/steve_left.png");
    lplayer.resize(psizex, psizey);
    rplayer = loadImage("/data/images/steve_right.png");
    rplayer.resize(psizex, psizey);
    lcplayer = loadImage("/data/images/steve_left_c.png");
    lcplayer.resize((int)(psizex*2.1), (int)(psizey*1.08));
    rcplayer = loadImage("/data/images/steve_right_c.png");
    rcplayer.resize((int)(psizex*2.1), (int)(psizey*1.08));
  }

  void display() {
    if (pricht == 1) {
      image(lplayer, px, py);
    } else if (pricht == 2) {
      image(rplayer, px, py);
    } else if (pricht == 3) {
      image(lcplayer, px-20, py);
    } else if (pricht == 4) {
      image(rcplayer, px-20, py);
    }
    movement();
    mainI.hotbar();
    gravitation();
  }

  void movement() {
    if (menu.pause == false) {
      if (left) {
        pricht = 1;
        px -= walk * sprint;
      }
      if (right) {
        pricht = 2;
        px += walk * sprint;
      }
      if (down && overblock == false) {
        if (up == false) {
          py+= jump / 15;
        }
      }
      if (pricht == 1) {
        pricht = 3;
      }
      if (pricht == 3 && down == false) {
        pricht = 1;
        
      }
      if (pricht == 2) {
        pricht = 4;
      }
      if (pricht == 4 && down == false) {
        pricht = 2;
      }

      if (up && overblock == true && gamemode == 0 && hold == false) {
        py-= jump;
        up = false;
        hold = true;
      } else if (up && gamemode != 0) {
        py-= jump / 15;
      }
    }
  }

  void grid() {
    for (float x= 0; x < 7; x++) {
      for (float y= 0; y < 6; y++) {
        noFill();
        rect((px-ggr*3-20)+(ggr*x), (py-ggr*2)+(ggr*y), ggr, ggr);
      }
    }
  }
  void grid2() {
    for (float x= 0; x < 25; x++) {
      for (float y= 0; y < 15; y++) {
        noFill();
        rect(iggr*x-gcen, 20+(iggr*y), iggr, iggr);
      }
    }
  }

  void blocksel() {
    if (mouseX > (px-ggr*3-20) && mouseX < (px-ggr*3-20)+(ggr*7) && mouseY > (py-ggr*2) && mouseY < (py-ggr*2)+(ggr*6)) {
      //for (float x= 0; x < 7; x++) {
      //  for (float y= 0; y < 6; y++) {
      //  }
      //}
      image(block.block, width/2, height/2);
      println("Hallo");
    }
  }

  void gravitation() {
    if (overblock == false && menu.pause == false && gamemode != 1) {
      py+= down1;
    }
  }
}
