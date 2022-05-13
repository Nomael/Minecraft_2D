class Block {
  String bname;
  int bsize = 80;
  PImage block;
  int bx;
  int by;


  Block(String bnames) {
    this.bname = bnames;
    block = loadImage("/data/images/" + bname + ".png");
    block.resize(bsize, bsize);
  }

  void display(int x, int y) {
    bx = x;
    by = y;
    image(block, x, y);
    coll();
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
