class Block {
  String bname;
  int bsize = 80;
  int blockw = bsize * 25;
  PImage block;
  boolean bsee[] = new boolean[blockw];
  int bx[] = new int[blockw];
  int by;


  Block(String bnames) {
    this.bname = bnames;
    block = loadImage("/data/images/" + bname + ".png");
    block.resize(bsize, bsize);
  }

  void display(int x, int y, int i) {
      bx[i] = x+i;
      by = y;
      image(block, x+i, y);
      coll();
      for (int z=0; z < blockw; z++) {
        bsee[z] = true;
      }
    }

  void coll() {
    if (player.py + player.psizey >= by) {
      player.py = by - player.psizey;
      player.overblock = true;
      player.hold = false;
    } else {
      player.overblock = false;
    }
  }
}
