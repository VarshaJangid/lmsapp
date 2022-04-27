import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import '/values/dimensions.dart';
import 'package:logger/logger.dart';

// Show Toast Message
flutterToast(String message, Color color) {
  Fluttertoast.showToast(
      msg: "    " + message + "    ",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: Dimensions.s18);
}

// For Phone Call
makingPhoneCall(String number) async {
  final url = 'tel:$number';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

final Logger logger = Logger(
  printer: PrettyPrinter(
    methodCount: 1,
    errorMethodCount: 20,
    colors: true,
    printEmojis: true,
    printTime: true,
    lineLength: 10,
  ),
);
