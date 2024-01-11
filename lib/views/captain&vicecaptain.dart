import 'package:app/views/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:app/views/playercards.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Captain extends StatefulWidget {
  final int matchId;
  final int competitionId;
  final String short_title;
  final String date_start_ist;

  final List<Player> selectedPlayers;
  const Captain({
    Key? key,
    required this.selectedPlayers,
    required this.matchId,
    required this.competitionId,
    required this.short_title,
    required this.date_start_ist,
  }) : super(key: key);
  @override
  State<Captain> createState() => _CaptainState();
}

class _CaptainState extends State<Captain> {
  bool isLoading = false;
  late String selectedCaptainId;
  late String phone;
  late String selectedViceCaptainId;
  late List<String> selectedPlayerNames;
  late List<String> selectedPlayerSkill;
  late List<String> selectedPlayerPoint;
  late List<String> selectedPlayerIds;

  _isLoggedIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var phoneNumber = pref.getString('phoneNumber');
    setState(() {
      phone = phoneNumber!;
    });
  }

  Future<void> submitTeam() async {
    setState(() {
      isLoading = true;
    });
    var headers = {
      'Content-Type': 'application/json',
    };

    var request = http.Request(
      'POST',
      Uri.parse('https://crickx.onrender.com/team'),
    );

    request.headers.addAll(headers);

    // Replace the following with your actual data
    Map<String, dynamic> requestBody = {
      "match_id": widget.matchId,
      "phoneNumber": phone,
      "playersID": selectedPlayerIds,
      "playersName": selectedPlayerNames,
      "playersSkill": selectedPlayerSkill,
      "playersPoint": selectedPlayerPoint,
      "c": selectedCaptainId,
      "vc": selectedViceCaptainId,
    };

    request.body = json.encode(requestBody);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        setState(() {
          isLoading = false;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MatchDetailPage(
                matchId: widget.matchId,
                short_title: widget.short_title,
                date_start_ist: widget.date_start_ist,
                competition: widget.competitionId),
            // builder: (context) => MatchDetailPage( matchId: 12345),
          ),
        );
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _isLoggedIn();
    // Initialize to an empty string
    selectedCaptainId = '';
    selectedViceCaptainId = '';
    List<Map<String, dynamic>> selectedPlayersJson =
        widget.selectedPlayers.map((player) => player.toJson()).toList();
    selectedPlayerNames =
        selectedPlayersJson.map((player) => player['name'].toString()).toList();
    selectedPlayerSkill = selectedPlayersJson
        .map((player) => player['skill'].toString())
        .toList();
    selectedPlayerPoint = selectedPlayersJson
        .map((player) => player['point'].toString())
        .toList();
    selectedPlayerIds =
        selectedPlayersJson.map((player) => player['pid'].toString()).toList();
  }

  bool isSubmitButtonVisible() {
    // Check if both captain and vice-captain positions are filled
    return selectedCaptainId.isNotEmpty && selectedViceCaptainId.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop(); // Add navigation logic here
          },
        ),
        title: Text(
          'Create team',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "Choose your Captain and Vice Captain",
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "C gets 2X points, VC gets 1.5X points",
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            elevation: 0.5,
            margin: EdgeInsets.all(0.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Container(
              width: double.infinity,
              height: 30.0,
              padding: const EdgeInsets.only(bottom: 0, left: 16, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 90.0,
                        height: 15.0,
                        margin: EdgeInsets.only(
                            left: 8.0), // Adjust the padding value as needed
                        child: Text(
                          'SELECTED BY',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Container(
                        width: 50.0,
                        height: 15.0,
                        margin: EdgeInsets.only(left: 130.0),
                        child: Text(
                          '% C BY',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Container(
                        width: 40.0,
                        height: 15.0,
                        margin: EdgeInsets.only(
                            right: 0.0), // Adjust the margin value as needed
                        child: Text(
                          '% VC BY',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: .5),
          Expanded(
            child: ListView.builder(
              itemCount: widget.selectedPlayers.length,
              itemBuilder: (context, index) {
                final player = widget.selectedPlayers[index];
                return Card(
                  elevation: 0.5,
                  margin: EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 70.0,
                    padding:
                        const EdgeInsets.only(bottom: 4, left: 19, right: 19),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          width: 67.0,
                          height: 80.0,
                          child: Image.asset(
                            'assets/image.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          left: 83.0,
                          top: 20,
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        player.name,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 83.0,
                          top: 30,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 175),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // Set the selected player's pid as captain if not already selected
                                        if (selectedCaptainId != player.pid &&
                                            selectedViceCaptainId !=
                                                player.pid) {
                                          setState(() {
                                            selectedCaptainId = player.pid;
                                          });
                                        }
                                      },
                                      child: Container(
                                        width: 30.0,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: selectedCaptainId == player.pid
                                              ? Colors.green
                                              : null,
                                        ),
                                        child: Center(
                                          child: Text(
                                            'C',
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30.0,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Set the selected player's pid as vice-captain if not already selected
                                        if (selectedViceCaptainId !=
                                                player.pid &&
                                            selectedCaptainId != player.pid) {
                                          setState(() {
                                            selectedViceCaptainId = player.pid;
                                          });
                                        }
                                      },
                                      child: Container(
                                        width: 30.0,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: selectedViceCaptainId ==
                                                  player.pid
                                              ? Colors.blue
                                              : null,
                                        ),
                                        child: Center(
                                          child: Text(
                                            'VC',
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          isLoading
              ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                )
              : Visibility(
                  visible: isSubmitButtonVisible(),
                  child: ElevatedButton(
                    onPressed: () {
                      submitTeam();
                      // Additional code as needed
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(
                          255, 88, 13, 123), // Set the desired button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Set the desired border radius
                      ),
                      minimumSize:
                          Size(150, 35), // Set the desired width and height
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        // Add other text styles as needed
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
