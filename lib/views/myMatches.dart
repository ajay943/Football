import 'package:app/views/myCompletedMatchesTeam.dart';
import 'package:flutter/material.dart';

class MyMatches extends StatefulWidget {
  const MyMatches({super.key});
  @override
  State<MyMatches> createState() => _MyMatchesState();
}

class _MyMatchesState extends State<MyMatches>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF924ACD), Color(0xFF391C5D)],
            ),
          ),
        ),
        title: Text(
          'My Matches',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 60,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/stadium.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0),
                    border: Border.all(
                      color: Color(0xFF8544BD),
                    ),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    tabs: [
                      Tab(text: 'Live'),
                      Tab(text: 'Completed'),
                    ],
                    indicatorColor: Color(0xFF8544BD),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.020),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Live Matches
                _buildLiveMatches(),
                // Completed Matches
                _buildCompletedMatches(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLiveMatches() {
    return Container(
      color: Colors.green,
      child: Center(
        child: Text(
          'Live Matches',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget _buildCompletedMatches() {
    return Expanded(
      child: ListView.builder(
        // itemCount: competitions.length,
        itemCount: 2,
        itemBuilder: (context, index) {
          // var element = competitions[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyCompletedMatchesTeam(
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Center(
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.22,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 29,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 169, 74, 228),
                                    Color.fromARGB(255, 51, 10, 86),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.016,
                            ), // Adjust the height based on your design
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          AssetImage('assets/india.png'),
                                    ),
                                    Text(
                                      'IND',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Completed',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          AssetImage('assets/aus.png'),
                                    ),
                                    Text(
                                      'AUS',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  0.016, // Adjust the percentage as needed
                            ),
                            // Adjust the height based on your design
                            Container(
                              height: 29,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 169, 74, 228),
                                    Color.fromARGB(255, 51, 10, 86),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))),
            ),
          );
        },
      ),
    );
  }
}
