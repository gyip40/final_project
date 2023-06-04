public class Dialogue {
  private String[] dialogue;
  private int[] yesno;
  private boolean[] willContinue;
  private int currentNum;
  private int choice;

  public Dialogue(String[] dialogue, int[] yesno, boolean[] willContinue, int choice) {
    this.dialogue = dialogue;
    this.yesno = yesno;
    this.willContinue = willContinue;
    this.currentNum = 0;
    this.choice = choice;

  }
  
  public int getCurrentNum() {
    return currentNum;
  }
  
  void setCurrentNum (int newCurrentNum) {
    this.currentNum = newCurrentNum;
  }
  
  public int getYesno() {
    return yesno[currentNum];
  }
  
  void setYesnoNum (int newYesnoNum) {
    this.yesno[currentNum] = newYesnoNum;
  }
  
  boolean getContinue (int continueNum) {
    return willContinue[continueNum];
  }
  
  void setContinue (int continueNum, boolean condition) {
    willContinue[continueNum] = condition;
  }
  
  void setDialogue (int index, String newDialogue) {
    dialogue[index] = newDialogue;
  }
  
   void display() {
    if (currentNum < dialogue.length && willContinue[currentNum]) {
      text(dialogue[currentNum], 40, 740);
    }
  }
  
  void yesno() {
    if (currentNum < yesno.length) {
      if (yesno[currentNum] == 1) {
        textAlign(LEFT, CENTER);
        fill(0);
        if (choice == 1) {
          text("\n\n>", 40, 740);
        }
        else {
          text("\n\n                       >", 40, 740);
        }
      }
    }
  }
  
  void mouseClicked() {
    if (mousePressed == true && yesno[currentNum] == 1) {
        if (choice == 1) {
          currentNum++;
          this.setContinue(currentNum, true);
        }
    }
    if (mousePressed == true && yesno[currentNum] == 0 && currentNum != 1) {
        currentNum++;
        this.setContinue(currentNum, true);
    }
  }
  
  void keyTyped() {
    if (keyPressed) {
      if (keyCode == RIGHT) {
        choice = 0;
      }
      if (keyCode == LEFT) {
        choice = 1;
      }
      if (key == ENTER && yesno[currentNum] == 1) {
        if (choice == 1) {
          currentNum++;
          this.setContinue(currentNum, true);
        }
      }
      if (key == ENTER && yesno[currentNum] == 0 && currentNum != 1) {
        currentNum++;
        this.setContinue(currentNum, true);
      }
    }
  }
}