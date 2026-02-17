// Typedef and Callable Classes in Dart

// Type alias for function type
typedef IntOperation = int Function(int a, int b);
typedef StringTransformer = String Function(String input);
typedef Predicate<T> = bool Function(T value);
typedef Callback = void Function();

// Type alias for complex types
typedef UserMap = Map<String, dynamic>;
typedef NumberList = List<int>;

// Function matching typedef
int add(int a, int b) => a + b;
int multiply(int a, int b) => a * b;
int subtract(int a, int b) => a - b;

// String transformers
String toUpperCase(String input) => input.toUpperCase();
String toLowerCase(String input) => input.toLowerCase();
String reverse(String input) => input.split('').reversed.join('');

// Using typedef in function parameters
void executeOperation(int x, int y, IntOperation operation) {
  int result = operation(x, y);
  print('Result: $result');
}

void transformAndPrint(String text, StringTransformer transformer) {
  String result = transformer(text);
  print('Transformed: $result');
}

// Generic typedef
typedef Comparator<T> = int Function(T a, T b);

void sortWithComparator<T>(List<T> items, Comparator<T> comparator) {
  items.sort(comparator);
  print('Sorted: $items');
}

// Callable class (class that acts like a function)
class Adder {
  int base;
  
  Adder(this.base);
  
  // call method makes the class callable
  int call(int value) {
    return base + value;
  }
}

class Multiplier {
  int factor;
  
  Multiplier(this.factor);
  
  int call(int value) => value * factor;
}

// Callable class with multiple parameters
class Calculator {
  String call(int a, int b, String operation) {
    switch (operation) {
      case '+':
        return '$a + $b = ${a + b}';
      case '-':
        return '$a - $b = ${a - b}';
      case '*':
        return '$a * $b = ${a * b}';
      case '/':
        return '$a / $b = ${a / b}';
      default:
        return 'Unknown operation';
    }
  }
}

// Callable class implementing typedef
class UpperCaseTransformer {
  String call(String input) {
    return input.toUpperCase();
  }
}

// Generic callable class
class Validator<T> {
  final Predicate<T> predicate;
  final String errorMessage;
  
  Validator(this.predicate, this.errorMessage);
  
  bool call(T value) {
    if (!predicate(value)) {
      print('Validation failed: $errorMessage');
      return false;
    }
    return true;
  }
}

// Callable class with state
class Counter {
  int _count = 0;
  
  int get count => _count;
  
  void call() {
    _count++;
    print('Counter: $_count');
  }
  
  void reset() {
    _count = 0;
    print('Counter reset');
  }
}

// Function that returns a function (closure)
IntOperation makeOperation(String op) {
  switch (op) {
    case '+':
      return (a, b) => a + b;
    case '-':
      return (a, b) => a - b;
    case '*':
      return (a, b) => a * b;
    default:
      return (a, b) => 0;
  }
}

void main() {
  print('=== Typedef for Function Types ===');
  
  // Using typedef with functions
  IntOperation addOp = add;
  IntOperation multiplyOp = multiply;
  
  print('Add: ${addOp(5, 3)}');
  print('Multiply: ${multiplyOp(5, 3)}');
  
  // Using typedef in function parameters
  print('\n=== Typedef in Parameters ===');
  executeOperation(10, 5, add);
  executeOperation(10, 5, multiply);
  executeOperation(10, 5, subtract);
  
  // Anonymous functions with typedef
  executeOperation(10, 5, (a, b) => a ~/ b);
  
  // String transformers
  print('\n=== String Transformers ===');
  transformAndPrint('Hello World', toUpperCase);
  transformAndPrint('Hello World', toLowerCase);
  transformAndPrint('Hello World', reverse);
  
  // Generic typedef
  print('\n=== Generic Typedef ===');
  List<int> numbers = [5, 2, 8, 1, 9];
  sortWithComparator(numbers, (a, b) => a.compareTo(b));
  
  List<String> words = ['banana', 'apple', 'cherry'];
  sortWithComparator(words, (a, b) => a.compareTo(b));
  
  // Typedef for complex types
  print('\n=== Typedef for Complex Types ===');
  UserMap user = {
    'name': 'Alice',
    'age': 25,
    'email': 'alice@example.com',
  };
  print('User: $user');
  
  NumberList primes = [2, 3, 5, 7, 11];
  print('Primes: $primes');
  
  // Callable classes
  print('\n=== Callable Classes ===');
  Adder add10 = Adder(10);
  print('Add 10 to 5: ${add10(5)}');
  print('Add 10 to 15: ${add10(15)}');
  
  Multiplier times3 = Multiplier(3);
  print('Multiply 5 by 3: ${times3(5)}');
  print('Multiply 7 by 3: ${times3(7)}');
  
  // Calculator callable class
  print('\n=== Calculator Callable Class ===');
  Calculator calc = Calculator();
  print(calc(10, 5, '+'));
  print(calc(10, 5, '-'));
  print(calc(10, 5, '*'));
  print(calc(10, 5, '/'));
  
  // Using callable class as typedef
  print('\n=== Callable Class as Typedef ===');
  StringTransformer upperTransformer = UpperCaseTransformer();
  transformAndPrint('hello world', upperTransformer);
  
  // Generic validator
  print('\n=== Generic Validator ===');
  Validator<int> positiveValidator = Validator(
    (value) => value > 0,
    'Value must be positive',
  );
  
  print('Validating 10: ${positiveValidator(10)}');
  print('Validating -5: ${positiveValidator(-5)}');
  
  Validator<String> notEmptyValidator = Validator(
    (value) => value.isNotEmpty,
    'String cannot be empty',
  );
  
  print('Validating "Hello": ${notEmptyValidator("Hello")}');
  print('Validating "": ${notEmptyValidator("")}');
  
  // Counter callable class
  print('\n=== Counter Callable Class ===');
  Counter counter = Counter();
  counter();
  counter();
  counter();
  print('Final count: ${counter.count}');
  counter.reset();
  counter();
  
  // Function returning function
  print('\n=== Function Returning Function ===');
  IntOperation addOperation = makeOperation('+');
  IntOperation subtractOperation = makeOperation('-');
  
  print('Dynamic add: ${addOperation(20, 8)}');
  print('Dynamic subtract: ${subtractOperation(20, 8)}');
  
  // List of operations
  print('\n=== List of Operations ===');
  List<IntOperation> operations = [add, multiply, subtract];
  
  for (var op in operations) {
    print('Operation result: ${op(12, 4)}');
  }
  
  // Predicate typedef
  print('\n=== Predicate Usage ===');
  Predicate<int> isEven = (n) => n % 2 == 0;
  Predicate<int> isPositive = (n) => n > 0;
  
  List<int> testNumbers = [-2, -1, 0, 1, 2, 3, 4];
  
  print('Even numbers:');
  for (var num in testNumbers.where(isEven)) {
    print('  $num');
  }
  
  print('Positive numbers:');
  for (var num in testNumbers.where(isPositive)) {
    print('  $num');
  }
}
