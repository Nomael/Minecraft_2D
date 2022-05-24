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
    for (float x= 0; x < 25; x++) {
      for (float y= 0; y < 15; y++) {
        for (int i=0; i < gx; i++) {
          if (inGrid[i] == false) {
            noFill();
            rect(ggr*x, (ggr*y), ggr, ggr);
          }
        }
      }
    }
  }
}
