public class TestEncapsulation {
    public static void main(String[] args) {
        // Test BankAccount
        BankAccount acc1 = new BankAccount("Red1", 5101127);
        acc1.deposit(500);    // Balance = 15000
        acc1.withdraw(300);   // Balance = 12000
        System.out.println("Final Balance: " + acc1.getBalance());

        // Test SavingsAccount
        SavingsAccount savings = new SavingsAccount("Red1", 20900, 0.05);
        savings.deposit(500);   // Balance = 2500
        savings.addInterest();  // Balance increases by 5%
        System.out.println("Final Balance: " + savings.getBalance());

        // Polymorphism check
        BankAccount[] accounts = {acc1, savings};
        for (BankAccount acc : accounts) {
            System.out.println("Account Balance: " + acc.getBalance());
        }
    }
}
