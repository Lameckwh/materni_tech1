import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:materni_tech1/calendar_diary/note_page.dart';
import 'package:table_calendar/table_calendar.dart';

import '../drawer_content.dart';

class CalendarDiary extends StatefulWidget {
  @override
  State<CalendarDiary> createState() => _CalendarDiaryState();
}

class _CalendarDiaryState extends State<CalendarDiary> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  late DateTime _selectedDay = DateTime.timestamp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                      Icons.note,
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
          drawer: DrawerContent(),
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
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    height: 150,
                    width: 150,
                    image: AssetImage("images/note.png"),
                  ),
                  const Text("No Data"),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize:
                            const Size(200, 50), // Set button width and height
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(25), // Set border radius
                        ),
                        // Set the background color to orange
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NotePage()),
                        );
                      },
                      child: const Text("Add a note for today"))
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
