import 'package:app_fono/widgets/custom_button.dart';
import 'package:app_fono/widgets/responsive_box.dart';
import 'package:flutter/material.dart';

import '../screens/login_fono.dart';

class ChooseLogin extends StatelessWidget {
  const ChooseLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBox(
      children: [
        Text(
          'Faça seu Login',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 20,),
        CustomButton(
          text: 'Sou Fono',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: ((context) => LoginFono())));
            },
          ),
        SizedBox(height: 20,),
        CustomButton(
          text: 'Sou Paciente',
          onPressed: () {

          },
        ),
      ],
    );
  }
}