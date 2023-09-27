import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:materni_tech1/pregnancy_info_update_form.dart';
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

  void _measurementsUnits(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(20.0),
          title: const Text('Popup Title'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Button 1'),
              ),
              TextButton(
                onPressed: () {
                  // Add logic for the second button here
                },
                child: const Text('Button 2'),
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

  void _rateUs(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(20.0),
          // title: Text('Popup Title'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 242, 242, 1),
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: const Color.fromRGBO(0, 176, 255, 1),
        toolbarHeight: 70,
      ),
      drawer: DrawerContent(
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Card(
              elevation: 2,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 10.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Personalization",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Color.fromRGBO(0, 176, 255, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  ListTile(
                    trailing: const Icon(Icons.arrow_forward_ios),
                    title: const Text("Update Pregnancy Information"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PregnancyInfoUpdateForm(
                                 
                                )),
                      );
                    },
                  ),
                  const Divider(
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  ListTile(
                    trailing: const Icon(Icons.arrow_forward_ios),
                    title: const Text("Measurements Units"),
                    onTap: () {
                      _measurementsUnits(
                        context,
                      );
                    },
                  ),
                  const Divider(
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  ListTile(
                    trailing: Switch(
                      value: notificationsEnabled,
                      onChanged: (value) {
                        setState(() {
                          notificationsEnabled = value;
                        });

                        // You can add code here to handle enabling/disabling notifications.
                        // For example, you can use a plugin like 'flutter_local_notifications'
                        // to schedule and display notifications when notificationsEnabled is true.
                      },
                    ),
                    title: const Text("Notifications"),
                  ),
                  SizedBox(
                    height: 5.h,
                  )
                ],
              ),
            ),
            Card(
              elevation: 2,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 10.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "FeedBack",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Color.fromRGBO(0, 176, 255, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 2,
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
                      // print(subject); //output,: Hello%20Flutter
                      Uri mail = Uri.parse(
                          "mailto:$email?subject=$subject&body=$body");
                      if (await launchUrl(mail)) {
                        //email app opened
                      } else {
                        //email app is not opened
                      }
                    },
                  ),
                  const Divider(
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
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
      ),
    );
  }
}
