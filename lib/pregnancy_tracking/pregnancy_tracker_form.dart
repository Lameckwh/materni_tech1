import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:materni_tech1/models/boxes.dart';
import 'package:materni_tech1/models/pregnancy_info.dart';
import 'package:materni_tech1/pregnancy_tracking/pregnancy_tracker_page.dart';

class PregnancyTrackerForm extends StatefulWidget {
  const PregnancyTrackerForm({super.key});

  @override
  State<PregnancyTrackerForm> createState() => _PregnancyTrackerFormState();
}

class _PregnancyTrackerFormState extends State<PregnancyTrackerForm> {
  DateTime? selectedDate = DateTime.now();
  int pregnancyDays = 0;
  int pregnancyWeeks = 0;
  String expectedDeliveryDate = "";

  void calculatePregnancy() {
    if (selectedDate != null) {
      // Assuming a 280-day pregnancy duration (40 weeks)
      const pregnancyDuration = Duration(days: 280);
      final lastPeriodDate = selectedDate!;
      final expectedDelivery = lastPeriodDate.add(pregnancyDuration);

      // Calculate the number of days and weeks
      final today = DateTime.now();
      final difference = today.difference(lastPeriodDate);
      setState(() {
        pregnancyDays = difference.inDays;
        pregnancyWeeks = (difference.inDays / 7).floor();
        expectedDeliveryDate =
            "${expectedDelivery.year}-${expectedDelivery.month.toString().padLeft(2, '0')}-${expectedDelivery.day.toString().padLeft(2, '0')}";
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();

    // Calculate the minimum date by subtracting 280 days from the current date
    final DateTime minDate = currentDate.subtract(const Duration(days: 280));

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? currentDate,
      firstDate:
          minDate, // Set the first date to 280 days ago from the current date
      lastDate: currentDate, // Set the last date to today's date
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void _dietTracker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
            side: const BorderSide(color: Colors.blue, width: 2.0),
          ),
          title: const Text(
            'Pregnancy Information',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Pregnancy Days: $pregnancyDays',
                  style: TextStyle(fontSize: 16.sp),
                ),
                SizedBox(height: 20.h),
                Text(
                  'Pregnancy Weeks: $pregnancyWeeks',
                  style: TextStyle(fontSize: 16.sp),
                ),
                SizedBox(height: 20.h),
                Text(
                  'Expected Delivery Date: $expectedDeliveryDate',
                  style: TextStyle(fontSize: 16.sp),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the popup
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    side: const BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.sp,
                ),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      const customKey =
                          "user123"; // Custom key based on the user's username
                      final expectedDeliveryDateTime =
                          DateTime.parse(expectedDeliveryDate);
                      boxPregnancyInfo.put(
                        customKey,
                        PregnancyInfo(
                          days: pregnancyDays.toString(),
                          weeks: pregnancyWeeks,
                          deliveryDate: expectedDeliveryDateTime,
                          lastDateOfPeriod: selectedDate!,
                        ),
                      );
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PregnancyTrackerPage(),
                      ),
                    ); // Close the popup
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    side: const BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  child: const Text(
                    'Proceed',
                  ),
                ),
              ],
            )
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
        toolbarHeight: 100,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, // Change this color to your desired color
        ),
        backgroundColor: const Color.fromRGBO(246, 242, 242, 1),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 30, 20, 30),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Text(
                'Provide Pregnancy Information',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(0, 176, 255, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10.0), // Set the border radius here
              ),
              color: const Color.fromRGBO(238, 238, 238, 1),
              child: InkWell(
                onTap: () => _selectDate(context),
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                    labelText: 'Last day of period',
                    prefixIcon: Icon(
                      color: Color.fromRGBO(0, 176, 255, 1),
                      Icons.calendar_today,
                    ), // Leading calendar icon
                    suffixIcon: Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromRGBO(0, 176, 255, 1),
                    ), // Trailing forward arrow icon
                    border: InputBorder.none,
                  ),
                  child: Text(
                    "${selectedDate?.toLocal()}".split(' ')[0],
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(0, 0, 0, .5),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 60),
          ElevatedButton(
            onPressed: () {
              calculatePregnancy(); // Calculate pregnancy details based on selectedDate
              _dietTracker(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => const PregnancyTrackerPage()),
              // );

              // Navigate to the next screen or perform any action here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(0, 176, 255, 1),
              minimumSize: const Size(200, 50), // Set button width and height
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5), // Set border radius
              ),
              // Set the background color to orange
            ),
            child: const Text(
              'Done',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Ubuntu"),
            ),
          ),
        ],
      ),
    );
  }
}
