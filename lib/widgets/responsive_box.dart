import 'package:flutter/material.dart';

class ResponsiveBox extends StatelessWidget {
  final List<Widget> children;
  final Color color1;
  final Color color2;

  const ResponsiveBox({super.key, required this.children, required this.color1, required this.color2});

  @override
  Widget build(BuildContext context) {
    return Container(
      //constraints: BoxConstraints(maxWidth: 350),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 0),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.1],
          colors: [
            color1,
            color2
          ]
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
        child: Container(
          // constraints: BoxConstraints(maxWidth: 1100),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.vertical,
            children: children,
          )
        ),
      ),
    );
  }
}
