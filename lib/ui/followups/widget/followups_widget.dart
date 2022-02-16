import '/ui/followup_detail/followup_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/components/rich_text.dart';
import '/values/app_constants.dart';
import '/values/app_assets.dart';
import '/values/app_routes.dart';
import '/values/dimensions.dart';
import '/theme/theme.dart';

class FollowUpsWidget extends StatelessWidget {
  final Map<String, dynamic> data;

  FollowUpsWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppRoutes.goto(context, FollowUpDetailScreen(data: data)),
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
                height: Dimensions.s90,
                width: Dimensions.s90,
                padding: const EdgeInsets.all(30),
                child: Image.asset(
                  Assets.followUp,
                ),
              ),
              const SizedBox(width: Dimensions.s12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichTextWidget(
                        Constants.name, data["name"].toString().toUpperCase()),
                    RichTextWidget(
                        Constants.phoneNumber, data["contact_number"]),
                    RichTextWidget(Constants.date, data["date"]),
                    RichTextWidget(Constants.time, data["time"]),
                    RichTextWidget(Constants.message, data["message"]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
