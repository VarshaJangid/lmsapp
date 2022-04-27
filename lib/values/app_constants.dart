import 'dart:async';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

int versionCode = 1;
String appVersion = "1.0.0";


enum ButtonType { positiveButton, negativeButton }

class Constants {

  static const String userProgress = "userProgress";

  static const String email = "Email";

  static const String authToken = "authToken";

  static const String yourHome = "Your home. ";

  static const String greener = "Greener";

  static const String enjoyTheExperience = "Enjoy the experience";

  static const String login = "Login";

  static const String verify = "Verify";

  static const String signUp = "Sign up";

  static const String termsOfService = "Terms of service";

  static const String phoneNumber = "Phone Number";

  static const String password = "Password";

  static const String confirmPassword = "Confirm Password";

  static const String forgotYourPassword = "Forgot your password";

  static const String enterValidPhoneNumber = "Enter valid Phone number !!";

  static const String enterValidOTP = "Enter valid OTP!!";

  static const String successfullyLogged = "Successfully Logged In !!";

  static const String emailAddress = "Email Address";

  static const String wrongPasswordProvidedForThatUser = "Wrong password provided for that user.";

  static const String invalidOtp = "Invalid OTP";

  static const String enterValidValues = "Enter Valid Values !!";

  static const String fullName = "Full Name";

  static const String register = "Register";

  static const String passwordAndConfirmPasswordMustMatch = "Password and Confirm Password must match.";

  static const String thePasswordProvidedIsTooWeak = "The password provided is too weak.";

  static const String theAccountAlreadyExistsForThatEmail = "The account already exists for that email.";

  static const String thanksForYouRegistration = " Thanks For The Registration !!";

  static const String codeSent = "Code Sent";

  static const String address = "Address";

  static const String uid = "uid";

  static const String status = "status";

  static const String updatedAt = "updatedAt";

  static const String name = "Name";

  static const String phone = "phone";

  static const String addData = "Add Data";

  static const String addDetails = "Add Details";

  static const String details = "Details";

  static const String followUpDetails = "Follow Up Details";

  static const String successfullyAdded = "Successfully Added !!";

  static const String companyName = "Company Name";

  static const String chooseCategory = "Choose Category";

  static const String category = "Category";

  static const String hotel = "Hotel";

  static const String restaurants = "Restaurant";

  static const String hostel = "Hostel";

  static const String dhaba = "Dhaba";

  static const String hospital = "Hospital";

  static const String marriage = "Marriage";

  static const String party = "Party";

  static const String canteen = "Canteen";

  static const String other = "Other";

  static const String cancel = "CANCEL";

  static const String interest = "Interest";

  static const String yes = "Yes";

  static const String moderate = "Moderate";

  static const String no = "No";

  static const String browse = "Browse";

  static const String plotNo = "Plot No";

  static const String city = "City";

  static const String state = "state";

  static const String contactNumber = "Contact Number";

  static const String remark = "Remark";

  static const String nextFollow = "Next Follow Up";

  static const String averageDailyUse = "Average Daily Use (in KG)";

  static const String followUps = "Follow Ups";

  static const String todayVisiting = "Today Visiting";

  static const String orders = "Orders";

  static const String date = "Date";

  static const String time = "Time";

  static const String message = "Message";

  static const String selectDate = "Select Date";

  static const String selectTime = "Select Time";

  static const String timeMessage  = "Time & Message";

  static const String addMessageHere = 'Add Message Here ...';

  static const String notSet = "Not Set";

  static const String setTimeDate = "Set Date & Time !!";

  static const String enterAMessage = "Enter A Message !!";

  static const String pleaseEnterAValidNumber = "Please Enter A Valid Number !!";

  static const String selectCategory = "Select Category";

  static const String completeYourProfile = "Please Complete Your Profile !!";

  static const String somethingWentWrong = "Something went wrong";

  static const String set = "Set";

  static const String logout = "Log Out";

  static const String profile = "Profile";

  static const String rajasthan = "Rajasthan";

  static const String jaipur = "Jaipur";

  static const String location = "Location";

  static const String noData = "No Data";

  static const String deleted = "Deleted !!";
}
