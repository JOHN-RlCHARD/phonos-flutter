import 'package:app_fono/widgets/choose_login.dart';
import 'package:app_fono/widgets/login_box.dart';
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
    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   body: Container(
    //     alignment: Alignment.center,
    //     width: double.infinity,
    //     height: double.infinity,
    //     color: Colors.lightBlue,
    //     child: LoginBox(),
    //   ),
    // );
  }
}
