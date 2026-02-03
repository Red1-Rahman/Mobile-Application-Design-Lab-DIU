abstract class Vehicle {
  String brand;
  Vehicle(this.brand);

  double calculateFare();
}

class Car extends Vehicle {
  Car(String brand) : super(brand);

  @override
  double calculateFare() => 50.0;
}

class Bike extends Vehicle {
  Bike(String brand) : super(brand);

  @override
  double calculateFare() => 20.0;
}

class Bus extends Vehicle {
  Bus(String brand) : super(brand);

  @override
  double calculateFare() => 10.0;
}

// Lab Report 2 - Add Train class here:
class Train extends Vehicle {
  Train(String brand) : super(brand);

  @override
  double calculateFare() => 60.0;
}