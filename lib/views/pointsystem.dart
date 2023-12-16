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
                // leftIcon: const Icon(Icons.text_fields_rounded, color: Colors.white),
                header: const Text(
                  'POINTS TYPE',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold, // Make text bold
                  ),
                ),
                content: Text(''),
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
                header: const Text('Simple Text'),
                content: const Text(loremIpsum),
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
                header: const Text('Simple Text'),
                content: const Text(loremIpsum),
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
                header: const Text('Simple Text'),
                content: const Text(loremIpsum),
              ),
              // Add more AccordionSection as needed
            ],
          ),
      ],
    );
  }
}

const String loremIpsum =
    '''Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''';
