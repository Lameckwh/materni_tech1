import 'package:flutter/material.dart';
import 'calendar_page.dart';
// import 'pregnancy_tools.dart';
import 'pregnancy_tools_page.dart';
import 'settings_page.dart';
import 'home_page.dart';

class DrawerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
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
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'MATERNTECH',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
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
          const SizedBox(
            height: 40,
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              size: 35,
              color: Colors.black,
            ),
            title: const Text(
              'Home',
              style: TextStyle(
                fontSize: 20,
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
              size: 35,
              color: Colors.black,
            ),
            title: const Text(
              'Calendar',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => CalendarPage()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.pregnant_woman,
              size: 35,
              color: Colors.black,
            ),
            title: const Text(
              'Pregnancy Tools',
              style: TextStyle(
                fontSize: 20,
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
              size: 35,
              color: Colors.black,
            ),
            title: const Text(
              'Settings',
              style: TextStyle(
                fontSize: 20,
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
