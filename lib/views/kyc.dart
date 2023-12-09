import 'package:app/views/multiple.dart';
import 'package:flutter/material.dart';

class KycScreen extends StatefulWidget {
  @override
  _KycScreenState createState() => _KycScreenState();
}

class _KycScreenState extends State<KycScreen> {
  DateTime? selectedDate;
  String? selectedState;
  TextEditingController aadharController = TextEditingController();

  List<String> states = [
    'State 1',
    'State 2',

    // Add more states as needed
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ))!;

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void showStateDropdown() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: Column(
            children: [
              for (String state in states)
                ListTile(
                  title: Text(state),
                  onTap: () {
                    setState(() {
                      selectedState = state;
                    });
                    Navigator.pop(context);
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => YourNewScreen()),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 0, 0),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'CRICKET',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 1, 111, 202),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'KYC DETAILS',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 3),
                Center(
                  child: Text(
                    'Enter Your details',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text('Select your date of birth'),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 80, // Set your desired height
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                        child: ElevatedButton(
                          onPressed: () => _selectDate(context),
                          child: Text(selectedDate != null
                              ? 'Selected Date: ${selectedDate!.toLocal()}'
                              : 'Select Date'),
                        ),
                      ),
                    ),
                    // Add more widgets to the row if needed
                  ],
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    showStateDropdown();
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kindly confirm your state',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedState ?? 'Select State',
                              style: TextStyle(fontSize: 16),
                            ),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text('Kindly enter aadhaar number (12 digits)'),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 5),
                      Expanded(
                        child: TextField(
                          controller: aadharController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Enter Aadhar Number',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 100,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: ElevatedButton(
                            onPressed: () {
                              print('Date of Birth: $selectedDate');
                              print('Selected State: $selectedState');
                              print('Aadhar Number: ${aadharController.text}');
                            },
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 2, 106, 192),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              minimumSize: Size(400, 50),
                            ),
                            child: Text(
                              'Continue',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 90),
                      Text(
                        'For any issue in KYC email us on',
                      ),
                      SizedBox(height: 0),
                      Text(
                        'contact@crickpe.com',
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      ),
                    ],
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
