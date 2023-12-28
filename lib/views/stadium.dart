import 'package:flutter/material.dart';

class StadiumPage extends StatefulWidget {
  @override
  State<StadiumPage> createState() => _StadiumPageState();
}

class _StadiumPageState extends State<StadiumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white, // Set the background color or use an image
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
                'assets/groundbg.png',
              ),
          ),
          Positioned(
            top: 0,
            height: 93.0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.black,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop(); // Add navigation logic here
                },
              ),
              // centerTitle: true,
              title: Padding(
                padding: EdgeInsets.only(
                  left: 50.0,
                  top: 0.0,
                ),
                child: Text(
                  '00 IND vs ENG 00',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
