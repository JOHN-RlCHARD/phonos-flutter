import 'dart:math';

import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      alignment: Alignment.bottomRight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('header_bg.png')),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 50),
        child: Container(
          alignment: Alignment.bottomRight,
          height: 600,
          width: double.infinity,
          child: Image.asset('header_fg.png', fit: BoxFit.cover,)
          ),
      ),
    );
  }
}