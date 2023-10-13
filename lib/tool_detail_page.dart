import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:materni_tech1/pregnancy_tool.dart';

class ToolDetailsPage extends StatelessWidget {
  final PregnancyTool tool;

  const ToolDetailsPage({super.key, required this.tool});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Image(
                  width: 120.w,
                  height: 120.h,
                  image: AssetImage(tool.imageAsset),
                ),
                SizedBox(height: 20.h),
                Text(
                  tool.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  tool.description,
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
