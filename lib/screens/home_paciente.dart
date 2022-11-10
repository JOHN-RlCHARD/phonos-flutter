import 'package:app_fono/screens/games/games_mobile.dart';
import 'package:app_fono/screens/profile.dart';
import 'package:app_fono/widgets/custom_button.dart';
import 'package:app_fono/widgets/responsive_bg.dart';
import 'package:app_fono/widgets/responsive_box.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar.dart';
import 'games/games.dart';

class HomePaciente extends StatelessWidget {
  const HomePaciente({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MyAppBar(),
      ),
      body: ResponsiveBackground(
        child: Center(
          child: ResponsiveBox(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(
                  'assets/fono_profile.jpg',
                ),
              ),
              Text(
                'Nome',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  text: 'Meu Perfil',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => ProfileScreen())));
                  }),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  text: 'Jogos',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => Games())));
                  }),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  text: 'Consultas',
                  onPressed: () {
                    //@TODO
                  }),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {},
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Sair',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
