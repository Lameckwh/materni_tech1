import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:materni_tech1/diet_tracker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'tips_page.dart';
import 'drawer_content.dart';
import 'pregnancy_tracker_form.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> images = [
    'images/slide_show.png',
    'images/slide_show.png',
    'images/slide_show.png',
  ];

  int currentIndex = 0;

  final List<String> urls = [
    'https://www.pregnancy.com.au/birth/birth-stories/pregnancy-stories/',
    'https://www.tommys.org/pregnancy-information/blogs-and-stories/im-pregnant',
    'https://www.maternityworldwide.org/case-studies-2/',
    'https://www.mirror.co.uk/all-about/pregnancy',
    'https://www.pregnancymagazine.com/'
  ];

  _launchURL() async {
    final random = Random();
    final randomIndex = random.nextInt(urls.length);
    final randomUrl = urls[randomIndex];
    final Uri url = Uri.parse(randomUrl);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch the url');
    }
  }

  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();

    // Start the automatic slideshow
    startSlideshow();
  }

  void startSlideshow() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (currentIndex < images.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }

      _pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  void goToPreviousImage() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
      _pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  void goToNextImage() {
    if (currentIndex < images.length - 1) {
      setState(() {
        currentIndex++;
      });
      _pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 242, 242, 1),
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5.0), // Adjust the radius as needed
            bottomRight: Radius.circular(5.0), // Adjust the radius as needed
          ),
        ),
        toolbarHeight: 80,
        elevation: 1,
        backgroundColor: Colors.blue,
        title: const Text(
          "Home",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      drawer: DrawerContent(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 60),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              Stack(
                children: <Widget>[
                  Container(
                    height: 200.0,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          images[index],
                          fit: BoxFit.cover,
                        );
                      },
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  ),
                  Positioned(
                    top: 20,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            size: 30,
                            weight: 400,
                            color: Color.fromRGBO(0, 176, 255, 1),
                          ),
                          onPressed: goToPreviousImage,
                          color: Colors.white,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            size: 30,
                            weight: 400,
                            color: Color.fromRGBO(0, 176, 255, 1),
                          ),
                          onPressed: goToNextImage,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 200, // Set a fixed height for the containers
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DietTrackerPage()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/diet_tracker.png', // Replace with your image path
                                width: 90, // Adjust width as needed
                                height: 90, // Adjust height as needed
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Diet',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                              ),
                              const Text(
                                'Tracker',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 35),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PregnancyTrackerForm()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/pregnancy_tracker.png', // Replace with your image path
                                width: 80, // Adjust width as needed
                                height: 80, // Adjust height as needed
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Pregnancy',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                              ),
                              const Text(
                                'Tracker',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              Container(
                height: 200, // Set a fixed height for the containers
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: _launchURL,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/magazine.png', // Replace with your image path
                                width: 90, // Adjust width as needed
                                height: 90, // Adjust height as needed
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Magazine &',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                              ),
                              const Text(
                                'Stories',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 35),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TipPage()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/tips.png', // Replace with your image path
                                width: 90, // Adjust width as needed
                                height: 90, // Adjust height as needed
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Tips',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                              ),
                            ],
                          ),
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
    );
  }
}
