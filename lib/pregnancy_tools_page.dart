import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:materni_tech1/pregnancy_tool.dart';
import 'package:materni_tech1/tool_detail_page.dart';

import 'drawer_content.dart';

class PregnancyToolsPage extends StatefulWidget {
  const PregnancyToolsPage({super.key});

  @override
  State<PregnancyToolsPage> createState() => _PregnancyToolsPageState();
}

class _PregnancyToolsPageState extends State<PregnancyToolsPage> {
  void _navigateToToolDetails(BuildContext context, PregnancyTool tool) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ToolDetailsPage(tool: tool),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 242, 242, 1),
      appBar: AppBar(
        title: Text(
          'Pregnancy Tools',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        toolbarHeight: 65.h,
        elevation: 1,
        backgroundColor: const Color.fromRGBO(0, 176, 255, 1),
      ),
      drawer: const DrawerContent(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "First trimester",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: const Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            // Inside your SingleChildScrollView for the first trimester tools
            SingleChildScrollView(
              padding: const EdgeInsets.only(left: 15),
              scrollDirection: Axis.horizontal, // Enable horizontal scrolling
              child: Row(
                children: List.generate(firstTrimester.length, (index) {
                  final tool = firstTrimester[index];
                  return SizedBox(
                    width: 160.w,
                    height: 160.h,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 3.0,
                      ),
                      child: InkWell(
                        onTap: () {
                          _navigateToToolDetails(context, tool);
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              12.0,
                            ), // Adjust the radius as needed
                          ),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 10,
                              bottom: 10,
                              right: 10,
                            ),
                            child: Column(
                              children: [
                                Image(
                                  width: 70,
                                  height: 70,
                                  image: AssetImage(tool.imageAsset),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  height: 45,
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    tool.name,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Second Trimester",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.only(left: 15),
              scrollDirection: Axis.horizontal, // Enable horizontal scrolling
              child: Row(
                children: List.generate(secondTrimester.length, (index) {
                  final tool = secondTrimester[index];
                  return SizedBox(
                    width: 160.w,
                    height: 160.h,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 3.0,
                      ),
                      child: InkWell(
                        onTap: () {
                          _navigateToToolDetails(context, tool);
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              12.0,
                            ), // Adjust the radius as needed
                          ),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 10,
                              bottom: 10,
                              right: 10,
                            ),
                            child: Column(
                              children: [
                                Image(
                                  width: 70,
                                  height: 70,
                                  image: AssetImage(tool.imageAsset),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  height: 45,
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    tool.name,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Third Trimester",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.only(left: 15),
              scrollDirection: Axis.horizontal, // Enable horizontal scrolling
              child: Row(
                children: List.generate(thirdTrimester.length, (index) {
                  final tool = thirdTrimester[index];
                  return SizedBox(
                    width: 160.w,
                    height: 160.h,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 3.0,
                      ),
                      child: InkWell(
                        onTap: () {
                          _navigateToToolDetails(context, tool);
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              12.0,
                            ), // Adjust the radius as needed
                          ),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 10,
                              bottom: 10,
                              right: 10,
                            ),
                            child: Column(
                              children: [
                                Image(
                                  width: 70,
                                  height: 70,
                                  image: AssetImage(tool.imageAsset),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  height: 45,
                                  child: Text(
                                    tool.name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
