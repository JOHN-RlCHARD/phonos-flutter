import 'package:app_fono/screens/games.dart';
import 'package:app_fono/widgets/custom_button.dart';
import 'package:app_fono/widgets/responsive_bg.dart';
import 'package:app_fono/widgets/responsive_box.dart';
import 'package:flutter/material.dart';

class HomePaciente extends StatelessWidget {
  const HomePaciente({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFECF7FC),
        title: Center(child: Image(image: AssetImage('assets/phonos_logo.png'))),
      ),
      body: ResponsiveBackground(
        child: ResponsiveBox(
          children: [
            CustomButton(
              text: 'Meu Perfil',
              onPressed: () {
                //@TODO
              }
            ),
            SizedBox(height: 20,),
            CustomButton(
              text: 'Jogos',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => Games())));
              }
            ),
            SizedBox(height: 20,),
            CustomButton(
              text: 'Consultas',
              onPressed: () {
                //@TODO
              }
            ),

          ],
        ),
      ),
    );
  }
}