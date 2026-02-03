double addItem(double total, double price) {
  return total + price;
} 

double applyDiscount(double total, double discount) {
  double discountAmount = total * (discount / 100);
  return total - discountAmount;
}

double tax(double total, double taxRate) {
  double taxAmount = total * (taxRate / 100);
  return total + taxAmount;
}

void main(){
  double a = 0;
  a = addItem(a, 50);
  a = addItem(a, 30);
  a = applyDiscount(a, 10);
  a = tax(a, 5);
  print("Total amount: $a");
}