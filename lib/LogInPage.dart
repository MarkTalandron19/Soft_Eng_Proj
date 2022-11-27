import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

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
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email or UserName"),
                  )),
              SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
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
                  onPressed: () {},
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
