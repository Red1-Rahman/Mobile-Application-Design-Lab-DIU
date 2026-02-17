// Classes and Objects in Dart

// Basic class
class Person {
  // Properties (instance variables)
  String name;
  int age;
  @override
  // Constructor
  Person(this.name, this.age);
  
  // Method
  void introduce() {
    print('Hi, I\'m $name and I\'m $age years old.');
  }
  
  // Getter
  String get info => 'Name: $name, Age: $age';
  
  // Setter
  set updateAge(int newAge) {
    if (newAge > 0) {
      age = newAge;
    }
  }
}

// Class with named constructor
class Point {
  double x;
  double y;
  
  // Default constructor
  Point(this.x, this.y);
  
  // Named constructor
  Point.origin()
      : x = 0,
        y = 0;
  
  Point.fromList(List<double> coords)
      : x = coords[0],
        y = coords[1];
  
  void display() {
    print('Point($x, $y)');
  }
}

// Class with private properties
class BankAccount {
  String _accountNumber; // Private (starts with _)
  double _balance;
  
  BankAccount(this._accountNumber, this._balance);
  
  // Getter for balance
  double get balance => _balance;
  
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('Deposited: \$${amount.toStringAsFixed(2)}');
    }
  }
  
  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print('Withdrawn: \$${amount.toStringAsFixed(2)}');
    } else {
      print('Insufficient funds');
    }
  }
}

// Class with static members
class MathUtils {
  static const double pi = 3.14159;
  static int calculationCount = 0;
  
  static double circleArea(double radius) {
    calculationCount++;
    return pi * radius * radius;
  }
  
  static double circleCircumference(double radius) {
    calculationCount++;
    return 2 * pi * radius;
  }
}

// Class with factory constructor
class Logger {
  final String name;
  static final Map<String, Logger> _cache = {};
  
  Logger._internal(this.name);
  
  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }
  
  void log(String message) {
    print('[$name] $message');
  }
}

void main() {
  print('=== Basic Class ===');
  Person person1 = Person('Alice', 25);
  person1.introduce();
  print(person1.info);
  
  person1.updateAge = 26;
  print('Updated age: ${person1.age}');
  
  print('\n=== Named Constructors ===');
  Point p1 = Point(10, 20);
  p1.display();
  
  Point p2 = Point.origin();
  p2.display();
  
  Point p3 = Point.fromList([5.5, 7.8]);
  p3.display();
  
  print('\n=== Private Properties ===');
  BankAccount account = BankAccount('ACC123', 1000.0);
  print('Initial balance: \$${account.balance.toStringAsFixed(2)}');
  
  account.deposit(500);
  print('Current balance: \$${account.balance.toStringAsFixed(2)}');
  
  account.withdraw(300);
  print('Current balance: \$${account.balance.toStringAsFixed(2)}');
  
  account.withdraw(2000); // Should fail
  
  print('\n=== Static Members ===');
  print('Pi: ${MathUtils.pi}');
  print('Circle area (radius 5): ${MathUtils.circleArea(5)}');
  print('Circle circumference (radius 5): ${MathUtils.circleCircumference(5)}');
  print('Calculation count: ${MathUtils.calculationCount}');
  
  print('\n=== Factory Constructor ===');
  Logger logger1 = Logger('App');
  Logger logger2 = Logger('App');
  Logger logger3 = Logger('Database');
  
  print('logger1 == logger2: ${logger1 == logger2}'); // true (same instance)
  print('logger1 == logger3: ${logger1 == logger3}'); // false
  
  logger1.log('Application started');
  logger3.log('Connected to database');
}
