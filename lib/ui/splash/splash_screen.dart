import '/ui/splash/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:lottie/lottie.dart';
import '/values/app_assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return ViewModelBuilder<SplashViewModel>.reactive(
      onModelReady: (model) => model.init(context),
      builder: (context, model, child) => Scaffold(
        body: Container(
          padding: const EdgeInsets.only(top: 120, bottom: 20),
          color: Colors.white,
          child: Center(
            child: Lottie.asset(Assets.splashLottieJson,
              height: 240),
          ),
        ),
      ),
      viewModelBuilder: () => SplashViewModel(),
    );
  }
}
