class Player {
  int px;
  int py;
  int psizey = 160;
  int psizex = 40;
  float sprint;
  float walk;
  float jump;
  float down1 = 3;
  int pricht = 2;
  int gamemode = 0;
  int ju = 100;
  float faktor = 1.05;
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
  PImage bsel;

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
    bsel = loadImage("/data/images/selector.png");
    bsel.resize(block.bsize, block.bsize);
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
    bhover();
    mainI.hotbar();
    gravitation();
    crosshairs();
  }

  void movement() {
    if (menu.pause == false && mainI.inv == false) {
      if (left) {
        pricht = 1;
        px -= walk * sprint;
      }
      if (right) {
        pricht = 2;
        px += walk * sprint;
      }
      if (down && overblock == false && up == false) {
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

      if (up && overblock == true && gamemode == 0 && hold == false && down == false && ju >= 20) {
        up = false;
        hold = true;
        ju = 0;
      } else if (up && gamemode != 0  && down == false) {
        py-= jump / 15;
      }
      if (ju < 20) {
        ju++;
        py -= 4;
      }
    }
  }

  void crosshairs() {
    if (menu.pause == false) {
      cursor(CROSS);
    }
  }

  void blocksel() {
    for (int i=0; i < block.banz; i++) {
      if (mouseX > block.bx[i] && mouseX < block.bx[i]+block.bsize && mouseY > block.by && mouseY < block.by+block.bsize && menu.pause == false && mainI.inv == false) {
        if (mouseButton == LEFT) {
          block.bsee[i] = false;
          println(block.bsee);
        }
        //if (mouseButton == RIGHT) {
        //    block.bsee[i] = true;
        //}
      }
    }
  }

  void bhover() {
    for (int i=0; i < block.banz; i++) {
      if (mouseX > block.bx[i] && mouseX < block.bx[i]+block.bsize && mouseY > block.by && mouseY < block.by+block.bsize && menu.pause == false && mainI.inv == false) {
        tint(0, 0, 0, 110);
        image(bsel, block.bx[i], block.by);
      } else {
        noTint();
      }
    }
  }

  void gravitation() {
    if (overblock == false && menu.pause == false && gamemode != 1 && ju >= 20) {
      py+= down1 * faktor;
      faktor += 0.15;
    }
  }

  void reset() {
    px = 160;
    py = height-240;
    menu.pause = false;
    menu.ppressed = false;
    down = false;
    up = false;
    hold = false;
    right = false;
    left = false;
  }
}
