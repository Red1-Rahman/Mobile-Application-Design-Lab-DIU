// String Reversal Program
// Demonstrates various methods to reverse a string in Dart
// String reversal is a common problem in programming interviews

void main() {
  print('=== String Reversal Methods ===\n');
  
  String original = 'Hello World';
  print('Original String: "$original"\n');
  
  // METHOD 1: Using built-in methods
  print('Method 1: Built-in Split-Reverse-Join');
  String reversed1 = reverseStringBuiltIn(original);
  print('Reversed: "$reversed1"\n');
  
  // METHOD 2: Using loop (character by character)
  print('Method 2: Using For Loop');
  String reversed2 = reverseStringLoop(original);
  print('Reversed: "$reversed2"\n');
  
  // METHOD 3: Using recursion
  print('Method 3: Using Recursion');
  String reversed3 = reverseStringRecursive(original);
  print('Reversed: "$reversed3"\n');
  
  // METHOD 4: Using StringBuffer (efficient for large strings)
  print('Method 4: Using StringBuffer');
  String reversed4 = reverseStringBuffer(original);
  print('Reversed: "$reversed4"\n');
  
  // METHOD 5: Using Stack
  print('Method 5: Using Stack (List as Stack)');
  String reversed5 = reverseStringStack(original);
  print('Reversed: "$reversed5"\n');
  
  // WORD REVERSAL (reverse order of words)
  print('Method 6: Reverse Word Order');
  String sentence = 'Dart is awesome';
  print('Original: "$sentence"');
  print('Words Reversed: "${reverseWords(sentence)}"\n');
  
  // REVERSE EACH WORD
  print('Method 7: Reverse Each Word Individually');
  print('Original: "$sentence"');
  print('Each Word Reversed: "${reverseEachWord(sentence)}"\n');
  
  // REVERSE VOWELS ONLY
  print('Method 8: Reverse Only Vowels');
  print('Original: "$original"');
  print('Vowels Reversed: "${reverseVowels(original)}"\n');
  
  // REVERSE IN PLACE (character array)
  print('Method 9: Reverse Character List In-Place');
  List<String> chars = original.split('');
  print('Original: ${chars.join()}');
  reverseListInPlace(chars);
  print('Reversed: ${chars.join()}\n');
}

// METHOD 1: BUILT-IN METHODS
// Uses Dart's built-in split, reversed, and join methods
// Time Complexity: O(n), Space Complexity: O(n)
// Most concise and readable approach
String reverseStringBuiltIn(String str) {
  // Step 1: split('') converts string to list of characters
  // Step 2: reversed returns an iterable in reverse order
  // Step 3: join('') combines characters back into string
  return str.split('').reversed.join('');
}

// METHOD 2: USING FOR LOOP
// Manually iterates through string from end to start
// Time Complexity: O(n), Space Complexity: O(n)
// Good for understanding the logic
String reverseStringLoop(String str) {
  String reversed = '';
  
  // Loop from last character to first
  for (int i = str.length - 1; i >= 0; i--) {
    reversed += str[i];  // Append each character
  }
  
  return reversed;
}

// METHOD 3: RECURSIVE APPROACH
// Recursively reverses by taking last character and reversing rest
// Time Complexity: O(n), Space Complexity: O(n) due to recursion stack
// Elegant but not recommended for very long strings
String reverseStringRecursive(String str) {
  // Base case: empty or single character string
  if (str.length <= 1) {
    return str;
  }
  
  // Take last character + reverse of remaining string
  // Example: "abc" -> "c" + reverse("ab") -> "c" + "ba" -> "cba"
  return str[str.length - 1] + reverseStringRecursive(str.substring(0, str.length - 1));
}

// METHOD 4: USING STRINGBUFFER
// StringBuffer is more efficient for string concatenation
// Time Complexity: O(n), Space Complexity: O(n)
// Best for large strings due to better performance
String reverseStringBuffer(String str) {
  StringBuffer buffer = StringBuffer();
  
  // Add characters in reverse order to buffer
  for (int i = str.length - 1; i >= 0; i--) {
    buffer.write(str[i]);
  }
  
  return buffer.toString();
}

// METHOD 5: USING STACK (LIFO - Last In First Out)
// Pushes all characters to stack, then pops them
// Demonstrates stack data structure concept
// Time Complexity: O(n), Space Complexity: O(n)
String reverseStringStack(String str) {
  List<String> stack = [];
  
  // Push all characters onto stack
  for (int i = 0; i < str.length; i++) {
    stack.add(str[i]);
  }
  
  StringBuffer result = StringBuffer();
  
  // Pop characters from stack (automatically reverses due to LIFO)
  while (stack.isNotEmpty) {
    result.write(stack.removeLast());
  }
  
  return result.toString();
}

// METHOD 6: REVERSE WORD ORDER
// Reverses the order of words in a sentence
// Example: "Hello World" -> "World Hello"
// Time Complexity: O(n), Space Complexity: O(n)
String reverseWords(String str) {
  // Split sentence into words, reverse order, join back
  return str.split(' ').reversed.join(' ');
}

// METHOD 7: REVERSE EACH WORD INDIVIDUALLY
// Keeps word order but reverses each word
// Example: "Hello World" -> "olleH dlroW"
// Time Complexity: O(n), Space Complexity: O(n)
String reverseEachWord(String str) {
  List<String> words = str.split(' ');
  
  // Reverse each word individually
  List<String> reversedWords = words.map((word) {
    return word.split('').reversed.join('');
  }).toList();
  
  return reversedWords.join(' ');
}

// METHOD 8: REVERSE ONLY VOWELS
// Reverses only vowels in the string, keeping consonants in place
// Example: "Hello" -> "Holle"
// Time Complexity: O(n), Space Complexity: O(n)
String reverseVowels(String str) {
  List<String> chars = str.split('');
  Set<String> vowels = {'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'};
  
  int left = 0;
  int right = chars.length - 1;
  
  // Two pointer approach - swap only vowels
  while (left < right) {
    // Move left pointer to next vowel
    while (left < right && !vowels.contains(chars[left])) {
      left++;
    }
    
    // Move right pointer to previous vowel
    while (left < right && !vowels.contains(chars[right])) {
      right--;
    }
    
    // Swap vowels
    if (left < right) {
      String temp = chars[left];
      chars[left] = chars[right];
      chars[right] = temp;
      left++;
      right--;
    }
  }
  
  return chars.join('');
}

// METHOD 9: IN-PLACE REVERSAL (for lists)
// Reverses a list in-place without creating new list
// Time Complexity: O(n), Space Complexity: O(1)
// Most memory efficient approach
void reverseListInPlace<T>(List<T> list) {
  int left = 0;
  int right = list.length - 1;
  
  // Swap elements from both ends moving towards center
  while (left < right) {
    // Swap elements at left and right positions
    T temp = list[left];
    list[left] = list[right];
    list[right] = temp;
    
    // Move pointers
    left++;
    right--;
  }
}
