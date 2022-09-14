import 'package:app_fono/widgets/login_box.dart';
import 'package:app_fono/widgets/responsive_bg.dart';
import 'package:app_fono/widgets/responsive_box.dart';
import 'package:flutter/material.dart';

class LoginFono extends StatefulWidget {
  const LoginFono({super.key});

  @override
  State<LoginFono> createState() => _LoginFonoState();
}

class _LoginFonoState extends State<LoginFono> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBackground(
        child: LoginBox(),
      ),
    );
  }
}