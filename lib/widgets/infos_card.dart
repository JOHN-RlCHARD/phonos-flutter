import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class InfosCard extends StatelessWidget {
  const InfosCard({super.key, required this.backgroundColor, required this.iconColor, required this.label, required this.value, required this.svgIconPath});
  final Color backgroundColor;
  final Color iconColor;
  final String svgIconPath;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 80,
      width: MediaQuery.of(context).size.width/6,
      constraints: BoxConstraints(
        minWidth: 120,
        maxWidth: 150,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: backgroundColor,
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        spacing: 15,
       // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: SvgPicture.asset(
                svgIconPath,
                color: iconColor,
              ),
            ),
          ),
          //Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF757575),
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
