import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:materni_tech1/diet_tracker/child_diet_tracking.dart';
import 'package:materni_tech1/models/boxes.dart';
import 'package:materni_tech1/models/child_info.dart';

class ChildDietForm extends StatefulWidget {
  const ChildDietForm({super.key});

  @override
  State<ChildDietForm> createState() => _ChildDietFormState();
}

class _ChildDietFormState extends State<ChildDietForm> {
  DateTime? selectedDate = DateTime.now();
  int days = 0;
  int months = 0;
  int years = 0;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();

    // Calculate the minimum date by subtracting 5 years from the current date
    final DateTime minDate =
        DateTime(currentDate.year - 5, currentDate.month, currentDate.day);

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? currentDate,
      firstDate:
          minDate, // Set the first date to 5 years ago from the current date
      lastDate: currentDate, // Set the last date to today's date
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        // Calculate the age from the selected date
        final today = DateTime.now();
        final difference = today.difference(selectedDate!);

        // Calculate years, months, and days
        final years = difference.inDays ~/ 365;
        final months = (difference.inDays % 365) ~/ 30;
        final days = (difference.inDays % 365) % 30;

        this.days = days;
        this.months = months;
        this.years = years;
      });
    }
  }

  void _dietTracker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(10.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.w),
            side: const BorderSide(color: Colors.blue, width: 2.0),
          ),
          title: Text(
            'Child Age Information',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17.sp),
          ),
          content: Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Days: $days',
                  style: TextStyle(fontSize: 16.sp),
                ),
                SizedBox(height: 20.h),
                Text(
                  'Months: $months',
                  style: TextStyle(fontSize: 16.sp),
                ),
                SizedBox(height: 20.h),
                Text(
                  'Years: $years',
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
                      borderRadius: BorderRadius.circular(20.w),
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
                  width: 10.w,
                ),
                OutlinedButton(
                  onPressed: () {
                    const customKey =
                        "child124"; // Custom key based on the user's username
                    final dateOfBirth = selectedDate!;
                    boxChildInfo.put(
                      customKey,
                      ChildInfo(
                        days: days,
                        months: months,
                        years: years,
                        dateOfBirth: dateOfBirth,
                      ),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChildDietTracking(),
                      ),
                    ); // Close the popup
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.w),
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
        // toolbarHeight: 100,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, // Change this color to your desired color
        ),
        backgroundColor: const Color.fromRGBO(246, 242, 242, 1),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            width: 140.w,
            height: 140.h,
            image: const AssetImage('images/baby_girl.png'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              padding: EdgeInsets.fromLTRB(10.w, 30.h, 20.w, 30.h),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(10.w),
              ),
              child: Text(
                "Provide Child's Birth Information",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color.fromRGBO(0, 176, 255, 1),
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(height: 30.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Set the border radius here
                  ),
                  color: const Color.fromRGBO(238, 238, 238, 1),
                  child: InkWell(
                    onTap: () => _selectDate(context),
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                        labelText: 'Date of birth',
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
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: const Color.fromRGBO(0, 0, 0, .5),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 60.h),
          ElevatedButton(
            onPressed: () {
              _dietTracker(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(0, 176, 255, 1),
              minimumSize: Size(200.w, 50.h), // Set button width and height
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.w), // Set border radius
              ),
              // Set the background color to orange
            ),
            child: Text(
              'Done',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
