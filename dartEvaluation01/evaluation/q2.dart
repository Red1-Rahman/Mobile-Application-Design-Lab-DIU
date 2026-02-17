class bankAccount {
  String holderName;
  double balance;

}

class savingsAccount extends bankAccount {

  
  savingsAccount() {
    holderName = this.holderName;
    balance = this.balance;
  }


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
  savingsAccount account = savingsAccount('Redwan Rahman', 24222000501127.0);
  account.holderName = 'Redwan Rahman';
  account.balance = 24222000501127.0;

  account.deposit(1127.0);
  print('Balance after deposit: ${account.balance}');
}