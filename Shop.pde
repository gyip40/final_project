private Menu currentMenu;
private String name = "";
private int score = 0;
private boolean playedBefore = false;

void setup() {
    size(1000, 800);
    noStroke();
    fill(0);
}

void draw() {
    if (mouseX > 345 && mouseX < 410 && mouseY > 435 && mouseY < 490) {
        makeButtons();
    }
}

void makeButtons() {
    fill(0, 40);
    rect(15, 690, 475, 100);
}