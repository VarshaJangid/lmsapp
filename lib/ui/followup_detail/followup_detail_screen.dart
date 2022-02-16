import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms/values/app_assets.dart';
import 'package:lottie/lottie.dart';
import '/components/text_widget.dart';
import '/values/app_constants.dart';
import '/values/app_method.dart';
import '/values/dimensions.dart';
import '/theme/theme.dart';

class FollowUpDetailScreen extends StatelessWidget {
  final Map<String, dynamic> data;

  FollowUpDetailScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          Constants.followUpDetails,
          style: AppTheme.textStyle.screenTitle,
        ),
        elevation: 0.0,
        backgroundColor: AppTheme.colors.primaryColor1,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
          margin: const EdgeInsets.symmetric(
              horizontal: Dimensions.s20, vertical: Dimensions.s20),
          child: Column(
            children: [
              Lottie.asset(Assets.callJSON,
                  height: Dimensions.padding*2.5),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: Constants.phoneNumber + " :  ",
                      style: AppTheme.textStyle.alertText,
                      children: <TextSpan>[
                        TextSpan(
                            text: data["contact_number"],
                            style: TextStyle(
                                color: AppTheme.colors.primaryColor1,
                                fontSize: Dimensions.s18,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () => makingPhoneCall(data["contact_number"]),
                      child: Icon(Icons.call, size: Dimensions.s30,color: AppTheme.colors.primaryColor1))
                ],
              ),
              const SizedBox(height: Dimensions.s6),
              const Divider(thickness: 1.5),
              const SizedBox(height: Dimensions.s10),
              TextWidget(Constants.name, data["name"]),
              TextWidget(Constants.date, data["date"]),
              TextWidget(Constants.time, data["time"]),
              TextWidget(Constants.message, data["message"]),
            ],
          )),
    );
  }
}