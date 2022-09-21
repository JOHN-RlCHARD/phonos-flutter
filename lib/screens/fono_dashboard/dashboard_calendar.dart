import 'package:flutter/material.dart';

class DashBoardCalendar extends StatelessWidget {
  const DashBoardCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 12, 12, 12),
      child: Container(
        padding: EdgeInsets.all(12),
        width: MediaQuery.of(context).size.width / 3.5,
        constraints: BoxConstraints(
          maxWidth: 400,
          minWidth: 200,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color(0xFFDBEFFA),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Calendário',
              style: TextStyle(
                color: Color(0xFF78746D),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
