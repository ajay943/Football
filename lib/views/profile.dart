import 'package:app/views/wallet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController dateinput = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String name = "";
  String lastName = "";
  String email = "";
  String dob = "";

  int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    if (birthDate.month > currentDate.month) {
      age--;
    } else if (currentDate.month == birthDate.month) {
      if (birthDate.day > currentDate.day) {
        age--;
      }
    }
    return age;
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2040),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      setState(() {
        dateinput.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'My profile',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_balance_wallet, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WalletScreen (),
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
                height: MediaQuery.of(context).size.height * .280,
                padding: const EdgeInsets.all(0.0),
                child: Image.asset(
                  'assets/ball.png',
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .95,
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
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .85,
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
                      SizedBox(height: 70.0),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * .075,
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              name = value;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * .010,),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * .075,
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              lastName = value;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Last Name',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * .010,),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * .075,
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Email ID',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * .010,),
                      GestureDetector(
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * .075,
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            controller: dateinput,
                            decoration: InputDecoration(
                              labelText: dateinput.text.isEmpty ? 'DOB' : 'DOB',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              suffixIcon: Icon(Icons.calendar_today, color: Colors.grey),
                            ),
                            readOnly: true,
                            validator: (value) {
                              if (calculateAge(DateTime.parse(value!)) < 16 || value.isEmpty) {
                                return 'Please enter a valid date.';
                              }
                              return null;
                            },
                            onTap: () {
                              _selectDate(context);
                            },
                          ),
                        ),
                      ),
                       SizedBox(height: MediaQuery.of(context).size.height * .040,),
                      Center(
                        child: InkWell(
                          onTap: () {
                            // Add your edit profile button logic here
                            printData(); // Print data when the button is tapped
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * .25,
                            height: MediaQuery.of(context).size.width * .080,
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
              backgroundImage: AssetImage('assets/profileimage.png'),
            ),
          ),
        ],
      ),
    );
  }

  void printData() {
    print('First Name: ${name}');
    print('Last Name: ${lastName}');
    print('Email: ${email}');
    print('DOB: ${dateinput.text}');
  }
}
