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
              const Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                child: SizedBox(
                  child: Text(
                    "Are you accessing as a:",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                child: SizedBox(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LogInPage(isChild: true)));
                    },
                    child: const Text("Child"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                child: SizedBox(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LogInPage(isChild: false)));
                    },
                    child: const Text("Parent"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
