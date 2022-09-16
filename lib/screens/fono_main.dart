import 'package:app_fono/widgets/responsive_bg.dart';
import 'package:app_fono/widgets/responsive_box.dart';
import 'package:flutter/material.dart';

class FonoMainPage extends StatelessWidget {
  const FonoMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBackground(
          child: ResponsiveBox(
        children: [Text('Fono Main Page')],
      )),
    );
  }
}
