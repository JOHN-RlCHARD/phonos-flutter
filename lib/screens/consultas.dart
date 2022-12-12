import 'package:app_fono/api/api_service.dart';
import 'package:app_fono/widgets/consulta_card.dart';
import 'package:app_fono/widgets/responsive_bg.dart';
import 'package:app_fono/widgets/responsive_box.dart';
import 'package:flutter/material.dart';

import '../api/models/paciente.dart';
import '../widgets/appbar.dart';

class Consultas extends StatelessWidget {
  final String accessToken;
  final Paciente user;

  const Consultas({super.key, required this.accessToken, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MyAppBar(),
      ),
      body: ResponsiveBackground(
        child: Center(
          child: FutureBuilder(
            future: ApiService().getAgendamentos(user.token, accessToken),
            builder: (BuildContext context, AsyncSnapshot snapshot) {

              try {
                if (snapshot.data.length == 0) return Center(
                child: Text(
                  "Nenhuma consulta encontrada!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  )
                ),
                );
              } catch (e) {}
              
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 30,),
                          Text(
                            "Histórico de Consultas",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                            )
                          ),
                          SizedBox(height: 30,),
                          ConsultaCard(
                            date: snapshot.data[index].data,
                            time: snapshot.data[index].hora,
                            mode: snapshot.data[index].tipo,
                            status: snapshot.data[index].status
                          )
                        ],
                      );
                    } else {
                      return ConsultaCard(
                        date: snapshot.data[index].data,
                        time: snapshot.data[index].hora,
                        mode: snapshot.data[index].tipo,
                        status: snapshot.data[index].status
                      );
                    }
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
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
