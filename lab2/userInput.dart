import 'dart:io';

int remainder(int a, int b) {
  return a % b;
}

void main(){
  print("Enter two numbers you want to devide");
  int a = int.parse(stdin.readLineSync()!);
  int b = int.parse(stdin.readLineSync()!);
  int c = 0;
  if (b == 0) {
    print('Division by zero is not allowed.');
  } else {
    c = remainder(a, b);
    print("Remainder: $c");
  }
  print("Enter number you want to add to the remainder: ");
  int d = int.parse(stdin.readLineSync()!);
  int e = c +d;
  print("the number: $e");
}