import 'package:flutter/material.dart';

class TipsPage extends StatefulWidget {
  const TipsPage({Key? key}) : super(key: key);

  @override
  State<TipsPage> createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tips',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue,
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 226, 226, 226),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: Colors.white, // Ensure the card's main color is white
                elevation: 4.0,
                margin: EdgeInsets.all(16.0),
                child: CustomPaint(
                  painter: BottomCornersPainter(),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          title: Text(
                            'Lorem Ipsum',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non risus eget orci ornare rhoncus sit amet quis justo.',
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              iconSize: 30.0,
                              icon: Icon(Icons.star),
                              onPressed: () {},
                            ),
                            IconButton(
                              iconSize: 30.0,
                              icon: Icon(Icons.share),
                              onPressed: () {},
                            ),
                            IconButton(
                              iconSize: 30.0,
                              icon: Icon(Icons.bookmark),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    iconSize: 30.0,
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => backPage()),
                      // );
                    },
                  ),
                  IconButton(
                    iconSize: 30.0,
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => forwardPage()),
                      // );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ... [rest of the code remains unchanged]

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

// ... [rest of the code remains unchanged]

