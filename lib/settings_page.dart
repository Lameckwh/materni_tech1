import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:materni_tech1/models/boxes.dart';
import 'package:materni_tech1/pregnancy_info_update_form.dart';
import 'package:materni_tech1/pregnancy_tracking/pregnancy_tracker_form.dart';
import 'package:url_launcher/url_launcher.dart';
import 'drawer_content.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = false;
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate2 = DateTime.now();

  void _rateUs(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(20.0),
          content: const Text(
              "We worked really hard on this! You can make us so happy if you rated it 5 stars: D. Thank you!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the popup
              },
              child: const Text('CLOSE'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the popup
              },
              child: const Text('RATE 5 STARS'),
            ),
          ],
        );
      },
    );
  }

  void _notifications(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(20.0),
          title: const Text('Notifications'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Today's tip"),
                  Switch(
                    value: notificationsEnabled,
                    onChanged: (value) {
                      setState(() {
                        notificationsEnabled = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Pregnancy Tracking"),
                  Switch(
                    value: notificationsEnabled,
                    onChanged: (value) {
                      setState(() {
                        notificationsEnabled = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the popup
              },
              child: const Text('Close'),
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
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: const Color.fromRGBO(0, 176, 255, 1),
        toolbarHeight: 70.h,
      ),
      drawer: const DrawerContent(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Determine the screen width
          // double screenWidth = constraints.maxWidth;
          // You can use screenWidth to adjust the UI elements as needed

          return Padding(
            padding: EdgeInsets.all(8.w),
            child: ListView(
              children: [
                Card(
                  elevation: 2,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.w, top: 10.h),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Personalization",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: const Color.fromRGBO(0, 176, 255, 1),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        trailing: const Icon(Icons.arrow_forward_ios),
                        title: const Text("Update Pregnancy Information"),
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
                                      const PregnancyInfoUpdateForm()),
                            );
                          }
                        },
                      ),
                      ListTile(
                        onTap: () {
                          _notifications(
                            context,
                          );
                        },
                        trailing: const Icon(Icons.arrow_forward_ios),
                        title: const Text("Notifications"),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 2,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.w, top: 10.h),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "FeedBack",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: const Color.fromRGBO(0, 176, 255, 1),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        trailing: const Icon(Icons.arrow_forward_ios),
                        title: const Text("Send FeedBack"),
                        onTap: () async {
                          String email =
                              Uri.encodeComponent("bit-032-19@must.ac.mw");
                          String subject =
                              Uri.encodeComponent("MaterniTech FeedBack ");
                          String body = Uri.encodeComponent("Hi, I am .....");
                          Uri mail = Uri.parse(
                              "mailto:$email?subject=$subject&body=$body");
                          if (await launchUrl(mail)) {
                            // Email app opened
                          } else {
                            // Email app is not opened
                          }
                        },
                      ),
                      ListTile(
                        trailing: const Icon(Icons.arrow_forward_ios),
                        title: const Text("Rate Us"),
                        onTap: () {
                          _rateUs(
                            context,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
