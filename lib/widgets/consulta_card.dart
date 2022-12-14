import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ConsultaCard extends StatefulWidget {
  final String date;
  final String time;
  final String mode;
  final String status;
  final List<dynamic> endereco;

  ConsultaCard(
      {super.key,
      required this.date,
      required this.time,
      required this.mode,
      required this.status,
      required this.endereco});

  @override
  State<ConsultaCard> createState() => _ConsultaCardState();
}

class _ConsultaCardState extends State<ConsultaCard> {
  late Color color = Colors.white;
  late String link = "";
  late bool _outDated = true;

  @override
  void initState() {
    super.initState();

    if (widget.endereco[0].substring(0, 5) == "https") {
      link = widget.endereco[0];
    }

    var cardYear = int.parse(widget.date.substring(0, 4));
    var cardMonth = int.parse(widget.date.substring(5, 7));
    var cardDay = int.parse(widget.date.substring(8, 10));

    var now = DateTime.now();

    if (now.year == cardYear &&
        now.month == cardMonth &&
        now.day == cardDay &&
        link != null) {
      if (now.hour < 2 + int.parse(widget.time.substring(0, 2))) {
        _outDated = false;
      }
    }

    if (widget.status == "Cancelado")
      color = Colors.red;
    else if (widget.status == "Agendado")
      color = Colors.orange;
    else
      color = Color(0xFF449BC0);
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 105,
              width: 10,
              decoration: BoxDecoration(
                color: Color(0xFF449BC0),
                borderRadius: BorderRadius.horizontal(left: Radius.circular(7)),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              constraints: BoxConstraints(minWidth: 220, maxWidth: 400),
              width: MediaQuery.of(context).size.width / 1.5,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(7)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ]),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Data: " + widget.date,
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Horário: " + widget.time,
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w600),
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
                          ],
                        ),
                        Spacer(),
                        (widget.mode == 'presencial')
                            ? Container()
                            : Container(
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: (_outDated)
                                      ? null
                                      : () async {
                                          await _launchInBrowser(
                                              Uri.parse(link));
                                        },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(30, 30),
                                    primary: Color(0xFF449BC0),
                                    onPrimary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: Icon(
                                    Icons.start,
                                    size: 20,
                                  ),
                                ),
                              ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          widget.status,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: color),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
