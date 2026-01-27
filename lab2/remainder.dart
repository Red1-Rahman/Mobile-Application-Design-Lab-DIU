int remainder(int a, int b) {
  return a % b;
}
int user_input(int c) {
  return c;
}
int add (int a, int b) {
  return a + b;
}

void main(){
  print("remainder:");
  int d = remainder(10, 3);
  print(d);
  int e = user_input(1);
  print("after adding 1");
  print(add(d, e));

}