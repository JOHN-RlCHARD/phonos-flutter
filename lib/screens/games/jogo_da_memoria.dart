import 'dart:async';
import 'dart:io';
import 'package:app_fono/widgets/login_box.dart';
import 'package:app_fono/widgets/responsive_bg.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class JogoDaMemoria extends StatefulWidget {
  const JogoDaMemoria({super.key});

  @override
  State<JogoDaMemoria> createState() => _LoginPacienteState();
}

class _LoginPacienteState extends State<JogoDaMemoria> {
  @override
   void initState() {
     super.initState();
     if (Platform.isAndroid) WebView.platform = AndroidWebView();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFECF7FC),
        title: Center(child: Image(image: AssetImage('assets/phonos_logo.png'))),
      ),
      body: WebView(
        initialUrl: 'http://192.168.0.17:5173/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}