import 'package:flutter/material.dart';
import 'mother_diet.dart';

class MotherDietForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 242, 242, 1),
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, // Change this color to your desired color
        ),
        backgroundColor: const Color.fromRGBO(246, 242, 242, 1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(40, 30, 20, 30),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Provide your pregnancy',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 176, 255, 1),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'information',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 176, 255, 1),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _buildContainer('Last date of period', '12 July 2023'),
                    const SizedBox(height: 20),
                    _buildContainer('Exoected Birth date', '12 March 2024'),
                    const SizedBox(height: 20),
                    _buildContainer('Weight', '0kg'),
                  ],
                ),
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => motherDiet()),
                  );

                  // Navigate to the next screen or perform any action here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(0, 176, 255, 1),
                  minimumSize:
                      const Size(200, 50), // Set button width and height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), // Set border radius
                  ),
                  // Set the background color to orange
                ),
                child: const Text(
                  'Done',
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
      ),
    );
  }

  Widget _buildContainer(String labelText, String date) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3), // Shadow position
          ),
        ],
      ),
      padding: const EdgeInsets.all(10), // Added padding
      height: 90, // Reduced height
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 30,
            child: Center(
              child: Text(
                labelText,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.calendar_today,
                  color: Colors.blue, // Set icon color to blue
                  size: 30, // Increased icon size
                ),
                Text(
                  date,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.black,
                  size: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
