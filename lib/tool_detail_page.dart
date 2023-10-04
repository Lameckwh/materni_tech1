import 'package:flutter/material.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Image(
              width: 150,
              height: 150,
              image: AssetImage(tool.imageAsset),
            ),
            const SizedBox(height: 20),
            Text(
              tool.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              tool.description,
              // textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
