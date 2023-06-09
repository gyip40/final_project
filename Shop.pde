private PImage bell;
private PImage standard;
private PFont font;

private String name = "";
private int numOrders = -1;
private int currentScore = 0;
private int cummulativeScore = 0;
private boolean startTyping = false;
private boolean continueTyping = true;
private boolean started = false;
private boolean popUp1 = false;
private String[] dialogues0 = new String[] {"Are you ready to start?\n\n   Yes                  No",
                                            "What's your name?\n\n",
                                            "NAME PLACEHOLDER",
                                            "Let's get started.",
                                            "You'll get orders and your job is to fill out those\norders to the best of your ability.",
                                            "Let's practice."
                                           };
private String[] dialogues1 = new String[] {"That's it!",
                                            "There are more orders on the counter.\n\nClick on them to take more orders.",
                                           };
private String[] dialogues2 = new String[] {"That's all for today.\n\nThanks for your help.",
                                            "SCORE PLACEHOLDER",
                                           };
private int[] yesno0 = new int[] {1, 0, 0, 0, 0, 0, 0};
private int[] yesno1 = new int[] {0, 0, 0};
private int[] yesno2 = new int[] {0, 0, 0};
private boolean[] willContinue0 = new boolean[] {true, false, false, false, false, false, false};
private boolean[] willContinue1 = new boolean[] {true, false, false};
private boolean[] willContinue2 = new boolean[] {true, false, false};
private int tempChoice = 1;
private Dialogue dialogue0 = new Dialogue(dialogues0, yesno0, willContinue0, tempChoice);
private Dialogue dialogue1 = new Dialogue(dialogues1, yesno1, willContinue1, tempChoice);
private Dialogue dialogue2 = new Dialogue(dialogues2, yesno2, willContinue2, tempChoice);
private boolean bottle = false;
private Drink drink = new Drink();
private boolean topping = false;
private boolean ice = false;
private boolean tea = false;
private boolean sugar = false;
private String chosen_topping = "";
private int chosen_ice = 0;
private String chosen_tea = "";
private int chosen_sugar = 0;
private boolean started_bottle = false;
private boolean finished_bottle = false;
private int begin_time = 0;
private int finish_time = 0;
private int multiplier = 0;
private boolean popUp2 = false;

void setup() {
  frameRate(100);
  size(1000, 800);
  //load images
  bell = loadImage("shop_morning_bell.png");
  standard = loadImage("shop_morning.png");
  //load font
  font = loadFont("font2.vlw");
  noStroke();
  textFont(font);
  fill(0);
  textAlign(CENTER, CENTER);
}

void draw() {
  if (!started) {
    image(bell, 0, 0, width, height);
  }
  else {
    image(standard, 0, 0, width, height);
  }
  if (!started && mouseX > 345 && mouseX < 410 && mouseY > 435 && mouseY < 490) {
    text("START!", mouseX, mouseY - 20);
  }
  if (popUp1) {
    popUp();
    textAlign(LEFT, CENTER);
    fill(0);
    dialogue0.display();
    dialogue0.yesno();
    dialogue0.keyTyped();
    dialogue0.mouseClicked();
    delay(50);
    if (dialogue0.getChoice() == 0) {
      popUp1 = false;
      started = false;
      dialogue0.setChoice(1);
    }
    if (dialogue0.getCurrentNum() == 1) {
      startTyping = true;
      text("\n\n" + name, 40, 740);
    }
    if (dialogue0.getCurrentNum() == 1 && continueTyping == false) {
      dialogue0.setContinue(2, true);  
      dialogue0.setCurrentNum(2);
    }
    if (dialogue0.getCurrentNum() == 6) {
      popUp1 = false;
      bottle = true;
    }
  }
  if (bottle) {
    noStroke();
    fill(0, 100);
    rect(0, 0, 1000, 800);
    if (!(chosen_ice == 0)) {
      drink.drawIce(chosen_ice);
    }
    if (!(chosen_topping.equals(""))) {
      drink.drawTopping(chosen_topping);
    }
    if (!(chosen_sugar == 0)) {
      drink.drawSugar(chosen_sugar);
    }
    if (!(chosen_tea.equals(""))) {
      drink.drawTea(chosen_tea);
    }
    //System.out.println(multiplier);
    textAlign(LEFT, CENTER);
    //text(drink.getBoba().getDrink(), 0, 0);
    //text(drink.getBoba().getTopping(), 0, 0);
    //text(drink.getBoba().getIceLevel(), 0, 0);
    //text(drink.getBoba().getSugarLevel(), 0, 0);
    bottle();
    drink.order(180, 650, numOrders + 1);
    score();
  }
  if (numOrders == 0 && !bottle) {
    popUp2 = true;
  }
  if (popUp2) {
    noStroke();
    popUp();
    textAlign(LEFT, CENTER);
    fill(0);
    dialogue1.display();
    dialogue1.yesno();
    dialogue1.keyTyped();
    dialogue1.mouseClicked();
    if (bottle) {
      popUp2 = false;
    }
  }
  if (!bottle && numOrders >= 0) {
    noStroke();
    fill(255);
    quad(515, 635, 575, 600, 500, 600, 440, 635);
    if (started && numOrders < 3 && mouseX > 440 && mouseX < 575 && mouseY > 600 && mouseY < 635) {
      fill(0);
      text("TAKE ORDER!", mouseX, mouseY - 20);
    }
  }
  if (numOrders == 3) {
    dialogue2.setDialogue(1, "Your total score was " + cummulativeScore + ".\n\nNice job.");
    noStroke();
    popUp();
    textAlign(LEFT, CENTER);
    fill(0);
    dialogue2.display();
    dialogue2.yesno();
    dialogue2.keyTyped();
    dialogue2.mouseClicked();
    delay(50);
  }
}

void popUp() {
  fill(0, 40);
  rect(15, 690, 475, 100);
}

void bottle() {
  if (!started_bottle) {
    int s1 = second();
    int m1 = minute();
    int h1 = hour();
    //System.out.println(h1 + ", " + m1 + ", " + s1);
    started_bottle = true;
    //System.out.println(h1 + ", " + m1 + ", " + s1);
    //System.out.println(h1 + ", " + m1 + ", " + s1);
    //System.out.println(3600 * h1 + 60 * m1 + s1);
    begin_time = 3600 * h1 + 60 * m1 + s1;
  }
  drink.drawBottle();
  buttons();
  if (topping && tea && sugar && ice) {
    drink.drawTop();
    fill(0, 100);
    rect(80, 400, 200, 100);
    fill(255);
    textSize(20);
    textAlign(CENTER, CENTER);
    text("SCORE:", 180, 430);
    textSize(40);
    textSize(20);
    text(currentScore, 180, 465);
    fill(0, 100);
    rect(700, 675, 150, 50);
    fill(255);
    text("CONTINUE", 775, 700);
    textSize(20);
  }
}

public int score() {
  int s2 = second();
  int m2 = minute();
  int h2 = hour();
  if (sugar && !finished_bottle) {
    currentScore = 0;
    multiplier = 0;
    //int s2 = second();
    //int m2 = minute();
    //int h2 = hour();
    //System.out.println(h2 + ", " + m2 + ", " + s2);
    finished_bottle = true;
    //System.out.println(h2 + ", " + m2 + ", " + s2);
    //System.out.println(h2 + ", " + m2 + ", " + s2);
    //System.out.println(3600 * h2 + 60 * m2 + s2);
    finish_time = 3600 * h2 + 60 * m2 + s2;
    multiplier =  finish_time - begin_time;
    if (multiplier > 20) {
      multiplier = 1;
    }
    else if (multiplier == 20) {
      multiplier = 20;
    }
    else {
      multiplier = 20 - multiplier;
    }
    System.out.println(multiplier);
    //System.out.println(drink.getBoba().getTopping());
    //System.out.println(drink.getBoba().getIceLevel());
    //System.out.println(drink.getBoba().getDrink());
    //System.out.println(drink.getBoba().getSugarLevel());
    if (drink.getBoba().getTopping().equals(chosen_topping)) {
      currentScore += 100;
    }
    if (drink.getBoba().getIceLevel() == chosen_ice) {
      currentScore += 100;
    }
    if (drink.getBoba().getDrink().equals(chosen_tea)) {
      currentScore += 100;
    }
    if (drink.getBoba().getSugarLevel() == chosen_sugar) {
      currentScore += 100;
    }
    currentScore *= multiplier;
    cummulativeScore += currentScore;
    System.out.println(currentScore);
    System.out.println(cummulativeScore);
  }
  return currentScore;
}

void buttons() {
  noStroke();
  if (!topping) {
    fill(210);
    circle(330, 140, 100);
    circle(670, 140, 100);
    fill(255);
    circle(325, 140, 100);
    circle(500, 140, 100);
    circle(675, 140, 100);
    fill(0);
    textAlign(CENTER, CENTER);
    text("PEARLS", 325, 140);
    text("AIYU\nJELLY", 500, 140);
    text("GRASS\nJELLY", 675, 140);
  }
  else if (!ice) {
    fill(210);
    circle(330, 140, 100);
    circle(670, 140, 100);
    fill(255);
    circle(325, 140, 100);
    circle(500, 140, 100);
    circle(675, 140, 100);
    fill(0);
    textAlign(CENTER, CENTER);
    text("NO\nICE", 325, 140);
    text("LESS\nICE", 500, 140);
    text("REGULAR\nICE", 675, 140);
  }
  else if (!tea) {
    fill(210);
    circle(255, 140, 100);
    circle(378, 140, 100);
    circle(622, 140, 100);
    circle(745, 140, 100);
    fill(255);
    circle(250, 140, 100);
    circle(375, 140, 100);
    circle(500, 140, 100);
    circle(625, 140, 100);
    circle(750, 140, 100);
    fill(0);
    textAlign(CENTER, CENTER);
    text("OOLONG\nTEA", 250, 140);
    text("BLACK\nTEA", 375, 140);
    text("MILK\nTEA", 500, 140);
    text("GREEN\nTEA", 625, 140);
    text("FRESH\nMILK", 750, 140);
  }
  else if (!sugar) {
    fill(210);
    circle(280, 140, 100);
    circle(428, 140, 100);
    circle(572, 140, 100);
    circle(720, 140, 100);
    fill(255);
    circle(275, 140, 100);
    circle(425, 140, 100);
    circle(575, 140, 100);
    circle(725, 140, 100);
    fill(0);
    textAlign(CENTER, CENTER);
    text("NO\nSUGAR", 275, 140);
    text("HALF\nSUGAR", 425, 140);
    text("REGULAR\nSUGAR", 575, 140);
    text("EXTRA\nSUGAR", 725, 140);
  }
}

void mouseClicked() {
  if (!started && mouseX > 345 && mouseX < 410 && mouseY > 435 && mouseY < 490) {
    started = true;
    popUp1 = true;
  }
  if (bottle) {
    if (!topping) {
      if (mouseX > 275 && mouseX < 375 && mouseY > 90 && mouseY < 190) {
        chosen_topping = "pearls";
        topping = true;
        //System.out.println(chosen_topping);
      }
      else if (mouseX > 450 && mouseX < 550 && mouseY > 90 && mouseY < 190) {
        chosen_topping = "aiyu jelly";
        topping = true;
        //System.out.println(chosen_topping);
      }
      else if (mouseX > 625 && mouseX < 725 && mouseY > 90 && mouseY < 190) {
        chosen_topping = "grass jelly";
        topping = true;
        //System.out.println(chosen_topping);
      }
    }
    else if (!ice) {
      if (mouseX > 275 && mouseX < 375 && mouseY > 90 && mouseY < 190) {
        chosen_ice = 0;
        ice = true;
        //System.out.println(chosen_ice);
      }
      else if (mouseX > 450 && mouseX < 550 && mouseY > 90 && mouseY < 190) {
        chosen_ice = 25;
        ice = true;
        //System.out.println(chosen_ice);
      }
      else if (mouseX > 625 && mouseX < 725 && mouseY > 90 && mouseY < 190) {
        chosen_ice = 50;
        ice = true;
        //System.out.println(chosen_ice);
      }
    }
    else if (!tea) {
      if (mouseX > 200 && mouseX < 300 && mouseY > 90 && mouseY < 190) {
        chosen_tea = "oolong tea";
        tea = true;
        //System.out.println(chosen_tea);
      }
      else if (mouseX > 325 && mouseX < 435 && mouseY > 90 && mouseY < 190) {
        chosen_tea = "black tea";
        tea = true;
        //System.out.println(chosen_tea);
      }
      else if (mouseX > 450 && mouseX < 550 && mouseY > 90 && mouseY < 190) {
        chosen_tea = "milk tea";
        tea = true;
        //System.out.println(chosen_tea);
      }
      else if (mouseX > 575 && mouseX < 675 && mouseY > 90 && mouseY < 190) {
        chosen_tea = "green tea";
        tea = true;
        //System.out.println(chosen_tea);
      }
      else if (mouseX > 700 && mouseX < 800 && mouseY > 90 && mouseY < 190) {
        chosen_tea = "fresh milk";
        tea = true;
        //System.out.println(chosen_tea);
      }
    }
    else if (!sugar) {
      if (mouseX > 225 && mouseX < 325 && mouseY > 90 && mouseY < 190) {
        chosen_sugar = 0;
        sugar = true;
        //System.out.println(chosen_sugar);
      }
      else if (mouseX > 375 && mouseX < 475 && mouseY > 90 && mouseY < 190) {
        chosen_sugar = 25;
        sugar = true;
        //System.out.println(chosen_sugar);
      }
      else if (mouseX > 525 && mouseX < 625 && mouseY > 90 && mouseY < 190) {
        chosen_sugar = 50;
        sugar = true;
        //System.out.println(chosen_sugar);
      }
      else if (mouseX > 675 && mouseX < 775 && mouseY > 90 && mouseY < 190) {
        chosen_sugar = 75;
        sugar = true;
        //System.out.println(chosen_sugar);
      }
    }
  }
  if (finished_bottle) {
    if (mouseX > 700 && mouseX < 850 && mouseY > 675 && mouseY < 725) {
      bottle = false;
      numOrders++;
      started_bottle = finished_bottle = false;
    }
  }
  if (!bottle) {
    if (started && numOrders < 3 && mouseX > 440 && mouseX < 575 && mouseY > 600 && mouseY < 635) {
      topping = ice = tea = sugar = false;
      chosen_topping = chosen_tea = "";
      chosen_ice = chosen_sugar = 0;
      drink = new Drink();
      bottle = true;
    }
  }
}

void keyTyped() {
  if (key == ENTER) {
    if (startTyping) {
      startTyping = continueTyping = false;
      if (name.equals("")) {
        dialogue0.setDialogue(2, "Welcome to our humble shop, Mysterious Person.\n\nYou'll be helping us out today.");
      }
      else {
        dialogue0.setDialogue(2, "Welcome to our humble shop, " + name + ".\n\nYou'll be helping us out today.");
      }
    }
  }
  if (startTyping && continueTyping) {
    if (key == BACKSPACE) {
      if (name.length() > 0) {
        name = name.substring(0, name.length() - 1);
      } else {
        name = "";
      }
    } else {
      name += key;
    }
    //println(name);
  }
}