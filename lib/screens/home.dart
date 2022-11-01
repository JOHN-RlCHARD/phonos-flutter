import 'package:app_fono/screens/home_paciente.dart';
import 'package:app_fono/widgets/appbar.dart';
import 'package:app_fono/widgets/responsive_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../widgets/custom_button.dart';
import '../widgets/responsive_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MyAppBar(),
      ),
      body: ResponsiveBackground(
        child: Center(
          child: ResponsiveBox(
            color1: Colors.white,
            color2: Colors.white,
            children: [
              SizedBox(height: 30,),
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
                SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
