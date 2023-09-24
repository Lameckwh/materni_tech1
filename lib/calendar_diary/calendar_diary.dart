import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:materni_tech1/calendar_diary/note_page.dart';
import 'package:materni_tech1/models/boxes.dart';
import 'package:materni_tech1/models/note.dart';
import 'package:table_calendar/table_calendar.dart';
import '../drawer_content.dart';

class CalendarDiary extends StatefulWidget {
  const CalendarDiary({super.key});

  @override
  State<CalendarDiary> createState() => _CalendarDiaryState();
}

class _CalendarDiaryState extends State<CalendarDiary> {
  TextEditingController noteController = TextEditingController();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  late DateTime _selectedDay = DateTime.timestamp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            toolbarHeight: 50.h,
            title: const Text(
              'Calendar and Diary',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w600,
              ),
            ),
            bottom: const TabBar(tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calendar_today,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "CALENDAR",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.list,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "NOTES",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
            ]),
          ),
          drawer: const DrawerContent(),
          body: TabBarView(children: [
            Center(
              child: Column(
                children: [
                  SizedBox(height: 50.h),
                  TableCalendar(
                    firstDay: DateTime.utc(1900, 1, 1),
                    lastDay: DateTime.utc(2070, 12, 31),
                    focusedDay: _focusedDay,
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    availableGestures: AvailableGestures.all,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    calendarFormat: _calendarFormat,
                    onFormatChanged: (format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // Handle the onTap event here, e.g., navigate to a new screen
                            // or perform some other action.
                            // You can use Navigator to navigate to a new screen, for example.
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  // Return the widget to navigate to, e.g., a detail page.
                                  // You can replace `DetailPage()` with your desired widget.
                                  return NotePage(selectedDate: _selectedDay);
                                },
                              ),
                            );
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    DateFormat('d MMMM').format(_selectedDay),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Add note......',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromRGBO(0, 0, 0, 0.5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            boxNotes.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          height: 150,
                          width: 150,
                          image: AssetImage("images/note.png"),
                        ),
                        const Text("No Data"),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(
                                200, 50), // Set button width and height
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  25), // Set border radius
                            ),
                            // Set the background color to orange
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      NotePage(selectedDate: _selectedDay)),
                            );
                          },
                          child: const Text("Add a note for today"),
                        )
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: boxNotes.length,
                    itemBuilder: (context, index) {
                      Note myNote = boxNotes.getAt(index);
                      return ListTile(
                        leading: IconButton(
                          onPressed: () {
                            setState(() {
                              boxNotes.deleteAt(index);
                            });
                          },
                          icon: const Icon(Icons.delete),
                        ),
                        title: Text(myNote.date),
                        subtitle: const Text("Name"),
                        trailing: Text(myNote.note),
                      );
                    },
                  )
          ]),
        ),
      ),
    );
  }
}
