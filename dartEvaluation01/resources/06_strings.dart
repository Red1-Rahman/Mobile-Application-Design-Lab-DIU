// String Operations in Dart

void main() {
  // String creation
  print('=== String Creation ===');
  String str1 = 'Single quotes';
  String str2 = "Double quotes";
  String str3 = '''Multi-line
  string using
  triple quotes''';
  print(str1);
  print(str2);
  print(str3);
  
  // String interpolation
  print('\n=== String Interpolation ===');
  String name = 'Alice';
  int age = 25;
  print('Name: $name, Age: $age');
  print('Next year, $name will be ${age + 1}');
  
  // String concatenation
  print('\n=== String Concatenation ===');
  String firstName = 'John';
  String lastName = 'Doe';
  String fullName = firstName + ' ' + lastName;
  print('Full Name: $fullName');
  
  // String properties
  print('\n=== String Properties ===');
  String text = 'Hello Dart';
  print('Text: $text');
  print('Length: ${text.length}');
  print('Is empty: ${text.isEmpty}');
  print('Is not empty: ${text.isNotEmpty}');
  
  // String methods
  print('\n=== String Methods ===');
  String sample = 'Hello World';
  print('Original: $sample');
  print('Uppercase: ${sample.toUpperCase()}');
  print('Lowercase: ${sample.toLowerCase()}');
  print('Contains "World": ${sample.contains("World")}');
  print('Starts with "Hello": ${sample.startsWith("Hello")}');
  print('Ends with "World": ${sample.endsWith("World")}');
  print('Index of "World": ${sample.indexOf("World")}');
  print('Substring(0, 5): ${sample.substring(0, 5)}');
  print('Replace "World" with "Dart": ${sample.replaceAll("World", "Dart")}');
  
  // String splitting
  print('\n=== String Splitting ===');
  String sentence = 'Apple,Banana,Orange';
  List<String> fruits = sentence.split(',');
  print('Fruits: $fruits');
  
  // String trimming
  print('\n=== String Trimming ===');
  String whitespace = '  Hello  ';
  print('Original: "$whitespace"');
  print('Trimmed: "${whitespace.trim()}"');
  print('Trim left: "${whitespace.trimLeft()}"');
  print('Trim right: "${whitespace.trimRight()}"');
  
  // String comparison
  print('\n=== String Comparison ===');
  String a = 'apple';
  String b = 'Apple';
  print('$a == $b: ${a == b}');
  print('$a compareTo $b: ${a.compareTo(b)}');
  
  // Character access
  print('\n=== Character Access ===');
  String word = 'Dart';
  print('Character at index 0: ${word[0]}');
  print('Characters: ${word.split("")}');
  
  // Raw strings
  print('\n=== Raw Strings ===');
  String path = r'C:\Users\Documents\file.txt';
  print('Path: $path');
}
