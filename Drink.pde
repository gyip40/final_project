private PImage toppingImage;

public class Drink {
  //private static int orderNum = -1;
  
  private Menu menu;
  private Boba boba;
  private String drinkColor;
  
  public Drink() {
    menu = new Menu();
    menu.generateBoba();
    boba = new Boba();
    boba = menu.getBoba();
    drinkColor = "";
    //orderNum++;
  }
  
  public Boba getBoba() {
    return boba;
  }
  
  public void translate(int x, int y) {
    textAlign(CENTER, CENTER);
    String translation = "";
    switch (boba.getSize()) {
      case 1:
        translation += "small";
        break;
      case 2:
        translation += "medium";
        break;
      case 3:
        translation += "large";
        break;
    }
    switch (boba.getDrink()) {
      case "oolong tea":
        drinkColor += "#da7800";
        break;
      case "black tea":
        drinkColor += "#971e09";
        break;
      case "milk tea":
        drinkColor += "#c6945f";
        break;
      case "green tea":
        drinkColor += "#55740d";
        break;
      case "fresh milk":
        drinkColor += "#ded7c6";
        break;
    }
    translation += " " + boba.getDrink() + "\nwith ";
    fill(0);
    translation += boba.getTopping() + ",\n";
    switch (boba.getIceLevel()) {
      case 0:
        translation += "no";
        break;
      case 25:
        translation += "less";
        break;
      case 50:
        translation += "regular";
        break;
    }
    translation += " ice,\n";
    switch (boba.getSugarLevel()) {
      case 0:
        translation += "no";
        break;
      case 25:
        translation += "half";
        break;
      case 50:
        translation += "regular";
        break;
      case 75:
        translation += "extra";
        break;
    }
    translation += " sugar";
    text(translation, x, y);
  }
  
  void order(int x, int y, int num) {
    stroke(0);
    strokeWeight(1);
    fill(255);
    rect(x - 85, y - 100, 170, 40);
    fill(0);
    textAlign(CENTER, CENTER);
    text("ORDER #" + num, x, y - 75);
    fill(#d7b68d, 100);
    for (int i = 0; i < 5; i++) {
      rect(x - 30, y - 110, 60, 20);
    }
    fill(255);
    rect(x - 85, y - 60, 170, 120);
    translate(x, y);
    fill(255, 60);
    line(x - 75, y - 25, x + 75, y - 25);
    line(x - 75, y - 1, x + 75, y - 1);
    line(x - 75, y + 22, x + 75, y + 22);
    line(x - 75, y + 44, x + 75, y + 44);
  }
  
  void drawBottle() {
    strokeWeight(3);
    strokeJoin(ROUND);
    strokeCap(ROUND);
    stroke(255);
    fill(255, 30);
    if (boba.getSize() == 1) {
      quad(400, 725, 600, 725, 635, 400, 365, 400);
    }
    if (boba.getSize() == 2) {
      quad(400, 725, 600, 725, 642, 335, 358, 335);
    }
    if (boba.getSize() == 3) {
      quad(400, 725, 600, 725, 649, 270, 351, 270);
    }
  }
  
  void drawTop() {
    strokeWeight(3);
    strokeJoin(ROUND);
    strokeCap(ROUND);
    stroke(255);
    fill(255, 80);
    if (boba.getSize() == 1) {
      arc(500, 400, 270, 270, PI, TWO_PI);
      rect(355, 390, 290, 20);
      for (int i = 360; i < 645; i += 10) {
        strokeWeight(2);
        line(i, 390, i, 405);
      }
    }
    if (boba.getSize() == 2) {
      arc(500, 335, 284, 284, PI, TWO_PI);
      rect(348, 325, 304, 20);
      for (int i = 353; i < 652; i += 14) {
        strokeWeight(2);
        line(i, 325, i, 340);
      }
    }
    if (boba.getSize() == 3) {
      arc(500, 270, 298, 298, PI, TWO_PI);
      rect(341, 260, 318, 20);
      for (int i = 346; i < 659; i += 11) {
        strokeWeight(2);
        line(i, 260, i, 275);
      }
    }
  }
  
  void drawTopping(String topping) {
    PImage toppingImage = loadImage(topping + ".png");
    image(toppingImage, 0, 0, 1000, 800);
  }
  
  void drawIce(int iceLevel) {
    PImage iceImage = loadImage("ice" + iceLevel + ".png");
    image(iceImage, 0, 0, 1000, 800);
  }
  
  void drawSugar(int sugarLevel) {
    PImage sugarImage = loadImage("sugar" + sugarLevel + ".png");
    tint(255, 200.0);
    image(sugarImage, 0, 0, 1000, 800);
    noTint();
  }
  
  void drawTea(String tea) {
    PImage teaImage = loadImage(tea + boba.getSize() + ".png");
    tint(255, 100.0);
    image(teaImage, 0, 0, 1000, 800);
    noTint();
  }
}