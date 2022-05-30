class Block {
  String bname;
  int bsize = 80;
  int banz = 25;
  //int blockw = bsize * banz;
  PImage block;
  boolean bsee[] = new boolean[banz];
  int bx[] = new int[banz];
  int by;


  Block(String bnames) {
    this.bname = bnames;
    block = loadImage("/data/images/" + bname + ".png");
    block.resize(bsize, bsize);

    for (int i=0; i < banz; i++) {
      bsee[i] = true;
    }
  }

  void display(int x, int y) {
    for (int i=0; i < banz; i++) {
      if (bsee[i] == true) {
        bx[i] = x+(i*bsize);
        by = y;
        image(block, x+(i*bsize), y);
        coll();
      }
    }
  }

  void coll() {
    if (player.py + player.psizey >= by) {
      player.py = by - player.psizey;
      player.overblock = true;
      player.faktor = 1.05;
      player.hold = false;
    } else {
      player.overblock = false;
    }
  }
}
