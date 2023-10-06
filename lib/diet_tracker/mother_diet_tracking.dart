import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:materni_tech1/diet_tracker/mother_dirt.dart';
import 'package:materni_tech1/home_page.dart';
import 'package:materni_tech1/models/boxes.dart';
import 'package:materni_tech1/models/pregnancy_info.dart';

class MotherDietTracking extends StatefulWidget {
  const MotherDietTracking({super.key});

  @override
  State<MotherDietTracking> createState() => _MotherDietTrackingState();
}

class _MotherDietTrackingState extends State<MotherDietTracking> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    // Initialize currentIndex with the pregnancy weeks from the Hive box
    final PregnancyInfo? pregnancyInfo = boxPregnancyInfo.values.isNotEmpty
        ? boxPregnancyInfo.values.first
        : null;

    if (pregnancyInfo != null) {
      currentIndex = pregnancyInfo.weeks;
    }

    startTimer();
  }

  void goToNextWeek() {
    if (currentIndex < motherDiet.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void goToPreviousWeek() {
    if ((currentIndex > 0)) {
      setState(() {
        currentIndex--;
      });
    }
  }

  final List<String> tips = [
    "During pregnancy, aim for regular prenatal check-ups to monitor your health and your baby's development. It's essential for a healthy pregnancy.",
    "Stay physically active during pregnancy, but consult your healthcare provider for safe exercise recommendations.",
    "Get plenty of rest and manage stress during pregnancy. Both are crucial for your well-being and your baby's development.",
    "Take your prenatal vitamins as prescribed by your doctor. They help fill nutritional gaps during pregnancy.",
    "Stay hydrated. Drink plenty of water throughout your pregnancy to support your body's changing needs.",
    "Learn about childbirth and discuss your birth plan with your healthcare provider. Being informed helps reduce anxiety.",
    "Avoid smoking, alcohol, and recreational drugs during pregnancy. They can harm your baby's health",
    "Stay hydrated. Drink plenty of water throughout your pregnancy to support your body's changing needs.",
    // Add more tips here...
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

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final String day = '${now.day}';
    final String month = _getMonthName(now.month);
    final String formattedDate = '$day $month';

    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 242, 242, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 176, 255, 1),
        toolbarHeight: 65.h,
        elevation: 1,
        title: const Text('Mother Diet Tracker',
            style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Extract the screen dimensions
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;

          return Column(
            children: [
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                          0,
                          screenHeight * 0.02,
                          0,
                          screenHeight * 0.02,
                        ),
                        height: screenHeight * 0.2,
                        width: screenHeight * 0.2,
                        child: Image.asset(
                          motherDiet[currentIndex].image,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                          screenWidth * 0.05,
                          0,
                          screenWidth * 0.05,
                          0,
                        ),
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(screenWidth * 0.015),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Today's Tip",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: screenWidth * 0.04,
                                      ),
                                    ),
                                    Text(
                                      formattedDate,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: screenWidth * 0.04,
                                        color: const Color.fromRGBO(
                                            30, 211, 48, 1),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: screenHeight * 0.015,
                                ),
                                Text(
                                  tips[currentTipIndex],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.036,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                          screenWidth * 0.05,
                          0,
                          screenWidth * 0.05,
                          0,
                        ),
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(screenWidth * 0.015),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  motherDiet[currentIndex].title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.036,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.015,
                                ),
                                Text(
                                  motherDiet[currentIndex].description,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.036,
                                  ),
                                )
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
                padding: EdgeInsets.all(screenWidth * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: currentIndex > 0 ? goToPreviousWeek : null,
                    ),
                    Text(
                      'Week $currentIndex',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: currentIndex < motherDiet.length - 1
                          ? goToNextWeek
                          : null,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
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
