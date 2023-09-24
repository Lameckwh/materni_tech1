import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:materni_tech1/calendar_diary/calendar_diary.dart';
import 'package:materni_tech1/models/boxes.dart';
import 'package:materni_tech1/models/note.dart';
// import 'package:materni_tech1/models/boxes.dart';
// import 'package:materni_tech1/models/note.dart';

class NotePage extends StatefulWidget {
  final DateTime selectedDate; // Add this parameter

  const NotePage({Key? key, required this.selectedDate}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  TextEditingController noteController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            DateFormat('d MMMM').format(widget.selectedDate)), // Set the title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: TextField(
                controller: noteController,
                maxLines: null,
                // Allows multiple lines of text
                decoration: const InputDecoration(
                  hintText: 'Enter your note here...',
                  fillColor: Color.fromARGB(255, 241, 179, 84),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        const Size(150, 50), // Set button width and height
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(25), // Set border radius
                    ),
                    // Set the background color to orange
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel"),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(0, 176, 255, 1),
                    minimumSize:
                        const Size(150, 50), // Set button width and height
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(25), // Set border radius
                    ),
                    // Set the background color to orange
                  ),
                  onPressed: () {
                    setState(() {
                      boxNotes.put(
                        "key_${noteController.text}",
                        Note(
                          note: noteController.text,
                          date: DateFormat('d MMMM')
                              .format(widget.selectedDate)
                              .toString(),
                        ),
                      );
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Text('Save Note'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the TextEditingController
    noteController.dispose();
    super.dispose();
  }
}
