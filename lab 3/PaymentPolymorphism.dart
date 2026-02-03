abstract class PaymentMethod {
  void processPayment(double amount);
}

class CreditCard extends PaymentMethod {
  @override
  void processPayment(double amount) {
    print('Processing \$${amount.toStringAsFixed(2)} via Credit Card');
  }
}

class PayPal extends PaymentMethod {
  @override
  void processPayment(double amount) {
    print('Processing \$${amount.toStringAsFixed(2)} via PayPal');
  }
}

class Bkash extends PaymentMethod {
  @override
  void processPayment(double amount) {
    print('Processing \$${amount.toStringAsFixed(2)} via Bkash');
  }
}


// Lab report 2 edit here

class DebitCard extends PaymentMethod {
  @override
  void processPayment(double amount) {
    print('Processing \$${amount.toStringAsFixed(2)} via Debit Card');
  }
}

class NexusPay extends PaymentMethod {
  @override
  void processPayment(double amount) {
    print('Processing \$${amount.toStringAsFixed(2)} via Nexus Pay');
  }
}