import 'package:app_fono/screens/games/games_desktop.dart';
import 'package:app_fono/screens/games/games_mobile.dart';
import 'package:flutter/material.dart';

import '../../classes/responsive.dart';
import '../../widgets/appbar.dart';

class Games extends StatelessWidget {
  const Games({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MyAppBar(),
      ),
      body: GamesDesktop(),
    );
  }
}
