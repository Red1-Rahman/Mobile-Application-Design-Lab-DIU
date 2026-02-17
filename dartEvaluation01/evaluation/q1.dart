double calculateTotal(double marks1, double marks2, double marks3) {
  double total = marks1 + marks2 + marks3;
  return total;
}
double calculateAverage(double total){
  double average = total/3;
  return average;
}
bool isPassed(double average){
  if(average >= 6.66){
    return true;
  } else {
    return false;
  }
}
void main(){
  print('Redwan Rahman, 024222005101127');
  double marks1 = 7.0;
  double marks2 = 2.0;
  double marks3 = 11.0;
  double total = calculateTotal(marks1, marks2, marks3);
  double average = calculateAverage(total);
  bool passed = isPassed(average);
  print('Total Marks: $total');
  print('Average Marks: $average');
  print('Passed: $passed');
}
