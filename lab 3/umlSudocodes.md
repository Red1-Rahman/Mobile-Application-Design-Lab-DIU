# 1. UserProfile Class

```dart
class UserProfile {
    String name;
    String email;
    int age;

    UserProfile(this.name, this.email, this.age);

    void updateEmail(String newEmail) {
        email = newEmail;
    }

    void displayProfile() {
        print('Name: $name, Email: $email, Age: $age');
    }
}
```

**Usage in App:** Display user info on a profile screen and allow email updates via a form.

# 2. Product Class for E-Commerce

```dart
class Product {
    String name;
    double price;
    int stockQuantity;

    Product(this.name, this.price, this.stockQuantity);

    void displayProduct() {
        print('$name - \$${price.toStringAsFixed(2)} (Stock: $stockQuantity)');
    }
}
```

**Usage in App:** Populate a ListView with product cards.

# 3. Notification Inheritance

```dart
class Notification {
    void send() {
        print('Sending generic notification...');
    }
}

class EmailNotification extends Notification {
    @override
    void send() {
        print('Sending email notification...');
    }
}

class SMSNotification extends Notification {
    @override
    void send() {
        print('Sending SMS notification...');
    }
}

class PushNotification extends Notification {
    @override
    void send() {
        print('Sending push notification...');
    }
}
```

**Usage in App:** Trigger different notification types based on user settings.

# 4. Transport Fare Calculator

```dart
abstract class Vehicle {
    String brand;
    Vehicle(this.brand);

    double calculateFare();
}

class Car extends Vehicle {
    Car(String brand) : super(brand);

    @override
    double calculateFare() => 50.0;
}

class Bike extends Vehicle {
    Bike(String brand) : super(brand);

    @override
    double calculateFare() => 20.0;
}

class Bus extends Vehicle {
    Bus(String brand) : super(brand);

    @override
    double calculateFare() => 10.0;
}

// Lab report 2 edit here
```

**Usage in App:** Show fare estimates based on selected vehicle type.

# 5. Payment Polymorphism

```dart
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
```

**Usage in App:** Select payment method during checkout and process accordingly.