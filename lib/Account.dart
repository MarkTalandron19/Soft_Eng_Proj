class Account {
  Account(
      {required this.userName, required this.password, required this.balance});
  String userName;
  String password;
  int balance;

  set setName(String newName) {
    userName = newName;
  }

  set setPassword(String newPass) {
    password = newPass;
  }

  set setBalance(int newBalance) {
    balance = newBalance;
  }

  void addBalance(int addFunds) {
    balance += addFunds;
  }

  void subtractBalance(int subtractBal) {
    balance -= subtractBal;
  }

  static Account fromJson(Map<String, dynamic> json) => Account(
      userName: json['username'],
      password: json['password'],
      balance: json['balance']);

  String get getName => userName;
  String get getPass => password;
  int get getBalance => balance;
}
