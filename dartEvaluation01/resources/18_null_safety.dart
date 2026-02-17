// Null Safety in Dart

void main() {
  print('=== Null Safety in Dart ===\n');
  
  // Non-nullable variables
  print('=== Non-nullable Variables ===');
  String name = 'John'; // Cannot be null
  int age = 25; // Cannot be null
  print('Name: $name, Age: $age');
  
  // Nullable variables
  print('\n=== Nullable Variables ===');
  String? nullableName; // Can be null
  int? nullableAge; // Can be null
  print('Nullable name: $nullableName');
  print('Nullable age: $nullableAge');
  
  nullableName = 'Alice';
  nullableAge = 30;
  print('After assignment - Name: $nullableName, Age: $nullableAge');
  
  // Null-aware operators
  print('\n=== Null-aware Operators ===');
  
  // ?? (if-null operator)
  String? username;
  String displayName = username ?? 'Guest';
  print('Display name: $displayName');
  
  username = 'john_doe';
  displayName = username ?? 'Guest';
  print('Display name: $displayName');
  
  // ??= (null-aware assignment)
  String? message;
  print('Message before: $message');
  message ??= 'Default message';
  print('Message after ??=: $message');
  message ??= 'Another message'; // Won't change
  print('Message after second ??=: $message');
  
  // ?. (null-aware access)
  print('\n=== Null-aware Access ===');
  String? text;
  int? length = text?.length;
  print('Text: $text, Length: $length');
  
  text = 'Hello';
  length = text.length; // Safe because text is not null
  print('Text: $text, Length: $length');
  
  // ?.. (null-aware cascade)
  StringBuffer? buffer;
  buffer?..write('Hello')..write(' ')..write('World');
  print('Buffer: $buffer');
  
  buffer = StringBuffer();
  buffer
    ..write('Hello')
    ..write(' ')
    ..write('World');
  print('Buffer: $buffer');
  
  // ! (null assertion operator)
  print('\n=== Null Assertion Operator ===');
  String? possiblyNull = 'Not null';
  String definitelyNotNull = possiblyNull!; // Assert it's not null
  print('Definitely not null: $definitelyNotNull');
  
  // Late variables
  print('\n=== Late Variables ===');
  late String lateVariable;
  // print(lateVariable); // Would throw error
  
  lateVariable = 'Initialized';
  print('Late variable: $lateVariable');
  
  // Late with initialization
  late String expensiveComputation = computeValue();
  print('Using late variable: $expensiveComputation');
  
  // Required named parameters
  print('\n=== Required Parameters ===');
  printPersonInfo(name: 'Bob', age: 35);
  
  // Optional parameters with null safety
  print('\n=== Optional Parameters ===');
  greet('Charlie');
  greet('David', 'Mr.');
  
  // Type promotion
  print('\n=== Type Promotion ===');
  String? nullableString = 'Hello';
  
  if (nullableString != null) {
    // nullableString is promoted to String (non-nullable)
    print('Length: ${nullableString.length}');
    print('Uppercase: ${nullableString.toUpperCase()}');
  }
  
  // Null check patterns
  print('\n=== Null Check Patterns ===');
  String? value1;
  String? value2 = 'World';
  
  // Pattern 1: if-null check
  if (value1 != null) {
    print('Value1: $value1');
  } else {
    print('Value1 is null');
  }
  
  // Pattern 2: null-coalescing
  print('Value1 or default: ${value1 ?? "default"}');
  
  // Pattern 3: null-aware call chain
  int? length1 = value1?.length;
  int? length2 = value2?.length;
  print('Length1: $length1, Length2: $length2');
  
  // Working with collections
  print('\n=== Collections and Null Safety ===');
  List<String> nonNullableList = ['A', 'B', 'C']; // Can't contain null
  List<String?> nullableList = ['A', null, 'C']; // Can contain null
  
  print('Non-nullable list: $nonNullableList');
  print('Nullable list: $nullableList');
  
  // Filtering nulls
  List<String> filtered = nullableList.whereType<String>().toList();
  print('Filtered (non-null): $filtered');
  
  // Map with nullable values
  Map<String, int?> scores = {
    'Alice': 95,
    'Bob': null,
    'Charlie': 87,
  };
  
  print('Scores: $scores');
  print('Bob\'s score: ${scores['Bob'] ?? "Not available"}');
  
  // Functions returning nullable values
  print('\n=== Functions with Nullable Returns ===');
  int? result = findNumber([1, 2, 3], 5);
  print('Finding 5: ${result ?? "Not found"}');
  
  result = findNumber([1, 2, 3], 2);
  print('Finding 2: $result');
  
  // Nullable in class properties
  print('\n=== Classes with Nullable Properties ===');
  User user1 = User('Alice', email: 'alice@example.com');
  user1.displayInfo();
  
  User user2 = User('Bob');
  user2.displayInfo();
}

// Function with required named parameters
void printPersonInfo({required String name, required int age}) {
  print('Name: $name, Age: $age');
}

// Function with optional parameters
void greet(String name, [String? title]) {
  if (title != null) {
    print('Hello, $title $name');
  } else {
    print('Hello, $name');
  }
}

// Late variable initialization function
String computeValue() {
  print('Computing expensive value...');
  return 'Computed Value';
}

// Function returning nullable value
int? findNumber(List<int> numbers, int target) {
  for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] == target) {
      return i;
    }
  }
  return null;
}

// Class with nullable properties
class User {
  String name;
  String? email;
  int? age;
  
  User(this.name, {this.email, this.age});
  
  void displayInfo() {
    print('User: $name');
    print('  Email: ${email ?? "Not provided"}');
    print('  Age: ${age ?? "Not specified"}');
  }
}
