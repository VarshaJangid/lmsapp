import 'package:flutter/material.dart';
import '/values/dimensions.dart';
import '/theme/theme.dart';

class SideDrawerItemWidget extends StatelessWidget {
  final IconData imageName;
  final String name;

  SideDrawerItemWidget({
    required this.imageName,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        height: Dimensions.paddingXXL,
        child: Row(
          children: <Widget>[
            const SizedBox(
              width: Dimensions.paddingM,
            ),
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(Dimensions.paddingXXL)),
              height: Dimensions.s40,
              width: Dimensions.s40,
              child: Icon(imageName, color: AppTheme.colors.primaryColor1.withOpacity(.7),),
            ),
            const SizedBox(
              width: Dimensions.paddingXL,
            ),
            Text(
              name,
              style: AppTheme.textStyle.lightText
                  .copyWith(fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
