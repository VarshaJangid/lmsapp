import '/components/context_extensions.dart';
import '/ui/set_time/set_time_screen.dart';
import '/components/text_line_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '/values/app_constants.dart';
import '/values/app_routes.dart';
import '/values/dimensions.dart';
import 'detail_view_model.dart';
import '/theme/theme.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> data;

  DetailScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     centerTitle: false,
    //     title: Text(
    //       Constants.details,
    //       style: AppTheme.textStyle.screenTitle,
    //     ),
    //     elevation: 0.0,
    //     backgroundColor: AppTheme.colors.primaryColor1,
    //     iconTheme: const IconThemeData(color: Colors.white),
    //   ),
    //   body: Container(
    //     margin: const EdgeInsets.symmetric(horizontal: Dimensions.s30),
    //     child: ListView(
    //       children: [
    //         const SizedBox(height: Dimensions.paddingS),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Text(
    //               data['category'],
    //               style: AppTheme.textStyle.screenTitle.copyWith(
    //                   color: Colors.black, fontWeight: FontWeight.bold),
    //             ),
    //           ],
    //         ),
    //         const SizedBox(height: Dimensions.paddingM),
    //         TextLineWidget(Constants.companyName, data['company_name']),
    //         TextLineWidget(Constants.category, data['category']),
    //         TextLineWidget(Constants.address, data['address']),
    //         data['address_2'] == "" ? const SizedBox(height: 0,)
    //         : TextLineWidget(Constants.address + "(Optional)", data['address_2']),
    //         Row(
    //           children: [
    //             SizedBox(
    //               width: context.getScreenWidth(aspectRatio: 1 / 3.5),
    //               child: TextLineWidget(Constants.city, data['city']),
    //             ),
    //             const SizedBox(width: Dimensions.paddingL),
    //             SizedBox(
    //               width: context.getScreenWidth(aspectRatio: 1 / 2.1),
    //               child: TextLineWidget(Constants.state, data['state']),
    //             ),
    //           ],
    //         ),
    //         TextLineWidget(Constants.emailAddress, data['email']),
    //         TextLineWidget(Constants.contactNumber, data['contact_number']),
    //         TextLineWidget(Constants.name, data['name']),
    //         TextLineWidget(Constants.remark, data['remark']),
    //         TextLineWidget(Constants.nextFollow, data['next_follow']),
    //         TextLineWidget(Constants.averageDailyUse, data['average_daily_use']),
    //         TextLineWidget(Constants.interest, data['interest']),
    //       ],
    //     ),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //       elevation: 0.0,
    //       child: const Icon(Icons.more_time),
    //       backgroundColor: AppTheme.colors.primaryColor1,
    //       onPressed: () => AppRoutes.goto(context, SetTimeScreen(
    //           number: data['contact_number'], name: data['name']))),
    // );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return ViewModelBuilder<DetailViewModel>.reactive(
      onModelReady: (model) => model.init(context, data['category']),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            Constants.details,
            style: AppTheme.textStyle.screenTitle,
          ),
          elevation: 0.0,
          backgroundColor: AppTheme.colors.primaryColor1,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        floatingActionButton: FloatingActionButton(
            elevation: 0.0,
            child: const Icon(Icons.more_time),
            backgroundColor: AppTheme.colors.primaryColor1,
            onPressed: () => AppRoutes.goto(
                context,
                SetTimeScreen(
                    number: data['contact_number'], name: data['name']))),
        backgroundColor: AppTheme.colors.primaryColor1,
        body: SizedBox(
          width: context.getScreenWidth(aspectRatio: 1),
          height: context.getScreenHeight(aspectRatio: 1),
          child: Column(
            children: [
              Lottie.asset(model.image, height: Dimensions.padding * 2.1),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.fromLTRB(
                    Dimensions.s20, 0, Dimensions.s20, Dimensions.s20),
                width: context.getScreenWidth(aspectRatio: 1),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: ListView(
                  children: [
                    const SizedBox(height: Dimensions.paddingM),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data['category'],
                          style: AppTheme.textStyle.screenTitle.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: Dimensions.paddingM),
                    TextLineWidget(Constants.companyName, data['company_name']),
                    TextLineWidget(Constants.category, data['category']),
                    TextLineWidget(Constants.address, data['address']),
                    data['address_2'] == ""
                        ? const SizedBox(
                            height: 0,
                          )
                        : TextLineWidget(Constants.address + "(Optional)",
                            data['address_2']),
                    Row(
                      children: [
                        SizedBox(
                          width: context.getScreenWidth(aspectRatio: 1 / 3.5),
                          child: TextLineWidget(Constants.city, data['city']),
                        ),
                        const SizedBox(width: Dimensions.paddingL),
                        SizedBox(
                          width: context.getScreenWidth(aspectRatio: 1 / 2.1),
                          child: TextLineWidget(Constants.state, data['state']),
                        ),
                      ],
                    ),
                    TextLineWidget(Constants.emailAddress, data['email']),
                    TextLineWidget(
                        Constants.contactNumber, data['contact_number']),
                    TextLineWidget(Constants.name, data['name']),
                    TextLineWidget(Constants.remark, data['remark']),
                    TextLineWidget(Constants.nextFollow, data['next_follow']),
                    TextLineWidget(
                        Constants.averageDailyUse, data['average_daily_use']),
                    TextLineWidget(Constants.interest, data['interest']),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
      viewModelBuilder: () => DetailViewModel(),
    );
  }
}
