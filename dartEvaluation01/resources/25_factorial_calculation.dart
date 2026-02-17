// Factorial Calculation Program
// Factorial of n (written as n!) is the product of all positive integers less than or equal to n
// Formula: n! = n × (n-1) × (n-2) × ... × 2 × 1
// Special cases: 0! = 1, 1! = 1
// Example: 5! = 5 × 4 × 3 × 2 × 1 = 120

void main() {
  print('=== Factorial Calculation ===\n');
  
  // METHOD 1: ITERATIVE APPROACH
  print('Method 1: Iterative (Using Loop)');
  int n = 5;
  print('$n! = ${factorialIterative(n)}');
  
  // METHOD 2: RECURSIVE APPROACH
  print('\nMethod 2: Recursive');
  print('$n! = ${factorialRecursive(n)}');
  
  // METHOD 3: USING REDUCE
  print('\nMethod 3: Using List.reduce()');
  print('$n! = ${factorialReduce(n)}');
  
  // FACTORIAL TABLE
  print('\n=== Factorial Table (0 to 10) ===');
  printFactorialTable(10);
  
  // LARGE FACTORIAL (using BigInt for very large numbers)
  print('\n=== Large Factorial ===');
  int largeN = 20;
  print('$largeN! = ${factorialBigInt(largeN)}');
  
  // TRAILING ZEROS IN FACTORIAL
  print('\n=== Trailing Zeros ===');
  int num = 10;
  print('$num! has ${trailingZerosInFactorial(num)} trailing zeros');
  print('$num! = ${factorialIterative(num)}');
  
  num = 25;
  print('$num! has ${trailingZerosInFactorial(num)} trailing zeros');
  
  // FACTORIAL OF ZERO AND ONE
  print('\n=== Special Cases ===');
  print('0! = ${factorialIterative(0)} (By definition)');
  print('1! = ${factorialIterative(1)}');
  
  // COMPARE METHODS PERFORMANCE
  print('\n=== Different Methods Comparison ===');
  int testNum = 6;
  print('Calculating $testNum!:');
  print('Iterative: ${factorialIterative(testNum)}');
  print('Recursive: ${factorialRecursive(testNum)}');
  print('Reduce: ${factorialReduce(testNum)}');
  
  // DOUBLE FACTORIAL (n!!)
  print('\n=== Double Factorial ===');
  int dNum = 7;
  print('$dNum!! = ${doubleFactorial(dNum)}');
  print('Explanation: $dNum!! = 7 × 5 × 3 × 1 = ${doubleFactorial(dNum)}');
}

// METHOD 1: ITERATIVE APPROACH
// Uses a loop to calculate factorial
// Time Complexity: O(n), Space Complexity: O(1)
// Most efficient and recommended for most cases
int factorialIterative(int n) {
  // Factorial is not defined for negative numbers
  if (n < 0) {
    throw ArgumentError('Factorial is not defined for negative numbers');
  }
  
  // Base case: 0! = 1 and 1! = 1
  if (n == 0 || n == 1) {
    return 1;
  }
  
  int result = 1;
  
  // Multiply all numbers from 2 to n
  for (int i = 2; i <= n; i++) {
    result *= i;
  }
  
  return result;
}

// METHOD 2: RECURSIVE APPROACH
// Function calls itself with smaller input
// Time Complexity: O(n), Space Complexity: O(n) due to call stack
// Elegant but can cause stack overflow for large n
int factorialRecursive(int n) {
  // Input validation
  if (n < 0) {
    throw ArgumentError('Factorial is not defined for negative numbers');
  }
  
  // Base case: 0! = 1 and 1! = 1
  if (n == 0 || n == 1) {
    return 1;
  }
  
  // Recursive case: n! = n × (n-1)!
  // Example: 5! = 5 × 4! = 5 × (4 × 3!) = 5 × 4 × 3 × 2 × 1
  return n * factorialRecursive(n - 1);
}

// METHOD 3: USING LIST.REDUCE()
// Creates a list of numbers and uses reduce to multiply them
// Time Complexity: O(n), Space Complexity: O(n)
// Functional programming approach
int factorialReduce(int n) {
  // Input validation
  if (n < 0) {
    throw ArgumentError('Factorial is not defined for negative numbers');
  }
  
  // Base cases
  if (n == 0 || n == 1) {
    return 1;
  }
  
  // Create list from 1 to n and multiply all elements
  // List.generate creates [1, 2, 3, ..., n]
  // reduce multiplies all elements together
  return List.generate(n, (i) => i + 1).reduce((a, b) => a * b);
}

// PRINT FACTORIAL TABLE
// Displays factorials from 0 to n in tabular format
void printFactorialTable(int n) {
  print('Number | Factorial');
  print('-------|----------');
  
  for (int i = 0; i <= n; i++) {
    // Use string padding for alignment
    String number = i.toString().padLeft(6);
    String factorial = factorialIterative(i).toString();
    print('$number | $factorial');
  }
}

// FACTORIAL WITH BIGINT (for very large numbers)
// Regular int can overflow for large factorials
// BigInt can handle arbitrarily large integers
// Use for n > 20 to avoid overflow
BigInt factorialBigInt(int n) {
  if (n < 0) {
    throw ArgumentError('Factorial is not defined for negative numbers');
  }
  
  if (n == 0 || n == 1) {
    return BigInt.one;
  }
  
  BigInt result = BigInt.one;
  
  // Calculate using BigInt to handle large numbers
  for (int i = 2; i <= n; i++) {
    result *= BigInt.from(i);
  }
  
  return result;
}

// COUNT TRAILING ZEROS IN FACTORIAL
// Trailing zeros are produced by factors of 10 (2 × 5)
// Since there are more 2s than 5s, we count factors of 5
// Time Complexity: O(log n)
int trailingZerosInFactorial(int n) {
  if (n < 0) {
    return -1;
  }
  
  int count = 0;
  
  // Keep dividing n by powers of 5 and add to count
  // This counts how many times 5 appears as a factor
  // Example: 25! has 5 factors of 5 (5,10,15,20) + 1 additional from 25 (5²)
  int divisor = 5;
  while (divisor <= n) {
    count += n ~/ divisor;
    divisor *= 5;
  }
  
  return count;
}

// DOUBLE FACTORIAL
// Double factorial n!! is product of every other number
// For odd n: n!! = n × (n-2) × (n-4) × ... × 3 × 1
// For even n: n!! = n × (n-2) × (n-4) × ... × 4 × 2
// Example: 7!! = 7 × 5 × 3 × 1 = 105
int doubleFactorial(int n) {
  if (n < 0) {
    throw ArgumentError('Double factorial is not defined for negative numbers');
  }
  
  // Base cases
  if (n == 0 || n == 1) {
    return 1;
  }
  
  int result = 1;
  
  // Multiply every other number
  for (int i = n; i > 0; i -= 2) {
    result *= i;
  }
  
  return result;
}

// TAIL RECURSIVE FACTORIAL (optimization for some compilers)
// Uses accumulator to avoid building up call stack
// Dart doesn't optimize tail recursion, but shown for educational purposes
int factorialTailRecursive(int n, [int accumulator = 1]) {
  if (n < 0) {
    throw ArgumentError('Factorial is not defined for negative numbers');
  }
  
  // Base case
  if (n == 0 || n == 1) {
    return accumulator;
  }
  
  // Tail recursive call - last operation is the recursive call
  return factorialTailRecursive(n - 1, n * accumulator);
}
