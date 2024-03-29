import 'package:app_fono/api/api_service.dart';
import 'package:app_fono/api/models/paciente.dart';
import 'package:app_fono/screens/consultas.dart';
import 'package:app_fono/screens/home.dart';
import 'package:app_fono/screens/profile.dart';
import 'package:app_fono/screens/tasks.dart';
import 'package:app_fono/variables/globals.dart';
import 'package:app_fono/widgets/custom_button.dart';
import 'package:app_fono/widgets/responsive_bg.dart';
import 'package:app_fono/widgets/responsive_box.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/appbar.dart';
import 'games.dart';

class HomePaciente extends StatelessWidget {
  const HomePaciente({super.key});

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
            child: FutureBuilder(
              future: ApiService().getPacienteByToken(USER_TOKEN, ACCESS_TOKEN),
              builder:
                  (BuildContext context, AsyncSnapshot<Paciente?> snapshot) {
                if (snapshot.hasData) {
                  return ResponsiveBox(
                    children: [
                      Container(
                          width: 80,
                          child: Image(
                            image: AssetImage(
                              snapshot.data!.img,
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        snapshot.data!.fname,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                          icon: Icon(Icons.person),
                          text: 'Meu Perfil',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => ProfileScreen())));
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                          icon: Icon(Icons.sports_esports),
                          text: 'Jogos',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => Games())));
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                          icon: Icon(Icons.calendar_month),
                          text: 'Consultas',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => Consultas())));
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                          icon: Icon(Icons.task),
                          text: 'Tarefas',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => Atividades())));
                          }),
                      const SizedBox(
                        height: 20,
                      ),

                      // CustomButton(
                      //     icon: Icon(Icons.meeting_room),
                      //     text: 'Ingressar na Consulta',
                      //     onPressed: () async {

                      //       await _launchInBrowser(Uri.parse("https://us05web.zoom.us/j/83486298042?pwd=WmoyQjd3RFBaSmIva1RPSXZwTEkvUT09"));

                      //     }),
                      // const SizedBox(
                      //   height: 20,
                      // ),

                      TextButton(
                        onPressed: () {
                          ACCESS_TOKEN = "";
                          USER_TOKEN = "";
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (builder) => HomePage()),
                            (route) => false,
                          );
                        },
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(
                              Icons.exit_to_app,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Sair',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
