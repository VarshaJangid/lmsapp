import '/components/custom_button.dart';
import 'package:flutter/material.dart';
import '/ui/login/login_screen.dart';
import '/values/app_constants.dart';
import '/values/dimensions.dart';
import '/values/app_routes.dart';
import '/values/app_assets.dart';
import '/theme/theme.dart';

class GreetingScreen extends StatelessWidget {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[
      AppTheme.colors.primaryColor1,
      AppTheme.colors.secondaryColorGreen
    ],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, Dimensions.padding*2, Dimensions.paddingXXL));

  GreetingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: Dimensions.paddingXL),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Constants.yourHome,
                style: TextStyle(
                    fontSize: Dimensions.s24,
                    color: AppTheme.colors.lightBlack,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                Constants.greener,
                style: TextStyle(
                    fontSize: Dimensions.s24,
                    foreground: Paint()..shader = linearGradient,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Text(
            Constants.enjoyTheExperience,
            style: TextStyle(
                color: AppTheme.colors.lightGrey, fontSize: Dimensions.s17),
          ),
          const SizedBox(height: Dimensions.paddingS),
          Image(
            image: const AssetImage(
              Assets.welcome,
            ),
            width: MediaQuery.of(context).size.width * .80,
          ),
          const SizedBox(height: Dimensions.paddingXL),
          CustomButton(
              callback: () => AppRoutes.goto(context, LoginScreen()),
              title: Constants.login),
          const SizedBox(height: Dimensions.paddingS*2),
          Text(
            Constants.termsOfService,
            style: TextStyle(
                color: AppTheme.colors.blueGrey, fontSize: Dimensions.s15),
          )
        ],
      ),
    );
  }
}