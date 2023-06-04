private PImage bell;
private PImage standard;

private Menu currentMenu;
private String name = "";
private int score = 0;
private boolean playedBefore = false;

void setup() {
    size(1000, 800);
    noStroke();
    fill(0);
    bell = loadImage("shop_morning_bell.png");
    standard = loadImage("shop_morning.png");
}

void draw() {
    if (mouseX > 345 && mouseX < 410 && mouseY > 435 && mouseY < 490) {
        makeButtons();
    }
    if (!playedBefore) {
        image(bell, 0, 0, width, height);
    }
    else {
        image(standard, 0, 0, width, height);
    }
}

void makeButtons() {
    fill(0, 40);
    rect(15, 690, 475, 100);
}