import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/values/dimensions.dart';
import '/theme/theme.dart';

class CustomButton extends StatelessWidget {
  final GestureTapCallback callback;
  final String title;

  CustomButton({required this.callback, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback(),
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        height: Dimensions.s50,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              AppTheme.colors.primaryColor1,
              AppTheme.colors.secondaryColorGreen
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(6.0),
            boxShadow: [
              BoxShadow(
                  color: AppTheme.colors.primaryColor1.withOpacity(0.1),
                  blurRadius: 65.0,
                  offset: const Offset(0.0, 15.0))
            ]),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: Dimensions.s18,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
