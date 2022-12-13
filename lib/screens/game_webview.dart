import 'package:app_fono/variables/globals.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../widgets/appbar.dart';

class GameWebview extends StatefulWidget {
  final String gamePort;

  const GameWebview({super.key, required this.gamePort});

  @override
  State<GameWebview> createState() => _GameWebviewState();
}

class _GameWebviewState extends State<GameWebview> {
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

// Step 3
  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF449BC0),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MyAppBar(),
      ),
      body: Transform.scale(
        scale: 0.95,
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: "http://" + IP_HOST + ":" + widget.gamePort,
          onWebViewCreated: (controller) {
            this.controller = controller;
          },
        ),
      ),
    );
    // return Scaffold(
    //   appBar: PreferredSize(
    //     preferredSize: Size.fromHeight(56),
    //     child: MyAppBar(),
    //   ),
    //   body: Column(
    //     children: [
    //       Expanded(
    //         child: WebviewScaffold(
    //           url: "http://" + IP_HOST + ":" + widget.gamePort,
    //           withJavascript: true,
    //           withZoom: true,
    //           displayZoomControls: true,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
