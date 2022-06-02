class Inventory {
  PImage hotbar;
  PImage selHotbar;
  PImage invbar;
  PImage invRing;

  int hbx = width/2-200;
  int hby = height-60;
  int shbx = hbx;
  int shbgr = 48;
  int[] count;
  int number;

  boolean inv = false;

  Inventory(int number) {
    count = new int[number];
    this.number = number;
    
    hotbar = loadImage("/data/images/hotbar.png");
    hotbar.resize(400, 50);
    selHotbar = loadImage("/data/images/selhotbar.png");
    selHotbar.resize(shbgr, shbgr);
    invbar = loadImage("/data/images/inventory.png");
    invbar.resize(shbgr*9, shbgr);
    invRing = loadImage("/data/images/inventoryRing.png");
    invRing.resize(shbgr*9 + 36, shbgr + (number*48)+50);
  }
  void hotbar() {
    //if (menu.pause == false && inv == false) {
    //  image(hotbar, hbx, hby);
    //  image(selHotbar, shbx, hby);
    //}
    if (player.asee == true) {
      image(hotbar, hbx, hby);
      image(selHotbar, shbx, hby);
    }
    if (menu.pause == false) {
      inv();
    }
  }
  void inv() {
    if (inv == true) {
      for (int i=0; i < number; i++) {
        image(invbar, hbx-10, height/2 - i*48);
      }
      image(invRing, hbx-28, height/2- number-2 * 59);
    }
  }
}
