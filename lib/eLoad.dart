import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'loadGlobe.dart';
import 'loadPLDC.dart';
import 'loadStem.dart';
class ELoadPage extends StatelessWidget {
  const ELoadPage({super.key, required this.isChild, required this.password});

  final String password;
  final bool isChild;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("#9B78FF"),
          title: const Text(
            "E-Load",
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
                          builder: (context) => LoadGlobe(
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
                                  'assets/earth.png'
                                ),
                              ),
                          Text(
                            "  Earth Telecom",
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
                          builder: (context) => LoadPLDC(
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
                                  'assets/pldc.png'
                                ),
                              ),
                          Text(
                            "  PLDC",
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
                          builder: (context) => LoadStem(
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
                                  'assets/stem.png'
                                ),
                              ),
                          Text(
                            "  Stem Wallet",
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
          ],
        ),
      ),
    );
  }
}
