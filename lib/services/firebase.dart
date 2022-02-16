import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '/values/app_method.dart';
import '/services/auth.dart';
import '/theme/theme.dart';

// Provide direct access to Firebase functionality for the adventurous
final database = FirebaseFirestore.instance;
final user = database.collection('user');
final followUps = database.collection('follow_ups');
final userStatus = database.collection('user_status');
final visitDetails = database.collection('visit_details');

// Delete Data
Future<void> deleteData(String data) {
  return followUps
      .doc(data)
      .delete()
      .then((value) => flutterToast("Deleted !!", AppTheme.colors.primaryColor1))
      .catchError((error) => flutterToast("Failed to delete : $error", Colors.red));
}

// Update Data
Future<void> updateUser(String name, String email, String address) {
  return user
      .doc(auth.currentUser.mobileNo)
      .update({
        'uid': auth.currentUser.uid,
        'number': auth.currentUser.mobileNo,
        'name': name,
        'email': email,
        'address': address})
      .then((value) => flutterToast("Updated !!", AppTheme.colors.primaryColor1))
      .catchError((error) => flutterToast("Failed to update : $error", Colors.red));
}
