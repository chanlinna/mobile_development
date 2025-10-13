class BankAccount {
    // TODO
    final int accountId;
    final String accountOwner;
    double _balance = 0;

    BankAccount(this.accountId, this.accountOwner);

    double get balance => _balance;

    void withdraw(double amount){
      if (amount <= 0){
        throw Exception("amount must be positive");
      }
      if (_balance - amount < 0){
        throw Exception("Insufficient balance for withdrawal!");
      }
      _balance -= amount;
    }

    void credit(double amount){
      if (amount <= 0){
        throw Exception("amount must be positive");
      }
      _balance += amount;
    }
}

class Bank {
    // TODO
    final String name;
    final List<BankAccount> _accounts = [];

    Bank({required this.name});

    BankAccount createAccount(int accountId, String accountOwner){
      for (var acc in _accounts){
        if (acc.accountId == accountId){
          throw Exception("Account with id $accountId already exist!");
        }
      }

      final newAccount = BankAccount(accountId, accountOwner);

      _accounts.add(newAccount);
      return newAccount;
    }

    List<BankAccount> get accounts => _accounts;
}
 
void main() {

  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
