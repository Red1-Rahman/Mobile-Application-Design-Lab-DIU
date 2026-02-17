// Common Array/List Problems
// This program demonstrates solutions to frequently asked array problems in coding interviews

void main() {
  print('=== Array/List Problems ===\n');
  
  // PROBLEM 1: FIND LARGEST AND SMALLEST ELEMENT
  print('Problem 1: Find Largest and Smallest');
  List<int> arr1 = [5, 2, 9, 1, 7, 6, 3];
  print('Array: $arr1');
  print('Largest: ${findLargest(arr1)}');
  print('Smallest: ${findSmallest(arr1)}');
  
  // PROBLEM 2: REVERSE AN ARRAY
  print('\nProblem 2: Reverse Array');
  List<int> arr2 = [1, 2, 3, 4, 5];
  print('Original: $arr2');
  reverseArray(arr2);
  print('Reversed: $arr2');
  
  // PROBLEM 3: FIND SUM AND AVERAGE
  print('\nProblem 3: Sum and Average');
  List<int> arr3 = [10, 20, 30, 40, 50];
  print('Array: $arr3');
  print('Sum: ${arraySum(arr3)}');
  print('Average: ${arrayAverage(arr3)}');
  
  // PROBLEM 4: REMOVE DUPLICATES
  print('\nProblem 4: Remove Duplicates');
  List<int> arr4 = [1, 2, 2, 3, 4, 4, 5, 5, 5];
  print('Original: $arr4');
  print('Without duplicates: ${removeDuplicates(arr4)}');
  
  // PROBLEM 5: FIND SECOND LARGEST
  print('\nProblem 5: Find Second Largest');
  List<int> arr5 = [12, 35, 1, 10, 34, 1];
  print('Array: $arr5');
  print('Second largest: ${findSecondLargest(arr5)}');
  
  // PROBLEM 6: ROTATE ARRAY
  print('\nProblem 6: Rotate Array');
  List<int> arr6 = [1, 2, 3, 4, 5, 6, 7];
  print('Original: $arr6');
  List<int> rotated = rotateArray(arr6, 3);
  print('Rotated by 3 positions: $rotated');
  
  // PROBLEM 7: FIND MISSING NUMBER
  print('\nProblem 7: Find Missing Number');
  List<int> arr7 = [1, 2, 4, 5, 6];  // Missing 3
  print('Array: $arr7 (should contain 1 to 6)');
  print('Missing number: ${findMissingNumber(arr7, 6)}');
  
  // PROBLEM 8: MERGE TWO SORTED ARRAYS
  print('\nProblem 8: Merge Sorted Arrays');
  List<int> arr8a = [1, 3, 5, 7];
  List<int> arr8b = [2, 4, 6, 8];
  print('Array 1: $arr8a');
  print('Array 2: $arr8b');
  print('Merged: ${mergeSortedArrays(arr8a, arr8b)}');
  
  // PROBLEM 9: FIND PAIR WITH GIVEN SUM
  print('\nProblem 9: Find Pair with Sum');
  List<int> arr9 = [1, 4, 45, 6, 10, 8];
  int targetSum = 16;
  print('Array: $arr9');
  print('Target sum: $targetSum');
  List<int>? pair = findPairWithSum(arr9, targetSum);
  if (pair != null) {
    print('Pair found: ${pair[0]} + ${pair[1]} = $targetSum');
  }
  
  // PROBLEM 10: COUNT FREQUENCY OF ELEMENTS
  print('\nProblem 10: Count Element Frequency');
  List<int> arr10 = [1, 2, 2, 3, 3, 3, 4, 4, 4, 4];
  print('Array: $arr10');
  Map<int, int> freq = countFrequency(arr10);
  print('Frequency: $freq');
  
  // PROBLEM 11: MOVE ZEROS TO END
  print('\nProblem 11: Move Zeros to End');
  List<int> arr11 = [0, 1, 0, 3, 12, 0, 5];
  print('Original: $arr11');
  moveZerosToEnd(arr11);
  print('After moving zeros: $arr11');
  
  // PROBLEM 12: FIND SUBARRAY WITH GIVEN SUM
  print('\nProblem 12: Find Subarray with Given Sum');
  List<int> arr12 = [1, 4, 20, 3, 10, 5];
  int sum = 33;
  print('Array: $arr12');
  print('Target sum: $sum');
  List<int>? subarray = findSubarrayWithSum(arr12, sum);
  if (subarray != null) {
    print('Subarray found: $subarray (sum = ${subarray.reduce((a, b) => a + b)})');
  }
}

// PROBLEM 1: FIND LARGEST ELEMENT
// Iterates through array to find maximum value
// Time Complexity: O(n), Space Complexity: O(1)
int findLargest(List<int> arr) {
  if (arr.isEmpty) {
    throw ArgumentError('Array cannot be empty');
  }
  
  int largest = arr[0];
  
  // Compare each element with current largest
  for (int i = 1; i < arr.length; i++) {
    if (arr[i] > largest) {
      largest = arr[i];
    }
  }
  
  return largest;
}

// FIND SMALLEST ELEMENT
// Similar to findLargest but finds minimum
int findSmallest(List<int> arr) {
  if (arr.isEmpty) {
    throw ArgumentError('Array cannot be empty');
  }
  
  int smallest = arr[0];
  
  for (int i = 1; i < arr.length; i++) {
    if (arr[i] < smallest) {
      smallest = arr[i];
    }
  }
  
  return smallest;
}

// PROBLEM 2: REVERSE ARRAY IN PLACE
// Uses two pointers to swap elements
// Time Complexity: O(n), Space Complexity: O(1)
void reverseArray(List<int> arr) {
  int left = 0;
  int right = arr.length - 1;
  
  // Swap elements from both ends moving towards center
  while (left < right) {
    int temp = arr[left];
    arr[left] = arr[right];
    arr[right] = temp;
    left++;
    right--;
  }
}

// PROBLEM 3: ARRAY SUM
// Calculates sum of all elements
// Time Complexity: O(n), Space Complexity: O(1)
int arraySum(List<int> arr) {
  int sum = 0;
  
  for (int num in arr) {
    sum += num;
  }
  
  return sum;
}

// ARRAY AVERAGE
// Calculates average of all elements
double arrayAverage(List<int> arr) {
  if (arr.isEmpty) {
    return 0.0;
  }
  
  return arraySum(arr) / arr.length;
}

// PROBLEM 4: REMOVE DUPLICATES
// Returns new list with unique elements
// Time Complexity: O(n), Space Complexity: O(n)
List<int> removeDuplicates(List<int> arr) {
  // Using Set automatically removes duplicates
  return arr.toSet().toList();
}

// PROBLEM 5: FIND SECOND LARGEST
// Finds second largest element in array
// Time Complexity: O(n), Space Complexity: O(1)
int? findSecondLargest(List<int> arr) {
  if (arr.length < 2) {
    return null;  // Need at least 2 elements
  }
  
  int largest = arr[0];
  int secondLargest = -999999;  // Initialize with very small number
  
  // Find largest first
  for (int num in arr) {
    if (num > largest) {
      secondLargest = largest;
      largest = num;
    } else if (num > secondLargest && num != largest) {
      secondLargest = num;
    }
  }
  
  return secondLargest;
}

// PROBLEM 6: ROTATE ARRAY
// Rotates array to right by k positions
// Time Complexity: O(n), Space Complexity: O(n)
List<int> rotateArray(List<int> arr, int k) {
  if (arr.isEmpty) return arr;
  
  k = k % arr.length;  // Handle k > array length
  
  // Take last k elements and put them at start
  return [...arr.sublist(arr.length - k), ...arr.sublist(0, arr.length - k)];
}

// PROBLEM 7: FIND MISSING NUMBER
// Finds missing number in sequence 1 to n
// Uses sum formula: sum = n*(n+1)/2
// Time Complexity: O(n), Space Complexity: O(1)
int findMissingNumber(List<int> arr, int n) {
  // Expected sum of numbers 1 to n
  int expectedSum = n * (n + 1) ~/ 2;
  
  // Actual sum of array elements
  int actualSum = arr.reduce((a, b) => a + b);
  
  // Difference is the missing number
  return expectedSum - actualSum;
}

// PROBLEM 8: MERGE TWO SORTED ARRAYS
// Merges two sorted arrays into one sorted array
// Time Complexity: O(m + n), Space Complexity: O(m + n)
List<int> mergeSortedArrays(List<int> arr1, List<int> arr2) {
  List<int> merged = [];
  int i = 0, j = 0;
  
  // Compare elements from both arrays and add smaller one
  while (i < arr1.length && j < arr2.length) {
    if (arr1[i] <= arr2[j]) {
      merged.add(arr1[i]);
      i++;
    } else {
      merged.add(arr2[j]);
      j++;
    }
  }
  
  // Add remaining elements from arr1
  while (i < arr1.length) {
    merged.add(arr1[i]);
    i++;
  }
  
  // Add remaining elements from arr2
  while (j < arr2.length) {
    merged.add(arr2[j]);
    j++;
  }
  
  return merged;
}

// PROBLEM 9: FIND PAIR WITH GIVEN SUM
// Finds two numbers that add up to target sum
// Time Complexity: O(n), Space Complexity: O(n)
List<int>? findPairWithSum(List<int> arr, int targetSum) {
  Set<int> seen = {};
  
  for (int num in arr) {
    int complement = targetSum - num;
    
    // Check if complement exists in set
    if (seen.contains(complement)) {
      return [complement, num];
    }
    
    seen.add(num);
  }
  
  return null;  // No pair found
}

// PROBLEM 10: COUNT FREQUENCY OF ELEMENTS
// Counts how many times each element appears
// Time Complexity: O(n), Space Complexity: O(n)
Map<int, int> countFrequency(List<int> arr) {
  Map<int, int> frequency = {};
  
  for (int num in arr) {
    frequency[num] = (frequency[num] ?? 0) + 1;
  }
  
  return frequency;
}

// PROBLEM 11: MOVE ZEROS TO END
// Moves all zero elements to end of array
// Time Complexity: O(n), Space Complexity: O(1)
void moveZerosToEnd(List<int> arr) {
  int nonZeroIndex = 0;
  
  // Move all non-zero elements to front
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] != 0) {
      arr[nonZeroIndex] = arr[i];
      nonZeroIndex++;
    }
  }
  
  // Fill remaining positions with zeros
  for (int i = nonZeroIndex; i < arr.length; i++) {
    arr[i] = 0;
  }
}

// PROBLEM 12: FIND SUBARRAY WITH GIVEN SUM
// Finds contiguous subarray with given sum
// Uses sliding window technique
// Time Complexity: O(n), Space Complexity: O(1)
List<int>? findSubarrayWithSum(List<int> arr, int targetSum) {
  int currentSum = 0;
  int start = 0;
  
  for (int end = 0; end < arr.length; end++) {
    currentSum += arr[end];
    
    // Shrink window from left if sum exceeds target
    while (currentSum > targetSum && start <= end) {
      currentSum -= arr[start];
      start++;
    }
    
    // Check if current sum equals target
    if (currentSum == targetSum) {
      return arr.sublist(start, end + 1);
    }
  }
  
  return null;  // No subarray found
}
