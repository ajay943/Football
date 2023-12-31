import 'package:app/views/detailNotification.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loader_skeleton/loader_skeleton.dart';

class AllNotification extends StatefulWidget {
  const AllNotification({super.key});

  @override
  State<AllNotification> createState() => _AllNotificationState();
}

class _AllNotificationState extends State<AllNotification> {
  late String phone;
  List competitions = [];
  bool isLoading = true;

  _isLoggedIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var phoneNumber = pref.getString('phoneNumber');
    setState(() {
      phone = phoneNumber!;
    });
  }

  Future<void> sendEmptyNotification() async {
    // Replace the phone number with the actual one
    final phoneNumber = phone;

    // API endpoint URL
    final url =
        Uri.parse('https://crickx.onrender.com/notifications/$phoneNumber');

    try {
      // Make the POST request without a request body
      var response = await http.post(url);

      // Check the response status code
      if (response.statusCode == 200) {
        print('Notification sent successfully');
        var data = json.decode(response.body);
        print(response.body);
        if (data != null) {
          setState(() {
            for (int i = 0; i < data['notifications'].length; i++) {
              competitions.addAll(data['notifications']);
            }
            isLoading = false;
          });
        }
      } else {
        print('Failed to send notification: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    _isLoggedIn();
    Future.delayed(Duration(seconds: 1), () {
      sendEmptyNotification();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF8443BA),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: isLoading
          ? CardSkeleton(
              isCircularImage: true,
              isBottomLinesActive: true,
            )
          : competitions.isEmpty ? Center(
            child: Text("No notifications availabel"),
          ): Expanded(
              child: ListView.builder(
                itemCount: competitions.length,
                // itemCount: 4,
                itemBuilder: (context, index) {
                  var element = competitions[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailNotification(
                            notificationId: element["_id"],
                          ),
                          // builder: (context) => MatchDetailPage( matchId: 12345),
                        ),
                      );
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => DetailNotification(),
                      //   ),
                      // );
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(right: 16, left: 16, top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            height: 110.0,
                            child: Card(
                              elevation: 5.0,
                              margin: EdgeInsets.all(0.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.phone_android,
                                          size: 24.0,
                                          color:
                                              Color.fromARGB(255, 113, 13, 167),
                                        ),
                                        SizedBox(width: 8.0),
                                        Text(
                                          element['title'],
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8.0),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left:
                                              30.0), // Adjust the left margin as needed
                                      child: Text(
                                        element['message'],
                                        style: TextStyle(
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(height: 16.0),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
