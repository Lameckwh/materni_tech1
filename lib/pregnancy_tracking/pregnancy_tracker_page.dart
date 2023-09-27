import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:materni_tech1/home_page.dart';
import 'package:materni_tech1/models/boxes.dart';
import 'package:materni_tech1/models/pregnancy_info.dart';
import 'package:materni_tech1/pregnancy_tracking/advice.dart';
import 'package:materni_tech1/pregnancy_tracking/baby.dart';
import 'package:materni_tech1/pregnancy_tracking/mother.dart';

class Advice {
  final String title;
  final String description;

  Advice(this.title, this.description);
}

class PregnancyTrackerPage extends StatefulWidget {
  const PregnancyTrackerPage({super.key});

  @override
  State<PregnancyTrackerPage> createState() => _PregnancyTrackerPageState();
}

class _PregnancyTrackerPageState extends State<PregnancyTrackerPage> {
  int currentIndex = 0;

  int selectedCategoryIndex = 0; // 0 for Mother, 1 for Child, 2 for Advice
  List<dynamic> currentCategoryData = advice; // Initialize with Mother data
  // Initialize with Mother data
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
  }

  void goToNextWeek() {
    if (currentIndex < mothers.length - 1) {
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

  void switchToCategory(int index) {
    setState(() {
      selectedCategoryIndex = index;
      if (selectedCategoryIndex == 0) {
        currentCategoryData = mothers;
      } else if (selectedCategoryIndex == 1) {
        currentCategoryData = baby;
      } else if (selectedCategoryIndex == 2) {
        currentCategoryData = advice;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final PregnancyInfo? pregnancyInfo = boxPregnancyInfo.values.isNotEmpty
        ? boxPregnancyInfo.values.first
        : null;
    final pregnancyDays =
        today.difference(pregnancyInfo?.lastDateOfPeriod ?? today).inDays;

    String pregnancyStatus = 'N/A';

    if (pregnancyInfo != null) {
      pregnancyStatus = 'Week ${pregnancyInfo.weeks} Day $pregnancyDays';
    }

    DateTime? deliveryDateTime = pregnancyInfo?.deliveryDate;

    final difference = deliveryDateTime?.difference(today);

    final daysLeft =
        difference?.inDays ?? 0; // Calculate the days left for pregnancy

    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 242, 242, 1),
      appBar: AppBar(
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
        backgroundColor: const Color.fromARGB(255, 166, 0, 255),
        toolbarHeight: 55.h,
        elevation: 1,
        title: Text(
          'Pregnancy Tracking',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            left: 15,
            bottom: 15,
            right: 15,
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 15,
                ),
                width: 330.w,
                height: 190.h,
                child: Card(
                  color: const Color.fromRGBO(142, 157, 234, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          'Pregnancy Status',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          pregnancyStatus,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17.sp,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 30,
                            right: 30,
                          ),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: LinearProgressIndicator(
                              value: pregnancyInfo!.weeks / 40,
                              // Adjust the value to set progress
                              minHeight: 12.h,
                              backgroundColor: Colors.grey[300],
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.green),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          '$daysLeft days left (${pregnancyInfo.deliveryDate.toLocal().toString().split(' ')[0]})',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: currentIndex > 0 ? goToPreviousWeek : null,
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color.fromRGBO(142, 157, 234, 1),
                    ),
                  ),
                  Text(
                    'Week $currentIndex',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                  IconButton(
                    onPressed:
                        currentIndex < mothers.length - 1 ? goToNextWeek : null,
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromRGBO(142, 157, 234, 1),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(15), // Adjust the radius as needed
                ),
                color: const Color.fromRGBO(142, 157, 234, 1),
                child: SizedBox(
                  height: 50.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        style: selectedCategoryIndex == 0
                            ? TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                // shape: const StadiumBorder(),
                                // Set the background color here
                              )
                            : TextButton.styleFrom(),
                        onPressed: () {
                          switchToCategory(0);
                          // boxPregnancyInfo.clear();
                        },
                        child: Text(
                          "Mother",
                          style: selectedCategoryIndex == 0
                              ? TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.sp,
                                )
                              : TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                ),
                        ),
                      ),
                      TextButton(
                        style: selectedCategoryIndex == 1
                            ? TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                // shape: const StadiumBorder(),
                                // Set the background color here
                              )
                            : TextButton.styleFrom(),
                        onPressed: () {
                          switchToCategory(1);
                        },
                        child: Text(
                          "Baby",
                          style: selectedCategoryIndex == 1
                              ? TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.sp,
                                )
                              : TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                ),
                        ),
                      ),
                      TextButton(
                          style: selectedCategoryIndex == 2
                              ? TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  // shape: const StadiumBorder(),
                                  // Set the background color here
                                )
                              : TextButton.styleFrom(),
                          onPressed: () {
                            switchToCategory(2);
                          },
                          child: Text(
                            "Advice",
                            style: selectedCategoryIndex == 2
                                ? TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.sp,
                                  )
                                : TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.sp,
                                    color: Colors.white,
                                  ),
                          )),
                    ],
                  ),
                ),
              ),
              selectedCategoryIndex == 1
                  ? Container(
                      margin: const EdgeInsets.only(top: 5),
                      height: 140.h,
                      width: 140.h,
                      child: Image.asset(
                        currentCategoryData[currentIndex].image,
                      ),
                    )
                  : SizedBox(
                      height: 15.h,
                    ),
              Text(
                currentCategoryData[currentIndex].title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                currentCategoryData[currentIndex].description,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 15.sp),
              )
            ],
          ),
        ),
      ),
    );
  }
}
