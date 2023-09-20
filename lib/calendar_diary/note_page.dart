import 'package:flutter/material.dart';
import 'package:materni_tech1/calendar_diary/calendar_diary.dart';

class NotePage extends StatefulWidget {
  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note Input Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: TextField(
                controller: _noteController,
                maxLines: null,
                // Allows multiple lines of text
                decoration: InputDecoration(
                  hintText: 'Enter your note here...',
                  fillColor: Color.fromARGB(255, 241, 179, 84),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 16.0),
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
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => CalendarDiary()),
                    );
                  },
                  child: Text("Cancel"),
                ),
                SizedBox(
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
                    // Save or process the note
                    String noteText = _noteController.text;
                    // You can do whatever you want with the note text here
                    print('Note saved: $noteText');
                  },
                  child: Text('Save Note'),
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
    _noteController.dispose();
    super.dispose();
  }
}
