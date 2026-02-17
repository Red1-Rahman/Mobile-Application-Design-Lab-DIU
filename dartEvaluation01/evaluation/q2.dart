class bankAccount {
  String holderName;
  double balance;

  bankAccount(this.holderName, this.balance);

}

class savingsAccount extends bankAccount {
  
  savingsAccount(String holderName, double balance) : super(holderName, balance);

  double deposit(double amount) {
    balance += amount;
    return balance;
  }
  double withdraw(double amount) {
    
      balance -= amount;
      return balance;
  }

}

void main(){
  savingsAccount account = savingsAccount('Redwan Rahman', 242220005101127);


  account.withdraw(1127.0);
  print('Balance after deposit: ${account.balance}');
}