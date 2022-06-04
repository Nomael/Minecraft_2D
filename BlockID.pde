class BlockID{
  int blockID[] = {11, 2, 1, 17, 0};
  String blockname[] = {"Dirt", "Grass", "Stone", "Wood", "Air"};
  String BIDName[] = new String[blockname.length];
  
  BlockID(){
    for(int i=0; i < blockID.length; i++){
       BIDName[i] = blockname[i] + " : " + blockID[i];
       println(BIDName[i]);
    }
  }
}
