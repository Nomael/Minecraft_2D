class Inventory {
  PImage hotbar;
  PImage selHotbar;

  int hbx = width/2-200;
  int hby = height-60;
  int shbx = hbx;
  int shbgr = 48;
  int[] count;
  int number;

  Inventory(int number) {
    count = new int[number];
    this.number = number;
    hotbar = loadImage("/data/images/hotbar.png");
    hotbar.resize(400, 50);
    selHotbar = loadImage("/data/images/selhotbar.png");
    selHotbar.resize(shbgr, shbgr);
  }
  void hotbar() {
    if (menu.pause == false) {
      image(hotbar, hbx, hby);
      image(selHotbar, shbx, hby);
    }
  }
  void inv() {
    for (int i=0; i < number; i++) {
      image(hotbar, width/2, height/2 + i*50);
    }
  }
}
