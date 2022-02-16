import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '/services/firebase.dart';
import 'package:stacked/stacked.dart';
import '/values/app_constants.dart';
import '/services/auth.dart';

class VisitedViewModel extends BaseViewModel {
  Stream<QuerySnapshot>? usersStream;

  init(BuildContext context) {
    usersStream = visitDetails
        // .orderBy("current_time", descending: true)
        .where(Constants.uid, isEqualTo: auth.currentUser.uid)
        .snapshots();
  }
}
//other, hotel, rest,