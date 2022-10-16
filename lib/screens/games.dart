import 'package:app_fono/screens/games/jogo_da_memoria.dart';
import 'package:app_fono/widgets/responsive_bg.dart';
import 'package:app_fono/widgets/responsive_box.dart';
import 'package:flutter/material.dart';

class Games extends StatelessWidget {
  const Games({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFECF7FC),
        title: Center(child: Image(image: AssetImage('assets/phonos_logo.png'))),
      ),
      body: ResponsiveBackground(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Card(
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => JogoDaMemoria())));
                },
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Center(
                    child: Text('Jogo da Memoria'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Card(
              child: InkWell(
                onTap: () {
                  //@TODO
                },
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Center(
                    child: Text('Forca'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Card(
              child: InkWell(
                onTap: () {
                  //@TODO
                },
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Center(
                    child: Text('Cruzadinha'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Card(
              child: InkWell(
                onTap: () {
                  //@TODO
                },
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Center(
                    child: Text('Caça Palavras'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}