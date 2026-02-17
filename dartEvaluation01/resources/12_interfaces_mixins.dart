// Interfaces and Mixins in Dart

// Interface (any class can be used as interface)
class Drawable {
  void draw() {
    print('Drawing...');
  }
}

class Resizable {
  void resize(double scale) {
    print('Resizing by $scale');
  }
}

// Class implementing interfaces
class Square implements Drawable, Resizable {
  double side;
  
  Square(this.side);
  
  @override
  void draw() {
    print('Drawing a square with side $side');
  }
  
  @override
  void resize(double scale) {
    side *= scale;
    print('Square resized to side $side');
  }
}

// Mixin - reusable code across multiple classes
mixin Swimming {
  void swim() {
    print('Swimming in water');
  }
}

mixin Flying {
  void fly() {
    print('Flying in the air');
  }
}

mixin Walking {
  void walk() {
    print('Walking on land');
  }
}

// Using mixins
class Duck with Swimming, Flying, Walking {
  String name;
  
  Duck(this.name);
  
  void quack() {
    print('$name says: Quack!');
  }
}

class Fish with Swimming {
  String species;
  
  Fish(this.species);
  
  void displayInfo() {
    print('Species: $species');
  }
}

class Bird with Flying, Walking {
  String type;
  
  Bird(this.type);
  
  void chirp() {
    print('$type chirps');
  }
}

// Mixin with 'on' constraint
class Animal {
  String name;
  Animal(this.name);
}

mixin CanRun on Animal {
  void run() {
    print('$name is running');
  }
}

mixin CanJump on Animal {
  void jump() {
    print('$name is jumping');
  }
}

class Dog extends Animal with CanRun, CanJump {
  Dog(String name) : super(name);
}

// Abstract class with mixin
abstract class Vehicle {
  String brand;
  Vehicle(this.brand);
  
  void start();
  void stop();
}

mixin Electric {
  int batteryLevel = 100;
  
  void charge() {
    batteryLevel = 100;
    print('Battery charged to 100%');
  }
  
  void useBattery(int amount) {
    batteryLevel -= amount;
    print('Battery: $batteryLevel%');
  }
}

mixin GPS {
  void navigate(String destination) {
    print('Navigating to $destination');
  }
}

class ElectricCar extends Vehicle with Electric, GPS {
  ElectricCar(String brand) : super(brand);
  
  @override
  void start() {
    print('$brand electric car started');
  }
  
  @override
  void stop() {
    print('$brand electric car stopped');
  }
}

// Interface with abstract methods
abstract class Serializable {
  String serialize();
  void deserialize(String data);
}

class User implements Serializable {
  String name;
  int age;
  
  User(this.name, this.age);
  
  @override
  String serialize() {
    return '$name,$age';
  }
  
  @override
  void deserialize(String data) {
    var parts = data.split(',');
    name = parts[0];
    age = int.parse(parts[1]);
  }
  
  @override
  String toString() => 'User(name: $name, age: $age)';
}

void main() {
  print('=== Implementing Interfaces ===');
  Square square = Square(5);
  square.draw();
  square.resize(2);
  square.draw();
  
  print('\n=== Using Mixins ===');
  Duck duck = Duck('Donald');
  duck.quack();
  duck.swim();
  duck.fly();
  duck.walk();
  
  print('\n');
  Fish fish = Fish('Goldfish');
  fish.displayInfo();
  fish.swim();
  
  print('\n');
  Bird bird = Bird('Sparrow');
  bird.chirp();
  bird.fly();
  bird.walk();
  
  print('\n=== Mixin with Constraint ===');
  Dog dog = Dog('Buddy');
  dog.run();
  dog.jump();
  
  print('\n=== Complex Mixin Usage ===');
  ElectricCar tesla = ElectricCar('Tesla');
  tesla.start();
  tesla.navigate('New York');
  tesla.useBattery(20);
  tesla.charge();
  tesla.stop();
  
  print('\n=== Serializable Interface ===');
  User user1 = User('Alice', 25);
  print('Original: $user1');
  
  String serialized = user1.serialize();
  print('Serialized: $serialized');
  
  User user2 = User('', 0);
  user2.deserialize(serialized);
  print('Deserialized: $user2');
  
  print('\n=== Type Checking with Mixins ===');
  print('Duck can swim: ${duck is Swimming}');
  print('Duck can fly: ${duck is Flying}');
  print('Fish can swim: ${fish is Swimming}');
  print('Fish can fly: ${fish is Flying}');
}
