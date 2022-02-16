import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/values/dimensions.dart';
import '/theme/theme.dart';

class TextLineWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  TextLineWidget(this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: Dimensions.paddingS),
        RichText(
          text: TextSpan(
            text: title + " :  ",
            style: AppTheme.textStyle.alertText,
            children: <TextSpan>[
              TextSpan(text: subtitle,
                  style: TextStyle(color: AppTheme.colors.primaryColor1,
                      fontSize: Dimensions.s18)),
            ],
          ),
        ),
        const SizedBox(height: Dimensions.paddingS),
        const Divider(thickness: 1.5),
      ],
    );
  }
}
