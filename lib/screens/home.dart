import 'package:app_fono/screens/home_paciente.dart';
import 'package:app_fono/widgets/responsive_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../widgets/custom_button.dart';
import '../widgets/responsive_box.dart';
import 'login_fono.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            Text(
              'Entre com seu Token',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20,),
            CustomButton(
              text: 'Entrar',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => HomePaciente())));
                },
              ),
          ],
        ),
      ),
    );
  }
}
