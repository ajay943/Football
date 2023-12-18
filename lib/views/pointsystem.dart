import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';

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
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Points System'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'One Day'),
            Tab(text: 'Test'),
            Tab(text: 'T20'),
            Tab(text: 'T10'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PointsList(category: 'One Day'),
          PointsList(category: 'Test'),
          PointsList(category: 'T20'),
          PointsList(category: 'T10'),
        ],
      ),
    );
  }
}

class PointsList extends StatefulWidget {
  final String category;

  PointsList({required this.category});

  @override
  _PointsListState createState() => _PointsListState();
}

class _PointsListState extends State<PointsList> {
  bool _isBattingExpanded = false;
  bool _isBowlingExpanded = false;
  bool _isFieldingExpanded = false;
  bool _isOtherExpanded = false;

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
        InkWell(
          onTap: () {
            setState(() {
              _isBattingExpanded = !_isBattingExpanded;
              _isBowlingExpanded = false;
              _isFieldingExpanded = false;
              _isOtherExpanded = false;
            });
          },
          child: Row(
            children: [
              Text(
                '${widget.category} - Batting Points',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Expanded(child: Container()),
              Icon(
                _isBattingExpanded ? Icons.expand_less : Icons.expand_more,
                size: 30.0,
              ),
              SizedBox(width: 8.0),
            ],
          ),
        ),
        if (_isBattingExpanded)
          // Integration of the Accordion widget
          Accordion(
            headerBorderColor: Colors.blueGrey,
            headerBorderColorOpened: Colors.transparent,
            headerBackgroundColorOpened: Colors.white,
            contentBackgroundColor: Colors.white,
            contentBorderColor: Colors.grey,
            contentBorderWidth: 3,
            contentHorizontalPadding: 20,
            scaleWhenAnimating: true,
            openAndCloseAnimation: true,
            headerPadding:
                const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
            sectionClosingHapticFeedback: SectionHapticFeedback.light,
            children: [
              AccordionSection(
                isOpen: true,
                contentVerticalPadding: 20,
                leftIcon:
                    const Icon(Icons.text_fields_rounded, color: Colors.white),
                header: const Text(
                  'POINTS TYPE',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold, // Make text bold
                  ),
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'POINTS TYPE',
                          style: TextStyle(
                            fontWeight: FontWeight.bold, // Make text bold
                          ),
                        ),
                        Text(
                          'POINTS',
                          style: TextStyle(
                            fontWeight: FontWeight.bold, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Runs',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '1',
                          style: TextStyle(
                            color: Colors.green, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Boundary Bonus',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '1',
                          style: TextStyle(
                            color: Colors.green, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Six bonus',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '2',
                          style: TextStyle(
                            color: Colors.green, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Half- century bonus',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '4',
                          style: TextStyle(
                            color: Colors.green, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Century bonus',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '8',
                          style: TextStyle(
                            color: Colors.green, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Dimisal for a Duck(Batter Wicket',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '-3',
                          style: TextStyle(
                            color: Colors.red, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Note:- Any Player scoring century will only',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                      ],
                    ),
                    Text(
                      'get points for century.No points will be awarded as their half century bonus. if any runs are scored on an overthyrow,point for those runs will be creditted to batter on strike for that ball however if overthrow, points',
                      style: TextStyle(
                          // Make text bold
                          ),
                    ),
                  ],
                ),
              ),

              // Add more AccordionSection as needed
            ],
          ),
        SizedBox(height: 16.0),
        InkWell(
          onTap: () {
            setState(() {
              _isBowlingExpanded = !_isBowlingExpanded;
              _isBattingExpanded = false;
              _isFieldingExpanded = false;
              _isOtherExpanded = false;
            });
          },
          child: Row(
            children: [
              Text(
                '${widget.category} - Bowling Points',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Expanded(child: Container()),
              Icon(
                _isBowlingExpanded ? Icons.expand_less : Icons.expand_more,
                size: 30.0,
              ),
              SizedBox(width: 8.0),
            ],
          ),
        ),
        if (_isBowlingExpanded)
          // Integration of the Accordion widget
          Accordion(
            headerBorderColor: const Color.fromARGB(255, 191, 194, 196),
            headerBorderColorOpened: Colors.grey,
            // headerBackgroundColorOpened: Colors.green,
            // contentBackgroundColor: Colors.white,
            // contentBorderColor: Colors.green,
            contentBorderWidth: 3,
            contentHorizontalPadding: 20,
            scaleWhenAnimating: true,
            openAndCloseAnimation: true,
            headerPadding:
                const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
            sectionClosingHapticFeedback: SectionHapticFeedback.light,
            children: [
              AccordionSection(
                isOpen: true,
                contentVerticalPadding: 20,
                leftIcon:
                    const Icon(Icons.text_fields_rounded, color: Colors.white),
                header: const Text(''),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'POINTS TYPE',
                          style: TextStyle(
                            fontWeight: FontWeight.bold, // Make text bold
                          ),
                        ),
                        Text(
                          'POINTS',
                          style: TextStyle(
                            fontWeight: FontWeight.bold, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Wicket',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '25',
                          style: TextStyle(
                            color: Colors.green, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Bonus(LBW/Bowled)',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '8',
                          style: TextStyle(
                            color: Colors.green, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '4 wicket Bonus',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '4',
                          style: TextStyle(
                            color: Colors.green, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '5 wicket bonus',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '8',
                          style: TextStyle(
                            color: Colors.green, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Maiden Over',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '4',
                          style: TextStyle(
                            color: Colors.green, // Make text bold
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Add more AccordionSection as needed
            ],
          ),
        SizedBox(height: 16.0),
        InkWell(
          onTap: () {
            setState(() {
              _isFieldingExpanded = !_isFieldingExpanded;
              _isBattingExpanded = false;
              _isBowlingExpanded = false;
              _isOtherExpanded = false;
            });
          },
          child: Row(
            children: [
              Text(
                '${widget.category} - Fielding Points',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Expanded(child: Container()),
              Icon(
                _isFieldingExpanded ? Icons.expand_less : Icons.expand_more,
                size: 30.0,
              ),
              SizedBox(width: 8.0),
            ],
          ),
        ),
        if (_isFieldingExpanded)
          // Integration of the Accordion widget
          Accordion(
            headerBorderColor: Colors.blueGrey,
            headerBorderColorOpened: Colors.transparent,
            headerBackgroundColorOpened: Colors.green,
            contentBackgroundColor: Colors.white,
            contentBorderColor: Colors.green,
            contentBorderWidth: 3,
            contentHorizontalPadding: 20,
            scaleWhenAnimating: true,
            openAndCloseAnimation: true,
            headerPadding:
                const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
            sectionClosingHapticFeedback: SectionHapticFeedback.light,
            children: [
              AccordionSection(
                isOpen: true,
                contentVerticalPadding: 20,
                leftIcon:
                    const Icon(Icons.text_fields_rounded, color: Colors.white),
                header: const Text(''),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'POINTS TYPE',
                          style: TextStyle(
                            fontWeight: FontWeight.bold, // Make text bold
                          ),
                        ),
                        Text(
                          'POINTS',
                          style: TextStyle(
                            fontWeight: FontWeight.bold, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Catch',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '8',
                          style: TextStyle(
                            color: Colors.green, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '3 catch Bonus',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '4',
                          style: TextStyle(
                            color: Colors.green, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Stumping',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '12',
                          style: TextStyle(
                            color: Colors.green, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Run out(Direct Hit)',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '12',
                          style: TextStyle(
                            color: Colors.green, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Run out(Not a direct Hit)',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '6',
                          style: TextStyle(
                            color: Colors.green, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Note:- A Direct hit is inflicted by the fielder',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                      ],
                    ),
                    Text(
                      'who is only one to touch the ball after the batter faces the delivery .in all other cases,points will be awarded only to the last 2 fieldwers who touch the ball Players taking more than 3 catches  will also get 4 points as 3 catch bonus',
                      style: TextStyle(
                          // Make text bold
                          ),
                    ),
                  ],
                ),
              ),
              // Add more AccordionSection as needed
            ],
          ),
        SizedBox(height: 16.0),
        InkWell(
          onTap: () {
            setState(() {
              _isOtherExpanded = !_isOtherExpanded;
              _isBattingExpanded = false;
              _isBowlingExpanded = false;
              _isFieldingExpanded = false;
            });
          },
          child: Row(
            children: [
              Text(
                '${widget.category} - Other Points',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Expanded(child: Container()),
              Icon(
                _isOtherExpanded ? Icons.expand_less : Icons.expand_more,
                size: 30.0,
              ),
              SizedBox(width: 8.0),
            ],
          ),
        ),
        if (_isOtherExpanded)
          // Integration of the Accordion widget
          Accordion(
            headerBorderColor: Colors.blueGrey,
            headerBorderColorOpened: Colors.transparent,
            headerBackgroundColorOpened: Colors.green,
            contentBackgroundColor: Colors.white,
            contentBorderColor: Colors.green,
            contentBorderWidth: 3,
            contentHorizontalPadding: 20,
            scaleWhenAnimating: true,
            openAndCloseAnimation: true,
            headerPadding:
                const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
            sectionClosingHapticFeedback: SectionHapticFeedback.light,
            children: [
              AccordionSection(
                isOpen: true,
                contentVerticalPadding: 20,
                leftIcon:
                    const Icon(Icons.text_fields_rounded, color: Colors.white),
                header: const Text(''),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'POINTS TYPE',
                          style: TextStyle(
                            fontWeight: FontWeight.bold, // Make text bold
                          ),
                        ),
                        Text(
                          'POINTS',
                          style: TextStyle(
                            fontWeight: FontWeight.bold, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Captain',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '2x',
                          style: TextStyle(
                            color: Colors.green, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Vice-captain',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '1.5x',
                          style: TextStyle(
                            color: Colors.green, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'in announced Lineups',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '4',
                          style: TextStyle(
                            color: Colors.green, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Paying Substitute(concussion,)',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '4',
                          style: TextStyle(
                            color: Colors.green, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Economic Rate Points',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '(Min 5 overs)',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Below 2.5 runs per over',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '6',
                          style: TextStyle(
                            color: Colors.green, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'between 2.5-3.9 run per over',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '4',
                          style: TextStyle(
                            color: Colors.green, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'between 3.5-4.5 runs per over',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '2',
                          style: TextStyle(
                            color: Colors.green, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'between 4.51-6.99 runs per over',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '0',
                          style: TextStyle(
                            color: Colors.green, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'between 7-8 runs per over',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '- 2',
                          style: TextStyle(
                            color: Colors.red, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'between 8.01-9 runs per over',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '- 4',
                          style: TextStyle(
                            color: Colors.red, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Above 9 Runs per over',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '- 6 ',
                          style: TextStyle(
                            color: Colors.red, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Strike Rate',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,

                            /// Make text bold
                          ),
                        ),
                        Text(
                          '(Min 20 Balls to be played)',
                          style: TextStyle(
                            color: Colors.black, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Above 140 runs per 100 balls',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '6',
                          style: TextStyle(
                            color: Colors.green, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'between 120.101-140 run/100 ball',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '4',
                          style: TextStyle(
                            color: Colors.green, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'between 100-120 runs /100 balls',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '2',
                          style: TextStyle(
                            color: Colors.green, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'between 50.01-100 runs/100 balls',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '0',
                          style: TextStyle(
                            color: Colors.green, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'between 40-50 runs/100 balls',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '- 2',
                          style: TextStyle(
                            color: Colors.red, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'between 30-39.99 runs/100 balls',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '- 4',
                          style: TextStyle(
                            color: Colors.red, // Make text bold
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0), // Add some space between the rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Below 30 runs per 100 balls',
                          style: TextStyle(
                              // Make text bold
                              ),
                        ),
                        Text(
                          '-6',
                          style: TextStyle(
                            color: Colors.red, // Make text bold
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Add more AccordionSection as needed
            ],
          ),
      ],
    );
  }
}
