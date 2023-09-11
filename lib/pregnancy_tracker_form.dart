import 'package:flutter/material.dart';
import 'package:materni_tech1/pregnancy_tracker_page.dart';

class PregnancyTrackerForm extends StatefulWidget {
  @override
  State<PregnancyTrackerForm> createState() => _PregnancyTrackerFormState();
}

class _PregnancyTrackerFormState extends State<PregnancyTrackerForm> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 30, 20, 30),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Text(
                    'Provide your pregnancy information',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 176, 255, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Set the border radius here
                      ),
                      color: const Color.fromRGBO(238, 238, 238, 1),
                      child: InkWell(
                        onTap: () => _selectDate(context),
                        child: InputDecorator(
                          decoration: const InputDecoration(
                            labelText: 'Last day of period',
                            prefixIcon: Icon(
                              color: Color.fromRGBO(0, 176, 255, 1),
                              Icons.calendar_today,
                            ), // Leading calendar icon
                            suffixIcon: Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromRGBO(0, 176, 255, 1),
                            ), // Trailing forward arrow icon
                            border: InputBorder.none,
                          ),
                          child: Text(
                            "${selectedDate.toLocal()}".split(' ')[0],
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(0, 0, 0, .5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Set the border radius here
                      ),
                      color: const Color.fromRGBO(238, 238, 238, 1),
                      child: InkWell(
                        onTap: () => _selectDate(context),
                        child: InputDecorator(
                          decoration: const InputDecoration(
                            labelText: 'Last day of period',
                            prefixIcon: Icon(
                              color: Color.fromRGBO(0, 176, 255, 1),
                              Icons.calendar_today,
                            ), // Leading calendar icon
                            suffixIcon: Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromRGBO(0, 176, 255, 1),
                            ), // Trailing forward arrow icon
                            border: InputBorder.none,
                          ),
                          child: Text(
                            "${selectedDate.toLocal()}".split(' ')[0],
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(0, 0, 0, .5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Set the border radius here
                      ),
                      color: const Color.fromRGBO(238, 238, 238, 1),
                      child: InkWell(
                        onTap: () => _selectDate(context),
                        child: InputDecorator(
                          decoration: const InputDecoration(
                            labelText: 'Last day of period',
                            prefixIcon: Icon(
                              color: Color.fromRGBO(0, 176, 255, 1),
                              Icons.calendar_today,
                            ), // Leading calendar icon
                            suffixIcon: Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromRGBO(0, 176, 255, 1),
                            ), // Trailing forward arrow icon
                            border: InputBorder.none,
                          ),
                          child: Text(
                            "${selectedDate.toLocal()}".split(' ')[0],
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(0, 0, 0, .5),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PregnancyTrackerPage()),
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
