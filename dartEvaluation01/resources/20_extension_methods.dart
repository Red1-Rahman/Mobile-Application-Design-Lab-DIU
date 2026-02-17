// Extension Methods in Dart

// Basic extension on String
extension StringExtension on String {
  // Method to capitalize first letter
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
  
  // Method to check if string is numeric
  bool isNumeric() {
    return double.tryParse(this) != null;
  }
  
  // Method to reverse string
  String reverseString() {
    return split('').reversed.join('');
  }
  
  // Method to remove whitespace
  String removeWhitespace() {
    return replaceAll(RegExp(r'\s+'), '');
  }
  
  // Getter
  int get wordCount => split(' ').length;
}

// Extension on int
extension IntExtension on int {
  // Check if number is even
  bool get isEven => this % 2 == 0;
  
  // Check if number is odd
  bool get isOdd => this % 2 != 0;
  
  // Check if number is prime
  bool get isPrime {
    if (this < 2) return false;
    for (int i = 2; i <= this ~/ 2; i++) {
      if (this % i == 0) return false;
    }
    return true;
  }
  
  // Factorial
  int get factorial {
    if (this < 0) throw Exception('Negative numbers don\'t have factorial');
    if (this == 0 || this == 1) return 1;
    return this * (this - 1).factorial;
  }
  
  // Convert to ordinal (1st, 2nd, 3rd, etc.)
  String get ordinal {
    if (this % 100 >= 11 && this % 100 <= 13) {
      return '${this}th';
    }
    switch (this % 10) {
      case 1:
        return '${this}st';
      case 2:
        return '${this}nd';
      case 3:
        return '${this}rd';
      default:
        return '${this}th';
    }
  }
}

// Extension on List
extension ListExtension<T> on List<T> {
  // Get second element
  T? get secondOrNull => length >= 2 ? this[1] : null;
  
  // Get random element
  T? get random {
    if (isEmpty) return null;
    return this[(length * (DateTime.now().millisecond / 1000)).floor()];
  }
  
  // Check if list has duplicates
  bool get hasDuplicates => length != toSet().length;
  
  // Chunk list into smaller lists
  List<List<T>> chunk(int size) {
    List<List<T>> chunks = [];
    for (int i = 0; i < length; i += size) {
      chunks.add(sublist(i, i + size > length ? length : i + size));
    }
    return chunks;
  }
}

// Extension on DateTime
extension DateTimeExtension on DateTime {
  // Check if date is today
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }
  
  // Check if date is yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }
  
  // Format as readable string
  String get readable {
    return '$day/${month.toString().padLeft(2, '0')}/$year';
  }
  
  // Get day name
  String get dayName {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[weekday - 1];
  }
  
  // Add business days
  DateTime addBusinessDays(int days) {
    DateTime result = this;
    int addedDays = 0;
    
    while (addedDays < days) {
      result = result.add(Duration(days: 1));
      if (result.weekday < 6) {
        // Skip weekends
        addedDays++;
      }
    }
    return result;
  }
}

// Extension on num (works for int and double)
extension NumExtension on num {
  // Convert to percentage string
  String get asPercentage => '${(this * 100).toStringAsFixed(1)}%';
  
  // Check if number is between two values
  bool isBetween(num min, num max) => this >= min && this <= max;
  
  // Clamp value
  num clampValue(num min, num max) {
    if (this < min) return min;
    if (this > max) return max;
    return this;
  }
}

// Extension on Map
extension MapExtension<K, V> on Map<K, V> {
  // Invert map (swap keys and values)
  Map<V, K> get inverted {
    return Map.fromEntries(entries.map((e) => MapEntry(e.value, e.key)));
  }
  
  // Filter map by value
  Map<K, V> whereValue(bool Function(V) test) {
    return Map.fromEntries(entries.where((e) => test(e.value)));
  }
}

// Generic extension
extension IterableExtension<T> on Iterable<T> {
  // Get element at index or null
  T? elementAtOrNull(int index) {
    if (index < 0 || index >= length) return null;
    return elementAt(index);
  }
  
  // Sum for numeric types
  num sum() {
    if (T == int || T == double || T == num) {
      return fold(0, (prev, element) => prev + (element as num));
    }
    throw UnsupportedError('Sum only works with numeric types');
  }
}

void main() {
  print('=== String Extensions ===');
  String text = 'hello world';
  print('Original: $text');
  print('Capitalized: ${text.capitalize()}');
  print('Reversed: ${text.reverseString()}');
  print('Word count: ${text.wordCount}');
  
  String number = '123.45';
  String notNumber = 'abc';
  print('Is "$number" numeric: ${number.isNumeric()}');
  print('Is "$notNumber" numeric: ${notNumber.isNumeric()}');
  
  String withSpaces = 'H e l l o';
  print('Remove whitespace: ${withSpaces.removeWhitespace()}');
  
  print('\n=== Int Extensions ===');
  int num1 = 7;
  print('$num1 is even: ${num1.isEven}');
  print('$num1 is odd: ${num1.isOdd}');
  print('$num1 is prime: ${num1.isPrime}');
  print('Factorial of 5: ${5.factorial}');
  
  for (int i = 1; i <= 5; i++) {
    print('$i -> ${i.ordinal}');
  }
  
  print('\n=== List Extensions ===');
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8];
  print('List: $numbers');
  print('Second element: ${numbers.secondOrNull}');
  print('Has duplicates: ${numbers.hasDuplicates}');
  
  List<int> withDups = [1, 2, 2, 3];
  print('List with dups: $withDups');
  print('Has duplicates: ${withDups.hasDuplicates}');
  
  print('Chunked (size 3): ${numbers.chunk(3)}');
  
  print('\n=== DateTime Extensions ===');
  DateTime now = DateTime.now();
  print('Current date: ${now.readable}');
  print('Day name: ${now.dayName}');
  print('Is today: ${now.isToday}');
  
  DateTime yesterday = now.subtract(Duration(days: 1));
  print('Yesterday: ${yesterday.readable}');
  print('Is yesterday: ${yesterday.isYesterday}');
  
  DateTime future = now.addBusinessDays(5);
  print('5 business days from now: ${future.readable} (${future.dayName})');
  
  print('\n=== Num Extensions ===');
  double percentage = 0.756;
  print('$percentage as percentage: ${percentage.asPercentage}');
  
  int value = 15;
  print('$value is between 10 and 20: ${value.isBetween(10, 20)}');
  print('$value is between 20 and 30: ${value.isBetween(20, 30)}');
  
  print('Clamp 5 (0-10): ${5.clampValue(0, 10)}');
  print('Clamp 15 (0-10): ${15.clampValue(0, 10)}');
  print('Clamp -5 (0-10): ${(-5).clampValue(0, 10)}');
  
  print('\n=== Map Extensions ===');
  Map<String, int> ages = {
    'Alice': 25,
    'Bob': 30,
    'Charlie': 35,
  };
  print('Original map: $ages');
  print('Inverted map: ${ages.inverted}');
  
  Map<String, int> filtered = ages.whereValue((age) => age >= 30);
  print('Age >= 30: $filtered');
  
  print('\n=== Generic Iterable Extensions ===');
  List<int> nums = [1, 2, 3, 4, 5];
  print('List: $nums');
  print('Element at 2: ${nums.elementAtOrNull(2)}');
  print('Element at 10: ${nums.elementAtOrNull(10)}');
  print('Sum: ${nums.sum()}');
  
  print('\n=== Chaining Extensions ===');
  String sentence = 'dart programming language';
  String result = sentence
      .split(' ')
      .map((word) => word.capitalize())
      .join(' ');
  print('Original: $sentence');
  print('Capitalized words: $result');
  
  print('\n=== Prime Numbers ===');
  List<int> primes = List.generate(20, (i) => i)
      .where((n) => n.isPrime)
      .toList();
  print('Prime numbers (0-20): $primes');
}
