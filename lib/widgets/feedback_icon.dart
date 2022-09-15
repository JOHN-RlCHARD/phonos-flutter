import 'package:flutter/material.dart';

class FeedbackIcon extends StatefulWidget {
  bool _isError = false;

  FeedbackIcon(this._isError);

  bool get isError => _isError;

  @override
  State<FeedbackIcon> createState() => _FeedbackIconState();
}

class _FeedbackIconState extends State<FeedbackIcon> {
  @override
  Widget build(BuildContext context) {
    Widget out;

    debugPrint("Rebuilding ErrorWidget");
    widget.isError
        ? out = new Icon(
            Icons.error,
            color: Color(0xFFFF7A7A),
          )
        : out = new Icon(null);

    return out;
  }
}
