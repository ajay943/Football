// import 'package:app/views/razerpay.dart';
// import 'package:flutter/material.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'package:app/views/upiIndia.dart';

// class PaymentGetwayList extends StatefulWidget {
//   final double enteredAmount;
//   final String phone;
//   const PaymentGetwayList({
//     required this.enteredAmount,
//     required this.phone,
//   });
//   @override
//   State<PaymentGetwayList> createState() => _PaymentGetwayListState();
// }

// class _PaymentGetwayListState extends State<PaymentGetwayList> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Payment',
//           style: TextStyle(
//             fontSize: 22,
//             fontWeight: FontWeight.w600,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Colors.black,
//         centerTitle: true,
//         toolbarHeight: 60,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             bottom: Radius.elliptical(1, 1),
//           ),
//         ),
//         iconTheme: IconThemeData(color: Colors.white),
//         automaticallyImplyLeading: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height * 0.045,
//             width: double.infinity,
//             color: Colors.white10,
//             child: Padding(
//               padding: const EdgeInsets.only(top: 10.0, left: 20),
//               child: Text(
//                 'Add ₹ ${widget.enteredAmount}',
//                 style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
//               ),
//             ),
//           ),
//           SizedBox(height: 50.0),
//           Container(
//             height: MediaQuery.of(context).size.height * 0.23,
//             width: double.infinity,
//             margin: EdgeInsets.symmetric(horizontal: 10),
//             child: Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(14.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ListTile(
//                       leading: CircleAvatar(
//                         backgroundColor: Colors.white70,
//                         backgroundImage: AssetImage('assets/razorpay.webp'),
//                       ),
//                       title: Text(
//                         'Razor Pay',
//                         style: TextStyle(
//                           fontSize: 17,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                       trailing: Container(
//                         width: MediaQuery.of(context).size.width * .30,
//                         height: MediaQuery.of(context).size.height * .045,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             // Your button action goes here
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => RazorPayPage(
//                                   enteredAmount: widget.enteredAmount,
//                                   phone: widget.phone
//                                 ),
//                               ),
//                             );
//                           },
//                           style: ElevatedButton.styleFrom(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(5.0),
//                             ),
//                             primary: Colors.grey,
//                             onPrimary: Colors.white,
//                           ),
//                           child: Text(
//                             'Pay Now',
//                             style: TextStyle(
//                               fontSize: 12, // Set your desired font size
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 0),
//                     Divider(
//                       color: Colors.grey,
//                       thickness: 1,
//                       height: 20,
//                     ),
//                     ListTile(
//                       leading: CircleAvatar(
//                         backgroundColor: Colors.white70,
//                         backgroundImage: AssetImage('assets/upi.png'),
//                       ),
//                       title: Text(
//                         'UPI ID',
//                         style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                       trailing: Container(
//                         width: MediaQuery.of(context).size.width * .30,
//                         height: MediaQuery.of(context).size.height * .045,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => HomePage(
//                                    enteredAmount: widget.enteredAmount,
//                                     phone: widget.phone
//                                 ),
//                               ),
//                             );
//                           },
//                           style: ElevatedButton.styleFrom(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(5.0),
//                             ),
//                             primary: Colors.grey,
//                             onPrimary: Colors.white,
//                           ),
//                           child: Text(
//                             'Pay Now',
//                             style: TextStyle(
//                               fontSize: 12, // Set your desired font size
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:app/views/razerpay.dart';
import 'package:app/views/upiIndia.dart';

class PaymentGetwayList extends StatefulWidget {
  final double enteredAmount;
  final String phone;

  const PaymentGetwayList({
    required this.enteredAmount,
    required this.phone,
  });

  @override
  State<PaymentGetwayList> createState() => _PaymentGetwayListState();
}

class _PaymentGetwayListState extends State<PaymentGetwayList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        toolbarHeight: 60,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(1, 1),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Color(0xFFF3F7F9), // Set your desired background color here
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.055,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                    15.0), // Set your desired border radius
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 20),
                child: Text(
                  'Add ₹ ${widget.enteredAmount}',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(height: 50.0),
            Container(
              height: MediaQuery.of(context).size.height * 0.20,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                    20.0), // Set your desired border radius
              ),
              child: Padding(
                padding: const EdgeInsets.only(left:10,right:5,top:14,bottom:14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white70,
                        backgroundImage: AssetImage('assets/razorpay.webp'),
                      ),
                      title: Text(
                        'Razor Pay',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      trailing: Container(
                        width: MediaQuery.of(context).size.width * .27,
                        height: MediaQuery.of(context).size.height * .040,
                        child: ElevatedButton(
                          onPressed: () {
                            // Your button action goes here
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RazorPayPage(
                                  enteredAmount: widget.enteredAmount,
                                  phone: widget.phone,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            primary: Colors.grey,
                            onPrimary: Colors.white,
                          ),
                          child: Text(
                            'Pay Now',
                            style: TextStyle(
                              fontSize: 10, // Set your desired font size
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Divider(
                      color: Colors.grey,
                      thickness: 0.1,
                      height: 5,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white70,
                        backgroundImage: AssetImage('assets/upi.png'),
                      ),
                      title: Text(
                        'UPI ID',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      trailing: Container(
                        width: MediaQuery.of(context).size.width * .27,
                        height: MediaQuery.of(context).size.height * .040,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(
                                  enteredAmount: widget.enteredAmount,
                                  phone: widget.phone,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            primary: Colors.grey,
                            onPrimary: Colors.white,
                          ),
                          child: Text(
                            'Pay Now',
                            style: TextStyle(
                              fontSize: 10, // Set your desired font size
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
