import 'package:app_fono/widgets/game_card.dart';
import 'package:app_fono/widgets/responsive_bg.dart';
import 'package:app_fono/widgets/responsive_box.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class GamesDesktop extends StatefulWidget {
  const GamesDesktop({super.key});

  @override
  State<GamesDesktop> createState() => _GamesDesktopState();
}

class _GamesDesktopState extends State<GamesDesktop> {
  final games = [
    1, 2
  ];


  @override
  Widget build(BuildContext context) {

    return ResponsiveBackground(
      child: Center(
        child: ResponsiveBox(
          color1: Color(0xFFDBEFFA),
          color2: Colors.white,
          children: [
            CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(
                  'assets/fono_profile.jpg',
                ),
              ),

              SizedBox(height: 50,),

              Container(
                width: 360,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Procurar jogos',
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.3)
                  ),
                  textInputAction: TextInputAction.search,
                ),
              ),

              SizedBox(height: 50,),

              Row(
                children: [
                  GameCard(
                    title: 'Forca',
                    difficulty: 'Easy',
                    description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.',
                    image: AssetImage('assets/kawaii_polar.png'),
                  ),
                  SizedBox(width: 30,),
                  GameCard(
                    title: 'Forca',
                    difficulty: 'Easy',
                    description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.',
                    image: AssetImage('assets/kawaii_polar.png'),
                  ),
                  SizedBox(width: 30,),
                  GameCard(
                    title: 'Forca',
                    difficulty: 'Easy',
                    description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.',
                    image: AssetImage('assets/kawaii_polar.png'),
                  ),
                ],
              ),
              

          ],
        ),
      )
    );
  }
}