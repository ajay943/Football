import 'package:flutter/material.dart';

class PointsSystemPage extends StatefulWidget {
  @override
  _PointsSystemPageState createState() => _PointsSystemPageState();
}

class _PointsSystemPageState extends State<PointsSystemPage>
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
        title: Text('Points System'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Batsmen'),
            Tab(text: 'Bowlers'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PointsList(category: 'Batsmen'),
          PointsList(category: 'Bowlers'),
        ],
      ),
    );
  }
}

class PointsList extends StatelessWidget {
  final String category;

  PointsList({required this.category});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        // Your banner widget here
        Container(
          height: 200.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/slider2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 16.0),
        // Your points system content based on the category
        Text(
          '$category Points System:',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          '1. Point rule 1',
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 8.0),
        Text(
          '2. Point rule 2',
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 8.0),
        // Add more point rules as needed
      ],
    );
  }
}
