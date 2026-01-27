void greet(String name, String id) {
  print('Hello, $name, ID: $id');
}

int add(int a, int b) {
  return a + b;
}

int sub(int a, int b) {
  return a - b;
}
int mul(int a, int b) {
  return a * b;
}
double div(int a, int b) {
  if (b == 0) {
    throw ArgumentError('Division by zero is not allowed.');
  }
  return a / b;
}


void main(){
  greet('Redwan', '0242220005101127');
  print(add(2, 3));
}