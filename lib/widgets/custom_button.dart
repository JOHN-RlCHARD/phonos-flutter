import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Icon? icon;
  final Function()? onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: (icon == null)? 
      Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w600),
          )
      : Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          icon!,
          SizedBox(width: 7,),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(175, 50),
        primary: Color(0xFF449BC0),
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
