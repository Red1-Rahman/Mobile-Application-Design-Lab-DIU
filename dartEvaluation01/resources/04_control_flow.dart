// Control Flow Statements in Dart

void main() {
  // If-Else Statement
  print('=== If-Else Statement ===');
  int number = 15;
  
  if (number > 0) {
    print('$number is positive');
  } else if (number < 0) {
    print('$number is negative');
  } else {
    print('$number is zero');
  }
  
  // Switch-Case Statement
  print('\n=== Switch-Case Statement ===');
  String day = 'Monday';
  
  switch (day) {
    case 'Monday':
      print('Start of the work week');
      break;
    case 'Friday':
      print('End of the work week');
      break;
    case 'Saturday':
    case 'Sunday':
      print('Weekend!');
      break;
    default:
      print('Midweek day');
  }
  
  // For Loop
  print('\n=== For Loop ===');
  for (int i = 1; i <= 5; i++) {
    print('Count: $i');
  }
  
  // For-in Loop
  print('\n=== For-in Loop ===');
  List<String> fruits = ['Apple', 'Banana', 'Orange'];
  for (var fruit in fruits) {
    print('Fruit: $fruit');
  }
  
  // While Loop
  print('\n=== While Loop ===');
  int count = 1;
  while (count <= 3) {
    print('While count: $count');
    count++;
  }
  
  // Do-While Loop
  print('\n=== Do-While Loop ===');
  int num = 1;
  do {
    print('Do-while num: $num');
    num++;
  } while (num <= 3);
  
  // Break Statement
  print('\n=== Break Statement ===');
  for (int i = 1; i <= 5; i++) {
    if (i == 3) {
      print('Breaking at $i');
      break;
    }
    print('i = $i');
  }
  
  // Continue Statement
  print('\n=== Continue Statement ===');
  for (int i = 1; i <= 5; i++) {
    if (i == 3) {
      print('Skipping $i');
      continue;
    }
    print('i = $i');
  }
}
