import 'package:pin_code_text_field/pin_code_text_field.dart';
import '/components/app_textfield.dart';
import '/components/custom_button.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '/values/app_constants.dart';
import 'package:lottie/lottie.dart';
import '/values/dimensions.dart';
import '/values/app_assets.dart';
import 'login_view_model.dart';
import '/theme/theme.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return ViewModelBuilder<LoginViewModel>.reactive(
      onModelReady: (model) => model.init(context),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: false,
            title: Text(
              Constants.login,
              style: AppTheme.textStyle.screenTitle,
            ),
            elevation: 0.0,
            backgroundColor: AppTheme.colors.primaryColor1,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          key: _scaffoldKey,
          body: Container(
            child: model.showLoading
                ? const Center(
                    child: CircularProgressIndicator(color: Color(0xFF0AC4BA),),
                  )
                : model.currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                    ? getMobileFormWidget(context, model)
                    : getOtpFormWidget(context, model),
            padding: const EdgeInsets.all(Dimensions.s16),
          )),
      viewModelBuilder: () => LoginViewModel(),
    );
  }

  // Mobile Number Widget
  getMobileFormWidget(BuildContext context, LoginViewModel model) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: Dimensions.s50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: Dimensions.paddingXXL),
              Lottie.asset(
                Assets.loginJSON,
                height: MediaQuery.of(context).size.width * .65,
              ),
              AppTextField(
                controller: model.phoneController,
                labelText: Constants.phoneNumber,
                keyboardType: TextInputType.phone,
                obscureText: false,
                action: TextInputAction.done,
              ),
              const SizedBox(height: Dimensions.paddingXL),
              CustomButton(
                callback: () => model.validation(context),
                title: Constants.login,
              ),
              const SizedBox(height: Dimensions.paddingL),
            ],
          ),
        ),
      ),
    );
  }

  // OTP Widget
  getOtpFormWidget(BuildContext context, LoginViewModel model) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: Dimensions.s10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: Dimensions.paddingXXL),
            Lottie.asset(
              Assets.loginJSON,
              height: MediaQuery.of(context).size.width * .65,
            ),
            PinCodeTextField(
              autofocus: true,
              controller: model.otpController,
              defaultBorderColor: AppTheme.colors.primaryColor1.withOpacity(.5),
              highlightPinBoxColor: AppTheme.colors.primaryColor1,
              maxLength: 6,
              hasTextBorderColor: AppTheme.colors.primaryColor1,
              onDone: (text) {},
              pinBoxWidth: 45,
              pinBoxHeight: 64,
              pinBoxDecoration: ProvidedPinBoxDecoration.roundedPinBoxDecoration,
              pinTextStyle: const TextStyle(fontSize: Dimensions.s16),
              pinTextAnimatedSwitcherTransition: ProvidedPinBoxTextAnimation.scalingTransition,
              pinTextAnimatedSwitcherDuration: const Duration(milliseconds: 300),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: Dimensions.paddingXL),
            CustomButton(
              callback: () => model.verifyOtp(context),
              title: Constants.verify,
            ),
            const SizedBox(height: Dimensions.paddingXL),
          ],
        ),
      ),
    );
  }
}
