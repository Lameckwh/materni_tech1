import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:materni_tech1/models/boxes.dart';
import 'package:materni_tech1/models/favorite_tip.dart';

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
          return ListView.builder(
            itemCount: keys.length,
            itemBuilder: (context, index) {
              int key = keys[index];
              FavoriteTip? favoriteTip = box.get(key) as FavoriteTip?;

              return favoriteTip != null
                  ? Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(favoriteTip.title),
                          onTap: () {
                            // Show the tip description in a popup dialog
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      favoriteTip.title,
                                    ),
                                  ),
                                  content: Text(favoriteTip.description),
                                  actions: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          'Close',
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              // Delete the favorite tip when the delete button is pressed
                              box.delete(key);
                            },
                          ),
                        ),
                      ),
                    )
                  : const Text(
                      "Empty",
                      style: TextStyle(color: Colors.black),
                    );
            },
          );
        },
      ),
    );
  }
}
