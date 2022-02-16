
import 'package:flutter/material.dart';
import '/theme/theme_color.dart';
import '/theme/theme_text_style.dart';

class AppTheme {
  static AppColor get colors {
    return const AppColor.getColor();
  }

  static AppTextStyle get textStyle {
    return AppTextStyle.getStyle();
  }
}
