import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat format = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: DateTime.now(),
        calendarFormat: format,
        onFormatChanged: (CalendarFormat _format) {
          setState(() {
            format = _format;
          });
        },
        rowHeight: 30,
        daysOfWeekHeight: 30,
        calendarStyle: CalendarStyle(
          outsideDaysVisible: false,
          cellMargin: EdgeInsets.all(3),
          todayDecoration: BoxDecoration(
            color: Color(0xFF449BC0),
            shape: BoxShape.circle,
          ),
          weekendTextStyle: TextStyle(
            fontSize: 14,
          ),
          todayTextStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        headerStyle: HeaderStyle(
          headerPadding: EdgeInsets.only(bottom: 3),
          titleTextStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          formatButtonVisible: false,
        ),
      ),
    );
  }
}
