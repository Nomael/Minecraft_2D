class Worldgen {
  int anz;
  boolean blockover[] = new boolean[anz];

  Worldgen() {
  }

  void bgen() {
    for (int i=0; i < block.blockw; i+= block.bsize) {
      block.display(0, height - block.bsize, i);
    }
  }
}
