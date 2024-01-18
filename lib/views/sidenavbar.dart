import 'package:app/phone.dart';
import 'package:app/views/chat.dart';
import 'package:app/views/pointsystem.dart';
import 'package:app/views/profile.dart';
import 'package:app/views/responsibleplay.dart';
import 'package:app/views/termsandconditions.dart';
import 'package:app/views/wallet.dart';
import 'package:flutter/material.dart';

class SideNavbar extends StatefulWidget {
  const SideNavbar({Key? key}) : super(key: key);

  @override
  State<SideNavbar> createState() => _SideNavbarState();
}

class _SideNavbarState extends State<SideNavbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: MediaQuery.of(context).size.width * 0.00,
                  left: MediaQuery.of(context).size.width * 0.00,
                  right: MediaQuery.of(context).size.width * 0.00,
                  child: Image.asset(
                    'assets/ball.png',
                    width: double.infinity,
                    // height:200,
                    height: MediaQuery.of(context).size.height * 0.3,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.20,
                  left: MediaQuery.of(context).size.width * 0.00,
                  right: MediaQuery.of(context).size.width * 0.00,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.03,
                                top: MediaQuery.of(context).size.width * 0.030,
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                height: MediaQuery.of(context).size.width * 0.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  color: Colors.blue,
                                  image: DecorationImage(
                                    image: AssetImage('assets/ball.png'),
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topLeft,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 16.0, top: 30.0),
                                    child: Text(
                                      '+916390907099',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                    width: 20,
                                  ),
                                  InkWell(
                                    onTap: (() => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ProfilePage(),
                                          ),
                                        )),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 16.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            'SEE PROFILE',
                                            style: TextStyle(
                                              color: const Color(0xFF8443BA),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: 8.0),
                                          Icon(
                                            Icons.forward,
                                            color: const Color(0xFF8443BA),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 1.0),
                        Divider(
                          color: const Color.fromARGB(221, 237, 236, 236),
                          thickness: 1.0,
                          height: 15.0,
                          indent: 16.0,
                          endIndent: 15.0,
                        ),
                        SizedBox(height: 1.0),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WalletScreen(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 50.0, top: 8.0),
                            child: Row(
                              children: [
                                // SizedBox(height: 10.0),
                                Icon(
                                  Icons.account_balance_wallet,
                                  color: const Color(0xFF8443BA),
                                  size: 28,
                                ),
                                SizedBox(width: 25.0),
                                Text(
                                  'Wallet',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 1.0),
                        Divider(
                          color: const Color.fromARGB(221, 237, 236, 236),
                          thickness: 1.0,
                          height: 15.0,
                          indent: 16.0,
                          endIndent: 15.0,
                        ),
                        SizedBox(height: 1.0),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TermsAndConditionsPage(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 50.0, top: 8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.description,
                                  color: const Color(0xFF8443BA),
                                  size: 28,
                                ),
                                SizedBox(width: 25.0),
                                Text(
                                  'T&C',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 1.0),
                        Divider(
                          color: const Color.fromARGB(221, 237, 236, 236),
                          thickness: 1.0,
                          height: 15.0,
                          indent: 16.0,
                          endIndent: 15.0,
                        ),
                        SizedBox(height: 1.0),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PointsSystemPage(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 50.0, top: 8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.table_chart,
                                  color: const Color(0xFF8443BA),
                                  size: 28,
                                ),
                                SizedBox(width: 25.0),
                                Text(
                                  'Point System',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 1.0),
                        Divider(
                          color: const Color.fromARGB(221, 237, 236, 236),
                          thickness: 1.0,
                          height: 15.0,
                          indent: 16.0,
                          endIndent: 15.0,
                        ),
                        SizedBox(height: 1.0),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResponsiblePlayPage(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width *0.15, // Adjust as needed
                              top: MediaQuery.of(context).size.height *0.01,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: const Color(0xFF8443BA),
                                  size: 28,
                                ),
                                SizedBox(width: 25.0),
                                Text(
                                  'Responsible Play',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 1.0),
                        Divider(
                          color: const Color.fromARGB(221, 237, 236, 236),
                          thickness: 1.0,
                          height: 15.0,
                          indent: 16.0,
                          endIndent: 15.0,
                        ),
                        SizedBox(height: 1.0),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LiveChat(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 50.0, top: 8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.contact_support,
                                  color: const Color(0xFF8443BA),
                                  size: 28,
                                ),
                                SizedBox(width: 25.0),
                                Text(
                                  'Contact Us',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 1.0),
                        Divider(
                          color: const Color.fromARGB(221, 237, 236, 236),
                          thickness: 1.0,
                          height: 15.0,
                          indent: 16.0,
                          endIndent: 15.0,
                        ),
                        SizedBox(height: 1.0),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInNewScreen(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 50.0, top: 8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.exit_to_app,
                                  color: Color.fromARGB(255, 85, 8, 106),
                                  size: 28,
                                ),
                                SizedBox(width: 25.0),
                                Text(
                                  'Logout',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 1.0),
                        Divider(
                          color: const Color.fromARGB(221, 237, 236, 236),
                          thickness: 1.0,
                          height: 15.0,
                          indent: 16.0,
                          endIndent: 15.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

