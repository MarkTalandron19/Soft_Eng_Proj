import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'Account.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key, required this.account});

  final Account account;

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
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
              Text(
                "Hello, ${widget.account.getName}!",
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Dashboard",
              style: TextStyle(
                fontSize: 16,
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
            Text(
              "P${widget.account.getBalance}",
              style: const TextStyle(
                fontSize: 34,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
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
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: HexColor("#481cff"),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9.8),
                          ),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.credit_card),
                            SizedBox(width: 10,),
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
                            SizedBox(width: 10,),
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
                        onTap: () {},
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
                        onTap: () {},
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
