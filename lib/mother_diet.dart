import 'dart:async';

import 'package:flutter/material.dart';

class motherDiet extends StatefulWidget {
  const motherDiet({Key? key}) : super(key: key);

  @override
  State<motherDiet> createState() => _motherDietState();
}

class _motherDietState extends State<motherDiet> {
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
    // Extract the screen dimensions
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double cardHeight =
        screenHeight * 0.2; // For example, 20% of the screen height

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Mother Diet Tracker',
            style: TextStyle(color: Colors.white)),
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
                      margin: const EdgeInsets.fromLTRB(
                        0,
                        10,
                        0,
                        10,
                      ),
                      height: 150,
                      width: 150,
                      child: Image.asset(
                        'images/mother_diet.png',
                      ),
                    ),
                    // 2% of screen height
                    // SizedBox(
                    //   height: 20,
                    // ),

                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      height: 250,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Today's Tip",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19),
                                  ),
                                  Text(
                                    formattedDate,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
                                      color: Color.fromRGBO(30, 211, 48, 1),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                tips[currentTipIndex],
                                style: const TextStyle(fontSize: 19),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      height: 250,
                      child: const Card(
                        child: Padding(
                          padding: EdgeInsets.all(11.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Lorem Ipsum",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 19),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non risus eget orci ornare rhoncus sit amet quis justo.""",
                                style: TextStyle(fontSize: 19),
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
              padding: EdgeInsets.all(
                  screenWidth * 0.02), // Padding based on screen width
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {},
                  ),
                  const Text('Week 2'),
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
