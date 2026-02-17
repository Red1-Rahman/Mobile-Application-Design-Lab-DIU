// Sets in Dart

void main() {
  // Creating sets
  print('=== Creating Sets ===');
  Set<int> numbers = {1, 2, 3, 4, 5};
  var fruits = {'Apple', 'Banana', 'Orange'};
  Set<String> emptySet = {};
  
  print('Numbers: $numbers');
  print('Fruits: $fruits');
  
  // Sets automatically remove duplicates
  print('\n=== Duplicate Removal ===');
  Set<int> withDuplicates = {1, 2, 2, 3, 3, 3, 4};
  print('Set with duplicates: $withDuplicates');
  
  // Set properties
  print('\n=== Set Properties ===');
  print('Length: ${numbers.length}');
  print('Is empty: ${numbers.isEmpty}');
  print('Is not empty: ${numbers.isNotEmpty}');
  print('First element: ${numbers.first}');
  print('Last element: ${numbers.last}');
  
  // Adding elements
  print('\n=== Adding Elements ===');
  Set<String> colors = {'Red', 'Green'};
  print('Original: $colors');
  
  colors.add('Blue');
  print('After add: $colors');
  
  colors.add('Red'); // Won't be added (duplicate)
  print('After adding duplicate: $colors');
  
  colors.addAll({'Yellow', 'Purple'});
  print('After addAll: $colors');
  
  // Removing elements
  print('\n=== Removing Elements ===');
  colors.remove('Green');
  print('After remove: $colors');
  
  colors.removeAll({'Yellow', 'Purple'});
  print('After removeAll: $colors');
  
  // Set operations
  print('\n=== Set Operations ===');
  Set<int> setA = {1, 2, 3, 4, 5};
  Set<int> setB = {4, 5, 6, 7, 8};
  
  print('Set A: $setA');
  print('Set B: $setB');
  
  // Union
  print('Union (A ∪ B): ${setA.union(setB)}');
  
  // Intersection
  print('Intersection (A ∩ B): ${setA.intersection(setB)}');
  
  // Difference
  print('Difference (A - B): ${setA.difference(setB)}');
  
  // Checking elements
  print('\n=== Checking Elements ===');
  print('Contains 3: ${setA.contains(3)}');
  print('Contains 10: ${setA.contains(10)}');
  print('Contains all [1, 2]: ${setA.containsAll([1, 2])}');
  
  // Set iteration
  print('\n=== Set Iteration ===');
  Set<String> animals = {'Cat', 'Dog', 'Bird'};
  
  print('Using for-in:');
  for (var animal in animals) {
    print('  $animal');
  }
  
  print('Using forEach:');
  animals.forEach((animal) => print('  $animal'));
  
  // Converting between List and Set
  print('\n=== List ↔ Set Conversion ===');
  List<int> listWithDups = [1, 2, 2, 3, 3, 4];
  print('List with duplicates: $listWithDups');
  
  Set<int> uniqueSet = listWithDups.toSet();
  print('Converted to Set: $uniqueSet');
  
  List<int> backToList = uniqueSet.toList();
  print('Back to List: $backToList');
  
  // Set transformations
  print('\n=== Set Transformations ===');
  Set<int> values = {1, 2, 3, 4, 5};
  
  var doubled = values.map((n) => n * 2).toSet();
  print('Doubled: $doubled');
  
  var evens = values.where((n) => n % 2 == 0).toSet();
  print('Even numbers: $evens');
  
  // Checking subset/superset
  print('\n=== Subset/Superset ===');
  Set<int> small = {1, 2};
  Set<int> large = {1, 2, 3, 4, 5};
  
  print('Small set: $small');
  print('Large set: $large');
  print('Small is subset of Large: ${small.difference(large).isEmpty}');
  print('Large is superset of Small: ${large.containsAll(small)}');
}
