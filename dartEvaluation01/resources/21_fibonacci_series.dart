// Fibonacci Series Problem
// The Fibonacci sequence is a series where each number is the sum of the two preceding ones
// Series: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ...
// Formula: F(n) = F(n-1) + F(n-2), where F(0) = 0 and F(1) = 1

void main() {
  print('=== Fibonacci Series ===\n');
  
  // METHOD 1: Using Iteration (Loop)
  // This is more efficient for larger numbers
  // Time Complexity: O(n), Space Complexity: O(1)
  print('Method 1: Iterative Approach');
  int n = 10;  // Number of terms to generate
  fibonacciIterative(n);
  
  // METHOD 2: Using Recursion
  // Simple to understand but less efficient for large numbers
  // Time Complexity: O(2^n), Space Complexity: O(n) due to call stack
  print('\nMethod 2: Recursive Approach');
  print('First $n Fibonacci numbers:');
  for (int i = 0; i < n; i++) {
    print('F($i) = ${fibonacciRecursive(i)}');
  }
  
  // METHOD 3: Display only Fibonacci series up to n terms
  print('\nMethod 3: Fibonacci Series up to 15 terms');
  displayFibonacciSeries(15);
  
  // METHOD 4: Fibonacci numbers up to a certain value
  print('\nMethod 4: Fibonacci numbers up to 100');
  fibonacciUpToValue(100);
  
  // METHOD 5: Memoization (Dynamic Programming)
  // Optimizes recursive approach by storing previously calculated values
  // Time Complexity: O(n), Space Complexity: O(n)
  print('\nMethod 5: Using Memoization (Optimized Recursion)');
  Map<int, int> memo = {};
  print('F(20) using memoization = ${fibonacciMemo(20, memo)}');
  print('F(30) using memoization = ${fibonacciMemo(30, memo)}');
}

// ITERATIVE APPROACH
// Uses a loop to calculate Fibonacci numbers
// Most efficient for larger numbers
void fibonacciIterative(int n) {
  // Handle edge cases
  if (n <= 0) {
    print('Please enter a positive number');
    return;
  }
  
  // Initialize first two numbers
  int first = 0, second = 1;
  
  print('Fibonacci Series (First $n terms):');
  
  // Generate and print Fibonacci series
  for (int i = 0; i < n; i++) {
    print('Term ${i + 1}: $first');
    
    // Calculate next term
    int next = first + second;
    
    // Update values for next iteration
    first = second;
    second = next;
  }
}

// RECURSIVE APPROACH
// Uses function calling itself to calculate Fibonacci
// Simple but inefficient for large numbers due to repeated calculations
int fibonacciRecursive(int n) {
  // Base cases: F(0) = 0, F(1) = 1
  if (n <= 1) {
    return n;
  }
  
  // Recursive case: F(n) = F(n-1) + F(n-2)
  return fibonacciRecursive(n - 1) + fibonacciRecursive(n - 2);
}

// DISPLAY FIBONACCI SERIES
// Shows Fibonacci sequence in a single line
void displayFibonacciSeries(int n) {
  if (n <= 0) {
    print('Please enter a positive number');
    return;
  }
  
  List<int> series = [];
  int first = 0, second = 1;
  
  // Build the series
  for (int i = 0; i < n; i++) {
    series.add(first);
    int next = first + second;
    first = second;
    second = next;
  }
  
  print('Series: ${series.join(', ')}');
}

// FIBONACCI UP TO A VALUE
// Generates all Fibonacci numbers less than or equal to a given value
void fibonacciUpToValue(int maxValue) {
  if (maxValue < 0) {
    print('Please enter a non-negative number');
    return;
  }
  
  List<int> series = [];
  int first = 0, second = 1;
  
  // Generate Fibonacci numbers up to maxValue
  while (first <= maxValue) {
    series.add(first);
    int next = first + second;
    first = second;
    second = next;
  }
  
  print('Fibonacci numbers up to $maxValue: ${series.join(', ')}');
}

// MEMOIZATION APPROACH (Dynamic Programming)
// Stores previously calculated values to avoid redundant calculations
// Combines efficiency of iteration with simplicity of recursion
int fibonacciMemo(int n, Map<int, int> memo) {
  // Check if value already calculated
  if (memo.containsKey(n)) {
    return memo[n]!;
  }
  
  // Base cases
  if (n <= 1) {
    return n;
  }
  
  // Calculate and store result
  memo[n] = fibonacciMemo(n - 1, memo) + fibonacciMemo(n - 2, memo);
  return memo[n]!;
}
