import 'package:flutter/material.dart';

AppColor appColors() => const AppColor.getColor();

class AppColor {
  final Color primaryColor1;
  final Color secondaryColorGreen;
  final Color lightBlack;
  final Color lightGrey;
  final Color blueGrey;

  const AppColor({
    required this.primaryColor1,
    required this.secondaryColorGreen,
    required this.lightBlack,
    required this.lightGrey,
    required this.blueGrey,
  });

  const AppColor.getColor()
        : primaryColor1 = const Color(0xFF0AC4BA),
        secondaryColorGreen = const Color(0xFF2BDA8E),
        lightBlack = const Color(0xFF323643),
        lightGrey = const Color(0xFFC5CCD6),
        blueGrey = const Color(0xFF9DA3B4);
}
