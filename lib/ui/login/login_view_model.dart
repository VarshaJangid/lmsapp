import 'package:firebase_auth/firebase_auth.dart';
import '/services/firebase.dart';
import '/ui/sign_up/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/ui/browse/browse_screen.dart';
import 'package:stacked/stacked.dart';
import '/values/app_constants.dart';
import '/values/app_routes.dart';
import '/values/app_method.dart';
import '/services/auth.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginViewModel extends BaseViewModel {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  void init(BuildContext context) {}

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId = '';
  bool showLoading = false;

  void signInWithPhoneAuthCredential(
      BuildContext context, PhoneAuthCredential phoneAuthCredential) async {
    showLoading = true;
    notifyListeners();
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      showLoading = false;
      notifyListeners();
      if (authCredential.user != null) {
        userStatus
            .where(Constants.uid, isEqualTo: _auth.currentUser!.uid)
            .get()
            .then((documentSnapshot) {
          if (documentSnapshot.docs.isEmpty) {
            flutterToast(Constants.completeYourProfile, Colors.green);
            AppRoutes.goto(context, SignUpScreen(
                uid: _auth.currentUser!.uid,
                phone: '${_auth.currentUser!.phoneNumber}'));
          } else {
            flutterToast(Constants.successfullyLogged, Colors.green);
            user
                .where(Constants.uid, isEqualTo: _auth.currentUser!.uid)
                .get()
                .then((documentSnapshot) {
              documentSnapshot.docs.map((e) {
                auth.setUser(
                    uid: e.get('uid'),
                    email: e.get('email'),
                    mobileNo: e.get("number"),
                    name: e.get("name"),
                    address: e.get('address'));
                auth.updateUserInSharedPrefs(e.get('uid'), e.get('email'),
                    e.get("number"), e.get("name"), e.get('address'));
                auth.setUserFromPreference();
                print("Email   -------------- ${auth.currentUser.email}");
                print("uid     -------------- ${auth.currentUser.uid}");
                print("Mobile  -------------- ${auth.currentUser.mobileNo}");
                print("name    -------------- ${auth.currentUser.name}");
                print("address -------------- ${auth.currentUser.address}");
              }).toList();
            });
            AppRoutes.makeFirst(context, BrowseScreen());
          }
        });
      }
    } on FirebaseAuthException catch (e) {
      showLoading = false;
      notifyListeners();
      flutterToast(e.message.toString(), Colors.red);
    }
  }

  // Verify OTP
  verifyOtp(BuildContext context) async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpController.text);

    //Phone Auth
    signInWithPhoneAuthCredential(context, phoneAuthCredential);
  }

  // Validation for Mobile Number
  validation(BuildContext context) {
    if (phoneController.text.length != 10) {
      flutterToast(Constants.pleaseEnterAValidNumber, Colors.red);
    } else {
      loginWithNumber(context);
    }
  }

  // Login with Number
  loginWithNumber(BuildContext context) async {
    showLoading = true;
    notifyListeners();
    await _auth.verifyPhoneNumber(
      phoneNumber: '+91' + phoneController.text,
      verificationCompleted: (phoneAuthCredential) async {
        showLoading = false;
        notifyListeners();
      },
      verificationFailed: (verificationFailed) async {
        showLoading = false;
        notifyListeners();
        flutterToast(verificationFailed.message.toString(), Colors.red);
      },
      codeSent: (verificationId, resendingToken) async {
        showLoading = false;
        currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
        this.verificationId = verificationId;
        notifyListeners();
      },
      codeAutoRetrievalTimeout: (verificationId) async {},
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    otpController.dispose();
    super.dispose();
  }
}
