import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:materni_tech1/models/boxes.dart';
import 'package:materni_tech1/models/child_info.dart';
// import 'package:materni_tech1/models/boxes.dart';
import 'package:materni_tech1/models/note.dart';
import 'package:materni_tech1/models/pregnancy_info.dart';
import 'home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hive_flutter /adapters.dart';

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
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 176, 255, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 110.h),
            Image.asset(
              'images/welcome.png', // Replace with your image path
              width: 220.w, // Adjust width as needed
              height: 220.h, // Adjust height as needed
            ),
            SizedBox(height: 50.h),
            Text(
              "Maternal Health and", // Updated text
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Child Nutrition", // Updated text
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 80.h),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );

                // Navigate to the next screen or perform any action here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(18, 53, 232, 1),
                minimumSize: Size(170.w, 50.h), // Set button width and height
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Set border radius
                ),
                // Set the background color to orange
              ),
              child: Text(
                'Get Started',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Ubuntu"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
