import '/values/app_method.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import '/ui/login/login_screen.dart';
import '/values/app_constants.dart';
import '/values/app_routes.dart';
import '/model/user.dart';

final auth = Auth();

class Auth {
  UserDetails _user = UserDetails();

  UserDetails get currentUser {
    return _user;
  }

  Future<void> setUser(
      {String uid = '',
      String email = '',
      String mobileNo = '',
      String name = '',
      String address = ','}) async {
    if (uid != null) {
      _user = UserDetails.fromEmail(uid, email, mobileNo, name, address);
    }
  }

  Future<void> setUserFromPreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _user = UserDetails();
    _user.uid = prefs.getString(Constants.uid) ?? "";
    _user.email = prefs.getString(Constants.email) ?? "";
    _user.mobileNo = prefs.getString(Constants.phone) ?? "";
    _user.name = prefs.getString(Constants.name) ?? "";
    _user.address = prefs.getString(Constants.address) ?? "";

    await setUser(
      uid: _user.uid,
      email: _user.email,
      name: _user.name,
      mobileNo: _user.mobileNo,
      address: _user.address,
    );
    logger.w(
        'setUserFromPreference uid -------- ${prefs.getString(Constants.uid)}');
  }

  Future<void> updateTokenInSharedPrefs(String uid) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constants.uid, uid);
  }

  Future<void> updateUserInSharedPrefs(String uid, String email,
      String mobileNo, String name, String address) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constants.uid, uid);
    prefs.setString(Constants.email, email);
    prefs.setString(Constants.phone, mobileNo);
    prefs.setString(Constants.name, name);
    prefs.setString(Constants.address, address);

    logger.wtf(
        'updateUserInSharedPrefs uid -------- ${prefs.getString(Constants.uid)}');
  }

  Future<void> removeUserFromSharedPrefs(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    logger.e('-------- removeUserFromSharedPrefs --------');
    AppRoutes.makeFirst(context, LoginScreen());
  }
}
