class BlockID {
  int blockID[] = {0, 1, 2, 11, 17};
  String blockIDZ[] = new String[blockID.length];
  String blockname[] = {"air", "stone", "grass", "dirt", "wood"};
  String BIDName[] = new String[blockname.length];

  BlockID() {
    for (int i=0; i < blockID.length; i++) {
      blockIDZ[i] = nf(blockID[i], 4);
      BIDName[i] = blockname[i] + " (#" + blockIDZ[i] + ")";
      println("minecraft:" + BIDName[i]);
    }
  }
}
