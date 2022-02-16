import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '/values/app_constants.dart';
import '/services/firebase.dart';
import '/services/auth.dart';

class FollowUpsViewModel extends BaseViewModel {
  Stream<QuerySnapshot>? usersStream;

  init(BuildContext context) {
    usersStream = followUps
        .where(Constants.uid, isEqualTo: auth.currentUser.uid)
        .snapshots();
  }
}
