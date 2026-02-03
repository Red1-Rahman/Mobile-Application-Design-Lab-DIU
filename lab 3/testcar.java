public class TestCar{
    public static void main(String[] args) {
        Car car1 = new Car("Toyota", "Corolla", 2020);
        Car car2 = new Car("Tesla", "Model 3", 2023);

        car1.displayInfo();
        car2.displayInfo();
    }
}