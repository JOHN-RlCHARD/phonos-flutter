import 'package:flutter/material.dart';

class ConsultaCard extends StatefulWidget {
  final String date;
  final String time;
  final String mode;
  final String status;

  ConsultaCard(
      {super.key,
      required this.date,
      required this.time,
      required this.mode,
      required this.status});

  @override
  State<ConsultaCard> createState() => _ConsultaCardState();
}

class _ConsultaCardState extends State<ConsultaCard> {
  late Color color = Colors.white;

  @override
  void initState() {
    super.initState();
    if (widget.status == "Cancelado")
      color = Colors.red;
    else if (widget.status == "Agendado")
      color = Colors.orange;
    else
      color = Color(0xFF449BC0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          gradient: LinearGradient(
            colors: [Color(0xFF449BC0), Colors.white],
            stops: [0.03, 0.03],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.date,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            Text(
              widget.time,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.mode,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF449BC0)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.status,
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w800, color: color),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
