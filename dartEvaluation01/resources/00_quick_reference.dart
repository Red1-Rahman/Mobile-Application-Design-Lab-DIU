// QUICK REFERENCE GUIDE
// This file demonstrates common patterns and syntax used across all programs

void main() {
  print('=== Dart Quick Reference ===\n');
  
  // VARIABLES & TYPES
  print('1. VARIABLES & TYPES');
  int number = 42;                    // Integer
  double decimal = 3.14;              // Floating point
  String text = 'Hello';              // String
  bool flag = true;                   // Boolean
  var inferred = 'Auto-typed';        // Type inference
  dynamic flexible = 'Any type';      // Dynamic type
  String? nullable;                   // Nullable type
  final runtime = DateTime.now();     // Runtime constant
  const compile = 100;                // Compile-time constant
  print('✓ Variables declared\n');
  
  // OPERATORS
  print('2. OPERATORS');
  int sum = 5 + 3;                    // Addition
  int diff = 5 - 3;                   // Subtraction
  int product = 5 * 3;                // Multiplication
  double quotient = 5 / 3;            // Division (double)
  int intDiv = 5 ~/ 3;                // Integer division
  int remainder = 5 % 3;              // Modulo
  bool isEqual = (5 == 3);            // Equality
  bool isGreater = (5 > 3);           // Comparison
  String? value = null;
  String result = value ?? 'default'; // Null coalescing
  print('✓ Operators demonstrated\n');
  
  // CONTROL FLOW
  print('3. CONTROL FLOW');
  
  // If-else
  if (number > 40) {
    print('Number is greater than 40');
  } else {
    print('Number is 40 or less');
  }
  
  // Switch
  switch (number) {
    case 42:
      print('The answer!');
      break;
    default:
      print('Some other number');
  }
  
  // For loop
  for (int i = 0; i < 3; i++) {
    // Loop body
  }
  
  // While loop
  int count = 0;
  while (count < 3) {
    count++;
  }
  
  // For-in loop
  for (var item in [1, 2, 3]) {
    // Process item
  }
  print('✓ Control flow structures\n');
  
  // FUNCTIONS
  print('4. FUNCTIONS');
  
  // Regular function
  int add(int a, int b) => a + b;
  
  // Optional parameters
  void greet([String name = 'Guest']) {
    print('Hello, $name');
  }
  
  // Named parameters
  void printInfo({required String name, int age = 0}) {
    print('$name is $age years old');
  }
  
  print('Sum: ${add(5, 3)}');
  greet('Alice');
  printInfo(name: 'Bob', age: 25);
  print('✓ Functions demonstrated\n');
  
  // COLLECTIONS
  print('5. COLLECTIONS');
  
  // List
  List<int> numbers = [1, 2, 3, 4, 5];
  numbers.add(6);
  numbers.remove(3);
  
  // Set
  Set<String> uniqueNames = {'Alice', 'Bob', 'Charlie'};
  uniqueNames.add('Alice'); // Won't be added (duplicate)
  
  // Map
  Map<String, int> ages = {
    'Alice': 25,
    'Bob': 30,
  };
  ages['Charlie'] = 35;
  
  print('List: $numbers');
  print('Set: $uniqueNames');
  print('Map: $ages');
  print('✓ Collections demonstrated\n');
  
  // CLASSES
  print('6. CLASSES');
  var person = Person('John', 28);
  person.introduce();
  print('✓ Classes demonstrated\n');
  
  // COMMON PATTERNS
  print('7. COMMON PATTERNS');
  
  // List operations
  var doubled = numbers.map((n) => n * 2).toList();
  var evens = numbers.where((n) => n % 2 == 0).toList();
  var sum2 = numbers.reduce((a, b) => a + b);
  
  // String operations
  String sentence = 'Hello World';
  var upper = sentence.toUpperCase();
  var reversed = sentence.split('').reversed.join();
  var words = sentence.split(' ');
  
  // Error handling
  try {
    throw Exception('Example error');
  } catch (e) {
    print('Caught: ${e.toString()}');
  }
  
  print('✓ Common patterns demonstrated\n');
  
  print('=== Reference Complete ===');
}

// Example class
class Person {
  String name;
  int age;
  
  Person(this.name, this.age);
  
  void introduce() {
    print('Hi, I\'m $name, $age years old');
  }
}

// ALGORITHM TIME COMPLEXITIES
/*
O(1)      - Constant time
O(log n)  - Logarithmic time (e.g., binary search)
O(n)      - Linear time (e.g., single loop)
O(n log n)- Linearithmic (e.g., merge sort)
O(n²)     - Quadratic time (e.g., nested loops)
O(2ⁿ)     - Exponential time (e.g., naive recursion)
*/

// PROBLEM-SOLVING PATTERNS
/*
1. Two Pointers - Use for arrays, strings
2. Sliding Window - For subarray/substring problems
3. Hash Map - For frequency counting, pair finding
4. Recursion - For tree/graph, divide-conquer
5. Dynamic Programming - For optimization problems
6. Greedy - For local optimal choices
7. Binary Search - For sorted arrays
8. DFS/BFS - For graphs and trees
*/

// COMMON ARRAY OPERATIONS
/*
find largest: iterate and compare
reverse: two pointers swap
remove duplicates: use Set
find pair sum: use HashMap
rotate: slice and concatenate
merge sorted: two pointers
*/

// COMMON STRING OPERATIONS
/*
reverse: split-reverse-join
palindrome: two pointers
anagram: sort and compare
substring: sliding window
pattern match: KMP/regex
*/

// MATHEMATICAL ALGORITHMS
/*
fibonacci: iterative with two vars
factorial: iterative multiplication
prime: check divisors up to √n
GCD: Euclidean algorithm
LCM: (a*b)/GCD(a,b)
*/
