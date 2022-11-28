import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Account.dart';
import 'SignInAs.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
      home: const Test(),
    );
  }
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final int test = 500;

          update(test: test); 
        },
        child: const Text("update"),
      ),
    );
  }

  Future update({required int test}) async {
    final doc = FirebaseFirestore.instance.collection('Test').doc('7avQbI9Nr8WzV9WLoSQ9');

    final json = {
      'test': test,
    };

    await doc.set(json);
  }
}