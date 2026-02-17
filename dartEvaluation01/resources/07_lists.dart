// Lists (Arrays) in Dart

void main() {
  // Creating lists
  print('=== Creating Lists ===');
  List<int> numbers = [1, 2, 3, 4, 5];
  var fruits = ['Apple', 'Banana', 'Orange'];
  List<dynamic> mixed = [1, 'Two', 3.0, true];
  
  print('Numbers: $numbers');
  print('Fruits: $fruits');
  print('Mixed: $mixed');
  
  // List properties
  print('\n=== List Properties ===');
  print('Length: ${numbers.length}');
  print('Is empty: ${numbers.isEmpty}');
  print('Is not empty: ${numbers.isNotEmpty}');
  print('First element: ${numbers.first}');
  print('Last element: ${numbers.last}');
  print('Reversed: ${numbers.reversed}');
  
  // Accessing elements
  print('\n=== Accessing Elements ===');
  print('Element at index 0: ${fruits[0]}');
  print('Element at index 2: ${fruits[2]}');
  
  // Modifying lists
  print('\n=== Modifying Lists ===');
  List<String> colors = ['Red', 'Green', 'Blue'];
  print('Original: $colors');
  
  colors[1] = 'Yellow';
  print('After modification: $colors');
  
  colors.add('Purple');
  print('After add: $colors');
  
  colors.addAll(['Orange', 'Pink']);
  print('After addAll: $colors');
  
  colors.insert(1, 'Black');
  print('After insert at index 1: $colors');
  
  colors.remove('Yellow');
  print('After remove "Yellow": $colors');
  
  colors.removeAt(0);
  print('After removeAt 0: $colors');
  
  // List methods
  print('\n=== List Methods ===');
  List<int> nums = [5, 2, 8, 1, 9];
  print('Original: $nums');
  
  nums.sort();
  print('Sorted: $nums');
  
  nums.shuffle();
  print('Shuffled: $nums');
  
  print('Contains 8: ${nums.contains(8)}');
  print('Index of 8: ${nums.indexOf(8)}');
  
  // List iteration
  print('\n=== List Iteration ===');
  List<String> animals = ['Cat', 'Dog', 'Bird'];
  
  print('Using for loop:');
  for (int i = 0; i < animals.length; i++) {
    print('  $i: ${animals[i]}');
  }
  
  print('Using for-in loop:');
  for (var animal in animals) {
    print('  $animal');
  }
  
  print('Using forEach:');
  animals.forEach((animal) => print('  $animal'));
  
  // List transformations
  print('\n=== List Transformations ===');
  List<int> values = [1, 2, 3, 4, 5];
  
  var doubled = values.map((n) => n * 2).toList();
  print('Doubled: $doubled');
  
  var evens = values.where((n) => n % 2 == 0).toList();
  print('Even numbers: $evens');
  
  var sum = values.reduce((a, b) => a + b);
  print('Sum: $sum');
  
  // Spread operator
  print('\n=== Spread Operator ===');
  List<int> list1 = [1, 2, 3];
  List<int> list2 = [4, 5, 6];
  List<int> combined = [...list1, ...list2];
  print('Combined: $combined');
  
  // List comprehension (collection if/for)
  print('\n=== Collection If/For ===');
  bool includeZero = true;
  List<int> listWithCondition = [
    if (includeZero) 0,
    1,
    2,
    3,
  ];
  print('List with condition: $listWithCondition');
  
  List<int> generated = [
    for (var i = 1; i <= 5; i++) i * i
  ];
  print('Generated (squares): $generated');
  
  // Fixed-length list
  print('\n=== Fixed-length List ===');
  List<int> fixedList = List.filled(5, 0);
  print('Fixed list: $fixedList');
  fixedList[0] = 10;
  print('After modification: $fixedList');
}
