import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'Account.dart';
import 'MainMenu.dart';


class LogInPage extends StatefulWidget {
  const LogInPage({super.key, required this.isChild});
  final bool isChild;

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final userController = TextEditingController();

  final passController = TextEditingController();

  Future<Account?> readAccount() async {
    if (passController.text.isNotEmpty) {
      final docUser = FirebaseFirestore.instance
          .collection('users')
          .doc(passController.text);
      final snapshot = await docUser.get();

      if (snapshot.exists) {
        return Account.fromJson(snapshot.data()!);
      } else {
        return null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#ecf2ff"),
        body: SingleChildScrollView(
          child: Padding(
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
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: Text(
                    "To start using Start Early, Sign in or Sign-up!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: HexColor("3f60a0"),
                      fontSize: 20,
                    ),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 35, 20),
                 child: Image(image: AssetImage(
                  'assets/signin.png'),
                  ),
              ),
                SizedBox(
                    width: 300,
                    child: TextField(
                      controller: userController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Email or Username"),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: 300,
                      child: TextField(
                        controller: passController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Password"),
                      )),
                ),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainMenu(
                                    isChild: widget.isChild,
                                    password: passController.text,
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
      ),
    );
  }
}
