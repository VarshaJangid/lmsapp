import 'package:flutter/cupertino.dart';
import '/values/app_method.dart';
import 'package:stacked/stacked.dart';
import '/values/app_constants.dart';
import '/values/app_assets.dart';
import 'package:intl/intl.dart';

class DetailViewModel extends BaseViewModel {
  String image = '';
  dynamic currentTime = DateFormat.jm().format(DateTime.now());
  void init(BuildContext context, final category) {
    logger.i("Current Time is : $currentTime");
    category == Constants.hotel
        ? image = Assets.hotelJSON
        : category == Constants.restaurants
            ? image = Assets.restaurantJSON
            : category == Constants.hostel
                ? image = Assets.hotelJSON
                : category == Constants.dhaba
                    ? image = Assets.restaurantJSON
                    : category == Constants.hospital
                        ? image = Assets.hospitalJSON
                        : category == Constants.marriage
                            ? image = Assets.marriageJSON
                            : category == Constants.party
                                ? image = Assets.partyJSON
                                : category == Constants.canteen
                                    ? image = Assets.canteenJSON
                                    : category.toString().substring(0,5) == Constants.other
                                        ? image = Assets.canteenJSON
                                        : Assets.loginThink;
  }
}
