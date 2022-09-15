import 'package:flutter/material.dart';

class MyInputTheme {
  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
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
        contentPadding: const EdgeInsets.all(16),
        isDense: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: _buildBorder(Color(0xFF404040)),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: Color(0xFFFF3838),
            width: 1,),
          ),
        errorBorder: _buildBorder(Color(0xFFFF7A7A)),
        focusedBorder: _buildBorder(Color(0xFF449BC0)),
        border: _buildBorder(Colors.yellow),
        disabledBorder: _buildBorder(Colors.grey[400]!),
        suffixStyle: _buildTextStyle(Colors.black),
        counterStyle: _buildTextStyle(Colors.black),
        floatingLabelStyle: MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
          final Color color;
          if (states.contains(MaterialState.error)) {
            color=Color(0xFFFF7A7A);
          } else if (states.contains(MaterialState.focused)) {
            color=Color(0xFF449BC0);
          } else {
            color=Colors.black;
          }
          return _buildTextStyle(color);
        }),
        errorStyle: _buildTextStyle(Color(0xFFFF7A7A)),
        helperStyle: _buildTextStyle(Colors.cyan),
        hintStyle: _buildTextStyle(Colors.grey),
        labelStyle: MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
          final Color color = states.contains(MaterialState.error)
              ? const Color(0xFFFF7A7A)
              : Colors.black;
          return _buildTextStyle(color);
        }),
        prefixStyle: _buildTextStyle(Colors.black),
        suffixIconColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
          final Color color;
          if (states.contains(MaterialState.error)) {
            color=Color(0xFFFF7A7A);
          } else if (states.contains(MaterialState.focused)) {
            color=Color(0xFF449BC0);
          } else {
            color=Colors.black;
          }
          return color;
        }),
      );
}
