import 'package:app_fono/widgets/game_card.dart';
import 'package:app_fono/widgets/responsive_bg.dart';
import 'package:flutter/material.dart';

class GamesMobile extends StatelessWidget {
  const GamesMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBackground(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Wrap(
            alignment: WrapAlignment.spaceAround,
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.vertical,
            spacing: 20,
            runSpacing: 20,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
              ),
              //SizedBox(height: 30, width: MediaQuery.of(context).size.width,),

              Container(
                width: 360,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Procurar jogos',
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.3)),
                  textInputAction: TextInputAction.search,
                ),
              ),

              GameCard(
                title: 'Jogo da Memoria',
                difficulty: 'Hard',
                description:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.',
                image: AssetImage('assets/kawaii_polar.png'),
              ),

              GameCard(
                title: 'Forca',
                difficulty: 'Hard',
                description:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.',
                image: AssetImage('assets/kawaii_polar.png'),
              ),

              GameCard(
                title: 'Cruzadinha',
                difficulty: 'Hard',
                description:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.',
                image: AssetImage('assets/kawaii_polar.png'),
              ),

              GameCard(
                title: 'Caca Palavras',
                difficulty: 'Hard',
                description:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.',
                image: AssetImage('assets/kawaii_polar.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
