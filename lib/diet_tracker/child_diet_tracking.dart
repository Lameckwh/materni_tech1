import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:materni_tech1/diet_tracker/child_diet.dart';
import 'package:materni_tech1/home_page.dart';
import 'package:materni_tech1/models/boxes.dart';
import 'package:materni_tech1/models/child_info.dart';

class ChildDietTracking extends StatefulWidget {
  const ChildDietTracking({Key? key}) : super(key: key);

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
    // Create a timer that triggers every 24 hours
    timer = Timer.periodic(const Duration(hours: 24), (timer) {
      setState(() {
        // Increment the tip index to display the next tip
        currentTipIndex = (currentTipIndex + 1) % tips.length;
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
                    // ignore: sized_box_for_whitespace
                    Container(
                      height: 150.sp,
                      width: 150.sp,
                      child: Image.asset(
                        childDiet[currentIndex].image,
                      ),
                    ),
                    SizedBox(height: 20.h), // 2% of screen height

                    Container(
                      margin:
                          const EdgeInsets.only(left: 11, right: 11, top: 11),
                      // height: 25,
                      child: Card(
                        elevation: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
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
                      margin: const EdgeInsets.all(7),
                      child: Card(
                        elevation: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
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
                              Text(
                                """Avoid these foods, which could be swallowed whole and block the windpipe:
Hot dogs (unless cut in quarters lengthwise before being sliced)

Chunks of peanut butter (Peanut butter may be spread thinly on bread or a cracker, but never give chunks of peanut butter to a toddler.)

Nuts—especially peanuts

Raw cherries with pits

Round, hard candies—including jelly beans

Gum

Whole grapes

Marshmallows

Raw carrots, celery, green beans

Popcorn

Seeds—such as processed pumpkin or sunflower seeds

Whole grapes, cherry tomatoes (cut them in quarters)

Large chunks of any food such as meat, potatoes, or raw vegetables and fruits

""",
                                style: TextStyle(fontSize: 15.sp),
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
              padding:
                  const EdgeInsets.all(16), // Padding based on screen width
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

  Widget buildCard(
      String title, String date, String content, double cardHeight) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        child: Container(
          width: double.infinity,
          height: cardHeight,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(date,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 5),
              Text(content),
            ],
          ),
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
