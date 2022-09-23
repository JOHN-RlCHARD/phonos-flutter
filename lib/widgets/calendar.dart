import 'package:app_fono/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(
            children: [
              TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: selectedDay,
                calendarFormat: CalendarFormat.month,
                onDaySelected: (DateTime selectDay, DateTime focusDay) {
                  setState(() {
                    selectedDay = selectDay;
                    focusedDay = focusDay;
                  });
                },
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(selectedDay, date);
                },
                availableGestures: AvailableGestures.horizontalSwipe,
                rowHeight: 30,
                daysOfWeekHeight: 30,
                calendarStyle: CalendarStyle(
                  isTodayHighlighted: true,
                  outsideDaysVisible: false,
                  cellMargin: EdgeInsets.all(3),
                  todayDecoration: BoxDecoration(
                    color: Color(0xFF449BC0),
                    shape: BoxShape.circle,
                  ),
                  weekendTextStyle: TextStyle(
                    fontSize: 14,
                  ),
                  selectedTextStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
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
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          height: 250,
          child: SingleChildScrollView(
            child: Column(
              children: [
                EventCard(
                  eventoNum: 1,
                  eventoDesc: 'David evento com David Cliente',
                  eventoDate: '26/02',
                ),
                EventCard(
                  eventoNum: 2,
                  eventoDesc: 'David evento com David Cliente',
                  eventoDate: 'XX/XX',
                ),
                EventCard(
                  eventoNum: 3,
                  eventoDesc: 'David evento com David Cliente',
                  eventoDate: 'XX/XX',
                ),
                EventCard(
                  eventoNum: 4,
                  eventoDesc: 'David evento com David Cliente',
                  eventoDate: 'XX/XX',
                ),
                EventCard(
                  eventoNum: 5,
                  eventoDesc: 'David evento com David Cliente',
                  eventoDate: 'XX/XX',
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        TextButton(
          onPressed: () {},
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFF449BC0),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Icon(
                    Icons.calendar_month,
                    color: Color(0xFF449BC0),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Text(
                    'Programar novo evento',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class EventCard extends StatelessWidget {
  final int eventoNum;
  final String eventoDesc;
  final String eventoDate;

  const EventCard(
      {super.key,
      required this.eventoNum,
      required this.eventoDesc,
      required this.eventoDate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                stops: [.1 / 5, .1 / 5],
                begin: Alignment.centerLeft,
                colors: [Color(0xFFFF7E7E), Colors.white]),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Evento ${eventoNum.toString()}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF78746D),
                        fontSize: 12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 1, 30, 5),
                      child: Container(
                        height: 1,
                        width: double.maxFinite,
                        color: Color(0xFFD9D9D9),
                      ),
                    ),
                    Text(
                      eventoDesc,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF78746D),
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
              Text(
                'Dia\n${eventoDate}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF78746D),
                  fontSize: 14,
                ),
              ),
            ],
          )),
    );
  }
}
