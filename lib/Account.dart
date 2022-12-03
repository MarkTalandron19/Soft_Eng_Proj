class Account {
  Account(
      {required this.userName, required this.password, required this.balance});
  String userName;
  String password;
  double balance;

  set setName(String newName) {
    userName = newName;
  }

  set setPassword(String newPass) {
    password = newPass;
  }

  set setBalance(double newBalance) {
    balance = newBalance;
  }

  void addBalance(double addFunds) {
    balance += addFunds;
  }

  void subtractBalance(double subtractBal) {
    balance -= subtractBal;
  }

  static Account fromJson(Map<String, dynamic> json) => Account(
      userName: json['username'],
      password: json['password'],
      balance: json['balance']);

  String get getName => userName;
  String get getPass => password;
  double get getBalance => balance;
}
