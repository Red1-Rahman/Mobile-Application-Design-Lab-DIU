public class Vehicle {
    String brand;
    int year;

    public Vehicle(String brand, int year) {
        this.brand = brand;
        this.year = year;
    }

    public void start() {
        System.out.println(brand + " is starting...");
    }
}


Car.java (extended)

public class Car extends Vehicle {
    String model;

    public Car(String brand, int year, String model) {
        super(brand, year);
        this.model = model;
    }

    public void displayInfo() {
        System.out.println(year + " " + brand + " " + model);
    }
}
