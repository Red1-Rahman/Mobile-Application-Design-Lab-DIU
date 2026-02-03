public class BankAccount {
    private String accountNumber;
    private double balance;

    public BankAccount(String accountNumber, double balance) {
        this.accountNumber = accountNumber;
        this.balance = balance;
    }

    public void deposit(double amount) {
        if (amount > 0) {
            balance += amount;
            System.out.println("Deposited " + amount + ". New Balance: " + balance);
        } else {
            System.out.println("Invalid deposit amount");
        }
    }


    public void withdraw(double amount) {
        if (amount > 0 && amount <= balance) {
            balance -= amount;
            System.out.println("Withdrawn " + amount + ". Remaining Balance: " + balance);
        } else {
            System.out.println("Insufficient funds or invalid amount");
        }
    }

    public double getBalance() {
        return balance;
    }
}
