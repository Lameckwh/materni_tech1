import 'package:flutter/material.dart';
import 'package:materni_tech1/models/note.dart';
import 'home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
// Initializes Hive with a valid directory in your app files
  await Hive.initFlutter();
// Register Hive Adapter
  Hive.registerAdapter(NoteAdapter());
// open box
  await Hive.openBox("noteBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GetStartedPage(),
      ),
    );
  }
}

class GetStartedPage extends StatelessWidget {
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
                  MaterialPageRoute(builder: (context) => HomePage()),
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
