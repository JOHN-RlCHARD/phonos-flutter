import 'package:app_fono/screens/home.dart';
import "package:flutter/material.dart";
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(
      Duration(milliseconds: 2500),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context)=> HomePage()),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.4, 1],
            colors: [Color(0xFF449BC0).withOpacity(1), Color(0xFF449BC0).withOpacity(0.95)]),
        ),
        child: Center(
          child: Lottie.asset('assets/phonos_splash2.json'),
        ),
      ),
    );
  }
}