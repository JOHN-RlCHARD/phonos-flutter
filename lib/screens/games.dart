import 'package:flutter/material.dart';

import '../classes/responsive.dart';
import '../widgets/appbar.dart';
import '../widgets/game_card.dart';
import '../widgets/responsive_bg.dart';
import '../widgets/responsive_box.dart';

class Games extends StatelessWidget {
  final String avatar;

  const Games({super.key, required this.avatar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: MyAppBar(),
        ),
        body: ResponsiveBackground(
            child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ResponsiveBox(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 80,
                    child: Image(image: AssetImage(avatar,),)
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: 360,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Procurar jogos',
                          prefixIcon: Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.3)),
                      textInputAction: TextInputAction.search,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: [
                      GameCard(
                        title: 'Forca',
                        difficulty: 'Easy',
                        description:
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.',
                        image: AssetImage('assets/kawaii_polar.png'),
                      ),
                      GameCard(
                        title: 'Forca',
                        difficulty: 'Easy',
                        description:
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.',
                        image: AssetImage('assets/kawaii_polar.png'),
                      ),
                      GameCard(
                        title: 'Forca',
                        difficulty: 'Easy',
                        description:
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.',
                        image: AssetImage('assets/kawaii_polar.png'),
                      ),
                      GameCard(
                        title: 'Forca',
                        difficulty: 'Easy',
                        description:
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.',
                        image: AssetImage('assets/kawaii_polar.png'),
                      ),
                      GameCard(
                        title: 'Forca',
                        difficulty: 'Easy',
                        description:
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.',
                        image: AssetImage('assets/kawaii_polar.png'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )));
  }
}
