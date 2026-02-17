// Generics in Dart

// Generic class
class Box<T> {
  T value;
  
  Box(this.value);
  
  T getValue() => value;
  
  void setValue(T newValue) {
    value = newValue;
  }
  
  void display() {
    print('Box contains: $value (${value.runtimeType})');
  }
}

// Generic class with multiple type parameters
class Pair<K, V> {
  K key;
  V value;
  
  Pair(this.key, this.value);
  
  void display() {
    print('Pair($key: $value)');
  }
  
  @override
  String toString() => '($key, $value)';
}

// Generic class with constraints
class NumberBox<T extends num> {
  T value;
  
  NumberBox(this.value);
  
  T add(T other) => (value + other) as T;
  
  T multiply(T other) => (value * other) as T;
  
  bool isGreaterThan(T other) => value > other;
}

// Generic methods
T getFirst<T>(List<T> items) {
  if (items.isEmpty) {
    throw Exception('List is empty');
  }
  return items.first;
}

void printList<T>(List<T> items) {
  print('List of ${T}:');
  for (var item in items) {
    print('  - $item');
  }
}

T findMax<T extends Comparable>(List<T> items) {
  if (items.isEmpty) {
    throw Exception('List is empty');
  }
  
  T max = items.first;
  for (var item in items) {
    if (item.compareTo(max) > 0) {
      max = item;
    }
  }
  return max;
}

// Generic interface
abstract class Repository<T> {
  void add(T item);
  T? get(int id);
  List<T> getAll();
  void update(int id, T item);
  void delete(int id);
}

// Implementing generic interface
class User {
  int id;
  String name;
  
  User(this.id, this.name);
  
  @override
  String toString() => 'User(id: $id, name: $name)';
}

class UserRepository implements Repository<User> {
  final Map<int, User> _users = {};
  
  @override
  void add(User user) {
    _users[user.id] = user;
    print('Added: $user');
  }
  
  @override
  User? get(int id) => _users[id];
  
  @override
  List<User> getAll() => _users.values.toList();
  
  @override
  void update(int id, User user) {
    if (_users.containsKey(id)) {
      _users[id] = user;
      print('Updated: $user');
    }
  }
  
  @override
  void delete(int id) {
    var user = _users.remove(id);
    if (user != null) {
      print('Deleted: $user');
    }
  }
}

// Generic Stack implementation
class Stack<T> {
  final List<T> _items = [];
  
  void push(T item) {
    _items.add(item);
  }
  
  T? pop() {
    if (_items.isEmpty) return null;
    return _items.removeLast();
  }
  
  T? peek() {
    if (_items.isEmpty) return null;
    return _items.last;
  }
  
  bool get isEmpty => _items.isEmpty;
  int get size => _items.length;
  
  @override
  String toString() => _items.toString();
}

void main() {
  print('=== Generic Class ===');
  Box<int> intBox = Box(42);
  intBox.display();
  
  Box<String> stringBox = Box('Hello');
  stringBox.display();
  
  Box<List<int>> listBox = Box([1, 2, 3]);
  listBox.display();
  
  // Generic class with multiple types
  print('\n=== Multiple Type Parameters ===');
  Pair<String, int> pair1 = Pair('Age', 25);
  pair1.display();
  
  Pair<int, String> pair2 = Pair(1, 'First');
  pair2.display();
  
  // Generic class with constraints
  print('\n=== Generic Constraints ===');
  NumberBox<int> intNumBox = NumberBox(10);
  print('Value: ${intNumBox.value}');
  print('Add 5: ${intNumBox.add(5)}');
  print('Multiply by 3: ${intNumBox.multiply(3)}');
  
  NumberBox<double> doubleNumBox = NumberBox(3.14);
  print('Value: ${doubleNumBox.value}');
  print('Add 2.86: ${doubleNumBox.add(2.86)}');
  
  // Generic methods
  print('\n=== Generic Methods ===');
  List<int> numbers = [1, 2, 3, 4, 5];
  print('First number: ${getFirst(numbers)}');
  
  List<String> fruits = ['Apple', 'Banana', 'Orange'];
  print('First fruit: ${getFirst(fruits)}');
  
  printList(numbers);
  printList(fruits);
  
  // Generic method with constraints
  print('\n=== Generic Method with Constraints ===');
  print('Max number: ${findMax([5, 2, 9, 1, 7])}');
  print('Max string: ${findMax(['apple', 'zebra', 'banana'])}');
  
  // Generic repository
  print('\n=== Generic Repository ===');
  UserRepository userRepo = UserRepository();
  
  userRepo.add(User(1, 'Alice'));
  userRepo.add(User(2, 'Bob'));
  userRepo.add(User(3, 'Charlie'));
  
  print('\nAll users: ${userRepo.getAll()}');
  
  User? user = userRepo.get(2);
  print('Get user 2: $user');
  
  userRepo.update(2, User(2, 'Robert'));
  userRepo.delete(3);
  
  print('\nRemaining users: ${userRepo.getAll()}');
  
  // Generic Stack
  print('\n=== Generic Stack ===');
  Stack<String> stringStack = Stack();
  
  stringStack.push('First');
  stringStack.push('Second');
  stringStack.push('Third');
  
  print('Stack: $stringStack');
  print('Size: ${stringStack.size}');
  print('Peek: ${stringStack.peek()}');
  print('Pop: ${stringStack.pop()}');
  print('Pop: ${stringStack.pop()}');
  print('Stack after pops: $stringStack');
  
  // Using built-in generic collections
  print('\n=== Built-in Generic Collections ===');
  List<int> intList = [1, 2, 3];
  Set<String> stringSet = {'a', 'b', 'c'};
  Map<String, int> stringIntMap = {'one': 1, 'two': 2};
  
  print('List<int>: $intList');
  print('Set<String>: $stringSet');
  print('Map<String, int>: $stringIntMap');
  
  // Type checking with generics
  print('\n=== Type Checking ===');
  Box<int> box = Box(100);
  print('Box value type: ${box.value.runtimeType}');
  print('Is Box<int>: ${box is Box<int>}');
  print('Is Box<String>: ${box is Box<String>}');
}
