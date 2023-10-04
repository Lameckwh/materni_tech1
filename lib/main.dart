import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:materni_tech1/models/boxes.dart';
import 'package:materni_tech1/models/child_info.dart';
import 'package:materni_tech1/models/note.dart';
import 'package:materni_tech1/models/pregnancy_info.dart';
import 'home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  // Initializes Hive with a valid directory in your app files
  await Hive.initFlutter();
  // Register Note Adapter
  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(PregnancyInfoAdapter());
  Hive.registerAdapter(ChildInfoAdapter());
  // open box
  boxNotes = await Hive.openBox<Note>("noteBox");
  boxPregnancyInfo = await Hive.openBox<PregnancyInfo>("PregnancyInfoBox");
  boxChildInfo = await Hive.openBox<ChildInfo>("ChildInfoBox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Poppins'),
        debugShowCheckedModeBanner: false,
        home: const GetStartedPage(),
      ),
    );
  }
}

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 176, 255, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.16),
            Image.asset(
              'images/welcome.png',
              width: screenWidth * 0.61,
              height: screenWidth * 0.61,
            ),
            SizedBox(height: screenHeight * 0.05),
            Text(
              "Maternal Health and",
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.065,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Child Nutrition",
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.065,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.09),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(18, 53, 232, 1),
                minimumSize: Size(screenWidth * 0.47, screenHeight * 0.067),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.055,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Ubuntu",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
