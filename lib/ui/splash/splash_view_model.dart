import '/ui/greeting/greeting_screen.dart';
import 'package:flutter/cupertino.dart';
import '/ui/browse/browse_screen.dart';
import 'package:stacked/stacked.dart';
import '/values/app_routes.dart';
import '/services/auth.dart';

class SplashViewModel extends BaseViewModel {
  void init(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () async {
      await auth.setUserFromPreference();
      print("Auth uid ----------------- ${auth.currentUser.uid}");
      if (auth.currentUser.uid == '') {
        AppRoutes.makeFirst(context, GreetingScreen());
      } else {
        AppRoutes.makeFirst(context, BrowseScreen());
      }
    });
  }
}
