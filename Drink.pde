public class Drink {
  private Menu menu;
  private Boba boba;
  private String drinkColor;
  private String together;
  
  public Drink() {
    menu = new Menu();
    menu.generateBoba();
    boba = new Boba();
    boba = menu.getBoba();
    drinkColor = "";
    together = "";
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
        together += "#d7a96b";
        break;
      case "black tea":
        drinkColor += "#971e09";
        together += "#9d493a";
        break;
      case "milk tea":
        drinkColor += "#c6945f";
        together += "#be966b";
        break;
      case "green tea":
        drinkColor += "#55740d";
        together += "#7e914a";
        break;
      case "fresh milk":
        drinkColor += "#ded7c6";
        together += "#f7efdf";
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
  
  void drawDrink() {
    strokeWeight(3);
    strokeJoin(ROUND);
    strokeCap(ROUND);
    stroke(255, 80);
    fill(255, 5);
    if (boba.getSize() == 1) {
      quad(400, 725, 600, 725, 635, 400, 365, 400);
    }
    if (boba.getSize() == 2) {
      quad(400, 725, 600, 725, 642, 335, 358, 335);
    }
    else {
      quad(400, 725, 600, 725, 649, 270, 351, 270);
    }
  }
}