class bankAccount {
  String holderName;
  double balance;

  bankAccount(this.holderName, this.balance);

}

class savingsAccount extends bankAccount {
  
  savingsAccount(this.holderName, this.balance);

  void deposit(double amount) {
    balance += amount;
    return balance;
  }
  void withdraw(double amount) {
    
      balance -= amount;
      return balance;
  }

}

void main(){
  savingsAccount account = savingsAccount('Redwan Rahman', 242220005101127);


  account.deposit(1127.0);
  print('Balance after deposit: ${account.balance}');
}