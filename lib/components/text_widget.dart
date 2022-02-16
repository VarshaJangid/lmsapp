import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/values/dimensions.dart';
import '/theme/theme.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  TextWidget(this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: title + " :  ",
            style: AppTheme.textStyle.alertText,
            children: <TextSpan>[
              TextSpan(text: subtitle,
                  style: TextStyle(color: AppTheme.colors.primaryColor1,
                      fontSize: Dimensions.s18,fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        const SizedBox(height: Dimensions.paddingS),
        const Divider(thickness: 1.5),
        const SizedBox(height: Dimensions.paddingS),
      ],
    );
  }
}
