import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loader_skeleton/loader_skeleton.dart';

class DetailNotification extends StatefulWidget {
  final String notificationId;
  const DetailNotification({Key? key, required this.notificationId}) : super(key: key);

  @override
  State<DetailNotification> createState() => _DetailNotificationState();
}

class _DetailNotificationState extends State<DetailNotification> {

  List<dynamic> suggestions = [];
  String? title;
  String? message;
  bool isLoading = true;
  
  Future<void> getNotificationById(String notificationId) async {
  // API endpoint URL
  final url = Uri.parse('https://crickx.onrender.com/getNotificationByID');

  // Request headers
  var headers = {
    'Content-Type': 'application/json',
  };

  // Request body
  var body = {
    "_id": notificationId,
  };

  try {
    // Make the POST request
    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    // Check the response status code
    if (response.statusCode == 200) {
      print('Notification details received successfully');
      print(response.body);
      var jsonResponse = json.decode(response.body);
      setState(() {
        title = jsonResponse['count']['title'];
        message = jsonResponse['count']['message'];
        isLoading = false;
      });
    } else {
      print('Failed to get notification details: ${response.reasonPhrase}');
    }
  } catch (error) {
    print('Error: $error');
  }
}

@override
  void initState() {
    super.initState();
    getNotificationById(widget.notificationId);
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
       body:isLoading
          ? CardSkeleton(
              isCircularImage: true,
              isBottomLinesActive: true,
            ) 
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$title",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              "$message",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ), );
  }
}