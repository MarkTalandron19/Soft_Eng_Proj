import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'Account.dart';
import 'deposit.dart';
import 'eLoad.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key, required this.isChild, required this.password});

  final String password;
  final bool isChild;

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  Future<Account?> readUser() async {
    final docUser =
        FirebaseFirestore.instance.collection('users').doc(widget.password);
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      return Account.fromJson(snapshot.data()!);
    }
    return null;
  }
  
  Widget buildName(Account acc) {
    return Text("Hello, ${acc.getName}!",
        style: const TextStyle(
          fontSize: 25,
        ));
  }

  Widget buildBalance(Account acc) {
    return Text(
      '${acc.getBalance}',
      style: const TextStyle(
        fontSize: 34,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Future addDeposit({required int deposit}) async {
    final doc =
        FirebaseFirestore.instance.collection('users').doc(widget.password);

    final json = {
      'balance': FieldValue.increment(deposit),
    };

    await doc.update(json);
  }

    Future deductDeposit({required int deposit}) async {
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
      backgroundColor: HexColor("#ecf2ff"),
      body: Padding(
          padding: const EdgeInsets.all(30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              FutureBuilder<Account?>(
                  future: readUser(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final acc = snapshot.data;
                      return acc == null
                          ? const Center(
                              child: Text('No User'),
                            )
                          : 
                          Row( crossAxisAlignment: CrossAxisAlignment.start, children: [
                            const Image(image: AssetImage(
                              'assets/jepoy.png'),
                              height: 50,
                              width: 50,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 15, 0, 0),
                                child: buildName(acc),
                                ),
                          ]
                          );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ]),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Dashboard",
              style: TextStyle(
                fontSize: 23,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Your Balance",
              style: TextStyle(
                fontSize: 12,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder<Account?>(
                future: readUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final acc = snapshot.data;
                    return acc == null
                        ? const Center(
                            child: Text('No User'),
                          )
                        : buildBalance(acc);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 50,
                    width: 140,
                    child: ElevatedButton(
                        onPressed: !widget.isChild
                            ? () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DepositPage(
                                              isChild: widget.isChild,
                                              password: widget.password,
                                            )));
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: HexColor("#481cff"),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9.8),
                          ),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.credit_card),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Deposit",
                              style: TextStyle(
                                fontSize: 11.3,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 50,
                    width: 140,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: HexColor("#481cff"),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9.8),
                          ),
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.account_balance_wallet,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Vault",
                              style: TextStyle(
                                fontSize: 11.3,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Transaction History",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See More",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w300,
                      ),
                    ))
              ],
            ),
            Column(
              children: [
              SizedBox(
                height: 61,
                width: 350.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Text('Payment',
                    style: TextStyle(
                      fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 124, 124, 124),
                    )
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Text('P500.00',
                    style: TextStyle(
                      fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 124, 124, 124),
                    )
                    )
                  ),
              ]
                  ),
                   Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Text('12/04/2022',
                    style: TextStyle(
                      fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 146, 146, 146),
                    )
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Text('Details',
                    style: TextStyle(
                      fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 78, 169, 255),
                    )
                    )
                  ),
              ]
                  ),
                  ],
                  )
                ),
              ),
              Padding(padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child:              SizedBox(
                height: 61,
                width: 350.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Text('Payment',
                    style: TextStyle(
                      fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 124, 124, 124),
                    )
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Text('P300.00',
                    style: TextStyle(
                      fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 124, 124, 124),
                    )
                    )
                  ),
              ]
                  ),
                   Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Text('12/03/2022',
                    style: TextStyle(
                      fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 146, 146, 146),
                    )
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Text('Details',
                    style: TextStyle(
                      fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 78, 169, 255),
                    )
                    )
                  ),
              ]
                  ),
                  ],
                  )
                ),
              ),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Prizes History",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See More",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w300,
                      ),
                    ))
              ],
            ),
                        Column(
              children: [
              SizedBox(
                height: 61,
                width: 350.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Text('Shappee',
                    style: TextStyle(
                      fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 124, 124, 124),
                    )
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Text('order-bh1c-s2fd ',
                    style: TextStyle(
                      fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 124, 124, 124),
                    )
                    )
                  ),
              ]
                  ),
                   Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Text('11/21/2022',
                    style: TextStyle(
                      fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 146, 146, 146),
                    )
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Text('Details',
                    style: TextStyle(
                      fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 78, 169, 255),
                    )
                    )
                  ),
              ]
                  ),
                  ],
                  )
                ),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child:              SizedBox(
                height: 61,
                width: 350.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Text('Lazalora',
                    style: TextStyle(
                      fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 124, 124, 124),
                    )
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Text('order-abcd-efgh ',
                    style: TextStyle(
                      fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 124, 124, 124),
                    )
                    )
                  ),
              ]
                  ),
                   Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Text('10/09/2022',
                    style: TextStyle(
                      fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 146, 146, 146),
                    )
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Text('Details',
                    style: TextStyle(
                      fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 78, 169, 255),
                    )
                    )
                  ),
              ]
                  ),
                  ],
                  )
                ),
              ),)
              ],
            ),
            ],)
          ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.qr_code_scanner),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Expanded(
                  child: Material(
                    child: Center(
                      child: InkWell(
                        onTap: !widget.isChild
                            ? () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ELoadPage(
                                              isChild: widget.isChild,
                                              password: widget.password,
                                            )));
                              }
                            : null,
                        child: Column(children: const [
                          Icon(
                            Icons.smartphone,
                          ),
                          Text("E-load"),
                        ]),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Material(
                    child: Center(
                      child: InkWell(
                        onTap: !widget.isChild ? () {} : null,
                        child: Column(children: const [
                          Icon(
                            Icons.storefront,
                          ),
                          Text("Store"),
                        ]),
                      ),
                    ),
                  ),
                ),
                const SizedBox(),
              ],
            ),
          )),
    ));
  }
}
