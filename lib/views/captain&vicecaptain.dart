import 'package:flutter/material.dart';
import 'package:app/views/playercards.dart';

class Captain extends StatefulWidget {
  final int matchId;
  final List<Player> selectedPlayers;
  const Captain(
      {Key? key, required this.selectedPlayers, required this.matchId})
      : super(key: key);
  @override
  State<Captain> createState() => _CaptainState();
}

class _CaptainState extends State<Captain> {
  late String selectedCaptainId;
  late String selectedViceCaptainId;
  late List<String> selectedPlayerNames;
  late List<String> selectedPlayerSkill;
  late List<String> selectedPlayerPoint;
  late List<String> selectedPlayerIds;

  @override
  void initState() {
    super.initState();
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
                    height: 80.0,
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
                          top: 40,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Set the selected player's pid as captain if not already selected
                                      if (selectedCaptainId != player.pid &&
                                          selectedViceCaptainId != player.pid) {
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
                                      if (selectedViceCaptainId != player.pid &&
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
                                        color:
                                            selectedViceCaptainId == player.pid
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
          Visibility(
            visible: isSubmitButtonVisible(),
            child: ElevatedButton(
              onPressed: () {
                print("selectedCaptainId$selectedCaptainId");
                print("selectedViceCaptainId$selectedViceCaptainId");
                print("selectedPlayerNames$selectedPlayerNames");
                print("selectedPlayerSkill$selectedPlayerSkill");
                print("selectedPlayerPoint$selectedPlayerPoint");
                print("selectedPlayerIds$selectedPlayerIds");
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
