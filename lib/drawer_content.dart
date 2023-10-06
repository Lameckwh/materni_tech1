import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:materni_tech1/favorite_tips_page.dart';
import 'package:materni_tech1/models/boxes.dart';
import 'calendar_diary/calendar_diary.dart';
// import 'pregnancy_tools.dart';
import 'pregnancy_tools_page.dart';
import 'settings_page.dart';
import 'home_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerContent extends StatefulWidget {
  const DrawerContent({super.key});

  @override
  State<DrawerContent> createState() => _DrawerContentState();
}

class _DrawerContentState extends State<DrawerContent> {
  void _childReset(BuildContext context) {
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
            'Reset Child Information',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Are you sure?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.sp, color: Colors.red),
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
                      color: Colors.green,
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.sp,
                ),
                OutlinedButton(
                  onPressed: () {
                    boxChildInfo.clear(); // Clearing the child information
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    ); // Close the popup
                    // Create the SnackBar
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Color.fromRGBO(0, 0, 0, 0.6),
                        content: Text(
                          'Child Information Reset Ruccessfully',
                        ),
                        duration: Duration(seconds: 3),
                      ),
                    );
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
                    'Confirm',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  void _motherReset(BuildContext context) {
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
            'Reset Mother Information',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Are you sure?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.sp, color: Colors.red),
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
                      color: Colors.green,
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.sp,
                ),
                OutlinedButton(
                  onPressed: () {
                    boxPregnancyInfo.clear(); // Clearing the child information
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    ); // Close the popup
                    // Create the SnackBar
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Color.fromRGBO(0, 0, 0, 0.6),
                        content: Text(
                          'Mother Information Reset Ruccessfully',
                        ),
                        duration: Duration(seconds: 3),
                      ),
                    );
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
                    'Confirm',
                    style: TextStyle(color: Colors.red),
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
    return Drawer(
      width: 310.w,
      backgroundColor: const Color.fromRGBO(246, 242, 242, 1),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/drawer_image.png'),
                        fit: BoxFit.cover,
                      ),
                      border: Border(bottom: BorderSide())),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'MATERNTECH',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.home,
                    size: 30,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  onTap: () {
                    // Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.calendar_today,
                    size: 30,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Calendar and Diary',
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  onTap: () {
                    // Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CalendarDiary()));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.toolbox,
                    size: 30,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Pregnancy Tools',
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PregnancyToolsPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.favorite,
                    size: 30,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Favorite Tips',
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FavoriteTipsPage(),
                      ),
                    );
                  },
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.settings,
                    size: 30,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    // Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsPage()));
                  },
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.blue,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.loop,
                  size: 30,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Reset Info:',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _childReset(
                      context,
                    );
                  },
                  child: const Text(
                    'Child',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _motherReset(
                      context,
                    );
                    // Add your onPressed code here
                  },
                  child: const Text(
                    'Mother',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
