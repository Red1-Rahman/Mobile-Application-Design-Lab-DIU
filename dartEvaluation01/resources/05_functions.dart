// Functions in Dart

// Simple function
void greet() {
  print('Hello from greet function!');
}

// Function with parameters
void greetPerson(String name) {
  print('Hello, $name!');
}

// Function with return value
int add(int a, int b) {
  return a + b;
}

// Arrow function (short syntax)
int multiply(int a, int b) => a * b;

// Optional positional parameters
String createMessage(String text, [String? suffix]) {
  return suffix != null ? '$text $suffix' : text;
}

// Named parameters
void printUserInfo({required String name, int age = 0, String? city}) {
  print('Name: $name, Age: $age, City: ${city ?? "Unknown"}');
}

// Function with default parameter values
double calculateArea(double length, [double width = 1.0]) {
  return length * width;
}

// Higher-order function (function as parameter)
void executeOperation(int a, int b, Function operation) {
  print('Result: ${operation(a, b)}');
}

// Function returning function
Function makeMultiplier(int multiplier) {
  return (int value) => value * multiplier;
}

// Anonymous function
void demonstrateAnonymous() {
  var list = [1, 2, 3, 4, 5];
  
  print('Anonymous function with forEach:');
  list.forEach((item) {
    print('  Item: $item');
  });
}

// Recursive function
int factorial(int n) {
  if (n <= 1) return 1;
  return n * factorial(n - 1);
}

void main() {
  print('=== Simple Function ===');
  greet();
  
  print('\n=== Function with Parameters ===');
  greetPerson('Alice');
  
  print('\n=== Function with Return Value ===');
  int sum = add(5, 3);
  print('5 + 3 = $sum');
  
  print('\n=== Arrow Function ===');
  print('4 * 6 = ${multiply(4, 6)}');
  
  print('\n=== Optional Positional Parameters ===');
  print(createMessage('Hello'));
  print(createMessage('Hello', 'World'));
  
  print('\n=== Named Parameters ===');
  printUserInfo(name: 'Bob', age: 25, city: 'New York');
  printUserInfo(name: 'Charlie', age: 30);
  
  print('\n=== Default Parameters ===');
  print('Area (5): ${calculateArea(5)}');
  print('Area (5, 3): ${calculateArea(5, 3)}');
  
  print('\n=== Higher-order Function ===');
  executeOperation(10, 5, add);
  executeOperation(10, 5, multiply);
  
  print('\n=== Function Returning Function ===');
  var multiplyBy3 = makeMultiplier(3);
  print('5 * 3 = ${multiplyBy3(5)}');
  
  print('\n=== Anonymous Function ===');
  demonstrateAnonymous();
  
  print('\n=== Recursive Function ===');
  print('Factorial of 5: ${factorial(5)}');
}
