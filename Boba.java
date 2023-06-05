public class Boba {

    private int size;
    private int iceLevel;
    private int sugarLevel;
    private String drink;
    private String topping;

    public Boba() {
        size = 0;
        iceLevel = 0;
        sugarLevel = 0;
        drink = "";
        topping = "";
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getIceLevel() {
        return iceLevel;
    }

    public void setIceLevel(int iceLevel) {
        this.iceLevel = iceLevel;
    }
    
    public int getSugarLevel() {
        return sugarLevel;
    }

    public void setSugarLevel(int sugarLevel) {
        this.sugarLevel = sugarLevel;
    }

    public String getDrink() {
        return drink;
    }

    public void setDrink(String drink) {
        this.drink = drink;
    }

    public String getTopping() {
        return topping;
    }

    public void setTopping(String topping) {
        this.topping = topping;
    }

    public String toString(Boba boba) {
        String result = "";
        result += "SIZE:          " + boba.getSize() + "\n";
        result += "ICE LEVEL:     " + boba.getIceLevel() + "\n";
        result += "SUGAR LEVEL:   " + boba.getSugarLevel() + "\n";
        result += "DRINK:         " + boba.getDrink() + "\n";
        result += "TOPPING:       " + boba.getTopping() + "\n";
        return result;
    }

}