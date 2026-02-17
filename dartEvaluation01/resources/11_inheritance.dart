// Inheritance in Dart

// Base class (Parent/Super class)
class Animal {
  String name;
  int age;
  
  Animal(this.name, this.age);
  
  void eat() {
    print('$name is eating');
  }
  
  void sleep() {
    print('$name is sleeping');
  }
  
  void makeSound() {
    print('$name makes a sound');
  }
}

// Derived class (Child/Sub class)
class Dog extends Animal {
  String breed;
  
  // Constructor calling super constructor
  Dog(String name, int age, this.breed) : super(name, age);
  
  // Override parent method
  @override
  void makeSound() {
    print('$name barks: Woof! Woof!');
  }
  
  // New method specific to Dog
  void fetch() {
    print('$name is fetching the ball');
  }
}

class Cat extends Animal {
  String color;
  
  Cat(String name, int age, this.color) : super(name, age);
  
  @override
  void makeSound() {
    print('$name meows: Meow! Meow!');
  }
  
  void scratch() {
    print('$name is scratching');
  }
}

// Multi-level inheritance
class Bird extends Animal {
  double wingspan;
  
  Bird(String name, int age, this.wingspan) : super(name, age);
  
  @override
  void makeSound() {
    print('$name chirps: Tweet! Tweet!');
  }
  
  void fly() {
    print('$name is flying with ${wingspan}cm wingspan');
  }
}

class Eagle extends Bird {
  String huntingSkill;
  
  Eagle(String name, int age, double wingspan, this.huntingSkill)
      : super(name, age, wingspan);
  
  @override
  void fly() {
    print('$name soars majestically in the sky');
  }
  
  void hunt() {
    print('$name hunts with $huntingSkill skill');
  }
}

// Abstract class
abstract class Shape {
  String color;
  
  Shape(this.color);
  
  // Abstract method (must be implemented by subclasses)
  double area();
  double perimeter();
  
  // Concrete method
  void display() {
    print('Shape color: $color');
  }
}

class Rectangle extends Shape {
  double width;
  double height;
  
  Rectangle(String color, this.width, this.height) : super(color);
  
  @override
  double area() {
    return width * height;
  }
  
  @override
  double perimeter() {
    return 2 * (width + height);
  }
}

class Circle extends Shape {
  double radius;
  
  Circle(String color, this.radius) : super(color);
  
  @override
  double area() {
    return 3.14159 * radius * radius;
  }
  
  @override
  double perimeter() {
    return 2 * 3.14159 * radius;
  }
}

void main() {
  print('=== Basic Inheritance ===');
  Dog dog = Dog('Buddy', 3, 'Golden Retriever');
  print('Dog: ${dog.name}, Age: ${dog.age}, Breed: ${dog.breed}');
  dog.eat();
  dog.sleep();
  dog.makeSound();
  dog.fetch();
  
  print('\n=== Another Subclass ===');
  Cat cat = Cat('Whiskers', 2, 'Orange');
  print('Cat: ${cat.name}, Age: ${cat.age}, Color: ${cat.color}');
  cat.eat();
  cat.makeSound();
  cat.scratch();
  
  print('\n=== Multi-level Inheritance ===');
  Eagle eagle = Eagle('Skyler', 5, 200, 'Expert');
  eagle.eat();
  eagle.makeSound();
  eagle.fly();
  eagle.hunt();
  
  print('\n=== Polymorphism ===');
  List<Animal> animals = [
    Dog('Max', 4, 'Labrador'),
    Cat('Luna', 1, 'White'),
    Bird('Tweety', 2, 25)
  ];
  
  for (var animal in animals) {
    animal.makeSound(); // Calls the overridden method
  }
  
  print('\n=== Abstract Class ===');
  Rectangle rect = Rectangle('Red', 10, 5);
  rect.display();
  print('Area: ${rect.area()}');
  print('Perimeter: ${rect.perimeter()}');
  
  Circle circle = Circle('Blue', 7);
  circle.display();
  print('Area: ${circle.area().toStringAsFixed(2)}');
  print('Perimeter: ${circle.perimeter().toStringAsFixed(2)}');
  
  print('\n=== Type Checking ===');
  Animal animal = Dog('Rocky', 3, 'Bulldog');
  print('Is Animal: ${animal is Animal}');
  print('Is Dog: ${animal is Dog}');
  print('Is Cat: ${animal is Cat}');
  
  if (animal is Dog) {
    animal.fetch(); // Can access Dog-specific methods
  }
}
