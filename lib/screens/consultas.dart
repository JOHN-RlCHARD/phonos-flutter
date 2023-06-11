import 'package:app_fono/api/api_service.dart';
import 'package:app_fono/api/models/agendamento.dart';
import 'package:app_fono/variables/globals.dart';
import 'package:app_fono/widgets/consulta_card.dart';
import 'package:app_fono/widgets/responsive_bg.dart';
import 'package:app_fono/widgets/responsive_box.dart';
import 'package:flutter/material.dart';

import '../api/models/paciente.dart';
import '../widgets/appbar.dart';

class Consultas extends StatefulWidget {
  const Consultas({super.key});

  @override
  State<Consultas> createState() => _ConsultasState();
}

class _ConsultasState extends State<Consultas> {
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  Future<List<Agendamento>?> getAgendamentosList() async {
    List<Agendamento>? reversedList;
    var list = await ApiService().getAgendamentos(USER_TOKEN, ACCESS_TOKEN);
    if (list != null) {
      reversedList = List.from(list.reversed);
      return reversedList;
    }
    return reversedList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MyAppBar(),
      ),
      body: ResponsiveBackground(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ResponsiveBox(
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text("Suas Consultas",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 40,
                    child: TextButton(
                        onPressed: () => setState(() {}),
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              color: Color(0xFF449BC0), shape: BoxShape.circle),
                          child: Icon(
                            Icons.refresh,
                            color: Colors.white,
                            size: 20,
                          ),
                        )),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height - 290),
                child: FutureBuilder(
                    future: getAgendamentosList(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      try {
                        if (snapshot.data.length == 0)
                          return Text("Nenhuma consulta encontrada!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ));
                      } catch (e) {}

                      if (snapshot.hasData) {
                        return Container(
                          constraints: BoxConstraints(maxWidth: 420),
                          child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ConsultaCard(
                                date: snapshot.data[index].data,
                                time: snapshot.data[index].hora,
                                mode: snapshot.data[index].isOnline,
                                status: snapshot.data[index].isOver,
                                endereco: snapshot.data[index].endereco,
                              );
                            },
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      )
          // child: Center(
          //   child: SingleChildScrollView(
          //     child: Center(
          //       child: Padding(
          //         padding: const EdgeInsets.symmetric(vertical: 20),
          //         child: ResponsiveBox(
          //           children: [
          //             FutureBuilder(
          //               future: ApiService().getAgendamentos(user.token, accessToken),
          //               builder: (BuildContext context, AsyncSnapshot snapshot) {
          //                 if (snapshot.data != null) {
          //                   return ListView.builder(
          //                     itemCount: snapshot.data.length,
          //                     itemBuilder: (BuildContext context, int index) {
          //                       return ListTile(
          //                         title: Text(snapshot.data[index].data),
          //                         // date: snapshot.data[index].data,
          //                         // time: snapshot.data[index].hora,
          //                         // mode: snapshot.data[index].tipo,
          //                         // status: snapshot.data[index].status
          //                         );
          //                     },
          //                   );
          //                 } else {return Container(child: Text("No data"));}
          //               }
          //             ),
          //             Text(
          //               "Próxima Consulta",
          //               textAlign: TextAlign.center,
          //               style: TextStyle(
          //                 fontWeight: FontWeight.w800,
          //                 fontSize: 20,
          //               ),
          //             ),
          //             SizedBox(
          //               height: 30,
          //             ),
          //             ConsultaCard(
          //               date: "5 de Agosto de 2022(Sex)",
          //               time: "14:20",
          //               mode: "Presencial",
          //               status: "Agendado",
          //             ),
          //             SizedBox(
          //               height: 30,
          //             ),
          //             Text(
          //               "Histórico de Consultas",
          //               textAlign: TextAlign.center,
          //               style: TextStyle(
          //                 fontWeight: FontWeight.w800,
          //                 fontSize: 20,
          //               ),
          //             ),
          //             SizedBox(
          //               height: 10,
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          ),
    );
  }
}
