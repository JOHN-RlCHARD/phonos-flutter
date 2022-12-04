import 'package:app_fono/screens/consultas.dart';
import 'package:app_fono/screens/home.dart';
import 'package:app_fono/screens/profile.dart';
import 'package:app_fono/widgets/custom_button.dart';
import 'package:app_fono/widgets/responsive_bg.dart';
import 'package:app_fono/widgets/responsive_box.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar.dart';
import 'games.dart';

class HomePaciente extends StatelessWidget {
  final String avatar;

  const HomePaciente({super.key, required this.avatar});

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
              Container(
                width: 80,
                child: Image(image: AssetImage(avatar,),)
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Fulaninho',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  icon: Icon(Icons.person),
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
                  icon: Icon(Icons.sports_esports),
                  text: 'Jogos',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => Games())));
                  }),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  icon: Icon(Icons.calendar_month),
                  text: 'Consultas',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => Consultas())));
                  }),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (builder) => HomePage()),
                    (route) => false,
                  );
                },
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
