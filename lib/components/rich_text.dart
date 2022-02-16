import 'package:flutter/cupertino.dart';
import '/values/dimensions.dart';
import '/theme/theme.dart';

class RichTextWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  RichTextWidget(this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title+ " :  ",
        style: AppTheme.textStyle.alertText.copyWith(
            fontSize: Dimensions.s14, fontWeight: FontWeight.bold),
        children: <TextSpan>[
          TextSpan(text: subtitle,
              style: TextStyle(color: AppTheme.colors.primaryColor1,
                  fontSize: Dimensions.s14)),
        ],
      ),
    );
  }
}