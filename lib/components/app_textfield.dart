import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/theme/theme.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextInputAction action;

  AppTextField(
      {required this.controller,
      required this.labelText,
      required this.keyboardType,
      required this.obscureText,
      required this.action,
      });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: const Color(0xFF979797),
      keyboardType: keyboardType,
      textInputAction: action,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: AppTheme.colors.lightGrey),
          focusColor: Colors.black,
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF979797))),
          border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF979797))),
          focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF979797))),
          disabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF979797))),
          errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF979797))),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppTheme.colors.primaryColor1))),
    );
  }
}
