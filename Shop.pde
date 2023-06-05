private PImage bell;
private PImage standard;
private PFont font;

private String name = "";
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
private int[] yesno0 = new int[] {1, 0, 0, 0, 0, 0, 0};
private boolean[] willContinue0 = new boolean[] {true, false, false, false, false, false, false};
private int tempChoice = 1;
private Dialogue dialogue0 = new Dialogue(dialogues0, yesno0, willContinue0, tempChoice);
private boolean popUp1_finished = false;
private boolean popUp2_finished = false;
private boolean popUp3_finished = false;
private boolean bottle = false;
private Drink drink = new Drink();

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
    delay(80);
    delay(80);
    dialogue0.keyTyped();
    dialogue0.mouseClicked();
    //delay(100);
    if (dialogue0.getCurrentNum() == 1) {
      startTyping = true;
      text("\n\n" + name, 40, 740);
    }
    if (dialogue0.getCurrentNum() == 1 && continueTyping == false) {
      dialogue0.setContinue(2, true);  
      dialogue0.setCurrentNum(2);
    }
    if (dialogue0.getCurrentNum() == 6) {
    if (dialogue0.getCurrentNum() == 6) {
      popUp1 = false;
      popUp1_finished = true;
      bottle = true;
    }
  }
  if (popUp1_finished && !popUp2_finished) {
    if (bottle) {
      fill(0, 65);
      rect(0, 0, 1000, 800);
      fill(0, 65);
      rect(0, 0, 1000, 800);
      bottle();
      drink.translate(100, 100);
      drink.translate(100, 100);
    }
  }
}

void mouseClicked() {
  if (!started && mouseX > 345 && mouseX < 410 && mouseY > 435 && mouseY < 490) {
    started = true;
    popUp1 = true;
  }
}

void popUp() {
  fill(0, 40);
  rect(15, 690, 475, 100);
}

void bottle() {
  drink.drawDrink();
  drink.drawDrink();
}

void keyTyped() {
  if (key == ENTER) {
    if (startTyping) {
      startTyping = continueTyping = false;
      dialogue0.setDialogue(2, "Welcome to our humble shop, " + name + ".\n\nYou'll be helping us out today.");
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
    println(name);
  }
}