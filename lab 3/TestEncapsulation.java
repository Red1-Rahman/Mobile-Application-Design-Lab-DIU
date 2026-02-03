public class TestEncapsulation {
    public static void main(String[] args) {
        // Test BankAccount
        BankAccount acc1 = new BankAccount("A1001", 1000);
        acc1.deposit(500);    // Balance = 1500
        acc1.withdraw(300);   // Balance = 1200
        System.out.println("Final Balance: " + acc1.getBalance());

        // Test SavingsAccount
        SavingsAccount savings = new SavingsAccount("S2001", 2000, 0.05);
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
