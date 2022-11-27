class Account{
  Account({required this.userName, required this.balance});
  String userName;
  double balance;

  set setName(String newName)
  {
    userName = newName;
  }

  set setBalance(double newBalance)
  {
    balance = newBalance;
  }

  String get getName => userName;
  double get getBalance => balance;
}