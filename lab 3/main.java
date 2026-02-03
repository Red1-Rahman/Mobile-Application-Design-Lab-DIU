public class car {
    String brand;
    String model;
    int year;

    public car(String brand, String model, int year) {
        this.brand = brand;
        this.model = model;
        this.year = year;
    }

    public void displayInfo(){
        System.out.println(year + " " + brand + " " + model);
    }
}