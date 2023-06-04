public class Menu {
    private Boba randomDrink = new Boba();
    private int[] sizes;
    private int[] iceLevels;
    private int[] sugarLevels;
    private String[] drinkSelection;
    private String[] toppingSelection;
    
    public Menu() {
        sizes = new int[] {1, 2, 3};
        iceLevels = new int[] {0, 25, 50, 75};
        sugarLevels = new int[] {0, 25, 50, 75};
        drinkSelection = new String[] {"Oolong tea", "Black tea", "Milk tea", "Green tea", "Fresh milk"};
        toppingSelection = new String[] {"Pearls", "Auyu Jelly", "Grass Jelly", "Cheese foam"};
    }

    public void generateSize() {
        int randomIndex = (int)(Math.random() * sizes.length);
        // System.out.println(randomIndex); //debugging
        randomDrink.setSize(sizes[randomIndex]);
    }

    public void generateIceLevel() {
        int randomIndex = (int)(Math.random() * iceLevels.length);
        // System.out.println(randomIndex); //debugging
        randomDrink.setIceLevel(iceLevels[randomIndex]);
    }
    
    public void generateSugarLevel() {
        int randomIndex = (int)(Math.random() * sugarLevels.length);
        // System.out.println(randomIndex); //debugging
        randomDrink.setSugarLevel(sugarLevels[randomIndex]);
    }
    
    public void generateDrink() {
        int randomIndex = (int)(Math.random() * drinkSelection.length);
        // System.out.println(randomIndex); //debugging
        randomDrink.setDrink(drinkSelection[randomIndex]);
    }
    
    public void generateTopping() {
        int randomIndex = (int)(Math.random() * toppingSelection.length);
        // System.out.println(randomIndex); //debugging
        randomDrink.setTopping(toppingSelection[randomIndex]);
    }

    public void generateBoba() {
        generateSize();
        generateIceLevel();
        generateSugarLevel();
        generateDrink();
        generateTopping();
        // System.out.println("-----------------------------------------");
        // System.out.println(Boba.toString(randomDrink));
    }

    // public static void main(String[] args) {
    //     Menu test = new Menu();
    //     test.generateBoba(); 
    // }
}