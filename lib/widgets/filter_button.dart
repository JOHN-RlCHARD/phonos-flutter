import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String text;
  const FilterButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 7),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFF449BC0),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 11, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
