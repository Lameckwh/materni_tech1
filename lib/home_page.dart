import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:materni_tech1/diet_tracker/child_diet_tracking.dart';
import 'package:materni_tech1/diet_tracker/mother_diet_tracking.dart';
import 'package:materni_tech1/models/boxes.dart';
import 'package:materni_tech1/pregnancy_tracking/pregnancy_tracker_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'diet_tracker/child_diet_form.dart';
import 'tips_page.dart';
import 'drawer_content.dart';
import 'pregnancy_tracking/pregnancy_tracker_form.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> images = [
    'images/slideshow/baby.png',
    'images/slideshow/healthy_foods.png',
    'images/slideshow/T-Fitness-Guide.jpeg',
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
        duration: const Duration(milliseconds: 1000),
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
        duration: const Duration(milliseconds: 1000),
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
        duration: const Duration(milliseconds: 1000),
        curve: Curves.ease,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _dietTracker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(10.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.w),
            // You can further customize the shape here
          ),
          title: const Text(
            'Whom to track?',
            textAlign: TextAlign.center,
          ),
          content: Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 15.h),
                SizedBox(
                  height: 30.h,
                  width: 130.w,
                  child: OutlinedButton(
                    onPressed: () {
                      if (boxPregnancyInfo.isEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PregnancyTrackerForm()),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MotherDietTracking()),
                        );
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20.w), // Set the border radius
                      ),
                      side: const BorderSide(
                        color: Color.fromRGBO(
                            0, 176, 255, 1), // Set the border color
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Mother',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: Color.fromRGBO(
                              0, 176, 255, 1), // Set the icon color
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 30.h,
                  width: 110.w,
                  child: OutlinedButton(
                    onPressed: () {
                      if (boxChildInfo.isEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChildDietForm()),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChildDietTracking()),
                        );
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20.w), // Set the border radius
                      ),
                      side: const BorderSide(
                        color: Color.fromRGBO(
                            0, 176, 255, 1), // Set the border color
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Child',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.blue, // Set the icon color
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the popup
              },
              child: const Text(
                'Close',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 242, 242, 1),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5.w), // Adjust the radius as needed
            bottomRight: Radius.circular(5.w), // Adjust the radius as needed
          ),
        ),
        toolbarHeight: 65.h,
        elevation: 1,
        backgroundColor: const Color.fromRGBO(0, 176, 255, 1),
        title: Text(
          "Home",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      drawer: const DrawerContent(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Determine the screen width
          double screenWidth = constraints.maxWidth;
          // You can use screenWidth to adjust the UI elements as needed

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      SizedBox(
                        height: 180.h,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: images.length,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              images[index],
                              fit: BoxFit.cover,
                              width: screenWidth, // Adjust the width
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
                        bottom: 15.h,
                        left: screenWidth * 0.5 - 15.w,
                        child: SmoothPageIndicator(
                          controller: _pageController,
                          count: images.length,
                          effect: ExpandingDotsEffect(
                            expansionFactor: 2,
                            spacing: 8.w,
                            radius: 15.w,
                            dotWidth: 15.w,
                            dotHeight: 15.h,
                            dotColor: Colors.grey,
                            activeDotColor:
                                const Color.fromRGBO(0, 176, 255, 1),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20.h,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              height: 35.h,
                              width: 35.h,
                              margin: EdgeInsets.all(7.w),
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(255, 255, 255, .6),
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  size: 25,
                                  weight: 400,
                                  color: Color.fromRGBO(0, 176, 255, 1),
                                ),
                                onPressed: goToPreviousImage,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              height: 35.h,
                              width: 35.h,
                              margin: EdgeInsets.all(7.w),
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(255, 255, 255, .6),
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 25,
                                  weight: 400,
                                  color: Color.fromRGBO(0, 176, 255, 1),
                                ),
                                onPressed: goToNextImage,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 200.h,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _dietTracker(
                                context,
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.w),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xE1DDDDDD),
                                    blurRadius: 6.0,
                                    spreadRadius: 2.0,
                                    offset: Offset(0.0, 0.0),
                                  )
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'images/home_page/diet_tracker.png',
                                    width: 90.w,
                                    height: 90.h,
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    'Diet',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                  Text(
                                    'Tracker',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (boxPregnancyInfo.isEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PregnancyTrackerForm()),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PregnancyTrackerPage()),
                                );
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.w),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xE1DDDDDD),
                                    blurRadius: 6.0,
                                    spreadRadius: 2.0,
                                    offset: Offset(0.0, 0.0),
                                  )
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'images/home_page/pregnancy_tracker.png',
                                    width: 80.w,
                                    height: 80.h,
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    'Pregnancy',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                  Text(
                                    'Tracker',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.sp,
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
                  SizedBox(height: 15.h),
                  SizedBox(
                    height: 200.h,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: _launchURL,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.w),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xE1DDDDDD),
                                    blurRadius: 6.0,
                                    spreadRadius: 2.0,
                                    offset: Offset(0.0, 0.0),
                                  )
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'images/home_page/magazine.png',
                                    width: 90.w,
                                    height: 90.h,
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    'Magazine &',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                  Text(
                                    'Stories',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const TipPage()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.w),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xE1DDDDDD),
                                    blurRadius: 6.0,
                                    spreadRadius: 2.0,
                                    offset: Offset(0.0, 0.0),
                                  )
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'images/home_page/tips.png',
                                    width: 90.w,
                                    height: 90.h,
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    'Tips',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.sp,
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
          );
        },
      ),
    );
  }
}
