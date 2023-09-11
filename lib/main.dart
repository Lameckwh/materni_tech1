import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetStartedPage(),
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
            const SizedBox(height: 110),
            Image.asset(
              'images/welcome.png', // Replace with your image path
              width: 250, // Adjust width as needed
              height: 250, // Adjust height as needed
            ),
            const SizedBox(height: 50),
            const Text(
              "Maternal Health and", // Updated text
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Child Nutrition", // Updated text
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 80),
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
                minimumSize: const Size(200, 50), // Set button width and height
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Set border radius
                ),
                // Set the background color to orange
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
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
