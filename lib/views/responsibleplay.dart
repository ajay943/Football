import 'package:flutter/material.dart';

class ResponsiblePlayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsible Play'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Your banner widget here
            Container(
              height: 200.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/slider1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Your responsible play content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'RESPONSIBLE PLAY',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),

                  Center(
                    child: Text(
                      ' POLICY',
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Crickpe is the ultimate cricket fantasy gaming'
                    'App that lets you play online cricket and win'
                    'rewards. We always have our users’ best'
                    'interests in mind and our Responsible Play Policy'
                    'aims to promote responsible gaming practices'
                    'while ensuring that the platform remains a skill-'
                    'based, legal, and well-managed experience.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),
                  // Additional content within a Card
                  Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ensuring a Safe and Secure Gaming Experience',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 18.0),
                          Text(
                            'Users safety and security are vital to us.'
                            'Certain measures have been adopted to'
                            ' ensure each player financial security'
                            ' while playing on cricket. We have set a'
                            'transaction limit where users can add up.'
                            'to ₹25,000 in a single transaction to their'
                            ' Cricket account ',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 18.0),
                          // Add more content as needed
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 18.0),
                  Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Promoting Skill-Based Gameplay',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Our gaming app is designed to be entirely skill-based.'
                            'where success is determined by your knowledge of the game.'
                            'and your strategic decisions. We encourage users to'
                            'improve their cricket knowledge and'
                            'analytical skills to enhance their gameplay experience.',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 8.0),
                          // Add more content as needed
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 18.0),
                  Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Compliance with Applicable Laws',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'OOur platform operates within the bounds'
                            'of local laws and regulations related to'
                            'online gaming and are not available to'
                            'those under the age of 18 or from Assam,'
                            'Andhra Pradesh, Odisha, Telangana,'
                            'Nagaland, or Sikkim.',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 8.0),
                          // Add more content as needed
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 18.0),
                  Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Time and Money Management Skills',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'We encourage users to exercise'
                            'responsible time and money'
                            'management while using our app. Set'
                            'limits on the time you spend on gaming'
                            'and establish budgets to prevent'
                            'excessive spending. Remember,'
                            'responsible gaming is about enjoyment'
                            'and entertainment, not excessive financial'
                            'strain. ',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 8.0),
                          // Add more content as needed
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 18.0),
                  Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Not a Regular Source of Income',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'While winning in our fantasy gaming app'
                            'is possible through skillful gameplay, it is'
                            'important to note that this is not a'
                            'guaranteed source of income. Users'
                            'should view the platform as a form of'
                            'entertainment rather than a means to'
                            'generate regular earnings.',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 8.0),
                          // Add more content as needed
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 18.0),
                  Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Making Decisions Wisely',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Every decision you make in the game has'
                            'an impact on your gameplay experience.'
                            'We encourage users to make thoughtful'
                            'and informed decisions, focusing on the'
                            'strategic aspect of the game rather than'
                            'solely aiming for financial gains. ',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 8.0),
                          // Add more content as needed
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
