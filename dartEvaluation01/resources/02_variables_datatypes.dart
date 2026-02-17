// Variables and Data Types in Dart
// This program demonstrates different data types and variable declarations in Dart

void main() {
  // INTEGER DATA TYPE
  // Integers are whole numbers without decimal points
  // They can be positive, negative, or zero
  int age = 25;
  print('Age: $age');
  
  // DOUBLE DATA TYPE
  // Double represents floating-point numbers (numbers with decimal points)
  // Used for precise calculations involving decimals
  double price = 99.99;
  print('Price: $price');
  
  // STRING DATA TYPE
  // Strings are sequences of characters enclosed in single or double quotes
  // Used for text data
  String name = 'John Doe';
  print('Name: $name');
  
  // BOOLEAN DATA TYPE
  // Boolean can only have two values: true or false
  // Used for logical operations and conditions
  bool isStudent = true;
  print('Is Student: $isStudent');
  
  // DYNAMIC TYPE
  // Dynamic type can hold any type of value and can change type at runtime
  // The type is determined at runtime, not compile time
  // Use sparingly as it bypasses type safety
  dynamic dynamicVar = 'Hello';
  print('Dynamic (String): $dynamicVar');
  dynamicVar = 42;  // Now it holds an integer
  print('Dynamic (Int): $dynamicVar');
  
  // VAR KEYWORD (Type Inference)
  // 'var' automatically infers the type from the assigned value
  // Once assigned, the type cannot change (unlike dynamic)
  // Dart compiler determines the type at compile time
  var city = 'New York';  // Dart infers this as String
  print('City: $city');
  
  // CONST (Compile-time Constant)
  // 'const' creates a compile-time constant
  // Value must be known at compile time
  // Cannot be changed after initialization
  // Memory efficient as same value is reused
  const pi = 3.14159;
  print('Pi: $pi');
  
  // FINAL (Runtime Constant)
  // 'final' creates a runtime constant
  // Value can be determined at runtime
  // Cannot be changed after initialization
  // Different from const as value can be computed at runtime
  final currentTime = DateTime.now();
  print('Current Time: $currentTime');
  
  // NULL SAFETY
  // Dart supports null safety to prevent null reference errors
  // By default, variables cannot be null
  // Add '?' after type to make a variable nullable
  // This helps catch null pointer errors at compile time
  String? nullableString;  // Can be null
  print('Nullable String: $nullableString');
  nullableString = 'Now I have a value';
  print('Nullable String: $nullableString');
}
