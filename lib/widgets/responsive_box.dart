import 'package:flutter/material.dart';

class ResponsiveBox extends StatelessWidget {
  final List<Widget> children;

  const ResponsiveBox({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 350),
      padding: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}