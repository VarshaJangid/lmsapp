import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '/values/dimensions.dart';

@immutable
class AppTextStyle {
  static const TextDecoration underline = TextDecoration.underline;
  static const TextDecoration lineThrough = TextDecoration.lineThrough;

  static const String _regular = "Glory-Regular";
  static const String _bold = "Glory-Bold";
  static const String _light = "Glory-SemiBold";
  static const String _medium = "Glory-Medium";

  final TextStyle heading1;
  final TextStyle alertText;
  final TextStyle alertTitle;
  final TextStyle hintText;
  final TextStyle errorStyle;
  final TextStyle lightHeading;
  final TextStyle lightText;
  final TextStyle timerTextActive;
  final TextStyle timerTextInActive;
  final TextStyle buttonText;
  final TextStyle screenTitle;
  final TextStyle borderStyle;
  final TextStyle gloryMedium;
  final TextStyle semiBold;
  final TextStyle gloryBold;
  final TextStyle gloryRegular;

  const AppTextStyle({
    required this.screenTitle,
    required this.timerTextActive,
    required this.timerTextInActive,
    required this.heading1,
    required this.lightHeading,
    required this.alertText,
    required this.alertTitle,
    required this.hintText,
    required this.errorStyle,
    required this.lightText,
    required this.buttonText,
    required this.borderStyle,
    required this.gloryMedium,
    required this.semiBold,
    required this.gloryBold,
    required this.gloryRegular,
  });

  AppTextStyle.getStyle()
      : screenTitle = const TextStyle(
          fontFamily: _regular,
          fontSize: Dimensions.s20,
          color: Colors.white,
          inherit: true,
        ),
        buttonText = const TextStyle(
//          fontFamily: _bold,
          fontSize: Dimensions.s24,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          inherit: false,
        ),
        timerTextActive = const TextStyle(
          fontFamily: _bold,
          fontSize: Dimensions.s16,
          color: Color(0xFF233249),
          inherit: false,
        ),
        timerTextInActive = const TextStyle(
          fontFamily: _bold,
          fontSize: Dimensions.s16,
          color: Color(0xFF233249),
          decoration: underline,
          inherit: false,
        ),
        lightHeading = const TextStyle(
          fontFamily: _regular,
          fontSize: Dimensions.s24,
          color: Colors.white,
          inherit: false,
        ),
        lightText = const TextStyle(
          fontFamily: _light,
          fontSize: Dimensions.s18,
          color: Colors.white,
          inherit: true,
        ),
        heading1 = const TextStyle(
          fontFamily: _regular,
          fontSize: Dimensions.s18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          inherit: false,
        ),
        alertTitle = TextStyle(
          fontFamily: _regular,
          fontSize: Dimensions.s24,
          fontWeight: FontWeight.bold,
          color: Colors.grey[400],
          inherit: false,
        ),
        alertText = const TextStyle(
          fontFamily: _light,
          fontSize: Dimensions.s16,
          color: Color(0xFF233249),
          inherit: false,
        ),
        hintText = const TextStyle(
          fontFamily: _regular,
          fontSize: Dimensions.s24,
          color: Colors.white,
          inherit: false,
        ),
        errorStyle = const TextStyle(
          fontFamily: _medium,
          fontSize: Dimensions.s11,
          color: Colors.red,
          inherit: false,
        ),
        borderStyle = const TextStyle(
          fontFamily: _medium,
          fontSize: Dimensions.s11,
          color: Colors.red,
          inherit: false,
        ),
        gloryMedium = const TextStyle(
          fontFamily: _medium,
          fontSize: Dimensions.s14,
          color: Colors.white,
          inherit: false,
        ),
        semiBold = const TextStyle(
          fontFamily: _light,
          fontSize: Dimensions.s24,
          color: Colors.white,
          inherit: false,
        ),
        gloryBold = const TextStyle(
          fontFamily: _bold,
          fontSize: Dimensions.s24,
          color: Colors.white,
          inherit: false,
        ),
        gloryRegular = const TextStyle(
          fontFamily: _regular,
          fontSize: Dimensions.s24-1,
          color: Color(0xFFa6a6a6),
          inherit: false,
        );
}
