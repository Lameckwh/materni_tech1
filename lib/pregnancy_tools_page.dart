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
              padding: EdgeInsets.all(12.w),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "First trimester",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            // Inside your SingleChildScrollView for the first trimester tools
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 15.w),
              scrollDirection: Axis.horizontal, // Enable horizontal scrolling
              child: Row(
                children: List.generate(firstTrimester.length, (index) {
                  final tool = firstTrimester[index];
                  return SizedBox(
                    width: 160.w,
                    height: 160.h,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 3.w,
                      ),
                      child: InkWell(
                        onTap: () {
                          _navigateToToolDetails(context, tool);
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              12.w,
                            ), // Adjust the radius as needed
                          ),
                          elevation: 2,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 20.h,
                              left: 10.w,
                              bottom: 10.h,
                              right: 10.w,
                            ),
                            child: Column(
                              children: [
                                Image(
                                  width: 70.w,
                                  height: 70.h,
                                  image: AssetImage(tool.imageAsset),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                SizedBox(
                                  height: 45.h,
                                  child: Text(
                                    tool.name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14.sp,
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

            Padding(
              padding: EdgeInsets.all(12.w),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Second Trimester",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 15.w),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(secondTrimester.length, (index) {
                  final tool = secondTrimester[index];
                  return SizedBox(
                    width: 160.w,
                    height: 160.h,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 3.w,
                      ),
                      child: InkWell(
                        onTap: () {
                          _navigateToToolDetails(context, tool);
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              12.w,
                            ),
                          ),
                          elevation: 2,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 20.h,
                              left: 10.w,
                              bottom: 10.h,
                              right: 10.w,
                            ),
                            child: Column(
                              children: [
                                Image(
                                  width: 70.w,
                                  height: 70.h,
                                  image: AssetImage(tool.imageAsset),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                SizedBox(
                                  height: 45.h,
                                  child: Text(
                                    tool.name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14.sp,
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

            Padding(
              padding: EdgeInsets.all(12.w),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Third Trimester",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 15.w),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(thirdTrimester.length, (index) {
                  final tool = thirdTrimester[index];
                  return SizedBox(
                    width: 160.w,
                    height: 160.h,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 3.w,
                      ),
                      child: InkWell(
                        onTap: () {
                          _navigateToToolDetails(context, tool);
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              12.w,
                            ),
                          ),
                          elevation: 2,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 20.h,
                              left: 10.w,
                              bottom: 10.h,
                              right: 10.w,
                            ),
                            child: Column(
                              children: [
                                Image(
                                  width: 70.w,
                                  height: 70.h,
                                  image: AssetImage(tool.imageAsset),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                SizedBox(
                                  height: 45.h,
                                  child: Text(
                                    tool.name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14.sp,
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
