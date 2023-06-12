import 'dart:io';

import 'package:app_fono/api/api_service.dart';
import 'package:app_fono/variables/globals.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:file_picker/file_picker.dart';

class AtividadeCard extends StatefulWidget {
  final String titulo;
  final String date;
  final String desc;
  final String status;
  final String arquivoPath;
  final String id;

  AtividadeCard(
      {super.key,
      required this.titulo,
      required this.date,
      required this.desc,
      required this.status,
      required this.arquivoPath,
      required this.id});

  @override
  State<AtividadeCard> createState() => _AtividadeCardState();
}

class _AtividadeCardState extends State<AtividadeCard> {
  late String link = "";
  late bool isClicked = false;
  late int _maxLines = 2;

  @override
  void initState() {
    super.initState();

    var cardYear = int.parse(widget.date.substring(0, 4));
    var cardMonth = int.parse(widget.date.substring(5, 7));
    var cardDay = int.parse(widget.date.substring(8, 10));

    // var now = Datedesc.now();

    // if (now.year == cardYear &&
    //     now.month == cardMonth &&
    //     now.day == cardDay &&
    //     link != null) {
    //   if (now.hour < 2 + int.parse(widget.desc.substring(0, 2))) {
    //     _outDated = false;
    //   }
    // }
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
    return InkWell(
      onTap: () {
        if (isClicked) {
          _maxLines = 2;
          isClicked = false;
        } else {
          _maxLines = 15;
          isClicked = true;
        }
        setState(() {});
      },
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 125,
                width: 10,
                decoration: BoxDecoration(
                  color: (widget.status == "true") ? Colors.green : Colors.blue,
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(7)),
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
                                widget.titulo,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w800),
                              ),
                              Container(
                                width: 160,
                                child: Text(
                                  widget.desc,
                                  maxLines: _maxLines,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Text(
                                "Entrega até: " + widget.date,
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () async {
                                var path = widget.arquivoPath;
                                await _launchInBrowser(Uri.parse(
                                    'http://$IP_HOST:3000/atividades/file/$path'));
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(30, 30),
                                primary: Color(0xFF449BC0),
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: Icon(
                                Icons.download,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            (widget.status == "true") ? "Entregue" : "Aberto",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: (widget.status == "true")
                                    ? Colors.green
                                    : Colors.blue),
                          ),
                          Spacer(),
                          Container(
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (widget.status == "true") {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                          "Atenção",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700),
                                        ),
                                        content: Text(
                                          "Essa atividade já foi entregue, deseja substituir o envio anterior?",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Não"),
                                          ),
                                          Spacer(),
                                          TextButton(
                                            onPressed: () async {
                                              await sendActivity();
                                              Navigator.pop(context);
                                            },
                                            child: Text("Sim"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  await sendActivity();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(30, 30),
                                primary: Color(0xFF449BC0),
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: Icon(
                                Icons.upload,
                                size: 20,
                              ),
                            ),
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
      ),
    );
  }

  Future sendActivity() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      final file = result.files.single;

      await ApiService().putSendActivity(widget.id, ACCESS_TOKEN, file.path!);
    } else {
      // User canceled the picker
    }

    setState(() {});
  }
}
