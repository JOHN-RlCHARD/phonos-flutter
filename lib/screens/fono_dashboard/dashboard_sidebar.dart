import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashBoardSidebar extends StatelessWidget {
  final double avatarRadius;
  const DashBoardSidebar({super.key, required this.avatarRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
          color: Color(0xFFDBEFFA)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: CircleAvatar(
          radius: avatarRadius,
          backgroundColor: Colors.white,
          child: SvgPicture.asset(
            'assets/person_icon.svg',
            color: Color(0xFFDBEFFA),
          ),
        ),
      ),
    );
  }
}
