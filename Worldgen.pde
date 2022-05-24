class Worldgen {
  int anz;
  boolean blockover[] = new boolean[anz];
  int gx = 25;
  int gy = 15;
  boolean inGrid[] = new boolean[gx+gy];
  int ggr = 80;
  int i;
  int gridID[] = new int [height/ggr * width/ggr];
  int gridIDX[] = new int [height/ggr * width/ggr];
  int gridIDY[] = new int [height/ggr *width/ggr];


  Worldgen() {
  }

  void bgen() {
  }

  void grid() { // World Grid
    for (int x= 0; x < gx; x++) {
      for (int y= 0; y < gy; y++) {
        if (inGrid[x] == false) {
          noFill();
          if (i == 242) {
            i = 0;
          }
          gridIDX[i] = x;
          gridIDY[i] = y;
          i++;
          rect(ggr*x, (ggr*y), ggr, ggr);
        }
      }
    }
  }
}
