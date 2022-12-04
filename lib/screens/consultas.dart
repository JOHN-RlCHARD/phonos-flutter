import 'package:app_fono/widgets/consulta_card.dart';
import 'package:app_fono/widgets/filter_button.dart';
import 'package:app_fono/widgets/game_card.dart';
import 'package:app_fono/widgets/responsive_bg.dart';
import 'package:app_fono/widgets/responsive_box.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar.dart';

class Consultas extends StatelessWidget {
  const Consultas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MyAppBar(),
      ),
      body: ResponsiveBackground(
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ResponsiveBox(
                  children: [
                    Text(
                      "Próxima Consulta",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ConsultaCard(
                      date: "5 de Agosto de 2022(Sex)",
                      time: "14:20",
                      mode: "Presencial",
                      status: "Agendado",
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Histórico de Consultas",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Container(
                    //   alignment: Alignment.center,
                    //   width: MediaQuery.of(context).size.width / 1.7,
                    //   height: 40,
                    //   child: SingleChildScrollView(
                    //     scrollDirection: Axis.horizontal,
                    //     child: Row(
                    //       children: [
                    //         FilterButton(text: 'Cancelado'),
                    //         FilterButton(text: 'Finalizado'),
                    //         FilterButton(text: 'Esse mes'),
                    //         FilterButton(text: 'Mes Passado'),
                    //         FilterButton(text: 'Filtros'),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      // direction: Axis.horizontal,
                      // spacing: 15,
                      // runSpacing: 15,
                      // alignment: WrapAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ConsultaCard(
                          date: "3 de Agosto de 2022(Qua)",
                          time: "12:40",
                          mode: "Online",
                          status: "Finalizado",
                        ),
                        ConsultaCard(
                          date: "3 de Agosto de 2022(Qua)",
                          time: "11:40",
                          mode: "Online",
                          status: "Cancelado",
                        ),
                        ConsultaCard(
                          date: "22 de Outubro de 2022(Sab)",
                          time: "09:30",
                          mode: "Online",
                          status: "Finalizado",
                        ),
                        ConsultaCard(
                          date: "15 de Outubro de 2022(Seg)",
                          time: "16:30",
                          mode: "Online",
                          status: "Finalizado",
                        ),
                        ConsultaCard(
                          date: "15 de Outubro de 2022(Seg)",
                          time: "16:30",
                          mode: "Online",
                          status: "Finalizado",
                        ),
                        ConsultaCard(
                          date: "15 de Outubro de 2022(Seg)",
                          time: "16:30",
                          mode: "Online",
                          status: "Finalizado",
                        ),
                        ConsultaCard(
                          date: "15 de Outubro de 2022(Seg)",
                          time: "16:30",
                          mode: "Online",
                          status: "Finalizado",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
