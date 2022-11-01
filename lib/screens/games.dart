import 'package:app_fono/widgets/game_card.dart';
import 'package:app_fono/widgets/responsive_bg.dart';
import 'package:app_fono/widgets/responsive_box.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar.dart';

class Games extends StatelessWidget {
  const Games({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MyAppBar(),
      ),
      body: ResponsiveBackground(
        child: SingleChildScrollView(
          
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              direction: Axis.horizontal,
              spacing: 20,
              runSpacing: 20,
              children: [
                SizedBox(width: MediaQuery.of(context).size.width,),
                //SizedBox(height: 30, width: MediaQuery.of(context).size.width,),

                GameCard(
                  title: 'Jogo da Memoria',
                  difficulty: 'Hard',
                  description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.',
                  image: AssetImage('assets/kawaii_polar.png'),
                ),

                GameCard(
                  title: 'Forca',
                  difficulty: 'Hard',
                  description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.',
                  image: AssetImage('assets/kawaii_polar.png'),
                ),

                GameCard(
                  title: 'Cruzadinha',
                  difficulty: 'Hard',
                  description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.',
                  image: AssetImage('assets/kawaii_polar.png'),
                ),

                GameCard(
                  title: 'Caca Palavras',
                  difficulty: 'Hard',
                  description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.',
                  image: AssetImage('assets/kawaii_polar.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}