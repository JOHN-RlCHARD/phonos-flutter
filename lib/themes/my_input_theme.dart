import 'package:flutter/material.dart';

class MyInputTheme {
  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: color,
        width: 0.7,
      ),
    );
  }

  TextStyle _buildTextStyle(Color color) {
    return TextStyle(
      color: color,
    );
  }

  InputDecorationTheme theme() => InputDecorationTheme(
        contentPadding: EdgeInsets.all(16),
        isDense: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: _buildBorder(Color(0xFF404040)),
        errorBorder: _buildBorder(Color(0xFFFF7A7A)),
        focusedBorder: _buildBorder(Color(0xFF449BC0)),
        border: _buildBorder(Colors.yellow),
        disabledBorder: _buildBorder(Colors.grey[400]!),
        suffixStyle: _buildTextStyle(Colors.black),
        counterStyle: _buildTextStyle(Colors.black),
        floatingLabelStyle: _buildTextStyle(Color(0xFF449BC0)),
        errorStyle: _buildTextStyle(Color(0xFFFF7A7A)),
        helperStyle: _buildTextStyle(Colors.cyan),
        hintStyle: _buildTextStyle(Colors.grey),
        labelStyle: _buildTextStyle(Colors.black),
        prefixStyle: _buildTextStyle(Colors.black),
      );
}
