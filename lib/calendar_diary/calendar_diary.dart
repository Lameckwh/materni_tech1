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
  late DateTime _selectedDay = DateTime.now(); // Adjust this as needed

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(0, 176, 255, 1),
          elevation: 1,
          toolbarHeight: 65.h,
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
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 30.h),
                    TableCalendar(
                      daysOfWeekHeight: 25,
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return NotePage(selectedDate: _selectedDay);
                                  },
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Card(
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        DateFormat('d MMMM')
                                            .format(_selectedDay),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        'Add a note......',
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
                        ),
                      ],
                    ),
                  ],
                ),
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
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      NotePage(selectedDate: _selectedDay)),
                            );
                          },
                          child: const Text("Add a Note"),
                        )
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: boxNotes.length,
                    itemBuilder: (context, index) {
                      Note myNote = boxNotes.getAt(index);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: IconButton(
                                onPressed: () {
                                  setState(() {
                                    boxNotes.deleteAt(index);
                                  });
                                },
                                icon: const Icon(Icons.delete),
                              ),
                              title: Text(myNote.date),
                              subtitle: Text(myNote.note),
                            ),
                          ),
                        ),
                      );
                    },
                  )
          ],
        ),
      ),
    );
  }
}
