import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Term & Conditions',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
           Positioned(
            top: -5,
            left: 0.0,
            right: 0.0,
            child: Center(
              child: Card(
                child: Container(
                  width: double.infinity,
                  height: 144.0,
                  // padding: const EdgeInsets.all(16.0),
                  // decoration: BoxDecoration(
                  //   color: Color.fromARGB(213, 140, 5, 237),
                  // ),
                  child: Image.asset(
                    'assets/t&c.png', // Replace with the correct path to your image asset
                    fit: BoxFit.contain, // Adjust the fit as needed
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 170,
            left: 16.0,
            right: 16.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Funzy - Terms & Conditions',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0), // Add a sized box for spacing
                Text(
                  '     Fancy Circket Match") ("Services") to you, the user, ("User" or "you") subject to compliance with these terms and conditions (hereinafter referred to as "Terms & Conditions"). By accessing and/or using the Funzy Platform, you accept and agree to be legally bound by these Terms & Conditions, as it may be amended or supplemented from time to time, and agree to all operating rules, terms, conditions, policies, and procedures that may be published on Funzy Platform or in connection with the Services. All such rules, terms, conditions, policies, and procedures are incorporated into these Terms & Conditions by reference.++',
                  style: TextStyle(fontSize: 10.0),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Funzy',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Funzy is the flagship brand of Sport Technologies Private Limited ("Funzy"). Through Funzy, along with its sub-pages, and the Funzy App, Funzy operates five separate portals through which it offers Funzy based, football based, basketball based, volleyball based, hockey based, baseball based, handball based, American football based and kabaddi based online fantasy games. Funzy as used herein shall be construed as a collective reference to Funzy and the Funzy App',
                  style: TextStyle(
                    fontSize: 10.0,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Usage of Funzy',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Any person ("User") accessing Funzy App("Funzy platform") for participating in the various contests and game',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),);
  }
}
