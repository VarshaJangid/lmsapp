import '/ui/sign_up/sign_up_view_model.dart';
import '/components/custom_button.dart';
import 'package:flutter/cupertino.dart';
import '/components/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:lottie/lottie.dart';
import '/values/app_constants.dart';
import '/values/app_assets.dart';
import '/values/dimensions.dart';
import '/theme/theme.dart';

class SignUpScreen extends StatelessWidget {

  final String uid;
  final String phone;
  SignUpScreen({required this.uid, required this.phone});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    return ViewModelBuilder<SignUpViewModel>.reactive(
      onModelReady: (model) => model.init(context),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            Constants.signUp,
            style: AppTheme.textStyle.screenTitle,
          ),
          elevation: 0.0,
          backgroundColor: AppTheme.colors.primaryColor1,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: Dimensions.s50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(Assets.loginThink,
                  height: MediaQuery.of(context).size.width * .45),
                AppTextField(
                  controller: model.nameEditingController,
                  labelText: Constants.fullName,
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  action: TextInputAction.next,
                ),
                const SizedBox(height: Dimensions.paddingS),
                AppTextField(
                  controller: model.emailEditingController,
                  labelText: Constants.emailAddress,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  action: TextInputAction.none,
                ),
                const SizedBox(height: Dimensions.paddingS),
                AppTextField(
                  controller: model.addressEditingController,
                  labelText: Constants.address,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  action: TextInputAction.done,
                ),
                const SizedBox(height: Dimensions.paddingXL),
                CustomButton(
                  callback: () => model.validation(context, uid, phone),
                  title: Constants.register,
                ),
                const SizedBox(height: Dimensions.paddingXL),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => SignUpViewModel(),
    );
  }
}