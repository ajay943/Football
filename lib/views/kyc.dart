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

// import 'package:flutter/material.dart';
// import 'package:sidebarx/sidebarx.dart';


// class SidebarXExampleApp extends StatelessWidget {
//   SidebarXExampleApp({Key? key}) : super(key: key);

//   final _controller = SidebarXController(selectedIndex: 0, extended: true);
//   final _key = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'SidebarX Example',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: primaryColor,
//         canvasColor: canvasColor,
//         scaffoldBackgroundColor: scaffoldBackgroundColor,
//         textTheme: const TextTheme(
//           headlineSmall: TextStyle(
//             color: Colors.black,
//             fontSize: 46,
//             fontWeight: FontWeight.w800,
//           ),
//         ),
//       ),
//       home: Builder(
//         builder: (context) {
//           final isSmallScreen = MediaQuery.of(context).size.width < 600;
//           return Scaffold(
//             key: _key,
//             appBar: isSmallScreen
//                 ? AppBar(
//                     backgroundColor: canvasColor,
//                     title: Text(_getTitleByIndex(_controller.selectedIndex)),
//                     leading: IconButton(
//                       onPressed: () {
//                         // if (!Platform.isAndroid && !Platform.isIOS) {
//                         //   _controller.setExtended(true);
//                         // }
//                         _key.currentState?.openDrawer();
//                       },
//                       icon: const Icon(Icons.menu),
//                     ),
//                   )
//                 : null,
//             drawer: ExampleSidebarX(controller: _controller),
//             body: Row(
//               children: [
//                 if (!isSmallScreen) ExampleSidebarX(controller: _controller),
//                 Expanded(
//                   child: Center(
//                     child: _ScreensExample(
//                       controller: _controller,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class ExampleSidebarX extends StatelessWidget {
//   const ExampleSidebarX({
//     Key? key,
//     required SidebarXController controller,
//   })  : _controller = controller,
//         super(key: key);

//   final SidebarXController _controller;

//   @override
//   Widget build(BuildContext context) {
//     return SidebarX(
//       controller: _controller,
//       theme: SidebarXTheme(
//         margin: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: canvasColor,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         hoverColor: scaffoldBackgroundColor,
//         textStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
//         selectedTextStyle: const TextStyle(color: Colors.white),
//         itemTextPadding: const EdgeInsets.only(left: 30),
//         selectedItemTextPadding: const EdgeInsets.only(left: 30),
//         itemDecoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(color: canvasColor),
//         ),
//         selectedItemDecoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(
//             color: actionColor.withOpacity(0.37),
//           ),
//           gradient: const LinearGradient(
//             colors: [accentCanvasColor, canvasColor],
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.28),
//               blurRadius: 30,
//             )
//           ],
//         ),
//         iconTheme: IconThemeData(
//           color: Colors.black.withOpacity(0.7),
//           size: 20,
//         ),
//         selectedIconTheme: const IconThemeData(
//           color: Colors.white,
//           size: 20,
//         ),
//       ),
//       extendedTheme: const SidebarXTheme(
//         width: 200,
//         decoration: BoxDecoration(
//           color: canvasColor,
//         ),
//       ),
//       footerDivider: divider,
//       headerBuilder: (context, extended) {
//         return SizedBox(
//           height: 100,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Image.asset('assets/images/avatar.png'),
//           ),
//         );
//       },
//       items: [
//         SidebarXItem(
//           icon: Icons.home,
//           label: 'Home',
//           onTap: () {
//             debugPrint('Home');
//           },
//         ),
//         const SidebarXItem(
//           icon: Icons.search,
//           label: 'Search',
//         ),
//         const SidebarXItem(
//           icon: Icons.people,
//           label: 'People',
//         ),
//         const SidebarXItem(
//           icon: Icons.favorite,
//           label: 'Favorites',
//         ),
//         const SidebarXItem(
//           iconWidget: FlutterLogo(size: 20),
//           label: 'Flutter',
//         ),
//       ],
//     );
//   }
// }

// class _ScreensExample extends StatelessWidget {
//   const _ScreensExample({
//     Key? key,
//     required this.controller,
//   }) : super(key: key);

//   final SidebarXController controller;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return AnimatedBuilder(
//       animation: controller,
//       builder: (context, child) {
//         final pageTitle = _getTitleByIndex(controller.selectedIndex);
//         switch (controller.selectedIndex) {
//           case 0:
//             return ListView.builder(
//               padding: const EdgeInsets.only(top: 10),
//               itemBuilder: (context, index) => Container(
//                 height: 100,
//                 width: double.infinity,
//                 margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Theme.of(context).canvasColor,
//                   boxShadow: const [BoxShadow()],
//                 ),
//               ),
//             );
//           default:
//             return Text(
//               pageTitle,
//               style: theme.textTheme.headlineSmall,
//             );
//         }
//       },
//     );
//   }
// }

// String _getTitleByIndex(int index) {
//   switch (index) {
//     case 0:
//       return 'Home';
//     case 1:
//       return 'Search';
//     case 2:
//       return 'People';
//     case 3:
//       return 'Favorites';
//     case 4:
//       return 'Custom iconWidget';
//     case 5:
//       return 'Profile';
//     case 6:
//       return 'Settings';
//     default:
//       return 'Not found page';
//   }
// }

// const primaryColor = Color.fromARGB(255, 242, 242, 246);
// const canvasColor = Color.fromARGB(255, 224, 224, 230);
// const scaffoldBackgroundColor = Color(0xFF464667);
// const accentCanvasColor = Color(0xFF3E3E61);
// const white = Colors.black;
// final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
// final divider = Divider(color: white.withOpacity(0.3), height: 1);
