import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:materni_tech1/favorite_tips_page.dart';
import 'package:materni_tech1/models/boxes.dart';
import 'package:materni_tech1/models/favorite_tip.dart';

class Tip {
  final String title;
  final String description;

  Tip(this.title, this.description);
}

final List<Tip> tips = [
  Tip(
    "Take a Prenatal Vitamin",
    """It's smart to start taking prenatal vitamins as soon as you know you're pregnant. In fact, many experts recommend taking them when you start trying to conceive. This is because your baby's neural tube, which becomes the brain and spinal cord, develops within the first month of pregnancy, so it's important you get essential nutrients—like folate, calcium, and iron—from the very start.

Prenatal vitamins are available over the counter at most drug stores, or you can get them by prescription from a doctor. If taking them makes you feel queasy, try taking them at night or with a light snack. Chewing gum or sucking on hard candy afterward can help, too.""",
  ),
  Tip(
    "Exercise",
    """Staying active is important for your general health and can help you reduce stress, improve circulation, and boost your mood. It can also encourage better sleep. Studies have shown that exercise has many benefits to support a healthy pregnancy, including helping to lower the risk of preeclampsia.

Take a pregnancy exercise class or walk at least 15 to 20 minutes a day at a moderate pace—in cool, shaded areas or indoors in order to prevent overheating.

Pilates, yoga, swimming, and walking are also great activities for most pregnant people, but be sure to check with a health care provider before starting any exercise program. Aim for 30 minutes of exercise most days of the week. Listen to your body, though, and don't overdo it.""",
  ),
  Tip(
    "Write a Birth Plan",
    """Determined to have a doula? Counting on that epidural? Write down your wishes and give a copy to everyone involved in your labor and delivery. Here are some things to consider when writing your birth plan:

Who you want present
Procedures you want to avoid
What positions you prefer for labor and delivery
Special clothing you'd like to wear
Whether you want music or a special focal point
Whether you want pain medications and what kind
What to do if complications arise""",
  ),
  Tip(
    "Educate Yourself",
    """Even if this isn't your first baby, attending a childbirth class will help you feel more prepared for delivery. Not only will you have the chance to learn more about childbirth and infant care, but you can also ask specific questions and voice concerns. You'll also become more acquainted with the facility and its staff.

Now is also a good time to brush up on your family's medical history. Talk to your doctor about problems with past pregnancies, and report any family incidences of congenital disorders.""",
  ),
  Tip(
    "Practice Kegels",
    """Kegel exercises strengthen the pelvic floor muscles, which support your bladder, bowels, and uterus. Done correctly, this simple exercise can help make your delivery easier and prevent problems later with incontinence.3

The best part: No one can tell you're doing them—so you can practice Kegels in the car, while you're sitting at your desk, or even standing in line at the grocery store.

Here's how to do them:

1. Practice squeezing as though you're stopping the flow of urine when you use the bathroom.
2. Hold for three seconds, then relax for three.
3. Repeat 10 times for a complete set.""",
  ),
  Tip(
    "Eliminate Toxins",
    """Because of their link to congenital disorders, miscarriage, and other pregnancy complications, you should avoid tobacco, alcohol, illicit drugs, and even solvents such as paint thinners and nail polish remover while pregnant. Smoking cigarettes, for example, decreases oxygen flow to your baby, and it's linked to preterm birth and other complications.4

"If you can't stop smoking, drinking, or using drugs, let your doctor know," recommends Roger Harms, MD, an OB-GYN at the Mayo Clinic. A doctor can offer advice and support and refer you to a program that can help you quit.""",
  ),
  Tip(
    "Check Your Medications",
    """Check with a health care provider before taking any medications, supplements, or "natural" remedies. Some are surprised to learn that even commonly used over-the-counter medications like ibuprofen and other non-steroidal anti-inflammatory drugs (NSAIDs) should be avoided during pregnancy.

For example, some studies have shown a potential link between using ibuprofen during pregnancy and an increased risk of miscarriage and congenital disorders. Additionally, the Food and Drug Administration doesn't recommend the use of ibuprofen after week 20 of pregnancy due to the risk of kidney problems in the fetus.

Rather than worry about whether something is safe to take during pregnancy, go ahead and check with a health care provider before taking any medication, prescribed or otherwise.""",
  ),
  Tip(
    "Drink More Water",
    """During pregnancy, your blood is supplying oxygen and essential nutrients to your baby through the placenta and carrying waste and carbon dioxide away, and your blood volume increases up to 50% to handle all this extra activity. So, you need to drink more to support that gain.

Drinking water can also prevent constipation, hemorrhoids, urinary tract infections (UTIs), fatigue, headaches, swelling, and other uncomfortable pregnancy symptoms. Aim for eight to 10 glasses per day, and if you don't enjoy the taste, try adding a squeeze of lime or a splash of fruit juice.""",
  ),
];

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
    } else {
      // Otherwise, add the tip to favorites
      boxFavoriteTip.add(FavoriteTip(tip.title, tip.description));
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
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoriteTipsPage(),
                ),
              );
            },
          ),
        ],
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
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          Text(
                            tips[currentIndex].title,
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            tips[currentIndex].description,
                            style: TextStyle(fontSize: screenWidth * 0.036),
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
                                onPressed: () {},
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
