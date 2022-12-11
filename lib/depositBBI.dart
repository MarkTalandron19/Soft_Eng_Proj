import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'MainMenu.dart';

class DepositBbi extends StatefulWidget {
  const DepositBbi({super.key, required this.isChild, required this.password});

  final String password;
  final bool isChild;
  @override
  State<DepositBbi> createState() => _DepositState();
}

class _DepositState extends State<DepositBbi> {
  int amount = 0;
  final amountController = TextEditingController();
  Future addDeposit({required int deposit}) async {
    final doc =
        FirebaseFirestore.instance.collection('users').doc(widget.password);

    final json = {
      'balance': FieldValue.increment(deposit),
    };

    await doc.update(json);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("#9B78FF"),
          title: const Text(
            "Deposit",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 28.0,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: const Color.fromARGB(255, 253, 253, 253),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20 , 20),
                child: Center(child: 
                Image(image: AssetImage(
                  'assets/bbi.png'),
                  height: 200.0,
                  width: 200.0,
                  ),
                  )
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'PHP 0.00',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 50, 0),
                child: Text(
                  "Transfer Fee: 10.00 PHP",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.red,
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.fromLTRB(20, 20, 50, 0),
              //   child: Text(
              //     "Total Amount:" + {},
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       fontFamily: 'Poppins',
              //       color: HexColor("#545454"),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 300, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      amount = int.parse(amountController.text);
                    });
                    addDeposit(deposit: amount);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainMenu(
                                  isChild: widget.isChild,
                                  password: widget.password,
                                )));
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff481CFF)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  child: const SizedBox(
                    width: 310.0,
                    height: 50.0,
                    child: Text(
                      "Send",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
