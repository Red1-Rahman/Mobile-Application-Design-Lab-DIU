// Prime Number Program
// A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself
// Examples: 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, ...
// Note: 1 is NOT a prime number, 2 is the only even prime number

import 'dart:math';

void main() {
  print('=== Prime Number Programs ===\n');
  
  // CHECK IF A NUMBER IS PRIME
  print('=== Prime Number Check ===');
  
  // Test various numbers
  List<int> testNumbers = [1, 2, 3, 4, 15, 17, 29, 100, 97];
  
  for (int num in testNumbers) {
    bool isPrime = isPrimeBasic(num);
    print('$num is ${isPrime ? "PRIME" : "NOT PRIME"}');
  }
  
  // OPTIMIZED PRIME CHECK
  print('\n=== Optimized Prime Check ===');
  int largeNum = 104729;  // A large prime number
  print('Is $largeNum prime? ${isPrimeOptimized(largeNum)}');
  
  // PRINT PRIME NUMBERS IN A RANGE
  print('\n=== Prime Numbers from 1 to 50 ===');
  printPrimesInRange(1, 50);
  
  // FIRST N PRIME NUMBERS
  print('\n=== First 20 Prime Numbers ===');
  List<int> firstPrimes = getFirstNPrimes(20);
  print(firstPrimes.join(', '));
  
  // PRIME FACTORS
  print('\n=== Prime Factors ===');
  int number = 60;
  print('Prime factors of $number: ${getPrimeFactors(number)}');
  
  number = 100;
  print('Prime factors of $number: ${getPrimeFactors(number)}');
  
  // COUNT PRIMES UP TO N
  print('\n=== Count Prime Numbers ===');
  int limit = 100;
  print('Number of primes up to $limit: ${countPrimes(limit)}');
  
  // SIEVE OF ERATOSTHENES
  print('\n=== Sieve of Eratosthenes (Primes up to 30) ===');
  List<int> sievePrimes = sieveOfEratosthenes(30);
  print(sievePrimes.join(', '));
  
  // TWIN PRIMES
  print('\n=== Twin Primes (up to 100) ===');
  findTwinPrimes(100);
  
  // CHECK IF NUMBER IS PRIME USING DIFFERENT METHODS
  print('\n=== Performance Comparison for Prime Check ===');
  int testNum = 97;
  print('Testing number: $testNum');
  print('Basic method: ${isPrimeBasic(testNum)}');
  print('Optimized method: ${isPrimeOptimized(testNum)}');
  print('Trial division: ${isPrimeTrialDivision(testNum)}');
}

// METHOD 1: BASIC PRIME CHECK
// Checks divisibility by all numbers from 2 to n-1
// Time Complexity: O(n), Space Complexity: O(1)
// Simple but inefficient for large numbers
bool isPrimeBasic(int n) {
  // Numbers less than 2 are not prime
  if (n < 2) {
    return false;
  }
  
  // 2 is the only even prime number
  if (n == 2) {
    return true;
  }
  
  // Even numbers (except 2) are not prime
  if (n % 2 == 0) {
    return false;
  }
  
  // Check divisibility from 3 to n-1
  for (int i = 3; i < n; i++) {
    if (n % i == 0) {
      return false;  // Found a divisor, not prime
    }
  }
  
  return true;  // No divisors found, it's prime
}

// METHOD 2: OPTIMIZED PRIME CHECK
// Only checks divisibility up to square root of n
// Time Complexity: O(√n), Space Complexity: O(1)
// Much more efficient - if n has a divisor greater than √n, it must also have one less than √n
bool isPrimeOptimized(int n) {
  // Handle edge cases
  if (n < 2) return false;
  if (n == 2) return true;
  if (n % 2 == 0) return false;
  
  // Only check odd divisors up to square root of n
  // If n = a × b and a ≤ b, then a ≤ √n
  int sqrtN = sqrt(n).toInt();
  
  for (int i = 3; i <= sqrtN; i += 2) {
    if (n % i == 0) {
      return false;
    }
  }
  
  return true;
}

// METHOD 3: TRIAL DIVISION
// Checks divisibility by 2, 3, then numbers of form 6k±1
// Time Complexity: O(√n), Space Complexity: O(1)
// Based on fact that all primes > 3 are of the form 6k±1
bool isPrimeTrialDivision(int n) {
  if (n <= 1) return false;
  if (n <= 3) return true;
  
  // If divisible by 2 or 3, not prime
  if (n % 2 == 0 || n % 3 == 0) return false;
  
  // All primes > 3 are of form 6k±1
  // Check divisibility by numbers of form 6k±1 up to √n
  int i = 5;
  while (i * i <= n) {
    if (n % i == 0 || n % (i + 2) == 0) {
      return false;
    }
    i += 6;
  }
  
  return true;
}

// PRINT ALL PRIME NUMBERS IN A RANGE
// Displays all prime numbers between start and end (inclusive)
void printPrimesInRange(int start, int end) {
  List<int> primes = [];
  
  for (int i = start; i <= end; i++) {
    if (isPrimeOptimized(i)) {
      primes.add(i);
    }
  }
  
  print('Prime numbers: ${primes.join(', ')}');
  print('Total count: ${primes.length}');
}

// GET FIRST N PRIME NUMBERS
// Returns a list of first n prime numbers
List<int> getFirstNPrimes(int n) {
  List<int> primes = [];
  int num = 2;  // Start from first prime
  
  // Keep finding primes until we have n of them
  while (primes.length < n) {
    if (isPrimeOptimized(num)) {
      primes.add(num);
    }
    num++;
  }
  
  return primes;
}

// GET PRIME FACTORS OF A NUMBER
// Returns all prime factors of a given number
// Example: 60 = 2 × 2 × 3 × 5
List<int> getPrimeFactors(int n) {
  List<int> factors = [];
  
  // Divide by 2 while possible
  while (n % 2 == 0) {
    factors.add(2);
    n ~/= 2;
  }
  
  // Check odd divisors from 3 onwards
  for (int i = 3; i * i <= n; i += 2) {
    while (n % i == 0) {
      factors.add(i);
      n ~/= i;
    }
  }
  
  // If n is still greater than 1, it's a prime factor
  if (n > 1) {
    factors.add(n);
  }
  
  return factors;
}

// COUNT PRIME NUMBERS UP TO N
// Returns count of prime numbers less than or equal to n
int countPrimes(int n) {
  if (n < 2) return 0;
  
  int count = 0;
  
  for (int i = 2; i <= n; i++) {
    if (isPrimeOptimized(i)) {
      count++;
    }
  }
  
  return count;
}

// SIEVE OF ERATOSTHENES
// Efficient algorithm to find all primes up to n
// Time Complexity: O(n log log n), Space Complexity: O(n)
// Best method for finding multiple primes
List<int> sieveOfEratosthenes(int n) {
  if (n < 2) return [];
  
  // Create a boolean array and initialize all entries as true
  List<bool> isPrime = List.filled(n + 1, true);
  isPrime[0] = isPrime[1] = false;  // 0 and 1 are not prime
  
  // Start with smallest prime number, 2
  for (int i = 2; i * i <= n; i++) {
    // If i is prime, mark all its multiples as not prime
    if (isPrime[i]) {
      for (int j = i * i; j <= n; j += i) {
        isPrime[j] = false;
      }
    }
  }
  
  // Collect all numbers that are still marked as prime
  List<int> primes = [];
  for (int i = 2; i <= n; i++) {
    if (isPrime[i]) {
      primes.add(i);
    }
  }
  
  return primes;
}

// FIND TWIN PRIMES
// Twin primes are pairs of primes that differ by 2
// Examples: (3,5), (5,7), (11,13), (17,19), (29,31)
void findTwinPrimes(int limit) {
  List<String> twinPrimes = [];
  
  for (int i = 2; i < limit - 1; i++) {
    // Check if both i and i+2 are prime
    if (isPrimeOptimized(i) && isPrimeOptimized(i + 2)) {
      twinPrimes.add('($i, ${i + 2})');
    }
  }
  
  print('Twin primes: ${twinPrimes.join(', ')}');
}
