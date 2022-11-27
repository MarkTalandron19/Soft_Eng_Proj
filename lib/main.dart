import 'package:flutter/material.dart';
import 'Account.dart';
import 'SignInAs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  Account newAcc = Account(userName: "Tester", balance: 3000.00);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignInAs(),
    );
  }
}