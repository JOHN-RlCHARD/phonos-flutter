import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.black.withOpacity(0.5),
      backgroundColor: Color(0xFF449BC0),
      title: Center(
        child: SvgPicture.asset('assets/phonos_logo.svg'),
        ),
      );
  }
}