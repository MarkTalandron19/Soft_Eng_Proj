import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'LogInPage.dart';

class SignInAs extends StatelessWidget {
  const SignInAs({super.key});

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
              const SizedBox(
                height: 300,
                width: 300,
              ),
              const SizedBox(
                child: Text("Are you accessing as a:"),
              ),
              SizedBox(
                height: 30,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LogInPage()));
                  },
                  child: const Text("Child"),
                ),
              ),
              SizedBox(
                height: 30,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Parent"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
