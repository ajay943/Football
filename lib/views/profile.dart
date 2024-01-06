import 'package:app/views/wallet.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Set the background color to black
        title: Text(
          'My profile',
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.white), // Set icon color to white
          onPressed: () {
            // Add your back arrow icon logic here
            Navigator.pop(
                context); // For example, you can pop the current screen
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_balance_wallet,
                color: Colors.white), // Set icon color to white
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WalletScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: -5,
            left: 0.0,
            right: 0.0,
            child: Card(
              child: Container(
                width: double.infinity,
                height: 250.0, // Set your desired height
                padding: const EdgeInsets.all(0.0),
                child: Image.asset(
                  'assets/ball.png',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 130,
            left: 0.0,
            right: 0.0,
            child: Center(
              child: Card(
                child: Container(
                  width: 450.0,
                  height: 600.0,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 80.0),
                      Container(
                        width: 400.0,
                        height: 66.0,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            // enabledBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(color: Colors.grey),
                            // ),
                          ),
                          // Add any additional properties or controllers as needed
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        width: 400.0,
                        height: 66.0,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Contact Number',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            // enabledBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(color: Colors.grey),
                            // ),
                          ),
                          // Add any additional properties or controllers as needed
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        width: 400.0,
                        height: 66.0,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email ID',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            // enabledBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(color: Colors.grey),
                            // ),
                          ),
                          // Add any additional properties or controllers as needed
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        width: 400.0,
                        height: 66.0,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'DOB',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            // enabledBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(color: Colors.grey),
                            // ),
                          ),
                          // Add any additional properties or controllers as needed
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Center(
                        child: InkWell(
                          onTap: () {
                            // Add your edit profile button logic here
                          },
                          child: Container(
                            width: 134.0,
                            height: 33.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF8242BA),
                                  Color(0xFF402066),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(4.04),
                            ),
                            child: Center(
                              child: Text(
                                'Edit Profile',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 45.0,
            left: (MediaQuery.of(context).size.width - 150) / 2,
            child: CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage('assets/img2.png'),
            ),
          ),
        ],
      ),
    );
  }
}
