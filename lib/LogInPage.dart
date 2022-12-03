import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Account.dart';
import 'MainMenu.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key, required this.isChild});
  final bool isChild;
  final userController = TextEditingController();
  final passController = TextEditingController();
  String userName = '';
  String password = '';
  double balance = 0;

  Future<void> readAccount() async {
    final docUser =
        FirebaseFirestore.instance.collection('users').doc(passController.text);
    docUser.get().then((value) {
      userName = value['username'];
      password = value['password'];
      balance = value['balance'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#ecf2ff"),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 20),
              SizedBox(
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    color: HexColor("3f60a0"),
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
                width: 300,
              ),
              SizedBox(
                  width: 300,
                  child: TextField(
                    controller: userController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email or UserName"),
                  )),
              SizedBox(
                  width: 300,
                  child: TextField(
                    controller: passController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Password"),
                  )),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot your password?",
                    style: TextStyle(
                      color: HexColor("b9adff"),
                      fontSize: 10,
                    ),
                  )),
              SizedBox(
                height: 30,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    readAccount();
                    Account curAcc = Account(
                        userName: userName,
                        password: password,
                        balance: balance);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainMenu(
                                  account: curAcc,
                                  isChild: isChild,
                                )));
                  },
                  child: const Text("Sign In"),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Don't have an account? Sign up now!",
                    style: TextStyle(
                      color: HexColor("b9adff"),
                      fontSize: 10,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
