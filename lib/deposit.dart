import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'depositDbo.dart';
import 'depositBBI.dart';
import 'depositLambak.dart';
class DepositPage extends StatelessWidget {
  const DepositPage({super.key, required this.isChild, required this.password});

  final String password;
  final bool isChild;

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
        backgroundColor: HexColor("#ecf2ff"),
        body: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 20.0, top: 15.0),
              child: Text(
                "Linked Accounts",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: HexColor("#545454"),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: SizedBox(
                    height: 65.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DepositDbo(
                                isChild: isChild,
                                password: password,
                              )));},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.white,
                      ),
                      child: Row(
                        children: const <Widget>[
                          SizedBox(
                            width: 5.0,
                          ),
                          Image(
                                image: AssetImage(
                                  'assets/dbo.png'
                                ),
                              ),
                          Text(
                            "  Dank Bank Organization",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child:
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: SizedBox(
                    height: 65.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DepositBbi(
                                isChild: isChild,
                                password: password,
                              )));},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.white,
                      ),
                      child: Row(
                        children: const <Widget>[
                          SizedBox(
                            width: 5.0,
                            
                          ),
                          Image(
                                image: AssetImage(
                                  'assets/bbi.png'
                                ),
                              ),
                          Text(
                            "  Bank Bank International",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
               ),
                               Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child:
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: SizedBox(
                    height: 65.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DepositLambank(
                                isChild: isChild,
                                password: password,
                              )));},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.white,
                      ),
                      child: Row(
                        children: const <Widget>[
                          SizedBox(
                            width: 5.0,
                            
                          ),
                          Image(
                                image: AssetImage(
                                  'assets/lambank.png'
                                ),
                              ),
                          Text(
                            "  Lambank",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
               ),
              ],
            ),
            
            const SizedBox(
              height: 35.0,
            ),
            SizedBox(
              height: 55.0,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xff481CFF)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                
                
                child: const SizedBox(
                  width: 290.0,
                  child: Text(
                    "Request For Funds",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 20.0, top: 15.0),
              child: Text(
                "Add to Vault",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: HexColor("#545454"),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Container(
              padding: const EdgeInsets.only(top: 5.0, left: 5.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              margin: const EdgeInsets.only(left: 30.0, right: 30.0),
              height: 70,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Your Balance",
                  style: TextStyle(
                    color: HexColor("#B7B5B7"),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
              height: 55.0,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xff481CFF)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                child: const SizedBox(
                  width: 290.0,
                  child: Text(
                    "Add Vault Balance",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
