import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TeamSelectionScreen extends StatefulWidget {
  @override
  _TeamSelectionScreenState createState() => _TeamSelectionScreenState();
}

class _TeamSelectionScreenState extends State<TeamSelectionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Player> players = [
    Player(
      name: 'Player 1',
      position: 'Forward',
      skill: 'WK(0)',
      photo: 'assets/player1.jpg',
      point: '5',
    ),
    Player(
      name: 'Player 2',
      position: 'Forward',
      skill: 'WK(0)',
      photo: 'assets/player2.jpg',
      point: '6',
    ),
    Player(
      name: 'Player 3',
      position: 'Forward',
      skill: 'WK(0)',
      photo: 'assets/player2.jpg',
      point: '8',
    ),
    Player(
      name: 'Player 4',
      position: 'Forward',
      skill: 'WK(0)',
      photo: 'assets/player2.jpg',
      point: '7',
    ),
    Player(
      name: 'Player 5',
      position: 'Midfielder',
      skill: 'BAT(0)',
      photo: 'assets/player3.jpg',
      point: '8',
    ),
    Player(
      name: 'Player 6',
      position: 'Midfielder',
      skill: 'BAT(0)',
      photo: 'assets/player4.jpg',
      point: '5',
    ),
    Player(
      name: 'Player 7',
      position: 'Defender',
      skill: 'AR(0)',
      photo: 'assets/player5.jpg',
      point: '8',
    ),
    Player(
      name: 'Player 8',
      position: 'Defender',
      skill: 'AR(0)',
      photo: 'assets/player6.jpg',
      point: '6',
    ),
    Player(
      name: 'Player 9',
      position: 'Goalkeeper',
      skill: 'BOWL(0)',
      photo: 'assets/player7.jpg',
      point: '9',
    ),
    Player(
      name: 'Player 10',
      position: 'Goalkeeper',
      skill: 'BOWL(0)',
      photo: 'assets/player8.jpg',
      point: '12',
    ),
  ];

  List<Player> selectedPlayers = [];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _getUniqueSkills().length, vsync: this);
  }

  List<String> _getUniqueSkills() {
    return players.map((player) => player.skill).toSet().toList();
  }

  List<Player> _getPlayersBySkill(String skill) {
    return players.where((player) => player.skill == skill).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team Selection'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Container(
            height: 200.0,
            width: 700.0,
            child: Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Maximum of 10 players from one team',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Players',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          'Credits Left',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0), // Add space between the two rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '0/11',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          '100',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          LinearPercentIndicator(
                            width: 310.0,
                            lineHeight: 27.0,
                            percent: 0.8,
                            center: Text(
                              "80.0%",
                              style: TextStyle(fontSize: 12.0),
                            ),
                            trailing: Icon(Icons.mood),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            backgroundColor: Colors.grey,
                            progressColor: Colors.white,
                          ),
                          Positioned(
                            right: 0.0,
                            child: Container(
                              padding: EdgeInsets.all(0.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                                border: Border.all(
                                  color: Colors
                                      .white, // Set the border color to white
                                  width: 1.5, // Set the border width
                                ),
                              ),
                              child: Icon(
                                Icons.remove,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          TabBar(
            controller: _tabController,
            tabs: _getUniqueSkills().map((skill) => Tab(text: skill)).toList(),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _getUniqueSkills().map((skill) {
                return Column(
                  children: [
                    Text(
                      'Select 1 - 8 your $skill team:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _getPlayersBySkill(skill).length,
                        itemBuilder: (context, index) {
                          final player = _getPlayersBySkill(skill)[index];
                          return ListTile(
                            title: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(player.photo),
                                ),
                                SizedBox(width: 16.0),
                                Text(player.name),
                              ],
                            ),
                            subtitle: Text(player.position),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      if (selectedPlayers.contains(player)) {
                                        selectedPlayers.remove(player);
                                      }
                                    });
                                  },
                                ),
                                Text(player.point),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      if (!selectedPlayers.contains(player)) {
                                        selectedPlayers.add(player);
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                            tileColor: selectedPlayers.contains(player)
                                ? Colors.blue.withOpacity(0.3)
                                : null,
                          );
                        },
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          // Handle the selected players
          print('Selected Players: ${selectedPlayers.map((e) => e.name)}');
        },
        child: Text('Submit'),
      ),
    );
  }
}

class Player {
  final String name;
  final String position;
  final String skill;
  final String photo;
  final String point;

  Player({
    required this.name,
    required this.position,
    required this.skill,
    required this.photo,
    required this.point,
  });
}