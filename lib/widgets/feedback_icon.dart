import 'package:flutter/material.dart';

class FeedbackIcon extends StatefulWidget {
  bool ?opt;
  FeedbackIcon(this.opt);

  @override
  State<FeedbackIcon> createState() => _FeedbackIconState();
}

class _FeedbackIconState extends State<FeedbackIcon> {
  @override
  Widget build(BuildContext context) {
    Widget out;
    out = const Icon(null);
    
    if (widget.opt==false) {
      out = const Icon(
        Icons.error,
        color: Color(0xFFFF7A7A),
      );
    } else if (widget.opt==true) {
      out = const Icon(
        Icons.check_circle,
        color: Color(0xFF81C880),
      );
    }
    return out;
  }
}
