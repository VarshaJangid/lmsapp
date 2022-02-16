import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/services/firebase.dart';
import '/ui/browse/browse_screen.dart';
import 'package:stacked/stacked.dart';
import '/values/app_constants.dart';
import '/values/app_routes.dart';
import '/values/app_method.dart';
import '/services/auth.dart';
import '/theme/theme.dart';

class SignUpViewModel extends BaseViewModel {
  final emailEditingController = TextEditingController();
  final nameEditingController = TextEditingController();
  final addressEditingController = TextEditingController();

  void init(BuildContext context) {}

  validation(BuildContext context, String uid, String phone) {
    if (emailEditingController.text.isEmpty ||
        nameEditingController.text.isEmpty ||
        addressEditingController.text.isEmpty) {
      flutterToast(Constants.enterValidValues, Colors.red);
    } else {
      registerUser(context, uid, phone);
    }
  }

  //Register User
  void registerUser(BuildContext context, String uid, String phone) async {
    auth.setUser(
      uid: uid,
      email: emailEditingController.text,
      mobileNo: phone,
      name: nameEditingController.text,
      address: addressEditingController.text,
    );
    auth.updateUserInSharedPrefs(
      uid,
      emailEditingController.text,
      phone,
      nameEditingController.text,
      addressEditingController.text,
    );
    auth.setUserFromPreference();
    user.doc(auth.currentUser.mobileNo).set({
      'uid': uid,
      'number': phone,
      'name': nameEditingController.text,
      'email': emailEditingController.text,
      'address': addressEditingController.text,
    });
    userStatus.doc(uid)
        .set({'uid': uid, 'contact_number': phone, 'status': 'Registered'});
    print("Email   -------------- ${auth.currentUser.email}");
    print("uid     -------------- ${auth.currentUser.uid}");
    print("Mobile  -------------- ${auth.currentUser.mobileNo}");
    print("Name    -------------- ${auth.currentUser.name}");
    print("Address -------------- ${auth.currentUser.address}");
    flutterToast(Constants.successfullyLogged, AppTheme.colors.primaryColor1);
    AppRoutes.makeFirst(context, BrowseScreen());
  }

  @override
  void dispose() {
    nameEditingController.dispose();
    emailEditingController.dispose();
    addressEditingController.dispose();
    super.dispose();
  }
}