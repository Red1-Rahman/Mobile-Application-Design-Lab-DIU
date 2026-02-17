// Operators in Dart

void main() {
  // Arithmetic Operators
  print('=== Arithmetic Operators ===');
  int a = 10, b = 3;
  print('$a + $b = ${a + b}');
  print('$a - $b = ${a - b}');
  print('$a * $b = ${a * b}');
  print('$a / $b = ${a / b}'); // Division (returns double)
  print('$a ~/ $b = ${a ~/ b}'); // Integer division
  print('$a % $b = ${a % b}'); // Modulo
  
  // Relational Operators
  print('\n=== Relational Operators ===');
  print('$a == $b: ${a == b}');
  print('$a != $b: ${a != b}');
  print('$a > $b: ${a > b}');
  print('$a < $b: ${a < b}');
  print('$a >= $b: ${a >= b}');
  print('$a <= $b: ${a <= b}');
  
  // Logical Operators
  print('\n=== Logical Operators ===');
  bool x = true, y = false;
  print('$x && $y: ${x && y}'); // AND
  print('$x || $y: ${x || y}'); // OR
  print('!$x: ${!x}'); // NOT
  
  // Assignment Operators
  print('\n=== Assignment Operators ===');
  int c = 5;
  print('c = $c');
  c += 3;
  print('c += 3: $c');
  c -= 2;
  print('c -= 2: $c');
  c *= 2;
  print('c *= 2: $c');
  c ~/= 3;
  print('c ~/= 3: $c');
  
  // Increment/Decrement
  print('\n=== Increment/Decrement ===');
  int d = 10;
  print('d = $d');
  print('d++: ${d++}'); // Post-increment
  print('d after post-increment: $d');
  print('++d: ${++d}'); // Pre-increment
  print('d--: ${d--}'); // Post-decrement
  print('--d: ${--d}'); // Pre-decrement
  
  // Ternary Operator
  print('\n=== Ternary Operator ===');
  int age = 20;
  String status = age >= 18 ? 'Adult' : 'Minor';
  print('Age: $age, Status: $status');
  
  // Null-aware Operators
  print('\n=== Null-aware Operators ===');
  String? name;
  String displayName = name ?? 'Guest'; // If null, use 'Guest'
  print('Display Name: $displayName');
  
  name ??= 'John'; // Assign if null
  print('Name after ??=: $name');
  
  // Cascade Notation
  print('\n=== Cascade Notation ===');
  var list = []
    ..add('Apple')
    ..add('Banana')
    ..add('Cherry');
  print('List: $list');
}
