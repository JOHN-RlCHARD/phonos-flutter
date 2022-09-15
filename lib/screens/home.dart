import 'package:app_fono/widgets/choose_login.dart';
import 'package:app_fono/widgets/responsive_bg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBackground(
        child: ChooseLogin(),
      ),
    );
  }
}
