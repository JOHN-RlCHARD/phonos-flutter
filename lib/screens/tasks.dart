import 'package:app_fono/api/api_service.dart';
import 'package:app_fono/api/models/agendamento.dart';
import 'package:app_fono/api/models/atividade.dart';
import 'package:app_fono/variables/globals.dart';
import 'package:app_fono/widgets/consulta_card.dart';
import 'package:app_fono/widgets/responsive_bg.dart';
import 'package:app_fono/widgets/responsive_box.dart';
import 'package:flutter/material.dart';

import '../api/models/paciente.dart';
import '../widgets/appbar.dart';
import '../widgets/atividade_card.dart';

class Atividades extends StatefulWidget {
  const Atividades({super.key});

  @override
  State<Atividades> createState() => _AtividadesState();
}

class _AtividadesState extends State<Atividades> {
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  Future<List<Atividade>?> getAtividadesList() async {
    List<Atividade>? reversedList;
    var list = await ApiService().getAtividades(USER_TOKEN, ACCESS_TOKEN);
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
                  Text("Suas Tarefas",
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
                    future: getAtividadesList(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      try {
                        if (snapshot.data.length == 0)
                          return Text("Você não tem atividades.",
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
                              return AtividadeCard(
                                titulo: snapshot.data[index].titulo,
                                date: snapshot.data[index].entrega,
                                desc: snapshot.data[index].descricao,
                                status: snapshot.data[index].isEntregue,
                                arquivoPath: snapshot.data[index].arquivoPath,
                                id: snapshot.data[index].id,
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
      )),
    );
  }
}
