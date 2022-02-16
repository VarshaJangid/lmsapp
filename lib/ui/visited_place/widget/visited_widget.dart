import '/ui/visited_detail_screen/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/values/app_constants.dart';
import '/components/rich_text.dart';
import '/values/app_routes.dart';
import '/values/dimensions.dart';
import '/theme/theme.dart';

class VisitedWidget extends StatelessWidget {
  final Map<String, dynamic> data;

  VisitedWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppRoutes.goto(context, DetailScreen(data: data)),
      child: Container(
        padding: const EdgeInsets.only(bottom: Dimensions.s10),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.s6),
          ),
          shadowColor: AppTheme.colors.primaryColor1,
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.s15),
            child: Row(
              children: [
                Container(
                  color: AppTheme.colors.primaryColor1.withOpacity(.2),
                  height: Dimensions.padding,
                  width: Dimensions.padding,
                  child: Center(
                    child: Text(
                      data['category'].toString().substring(0, 1).toUpperCase(),
                      style: AppTheme.textStyle.heading1.copyWith(fontSize: 25),
                    ),
                  ),
                ),
                const SizedBox(width: Dimensions.s12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichTextWidget(Constants.name, data["name"]),
                      RichTextWidget(Constants.phoneNumber, data["contact_number"]),
                      RichTextWidget(Constants.nextFollow, data["next_follow"]),
                      RichTextWidget(Constants.interest, data["interest"]),
                      RichTextWidget(Constants.address, data["address"]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}