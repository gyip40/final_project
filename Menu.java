//package final_project;

public class Menu {
    private Boba randomDrink = new Boba();
    private int[] sizes = new int[] {1, 2, 3};
    private String[] drinkSelection = new String[] {"Oolong tea", "Black tea", "Milk tea", "Green tea", "Fresh milk"};
    private String[] toppingSelection = new String[] {"Pearls", "Auyu Jelly", "Grass Jelly", "Cheese foam"};

    public void generateSize() {
        int randomIndex = (int)(Math.random() * (sizes.length + 1));
        System.out.println(randomIndex); //debugging
        randomDrink.setSize(sizes[randomIndex]);
    }
    
    public void generateDrink() {
        int randomIndex = (int)(Math.random() * (drinkSelection.length + 1));
        System.out.println(randomIndex); //debugging
        randomDrink.setDrink(drinkSelection[randomIndex]);
    }
    
    public void generateTopping() {
        int randomIndex = (int)(Math.random() * (toppingSelection.length + 1));
        System.out.println(randomIndex); //debugging
        randomDrink.setTopping(toppingSelection[randomIndex]);
    }

    public void generateBoba() {
        generateSize();
        generateDrink();
        generateTopping();
        System.out.println(randomDrink);
    }

    public static void main(String[] args) {
        Menu test = new Menu();
        test.generateBoba(); 
    }
}