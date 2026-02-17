// Exception Handling in Dart

// Custom exception class
class InvalidAgeException implements Exception {
  final String message;
  InvalidAgeException(this.message);
  
  @override
  String toString() => 'InvalidAgeException: $message';
}

class InsufficientFundsException implements Exception {
  final double requested;
  final double available;
  
  InsufficientFundsException(this.requested, this.available);
  
  @override
  String toString() =>
      'InsufficientFundsException: Requested: \$${requested.toStringAsFixed(2)}, Available: \$${available.toStringAsFixed(2)}';
}

// Functions that throw exceptions
void checkAge(int age) {
  if (age < 0) {
    throw InvalidAgeException('Age cannot be negative');
  } else if (age < 18) {
    throw InvalidAgeException('Must be 18 or older');
  }
  print('Age $age is valid');
}

int divide(int a, int b) {
  if (b == 0) {
    throw Exception('Division by zero is not allowed');
  }
  return a ~/ b;
}

void withdraw(double amount, double balance) {
  if (amount > balance) {
    throw InsufficientFundsException(amount, balance);
  }
  print('Withdrawal successful: \$${amount.toStringAsFixed(2)}');
}

// Function with multiple exception types
void processData(String? data) {
  if (data == null) {
    throw ArgumentError('Data cannot be null');
  }
  if (data.isEmpty) {
    throw FormatException('Data cannot be empty');
  }
  print('Processing: $data');
}

void main() {
  // Basic try-catch
  print('=== Basic Try-Catch ===');
  try {
    int result = divide(10, 0);
    print('Result: $result');
  } catch (e) {
    print('Error caught: $e');
  }
  
  // Try-catch with specific exception type
  print('\n=== Specific Exception Type ===');
  try {
    checkAge(15);
  } on InvalidAgeException catch (e) {
    print('Caught: $e');
  }
  
  // Multiple catch blocks
  print('\n=== Multiple Catch Blocks ===');
  try {
    processData(null);
  } on ArgumentError catch (e) {
    print('ArgumentError: $e');
  } on FormatException catch (e) {
    print('FormatException: $e');
  } catch (e) {
    print('Unknown error: $e');
  }
  
  // Try-catch-finally
  print('\n=== Try-Catch-Finally ===');
  try {
    print('Attempting division...');
    int result = divide(20, 5);
    print('Result: $result');
  } catch (e) {
    print('Error: $e');
  } finally {
    print('Finally block always executes');
  }
  
  // Catch with stack trace
  print('\n=== Stack Trace ===');
  try {
    checkAge(-5);
  } catch (e, stackTrace) {
    print('Exception: $e');
    print('Stack trace:\n$stackTrace');
  }
  
  // Rethrowing exceptions
  print('\n=== Rethrowing Exceptions ===');
  void handleAge(int age) {
    try {
      checkAge(age);
    } catch (e) {
      print('Logging error: $e');
      rethrow; // Rethrow the same exception
    }
  }
  
  try {
    handleAge(10);
  } catch (e) {
    print('Caught rethrown exception: $e');
  }
  
  // Custom exception
  print('\n=== Custom Exception ===');
  try {
    withdraw(1000, 500);
  } on InsufficientFundsException catch (e) {
    print('Transaction failed: $e');
  }
  
  // Handling different exceptions
  print('\n=== Multiple Exception Scenarios ===');
  List<Function> operations = [
    () => divide(10, 2),
    () => divide(10, 0),
    () => checkAge(25),
    () => checkAge(-5),
    () => processData('valid'),
    () => processData(''),
  ];
  
  for (var i = 0; i < operations.length; i++) {
    print('\nOperation ${i + 1}:');
    try {
      operations[i]();
      print('Success!');
    } on InvalidAgeException catch (e) {
      print('Age validation failed: ${e.message}');
    } on FormatException catch (e) {
      print('Format error: ${e.message}');
    } on ArgumentError catch (e) {
      print('Argument error: ${e.message}');
    } catch (e) {
      print('Unexpected error: $e');
    }
  }
  
  // Assert (only in debug mode)
  print('\n=== Assertions ===');
  int value = 10;
  assert(value > 0, 'Value must be positive');
  print('Assertion passed for value: $value');
  
  // Using on without catch
  print('\n=== On Without Catch ===');
  try {
    throw FormatException('Test exception');
  } on FormatException {
    print('Caught FormatException (no variable needed)');
  }
  
  // Nested try-catch
  print('\n=== Nested Try-Catch ===');
  try {
    print('Outer try block');
    try {
      print('Inner try block');
      throw Exception('Inner exception');
    } catch (e) {
      print('Inner catch: $e');
      throw Exception('Outer exception');
    }
  } catch (e) {
    print('Outer catch: $e');
  }
}
