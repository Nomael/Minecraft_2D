class Menu {
  PFont DFMC;
  PFont SPMC;
  PImage leave;
  PImage leave_over;
  PImage resume;
  PImage resume_over;
  PImage play;
  PImage play_over;
  PImage quit;
  PImage quit_over;
  int menunav = 1;
  boolean pause = false;
  boolean ppressed = false;

  Menu(String iconname) {
    surface.setTitle(TITLE);
    surface.setIcon(loadImage("/data/images/" + iconname + ".png"));
    DFMC = createFont("/data/fonts/Default_Old_MC.ttf", 10);
    //SPMC = loadFont("/data/fonts/Special_MC.ttf");
    leave = loadImage("/data/images/leave.png");
    resume = loadImage("/data/images/resume.png");
    leave_over = loadImage("/data/images/leave_over.png");
    resume_over = loadImage("/data/images/resume_over.png");
    play = loadImage("/data/images/play.png");
    quit = loadImage("/data/images/quit.png");
    play_over = loadImage("/data/images/play_over.png");
    quit_over = loadImage("/data/images/quit_over.png");
    
  }

  void changeAppTitle(String title) {
    surface.setTitle(title);
  }

  void mainnav() {
    if (menunav == 1) {
      cursor(ARROW);
      imageMode(CENTER);
      if (mouseX > width/2 - 300 && mouseX < width/2 + 300 && mouseY < height/2 - 130 && mouseY > height/2 - 190) {
        image(play_over, width/2, height/2-160);
        cursor(HAND);
        if (mousePressed) {
          menunav = 2;
          player.reset();
        }
      } else {
        image(play, width/2, height/2-160);
      }
      if (mouseX > width/2 - 150 && mouseX < width/2 + 150 && mouseY < height/2 + 190 && mouseY > height/2 + 130) {
        cursor(HAND);
        image(quit_over, width/2, height/2+160);
        if (mousePressed) {
          exit();
        }
      } else {
        image(quit, width/2, height/2+160);
      }
      imageMode(CORNER);
    }
  }

  void pause() {
    if (keyCode == ESC && pause == false && ppressed == false) {
      pause = true;
      keyCode = 0;
    } else if (keyCode == ESC && ppressed == false) {
      pause = false;
      keyCode = 0;
    }
    if (pause) {
      cursor(ARROW);
      imageMode(CENTER);
      if (mouseX > width/2 - 300 && mouseX < width/2 + 300 && mouseY < height/2 - 30 && mouseY > height/2 - 90) {
        image(resume_over, width/2, height/2-60);
        cursor(HAND);
        if (mousePressed) {
          pause = false;
        }
      } else {
        image(resume, width/2, height/2-60);
      }
      if (mouseX > width/2 - 300 && mouseX < width/2 + 300 && mouseY < height/2 + 90 && mouseY > height/2 + 30) {
        image(leave_over, width/2, height/2+60);
        cursor(HAND);
        if (mousePressed) {
          menunav = 1;
          //exit();
        }
      } else {
        image(leave, width/2, height/2+60);
      }
      imageMode(CORNER);
    }
  }
}
