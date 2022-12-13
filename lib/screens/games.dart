import 'package:app_fono/api/api_service.dart';
import 'package:app_fono/screens/game_webview.dart';
import 'package:app_fono/variables/globals.dart';
import 'package:flutter/material.dart';

import '../api/models/paciente.dart';
import '../classes/responsive.dart';
import '../widgets/appbar.dart';
import '../widgets/game_card.dart';
import '../widgets/responsive_bg.dart';
import '../widgets/responsive_box.dart';

class Games extends StatelessWidget {
  const Games({super.key});

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
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ResponsiveBox(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                            width: 80,
                            child: Image(
                              image: AssetImage(
                                snapshot.data!.img,
                              ),
                            )),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          width: 360,
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Procurar jogos',
                                prefixIcon: Icon(Icons.search),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.3)),
                            textInputAction: TextInputAction.search,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Wrap(
                          direction: Axis.horizontal,
                          spacing: 20,
                          runSpacing: 20,
                          alignment: WrapAlignment.center,
                          children: [
                            GameCard(
                              title: 'Forca',
                              difficulty: 'Fácil',
                              description:
                                  'Revele a palavra escondida letra por letra, mas cuidado, suas tentativas são limitadas pelo número de pétalas na flor que o David está segurando.',
                              image: AssetImage('assets/splash_forca.png'),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            GameWebview(gamePort: "3003"))));
                              },
                            ),
                            GameCard(
                              title: 'Caça-Palavras',
                              difficulty: 'Dinâmico',
                              description:
                                  'Escolha a dificuldade e encontre todas as palavras escondidas no tabuleiro. Quanto menor o tempo que demorar para encontrá-las, maior será sua pontuação!',
                              image: AssetImage('assets/splash_wordhunt.png'),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            GameWebview(gamePort: "3004"))));
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        )));
  }
}
