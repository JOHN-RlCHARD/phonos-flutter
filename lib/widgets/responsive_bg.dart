import 'package:flutter/material.dart';

class ResponsiveBackground extends StatelessWidget {
  final Widget child;
  const ResponsiveBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Color(0xFFDBEFFA),
      child: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height / 4.3,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lines.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            child: Image(
              image: AssetImage('rectangle_topleft.png'),
              height: MediaQuery.of(context).size.height / 2,
            ),
            top: 0,
            left: 0,
          ),
          Positioned(
            child: Image(
              image: AssetImage('rectangle_bottomright.png'),
              height: MediaQuery.of(context).size.height / 2,
            ),
            bottom: 0,
            right: 0,
          ),
          Center(
            child: child,
          ),
        ],
      ),
    );
  }
}
