class Worldgen {
  int anz;
  boolean blockover[] = new boolean[anz];
  int gx = 25;
  int gy = 15;
  boolean inGrid[] = new boolean[gx+gy];
  int ggr = 80;

  Worldgen() {
  }

  void bgen() {
  }

  void grid() { // World Grid
    for (int x= 0; x < gx; x++) {
      for (float y= 0; y < gy; y++) {
        if (inGrid[x] == false) {
          noFill();
          rect(ggr*x, (ggr*y), ggr, ggr);
        }
      }
    }
  }
}
