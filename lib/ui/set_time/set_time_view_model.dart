import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/services/firebase.dart';
import 'package:stacked/stacked.dart';
import '/values/app_constants.dart';
import '/values/app_method.dart';
import '/values/app_routes.dart';
import '/services/auth.dart';
import '/theme/theme.dart';

class SetTimeViewModel extends BaseViewModel {
  final messageController = TextEditingController();
  String selectDate = Constants.notSet;
  String selectTime = Constants.notSet;
  QuerySnapshot? snapshot;
  String contactNumber = '';
  String name = '';

  void init(BuildContext context, String number, String displayName) {
    contactNumber = number;
    name = displayName;
  }

  // Validation
  validation(BuildContext context) {
    if (selectDate == Constants.notSet || selectTime == Constants.notSet) {
      flutterToast(Constants.setTimeDate, Colors.red);
    } else if (messageController.text.isEmpty) {
      flutterToast(Constants.enterAMessage, Colors.red);
    } else {
      addData(context);
    }
  }

  //Select Date
  datePicker(BuildContext context) async {
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
      notifyListeners();
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

  //Select Time
  timePicker(BuildContext context) {
    DatePicker.showTimePicker(context,
        theme: DatePickerTheme(
          containerHeight: 210.0,
          doneStyle: AppTheme.textStyle.heading1.copyWith(color: AppTheme.colors.primaryColor1),
          cancelStyle: AppTheme.textStyle.heading1.copyWith(color: AppTheme.colors.primaryColor1),
          itemStyle: AppTheme.textStyle.heading1,
        ),
        showTitleActions: true, onConfirm: (time) {
      selectTime = '${time.hour} : ${time.minute}';
      notifyListeners();
    }, currentTime: DateTime.now(), locale: LocaleType.en);
    notifyListeners();
  }

  // Add Data
  addData(BuildContext context) {
    CollectionReference followUp = followUps;
    followUp.add({
      'uid': auth.currentUser.uid,
      'name': name,
      'date': selectDate,
      'time': selectTime,
      'contact_number': contactNumber,
      'message': messageController.text,
    });
    AppRoutes.dismiss(context);
    flutterToast("Set !!", AppTheme.colors.primaryColor1);
    AppRoutes.dismiss(context);
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}
