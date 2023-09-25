import 'package:flutter/material.dart';
import 'package:materni_tech1/home_page.dart';
import 'package:materni_tech1/models/boxes.dart';
import 'package:materni_tech1/models/pregnancy_info.dart';

class PregnancyTrackerPage extends StatefulWidget {
  const PregnancyTrackerPage({super.key});

  @override
  State<PregnancyTrackerPage> createState() => _PregnancyTrackerPageState();
}

class _PregnancyTrackerPageState extends State<PregnancyTrackerPage> {
  @override
  Widget build(BuildContext context) {
    final PregnancyInfo? pregnancyInfo = boxPregnancyInfo.values.isNotEmpty
        ? boxPregnancyInfo.values.first
        : null;
    String pregnancyStatus =
        'WEEK ${pregnancyInfo?.weeks ?? 'N/A'} Day ${pregnancyInfo?.days ?? 'N/A'}';

    DateTime? formatAndParse(String? dateStr) {
      if (dateStr == null) return null;
      List<String> parts = dateStr.split('-');
      if (parts.length != 3) return null; // Invalid date format

      int year = int.tryParse(parts[0]) ?? 0;
      int month = int.tryParse(parts[1]) ?? 0;
      int day = int.tryParse(parts[2]) ?? 0;

      return DateTime(year, month, day);
    }

    final today = DateTime.now();
    DateTime? deliveryDateTime = formatAndParse(pregnancyInfo?.deliveryDate);
    final difference = deliveryDateTime?.difference(today);
    final daysLeft =
        difference?.inDays ?? 0; // Calculate the days left for pregnancy

    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 242, 242, 1),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
              Icons.arrow_back), // Replace with your custom back icon
          onPressed: () {
            // Navigate to the specified screen
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        backgroundColor: const Color.fromRGBO(0, 176, 255, 1),
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
                    Text(
                      pregnancyStatus,
                      style: const TextStyle(
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
                          valueColor:
                              const AlwaysStoppedAnimation<Color>(Colors.green),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      '$daysLeft days left (${pregnancyInfo?.deliveryDate ?? 'N/A'})',
                      style: const TextStyle(
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
                  Text(
                    'WeeK ${pregnancyInfo?.weeks ?? 'N/A'}',
                    style: const TextStyle(
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
                  borderRadius:
                      BorderRadius.circular(15), // Adjust the radius as needed
                ),
                color: const Color.fromRGBO(0, 176, 255, 1),
                child: SizedBox(
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
              SizedBox(
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
    );
  }
}
