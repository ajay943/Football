import 'package:app/views/multiple.dart'; 
import 'package:flutter/material.dart';

class KycScreen extends StatefulWidget {
  @override
  _KycScreenState createState() => _KycScreenState();
}

class _KycScreenState extends State<KycScreen> {
  // Variables to store user input
  DateTime? selectedDate;
  String? selectedState;
  TextEditingController aadharController = TextEditingController();

  // List of states for the Dropdown
  List<String> states = [
    'State 1',
    'State 2',
    'State 3',
    'State 4',
    // Add more states as needed
  ];

  // Function to show the Date of Birth picker
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
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
                Text(
                  'CRICKET KHELO',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.blue, // Set background color to red
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20), // Adding space at the top

            // Additional Text (centered)
            Center(
              child: Text(
                'KYC DETAILS',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 40),

            // Date of Birth Picker
            Text('Select your date of birth'),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text(selectedDate != null
                  ? 'Selected Date: ${selectedDate!.toLocal()}'
                  : 'Select Date'),
            ),
            SizedBox(height: 20),

            // Dropdown for State selection
            Text('Kindly confirm your state'),
            Container(
              width: double.infinity,
              child: DropdownButton<String>(
                value: selectedState,
                items: states.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedState = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20),

            // TextField for Aadhar Number
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10),
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
            SizedBox(height: 20),

            // Button to submit KYC
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
                          // Process KYC data (you can add your logic here)
                          print('Date of Birth: $selectedDate');
                          print('Selected State: $selectedState');
                          print('Aadhar Number: ${aadharController.text}');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
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
                  SizedBox(height: 100),
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
    );
  }
}
