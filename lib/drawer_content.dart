import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'calendar_diary/calendar_diary.dart';
// import 'pregnancy_tools.dart';
import 'pregnancy_tools_page.dart';
import 'settings_page.dart';
import 'home_page.dart';

class DrawerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(246, 242, 242, 1),
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/drawer_image.png'),
                fit: BoxFit.cover,
              ),
            ),
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
          const Divider(
            color: Colors.grey,
            thickness: 2,
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
            title: const Text(
              'Home',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.calendar_today,
              size: 30,
              color: Colors.black,
            ),
            title: Text(
              'Calendar',
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => CalendarDiary()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.pregnant_woman,
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
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const PregnancyToolsPage(),
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
              Navigator.pop(context);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
        ],
      ),
    );
  }
}
