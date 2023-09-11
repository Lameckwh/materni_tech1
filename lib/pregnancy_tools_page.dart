import 'package:flutter/material.dart';

import 'drawer_content.dart';

class PregnancyToolsPage extends StatelessWidget {
  const PregnancyToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 242, 242, 1),
      appBar: AppBar(
        title: const Text(
          'Pregnancy Tools',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Color.fromRGBO(0, 176, 255, 1),
        toolbarHeight: 100,
      ),
      drawer: DrawerContent(),

      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "First Trimester",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal, // Enable horizontal scrolling
            child: Row(
              children: <Widget>[
                ScrollableCard(
                  title: 'Prenatal Vitamins',
                  imageAsset:
                      'images/pills.png', // Replace with your image path
                ),
                ScrollableCard(
                  title: 'stretch mark prevention',
                  imageAsset:
                      'images/stretch_mark.png', // Replace with your image path
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Second Trimester",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal, // Enable horizontal scrolling
            child: Row(
              children: <Widget>[
                ScrollableCard(
                  title: 'Pregnancy Pillow',
                  imageAsset:
                      'images/pillow.png', // Replace with your image path
                ),
                ScrollableCard(
                  title: 'Maternity bra',
                  imageAsset:
                      'images/maternity_bra.png', // Replace with your image path
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Third Trimester",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal, // Enable horizontal scrolling
            child: Row(
              children: <Widget>[
                ScrollableCard(
                  title: 'Newborn clothes',
                  imageAsset:
                      'images/clothes.png', // Replace with your image path
                ),
                ScrollableCard(
                  title: 'bottle warmer',
                  imageAsset:
                      'images/bottle.png', // Replace with your image path
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ScrollableCard extends StatelessWidget {
  final String title;
  final String imageAsset;

  const ScrollableCard(
      {super.key, required this.title, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 180, // Set a fixed width for each card
      margin: const EdgeInsets.all(8.0), // Add some spacing between cards
      child: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                imageAsset,
                height: 80.0, // Set the height of the image
                width: 120, // Make the image take the full width
                fit: BoxFit.cover, // Adjust how the image fits within the space
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
