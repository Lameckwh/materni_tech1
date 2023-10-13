import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:materni_tech1/models/boxes.dart';
import 'package:materni_tech1/models/favorite_tip.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteTipsPage extends StatelessWidget {
  const FavoriteTipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Tips')),
      body: ValueListenableBuilder<Box>(
        valueListenable: boxFavoriteTip.listenable(),
        builder: (context, Box box, _) {
          List<int> keys = box.keys.cast<int>().toList();

          if (keys.isEmpty) {
            // Display the "Favorite tips will appear here" text when there are no favorite tips
            return Center(
              child: Text(
                'Favorite tips will appear here',
                style: TextStyle(fontSize: 16.sp, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            itemCount: keys.length,
            itemBuilder: (context, index) {
              int key = keys[index];
              FavoriteTip? favoriteTip = box.get(key) as FavoriteTip?;

              return favoriteTip != null
                  ? Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.w), // Adjust padding
                        child: ListTile(
                          title: Text(
                            favoriteTip.title,
                            style: TextStyle(fontSize: 16.sp), // Set font size
                          ),
                          onTap: () {
                            // Show the tip description in a vertically scrollable AlertDialog
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      favoriteTip.title,
                                      style: TextStyle(
                                          fontSize: 16.sp), // Set font size
                                    ),
                                  ),
                                  contentPadding:
                                      EdgeInsets.all(20.w), // Adjust width
                                  content: SingleChildScrollView(
                                    child: Text(
                                      favoriteTip.description,
                                      style: TextStyle(
                                          fontSize: 16.sp), // Set font size
                                    ),
                                  ),
                                  actions: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          'Close',
                                          style: TextStyle(
                                              fontSize: 16.sp), // Set font size
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },

                          trailing: GestureDetector(
                            onTap: () {
                              // Show a confirmation dialog before deleting the favorite tip
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Confirm Deletion',
                                      style: TextStyle(fontSize: 16.sp),
                                    ),
                                    content: Text(
                                      'Are you sure you want to delete this favorite tip?',
                                      style: TextStyle(fontSize: 16.sp),
                                    ),
                                    actions: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop(); // Close the confirmation dialog
                                            },
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(fontSize: 16.sp),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.h,
                                          ),
                                          ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty
                                                  .all<Color>(Colors
                                                      .red), // Set background color to red
                                            ),
                                            onPressed: () {
                                              // Delete the favorite tip when confirmed
                                              box.delete(key);
                                              Navigator.of(context)
                                                  .pop(); // Close the confirmation dialog
                                            },
                                            child: Text(
                                              'Delete',
                                              style: TextStyle(fontSize: 16.sp),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Icon(
                              Icons.delete,
                              size: 24.sp,
                              color: Colors.red,
                            ),
                          ),
// ...
                        ),
                      ),
                    )
                  : Text(
                      "Empty",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black), // Set font size and color
                    );
            },
          );
        },
      ),
    );
  }
}
