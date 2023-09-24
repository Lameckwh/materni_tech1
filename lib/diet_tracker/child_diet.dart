import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChildDiet extends StatefulWidget {
  const ChildDiet({Key? key}) : super(key: key);

  @override
  State<ChildDiet> createState() => _ChildDietState();
}

class _ChildDietState extends State<ChildDiet> {
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
  void initState() {
    super.initState();
    // Start the timer when the page is initialized
    startTimer();
  }

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
          color: Colors.white,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
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
                        'images/chield_diet.png',
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
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp),
                                  ),
                                  Text(
                                    formattedDate,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp,
                                      color:
                                          const Color.fromRGBO(30, 211, 48, 1),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Text(
                                tips[currentTipIndex],
                                style: TextStyle(fontSize: 16.sp),
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
                                "Unsafe foods for toddlers: choking risks",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Text(
                                """At two years old, your child should be able to use a spoon, drink from a cup with just one hand, and feed themselves a wide variety of finger foods. However, they are still learning to chew and swallow efficiently and may gulp food down when in a hurry to get on with playing. For that reason, the risk of choking at this age is high.""",
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
                                style: TextStyle(fontSize: 16.sp),
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
                    onPressed: () {},
                  ),
                  Text('Year 2', style: TextStyle(fontSize: 18.sp)),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () {},
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