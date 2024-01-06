import 'package:app/phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  late AnimationController _animationController;
  late Animation<double> _animation;

  final List<OnboardingPage> pages = [
    OnboardingPage(
      title: 'Welcome to Funzy',
      subTitle:
          'Ready to start winning? Swipe left to \n learn the basics of the Funzy Games',
      imageUrl: 'assets/onBording1.png',
    ),
    OnboardingPage(
      title: 'Select A Match',
      subTitle:
          'Ready to start winning? Swipe left to \n learn the basics of the Funzy Games',
      imageUrl: 'assets/onBording2.png',
    ),
    OnboardingPage(
      title: 'Join Contests',
      subTitle:
          'Ready to start winning? Swipe left to \n learn the basics of the Funzy Games',
      imageUrl: 'assets/onBording3.png',
    ),
    OnboardingPage(
      title: 'Create Teams',
      subTitle:
          'Ready to start winning? Swipe left to \n learn the basics of the Funzy Games',
      imageUrl: 'assets/onBording4.png',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _pageController.addListener(() {
      _animationController.value = _pageController.page! / (pages.length - 1);
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenUtilInit(
        child: Expanded(
          child: Stack(
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInNewScreen()),
                    );
                  },
                  child: Text('Skip'),
                ),
              ),
              Positioned(
                bottom: 70,
                left: 160,
                child: Container(
                  width: 80,
                  height: 80,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      
                      Transform.scale(
                        scale: 2,
                        child: CircularProgressIndicator(
                          value: _animation.value,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          strokeWidth: 4,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_pageController.page! < pages.length - 1) {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                            _animationController.reset();
                            _animationController.forward();
                          } else {
                            // Handle button action when on the last page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInNewScreen()),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(16),
                          primary: const Color(0xFF8443BA),
                        ),
                        child: Icon(Icons.arrow_forward, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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
    return 
    Stack(
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
                colors: [
                  Colors.black,
                  Colors.black,
                  Colors.black54.withOpacity(0.1),
                ],
              ),
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 25),
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
