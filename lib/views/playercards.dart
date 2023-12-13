import 'package:flutter/material.dart';

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
        skill: 'Attack',
        photo: 'assets/player1.jpg'),
    Player(
        name: 'Player 2',
        position: 'Forward',
        skill: 'Attack',
        photo: 'assets/player2.jpg'),
    Player(
        name: 'Player 3',
        position: 'Midfielder',
        skill: 'Midfield',
        photo: 'assets/player3.jpg'),
    Player(
        name: 'Player 4',
        position: 'Midfielder',
        skill: 'Midfield',
        photo: 'assets/player4.jpg'),
    Player(
        name: 'Player 5',
        position: 'Defender',
        skill: 'Defense',
        photo: 'assets/player5.jpg'),
    Player(
        name: 'Player 6',
        position: 'Defender',
        skill: 'Defense',
        photo: 'assets/player6.jpg'),
    Player(
        name: 'Player 7',
        position: 'Goalkeeper',
        skill: 'Goalkeeping',
        photo: 'assets/player7.jpg'),
    Player(
        name: 'Player 8',
        position: 'Goalkeeper',
        skill: 'Goalkeeping',
        photo: 'assets/player8.jpg'),
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
                      'Maximum of 10 players one team',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                        height:
                            16.0), // Add some space between text and progress bar
                    LinearProgressIndicator(
                      value: 0.3, // Set the progress value (e.g., 0.1 for 10%)
                      backgroundColor: Colors
                          .grey, // Set the background color of the progress bar
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.blue), // Set the progress color
                    ),
                    SizedBox(
                        height:
                            8.0), // Add some space between progress bar and number
                    Text(
                      '11/11', // Display the number
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
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
                    Text('Select your $skill team:'),
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

  Player(
      {required this.name,
      required this.position,
      required this.skill,
      required this.photo});
}
