// Palindrome Checking Program
// A palindrome is a word, phrase, number, or sequence that reads the same backward as forward
// Examples: "madam", "racecar", "12321"

void main() {
  print('=== Palindrome Checker ===\n');
  
  // STRING PALINDROME EXAMPLES
  print('=== String Palindrome Tests ===');
  
  // Test case 1: Simple palindrome
  String word1 = 'racecar';
  print('Is "$word1" a palindrome? ${isPalindromeString(word1)}');
  
  // Test case 2: Not a palindrome
  String word2 = 'hello';
  print('Is "$word2" a palindrome? ${isPalindromeString(word2)}');
  
  // Test case 3: Palindrome word
  String word3 = 'madam';
  print('Is "$word3" a palindrome? ${isPalindromeString(word3)}');
  
  // NUMBER PALINDROME EXAMPLES
  print('\n=== Number Palindrome Tests ===');
  
  // Test case 4: Palindrome number
  int num1 = 12321;
  print('Is $num1 a palindrome? ${isPalindromeNumber(num1)}');
  
  // Test case 5: Not a palindrome
  int num2 = 12345;
  print('Is $num2 a palindrome? ${isPalindromeNumber(num2)}');
  
  // Test case 6: Single digit (always palindrome)
  int num3 = 7;
  print('Is $num3 a palindrome? ${isPalindromeNumber(num3)}');
}

// METHOD 1: STRING PALINDROME (Using String Reversal)
// Reverses the string and compares with original
// Time Complexity: O(n), Space Complexity: O(n)
bool isPalindromeString(String str) {
  // Handle empty string or single character
  if (str.length <= 1) {
    return true;
  }
  
  // Reverse the string by splitting into characters, reversing, and joining
  String reversed = str.split('').reversed.join('');
  
  // Compare original with reversed
  return str == reversed;
}

// METHOD 2: NUMBER PALINDROME
// Checks if a number is palindrome by reversing its digits
// Time Complexity: O(log n) where n is the number
bool isPalindromeNumber(int num) {
  // Negative numbers are not palindromes
  if (num < 0) {
    return false;
  }
  
  // Single digit numbers are palindromes
  if (num < 10) {
    return true;
  }
  
  int original = num;
  int reversed = 0;
  
  // Reverse the number digit by digit
  while (num > 0) {
    int digit = num % 10;  // Get last digit
    reversed = reversed * 10 + digit;  // Add digit to reversed number
    num ~/= 10;  // Remove last digit from original
  }
  
  // Check if original equals reversed
  return original == reversed;
}
