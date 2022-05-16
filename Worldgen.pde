class Worldgen {
  int anz;
  boolean blockover[] = new boolean[anz];

  Worldgen(int anzahl) {
    this.anz = anzahl;
  }

  void bgen() {
    for (int i=0; i < width; i+= block.bsize) {
      block.display(0+i, height - block.bsize);
    }
  }
}
