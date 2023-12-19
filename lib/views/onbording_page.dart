import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';
class TestScreen extends StatelessWidget {
  final PageController _pageController = PageController();
  final List<OnboardingPage> pages = [
    OnboardingPage(
      title: 'Welcome to Funzy',
      subTitle: 'Ready to start wining? Swipe left to \n learn the basic of the Funzy Games',
      imageUrl: 'assets/playerimage.png',
    ),
    OnboardingPage(
      title: 'Select A Match',
      subTitle: 'Ready to start wining? Swipe left to \n learn the basic of the Funzy Games',
      imageUrl: 'assets/playerimage.png',
    ),
    OnboardingPage(
      title: 'Join Contests',
      subTitle: 'Ready to start wining? Swipe left to \n learn the basic of the Funzy Games',
      imageUrl: 'assets/playerimage.png',
    ),
    OnboardingPage(
      title: 'Create Teams',
      subTitle: 'Ready to start wining? Swipe left to \n learn the basic of the Funzy Games',
      imageUrl: 'assets/playerimage.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: pages.length,
            itemBuilder: (context, index) {
              return OnboardingPageWidget(
                title: pages[index].title,
                subTitle: pages[index].subTitle,
                imageUrl: pages[index].imageUrl,
              );
            },
            onPageChanged: (index) {
              // Handle page changes
            },
          ),
          Positioned(
            top: 40,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                // Handle skip button tap
              },
              child: Text('Skip'),
            ),
          ),
          Positioned(
            bottom: 70,
            left: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_pageController.page! < pages.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    } else {
                      // Handle button action when on the last page
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(16), // Adjust as needed
                  ),
                  child: Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class OnboardingPage {
  final String title;
  final String subTitle;
  final String imageUrl;
  OnboardingPage({
    required this.title,
    required this.subTitle,
    required this.imageUrl,
  });
}
class OnboardingPageWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imageUrl;
  OnboardingPageWidget({
    required this.title,
    required this.subTitle,
    required this.imageUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.asset(
            imageUrl,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 470,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: 500,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.black, Colors.black54.withOpacity(0.1)],
              ),
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 25), // Adjust as needed
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    subTitle,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}