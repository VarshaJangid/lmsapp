import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/services/firebase.dart';
import '/components/popup_widget.dart';
import 'package:stacked/stacked.dart';
import '/values/app_constants.dart';
import '/values/dimensions.dart';
import '/values/app_method.dart';
import '/values/app_routes.dart';
import '/services/auth.dart';
import '/theme/theme.dart';

class AddDataViewModel extends BaseViewModel {
  final companyNameController = TextEditingController();
  final categoryController = TextEditingController();
  final addressController = TextEditingController();
  final addressSecondController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final emailController = TextEditingController();
  final contactNumberController = TextEditingController();
  final nameController = TextEditingController();
  final remarkController = TextEditingController();
  final nextFollowController = TextEditingController();
  final averageUseController = TextEditingController();
  final interestController = TextEditingController();
  final otherController = TextEditingController();
  String category = '';
  String interest = '';
  String selectDate = '';

  void init(BuildContext context) {}

  validation(BuildContext context) {
    if (companyNameController.text == '') {
      flutterToast("Company Name Is Empty", Colors.red);
    } else if (categoryController.text == '') {
      flutterToast("Category Is Empty", Colors.red);
    } else if (addressController.text == '') {
      flutterToast("Address Is Empty", Colors.red);
    } else if (emailController.text == '') {
      flutterToast("Email Is Empty", Colors.red);
    } else if (contactNumberController.text == '') {
      flutterToast("Contact Number Is Empty", Colors.red);
    } else if (nameController.text == '') {
      flutterToast("Name Is Empty", Colors.red);
    } else if (remarkController.text == '') {
      flutterToast("Remark Is Empty", Colors.red);
    } else if (averageUseController.text == '') {
      flutterToast("Average Use Is Empty", Colors.red);
    } else if (interestController.text == '') {
      flutterToast("Interest Is Empty", Colors.red);
    }  else {
      interest != Constants.no
      ? nextFollowController.text == '' ? flutterToast("Next Follow Up Is Empty", Colors.red)
    : addData(context)
          : addData(context);
    }
  }

  // Select Follow Up Date
  nextFollowUp(BuildContext context) async {
    DatePicker.showDatePicker(context,
        theme: DatePickerTheme(
          containerHeight: 210.0,
          doneStyle: AppTheme.textStyle.heading1.copyWith(color: AppTheme.colors.primaryColor1),
          cancelStyle: AppTheme.textStyle.heading1.copyWith(color: AppTheme.colors.primaryColor1),
          itemStyle: AppTheme.textStyle.heading1,
        ),
        showTitleActions: true,
        minTime: DateTime.now(),
        maxTime: DateTime(2050, 12, 31), onConfirm: (date) {
      selectDate = '${date.day}-${date.month}-${date.year}';
      nextFollowController.text = selectDate;
      notifyListeners();
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

  // Add Visit Details
  addData(BuildContext context) {
    CollectionReference details = visitDetails;
    details.add({
      'uid': auth.currentUser.uid,
      'current_time': DateTime.now().microsecondsSinceEpoch,
      'company_name': companyNameController.text,
      'category': categoryController.text+otherController.text,
      'address': addressController.text,
      'address_2': addressSecondController.text,
      'city': "Jaipur",
      // 'city': cityController.text,
      // 'state': stateController.text,
      'state': "Rajasthan",
      'email': emailController.text,
      'contact_number': contactNumberController.text,
      'name': nameController.text,
      'remark': remarkController.text,
      'next_follow': nextFollowController.text,
      'average_daily_use': averageUseController.text,
      'interest': interestController.text,
    });
    AppRoutes.dismiss(context);
    flutterToast(Constants.successfullyAdded, AppTheme.colors.primaryColor1);
  }

// Choose Categories
  buildCategoryDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ListView(
            padding: const EdgeInsets.all(Dimensions.s20),
            children: [
              Center(
                child: Text(
                  Constants.selectCategory,
                  style: AppTheme.textStyle.screenTitle.copyWith(
                      color: AppTheme.colors.primaryColor1,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: Dimensions.s20,),
              PopUpWidget(title: Constants.hotel, model: this,),
              PopUpWidget(title: Constants.restaurants, model: this,),
              PopUpWidget(title: Constants.hostel, model: this,),
              PopUpWidget(title: Constants.dhaba, model: this,),
              PopUpWidget(title: Constants.hospital, model: this,),
              PopUpWidget(title: Constants.marriage, model: this,),
              PopUpWidget(title: Constants.party, model: this,),
              PopUpWidget(title: Constants.canteen, model: this,),
              PopUpWidget(title: Constants.other, model: this,),
            ],
          );
        });
  }

  buildInterestDialog(BuildContext context) {
    return showInterestList(
      context: context,
    );
  }

  void showInterestList({
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(
            Constants.interest,
            style: AppTheme.textStyle.heading1.copyWith(
                color: AppTheme.colors.primaryColor1, fontSize: Dimensions.s20),
          ),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.s5),
          ),
          content: Row(
            children: [
              Radio(
                activeColor: AppTheme.colors.primaryColor1,
                value: 0,
                groupValue: _radioValue1,
                onChanged: (value) {
                  handleRadioValueChange1(context, 0);
                  notifyListeners();
                },
              ),
              const Text(
                Constants.yes,
                style: TextStyle(fontSize: Dimensions.s16),
              ),
              Radio(
                activeColor: AppTheme.colors.primaryColor1,
                value: 1,
                groupValue: _radioValue1,
                onChanged: (value) {
                  handleRadioValueChange1(context, 1);
                  notifyListeners();
                },
              ),
              const Text(
                Constants.moderate,
                style: TextStyle(
                  fontSize: Dimensions.s16,
                ),
              ),
              Radio(
                value: 2,
                activeColor: AppTheme.colors.primaryColor1,
                groupValue: _radioValue1,
                onChanged: (value) {
                  handleRadioValueChange1(context, 2);
                  notifyListeners();
                },
              ),
              const Text(
                Constants.no,
                style: TextStyle(fontSize: Dimensions.s16),
              ),
            ],
          ),
        );
      },
      barrierDismissible: false,
    );
  }

  int _radioValue1 = -1;

  void handleRadioValueChange1(BuildContext context, int? value) {
    notifyListeners();
    _radioValue1 = value!;
    notifyListeners();
    switch (_radioValue1) {
      case 0:
        _radioValue1 = 0;
        flutterToast(Constants.yes, AppTheme.colors.primaryColor1);
        break;
      case 1:
        _radioValue1 = 1;
        flutterToast(Constants.moderate, AppTheme.colors.primaryColor1);
        break;
      case 2:
        _radioValue1 = 2;
        flutterToast(Constants.no, AppTheme.colors.primaryColor1);
        break;
    }
    AppRoutes.dismiss(context);
    interest = _radioValue1 == 0
        ? Constants.yes
        : _radioValue1 == 1
            ? Constants.moderate
            : Constants.no;
    interestController.text = interest;
    notifyListeners();
  }

  @override
  void dispose() {
    companyNameController.dispose();
    categoryController.dispose();
    addressController.dispose();
    addressSecondController.dispose();
    cityController.dispose();
    stateController.dispose();
    emailController.dispose();
    contactNumberController.dispose();
    nameController.dispose();
    remarkController.dispose();
    nextFollowController.dispose();
    averageUseController.dispose();
    interestController.dispose();
    otherController.dispose();
    super.dispose();
  }
}
