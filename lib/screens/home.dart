import 'package:app_fono/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/centered_view.dart';
import '../widgets/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CenteredView(
        child: Column(
          children: [
            NavBar(),
            Header(),
          ]
          ),
      ),
    );
  }
}