// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Calendar Demo',
      home: CalendarScreen(),
    );
  }
}

class CalendarScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalendarScreenState();
  }
}

class _CalendarScreenState extends State<CalendarScreen> {
  bool showEvents = true;

  List<NeatCleanCalendarEvent> _todaysEvents = [
    NeatCleanCalendarEvent('Event A',
        startTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 10, 0),
        endTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 12, 0),
        description: 'A special event',
        color: Colors.blue[700],
        spots: 3),
  ];

  final List<NeatCleanCalendarEvent> _eventList = [
    NeatCleanCalendarEvent('HIIT with Jack',
        spots: 3,
        description: 'Jack Son',
        startTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 10, 0),
        endTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 2, 12, 0),
        color: const Color(0xffDA4167),
        isMultiDay: true),
    NeatCleanCalendarEvent('Allday Event B',
        description: 'Jack Son',
        spots: 4,
        startTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day - 2, 14, 30),
        endTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 2, 17, 0),
        color: const Color(0xff56A3A6),
        isAllDay: true),
    NeatCleanCalendarEvent(
      'Normal Event D',
      description: 'Jack Son',
      spots: 1,
      startTime: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 14, 30),
      endTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day, 17, 0),
      color: const Color(0xffF78764),
    ),
  ];

  @override
  void initState() {
    super.initState();
    // Force selection of today on first load, so that the list of today's events gets shown.
    _handleNewDate(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Calendar(
        eventDoneColor: const Color(0xff56A3A6),
        selectedColor: const Color(0xffDA4167),
        todayColor: const Color(0xffF5CB5C),
        eventColor: const Color(0xff56A3A6),
        selectedTodayColor: const Color(0xffDA4167),
        defaultDayColor: Colors.white,
        hideTodayIcon: true,
        // isExpandable: true,
        isExpanded: true,
        eventsList: _eventList,
        dayOfWeekStyle: const TextStyle(
            color: Color(0xffF5CB5C), fontWeight: FontWeight.w800),
      ),
    ));
  }

  void _handleNewDate(date) {
    print('Date selected: $date');
  }
}
