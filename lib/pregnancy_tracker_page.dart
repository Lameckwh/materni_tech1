import 'package:flutter/material.dart';

class PregnancyTrackerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 242, 242, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 176, 255, 1),
        toolbarHeight: 80,
        elevation: 1,
        title: const Text(
          'Pregnancy Tracking',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              children: [
                Card(
                  color: const Color.fromRGBO(142, 157, 234, 1),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Pregnancy Status',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'WEEK 2 Day 3(17)',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: LinearProgressIndicator(
                            value: 0.1, // Adjust the value to set progress
                            minHeight: 15,
                            backgroundColor: Colors.grey[300],
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.green),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        '263 days left (20.04.2024)',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Color.fromRGBO(0, 176, 255, 1),
                      ),
                    ),
                    const Text(
                      "Week 6",
                      style: TextStyle(
                        fontSize: 19,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Color.fromRGBO(0, 176, 255, 1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        15), // Adjust the radius as needed
                  ),
                  color: const Color.fromRGBO(0, 176, 255, 1),
                  child: Container(
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const StadiumBorder(),
                            // Set the background color here
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Mother",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 19,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Baby",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 19,
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Advice",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 19,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: 180.0, // Set the desired width
                  height: 180.0, // Set the desired height
                  child: Image.asset("images/baby_stage.png"),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non risus eget orci ornare rhoncus sit amet quis justo",
                  style: TextStyle(fontSize: 19),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
