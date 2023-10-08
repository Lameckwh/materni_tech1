import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:materni_tech1/favorite_tips_page.dart';
import 'package:materni_tech1/models/boxes.dart';
import 'package:materni_tech1/models/favorite_tip.dart';
import 'package:materni_tech1/tips.dart';
import 'package:share/share.dart';

class TipPage extends StatefulWidget {
  const TipPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TipPageState createState() => _TipPageState();
}

class _TipPageState extends State<TipPage> {
  int currentIndex = 0;

  void goToNextTip() {
    if (currentIndex < tips.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void goToPreviousTip() {
    if ((currentIndex > 0)) {
      setState(() {
        currentIndex--;
      });
    }
  }

  bool isFavorite(Tip tip) {
    // Check if the tip is in the favorites box
    var favoriteTips = boxFavoriteTip.values.toList();
    return favoriteTips.any((favoriteTip) => favoriteTip.title == tip.title);
  }

  void toggleFavorite(Tip tip) {
    var favoriteTipKey = boxFavoriteTip.keys.firstWhere(
      (key) {
        var favoriteTip = boxFavoriteTip.get(key) as FavoriteTip?;
        return favoriteTip != null && favoriteTip.title == tip.title;
      },
      orElse: () => null,
    );

    if (favoriteTipKey != null) {
      // If a favorite tip with the same title is found, remove it
      boxFavoriteTip.delete(favoriteTipKey);

      // Show a Snackbar with the message "Removed from favorite tips"
      const snackBar = SnackBar(
        content: Text('Removed from favorite tips'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      // Otherwise, add the tip to favorites
      boxFavoriteTip.add(FavoriteTip(tip.title, tip.description));

      // Show a Snackbar with the message "Added to favorite tips" and a "View" button
      final snackBar = SnackBar(
        content: const Text('Added to favorite tips'),
        action: SnackBarAction(
          label: 'View',
          onPressed: () {
            // Navigate to the favorite tips page when the "View" button is clicked
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FavoriteTipsPage(),
              ),
            );
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    // Force a rebuild of the widget to update the favorite icon
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tips',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(0, 176, 255, 1),
        toolbarHeight: 55.h,
        elevation: 1,
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 226, 226, 226),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.white,
                  elevation: 4.0,
                  margin: EdgeInsets.all(screenWidth * 0.02),
                  child: CustomPaint(
                    painter: BottomCornersPainter(),
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          Text(
                            tips[currentIndex].title,
                            style: TextStyle(
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            tips[currentIndex].description,
                            style: TextStyle(fontSize: screenWidth * 0.037),
                          ),
                          const SizedBox(height: 16.0),
                          ButtonBar(
                            alignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                iconSize: screenWidth * 0.1,
                                icon: Icon(
                                  isFavorite(tips[currentIndex])
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isFavorite(tips[currentIndex])
                                      ? Colors.red
                                      : null,
                                ),
                                onPressed: () =>
                                    toggleFavorite(tips[currentIndex]),
                              ),
                              IconButton(
                                iconSize: screenWidth * 0.1,
                                icon: const Icon(Icons.share),
                                onPressed: () {
                                  final String text = '${tips[currentIndex].title}\n${tips[currentIndex].description}';
    Share.share(text, subject: 'Check out this tip!');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: currentIndex > 0 ? goToPreviousTip : null,
                    child: const Text('Back'),
                  ),
                  ElevatedButton(
                    onPressed:
                        currentIndex < tips.length - 1 ? goToNextTip : null,
                    child: const Text('Next'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomCornersPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.lightBlue
      ..style = PaintingStyle.fill;

    // Draw bottom left corner
    final bottomLeftPath = Path()
      ..moveTo(0, size.height)
      ..lineTo(50, size.height)
      ..quadraticBezierTo(0, size.height, 0, size.height - 50)
      ..close();
    canvas.drawPath(bottomLeftPath, paint);

    // Draw bottom right corner
    final bottomRightPath = Path()
      ..moveTo(size.width, size.height)
      ..lineTo(size.width - 50, size.height)
      ..quadraticBezierTo(size.width, size.height, size.width, size.height - 50)
      ..close();
    canvas.drawPath(bottomRightPath, paint);

    // Draw the entire top part of the card
    final topPartPath = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, 20)
      ..lineTo(0, 20)
      ..close();
    canvas.drawPath(topPartPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
