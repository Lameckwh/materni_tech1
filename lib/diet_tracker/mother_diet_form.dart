import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:materni_tech1/diet_tracker/child_diet.dart';
import 'package:materni_tech1/home_page.dart';
import 'package:materni_tech1/models/boxes.dart';
import 'package:materni_tech1/models/child_info.dart';

class ChildDietTracking extends StatefulWidget {
  const ChildDietTracking({super.key});

  @override
  State<ChildDietTracking> createState() => _ChildDietTrackingState();
}

class _ChildDietTrackingState extends State<ChildDietTracking> {
  final List<String> tips = [
    "Breastfeeding is the best start for your baby. It provides essential nutrients and antibodies for their growth and protection.",
    "Introduce a variety of fruits and vegetables to your child's diet. They provide essential vitamins and minerals for growth",
    "Encourage family meals. Eating together promotes healthy eating habits and family bonding.",
    "Limit sugary drinks and snacks for your child. Opt for water, milk, and healthy snacks like fruits and nuts",
    "Introduce whole grains like whole wheat bread and brown rice. They are rich in fiber and nutrients",
    "Offer lean protein sources like chicken, fish, and beans to support your child's growth and development",
    "Be patient with picky eaters. Offer new foods multiple times and create a positive eating environment",
  ];

  int currentTipIndex = 0;
  late Timer timer;

  @override
  void dispose() {
    // Dispose of the timer when the page is disposed
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    // Calculate the time remaining until midnight
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day + 1);
    final timeUntilMidnight = midnight.difference(now);

    // Create a timer that triggers at midnight and every 24 hours
    timer = Timer.periodic(timeUntilMidnight, (timer) {
      setState(() {
        // Reset the tip index to the first tip at midnight
        currentTipIndex = 0;
      });
    });
  }

  int currentIndex = 0;
  @override
  void initState() {
    super.initState();

    // Initialize currentIndex with the pregnancy weeks from the Hive box
    final ChildInfo? childInfo =
        boxChildInfo.values.isNotEmpty ? boxChildInfo.values.first : null;

    if (childInfo != null) {
      currentIndex = childInfo.years;
    }

    startTimer();
  }

  void goToNextYear() {
    if (currentIndex < childDiet.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void goToPreviousYear() {
    if ((currentIndex > 0)) {
      setState(() {
        currentIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final String day = '${now.day}';
    final String month = _getMonthName(now.month);
    final String formattedDate = '$day $month';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        toolbarHeight: 70.h,
        title: Text(
          'Child Diet Tracker',
          style: TextStyle(
            color: Colors.white,
            fontSize: 19.sp,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
              Icons.arrow_back), // Replace with your custom back icon
          onPressed: () {
            // Navigate to the specified screen
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 226, 226, 226),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 150.w,
                      width: 150.w,
                      child: Image.asset(
                        childDiet[currentIndex].image,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      margin:
                          EdgeInsets.only(left: 11.w, right: 11.w, top: 11.h),
                      child: Card(
                        elevation: 1,
                        child: Padding(
                          padding: EdgeInsets.all(11.w),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Today’s tip",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.sp),
                                  ),
                                  Text(
                                    formattedDate,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.sp,
                                      color:
                                          const Color.fromRGBO(30, 211, 48, 1),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                tips[currentTipIndex],
                                style: TextStyle(fontSize: 15.sp),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(7.w),
                      child: Card(
                        elevation: 1,
                        child: Padding(
                          padding: EdgeInsets.all(11.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                childDiet[currentIndex].title,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                childDiet[currentIndex].description,
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.grey[200],
              padding: EdgeInsets.all(16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: currentIndex > 0 ? goToPreviousYear : null,
                  ),
                  Text(
                    "Year $currentIndex",
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: currentIndex < childDiet.length - 1
                        ? goToNextYear
                        : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}
