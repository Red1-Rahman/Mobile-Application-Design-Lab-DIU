// Maps (Dictionaries) in Dart

void main() {
  // Creating maps
  print('=== Creating Maps ===');
  Map<String, int> ages = {
    'Alice': 25,
    'Bob': 30,
    'Charlie': 35
  };
  
  var scores = {
    'Math': 95,
    'Science': 88,
    'English': 92
  };
  
  Map<String, dynamic> person = {
    'name': 'John',
    'age': 28,
    'isStudent': false
  };
  
  print('Ages: $ages');
  print('Scores: $scores');
  print('Person: $person');
  
  // Map properties
  print('\n=== Map Properties ===');
  print('Length: ${ages.length}');
  print('Is empty: ${ages.isEmpty}');
  print('Is not empty: ${ages.isNotEmpty}');
  print('Keys: ${ages.keys}');
  print('Values: ${ages.values}');
  print('Entries: ${ages.entries}');
  
  // Accessing values
  print('\n=== Accessing Values ===');
  print('Alice\'s age: ${ages['Alice']}');
  print('Bob\'s age: ${ages['Bob']}');
  print('Non-existent key: ${ages['David']}'); // Returns null
  
  // Adding/Updating entries
  print('\n=== Adding/Updating Entries ===');
  Map<String, String> countries = {'USA': 'Washington D.C.'};
  print('Original: $countries');
  
  countries['UK'] = 'London';
  print('After adding UK: $countries');
  
  countries['USA'] = 'Washington';
  print('After updating USA: $countries');
  
  countries.addAll({'France': 'Paris', 'Germany': 'Berlin'});
  print('After addAll: $countries');
  
  // Removing entries
  print('\n=== Removing Entries ===');
  countries.remove('Germany');
  print('After remove: $countries');
  
  countries.clear();
  print('After clear: $countries');
  
  // Checking keys/values
  print('\n=== Checking Keys/Values ===');
  Map<String, int> inventory = {
    'Apples': 50,
    'Bananas': 30,
    'Oranges': 40
  };
  
  print('Contains key "Apples": ${inventory.containsKey('Apples')}');
  print('Contains value 30: ${inventory.containsValue(30)}');
  
  // Map iteration
  print('\n=== Map Iteration ===');
  
  print('Iterating over keys:');
  for (var key in inventory.keys) {
    print('  $key: ${inventory[key]}');
  }
  
  print('Iterating over values:');
  for (var value in inventory.values) {
    print('  $value');
  }
  
  print('Iterating over entries:');
  for (var entry in inventory.entries) {
    print('  ${entry.key}: ${entry.value}');
  }
  
  print('Using forEach:');
  inventory.forEach((key, value) {
    print('  $key: $value');
  });
  
  // Map methods
  print('\n=== Map Methods ===');
  Map<String, int> numbers = {
    'one': 1,
    'two': 2,
    'three': 3
  };
  
  // putIfAbsent
  numbers.putIfAbsent('four', () => 4);
  print('After putIfAbsent: $numbers');
  
  numbers.putIfAbsent('one', () => 100); // Won't change
  print('putIfAbsent existing key: $numbers');
  
  // update
  numbers.update('two', (value) => value * 10);
  print('After update: $numbers');
  
  // updateAll
  numbers.updateAll((key, value) => value + 1);
  print('After updateAll: $numbers');
  
  // Map transformations
  print('\n=== Map Transformations ===');
  Map<String, int> prices = {
    'Apple': 100,
    'Banana': 50,
    'Orange': 75
  };
  
  var doubled = prices.map((key, value) => MapEntry(key, value * 2));
  print('Doubled prices: $doubled');
  
  // Filtering map entries
  var expensive = Map.fromEntries(
    prices.entries.where((entry) => entry.value > 60)
  );
  print('Expensive items: $expensive');
  
  // Creating map from iterables
  print('\n=== Creating from Iterables ===');
  List<String> keys = ['a', 'b', 'c'];
  List<int> values = [1, 2, 3];
  
  Map<String, int> fromIterables = Map.fromIterables(keys, values);
  print('From iterables: $fromIterables');
  
  // Nested maps
  print('\n=== Nested Maps ===');
  Map<String, Map<String, int>> students = {
    'Alice': {'Math': 90, 'Science': 85},
    'Bob': {'Math': 88, 'Science': 92}
  };
  
  print('Students: $students');
  print('Alice\'s Math score: ${students['Alice']?['Math']}');
}
