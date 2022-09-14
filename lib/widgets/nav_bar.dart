import 'package:app_fono/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 40,
            child: Image.asset('logo.png')
            ),
          Wrap(
            spacing: 30,
            children: [
              NavBarItem(text: 'Sobre Nós'),
              NavBarItem(text: 'FAQ'),
              NavBarItem(text: 'Serviços'),
              NavBarItem(text: 'Conta'),
            ],
          ),
          CustomButton(text: 'Faça Login')
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final String text;

  const NavBarItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),

    );
  }
}