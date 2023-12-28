import 'package:app/phone.dart';
import 'package:app/views/chat.dart';
import 'package:app/views/pointsystem.dart';
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
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/ball.png',
                    width: 400,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                // Positioned(
                //   top: 55,
                //   left: 16,
                //   child: Container(
                //     height: 40,
                //     width: 40,
                //     decoration: BoxDecoration(
                //       color: Colors.black54,
                //       borderRadius: BorderRadius.circular(
                //           100.0), // Adjust the radius as needed
                //     ),
                //     padding: EdgeInsets.all(1.0),
                //     child: IconButton(
                //       icon: Icon(Icons.arrow_back, color: Colors.white),
                //       onPressed: () {
                //         Navigator.of(context).pop();
                //       },
                //     ),
                //   ),
                // ),
                Positioned(
                  top: 150,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    height: 700,
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
                                left: 16.0,
                                top: 20.0,
                              ),
                              child: Container(
                                width: 80,
                                height: 80,
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
                                  Padding(
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
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Divider(
                          color: const Color.fromARGB(221, 237, 236, 236),
                          thickness: 1.0,
                          height: 15.0,
                          indent: 16.0,
                          endIndent: 15.0,
                        ),
                        SizedBox(height: 10.0),
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
                        SizedBox(height: 10.0),
                        Divider(
                          color: const Color.fromARGB(221, 237, 236, 236),
                          thickness: 1.0,
                          height: 15.0,
                          indent: 16.0,
                          endIndent: 15.0,
                        ),
                        SizedBox(height: 10.0),
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
                        SizedBox(height: 10.0),
                        Divider(
                          color: const Color.fromARGB(221, 237, 236, 236),
                          thickness: 1.0,
                          height: 15.0,
                          indent: 16.0,
                          endIndent: 15.0,
                        ),
                        SizedBox(height: 10.0),
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
                        SizedBox(height: 10.0),
                        Divider(
                          color: const Color.fromARGB(221, 237, 236, 236),
                          thickness: 1.0,
                          height: 15.0,
                          indent: 16.0,
                          endIndent: 15.0,
                        ),
                        SizedBox(height: 10.0),
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
                            padding: EdgeInsets.only(left: 50.0, top: 8.0),
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
                        SizedBox(height: 10.0),
                        Divider(
                          color: const Color.fromARGB(221, 237, 236, 236),
                          thickness: 1.0,
                          height: 15.0,
                          indent: 16.0,
                          endIndent: 15.0,
                        ),
                        SizedBox(height: 10.0),
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
                        SizedBox(height: 10.0),
                        Divider(
                          color: const Color.fromARGB(221, 237, 236, 236),
                          thickness: 1.0,
                          height: 15.0,
                          indent: 16.0,
                          endIndent: 15.0,
                        ),
                        SizedBox(height: 10.0),
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
                        SizedBox(height: 10.0),
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
