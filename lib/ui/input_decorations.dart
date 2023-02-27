import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration textFormFieldID(
      {required String hintText,
      required String labelText,
      IconData? prefixIcon}) {
    return InputDecoration(
        labelText: labelText,
        hintText: hintText,
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.lime, width: 1)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.lime, width: 2)),
        prefixIcon: prefixIcon != null 
          ? Icon( prefixIcon, color: Colors.lime[800] )
          : null
        );
  }
}
