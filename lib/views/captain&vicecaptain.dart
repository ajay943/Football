import 'package:flutter/material.dart';
import 'package:app/views/playercards.dart';

class Captain extends StatefulWidget {
  final List<Player> selectedPlayers;

  const Captain({Key? key, required this.selectedPlayers}) : super(key: key);

  @override
  State<Captain> createState() => _CaptainState();
}

class _CaptainState extends State<Captain> {
  late Player selectedCaptain;
  late Player selectedViceCaptain;

  @override
  void initState() {
    super.initState();
    // Initialize to the first player in the list
    selectedCaptain = widget.selectedPlayers[0];
    selectedViceCaptain = widget.selectedPlayers[0];
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
                return GestureDetector(
                  onTap: () {
                    // Set the selected player as captain
                    setState(() {
                      selectedCaptain = player;
                      // Check if the vice-captain is the same as the captain
                      // If yes, reset the vice-captain to the first player in the list
                      if (selectedViceCaptain == selectedCaptain) {
                        selectedViceCaptain = widget.selectedPlayers[0];
                      }
                    });
                  },
                  child: Card(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                      
                                      child: Container(
                                        width: 30.0,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: selectedCaptain == player
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
                                        // Check if the selected vice-captain is the same as the captain
                                        // If yes, reset the vice-captain to the first player in the list
                                        if (selectedCaptain != player) {
                                          setState(() {
                                            selectedViceCaptain = player;
                                          });
                                        }
                                      },
                                      child: Container(
                                        width: 30.0,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: selectedViceCaptain == player
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
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
