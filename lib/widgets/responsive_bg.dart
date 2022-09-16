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
          Center(
            child: Container(
              constraints: BoxConstraints(
                maxHeight: 800,
                minWidth: 600
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/lines.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 560*0.72,
                minWidth: 560*0.5,
              ),
              width: MediaQuery.of(context).size.width/2.2,
              child: AspectRatio(
                aspectRatio: 560/638,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/rectangle_topleft.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 467*0.72,
                minWidth: 467*0.5,
              ),
              width: MediaQuery.of(context).size.width/2.2,
              child: AspectRatio(
                aspectRatio: 467/733,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/rectangle_bottomright.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
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
