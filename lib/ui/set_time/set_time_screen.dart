import '/components/text_line_widget.dart';
import '/components/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '/values/app_constants.dart';
import 'set_time_view_model.dart';
import '/values/dimensions.dart';
import '/theme/theme.dart';

class SetTimeScreen extends StatelessWidget {
  final String number;
  final String name;

  SetTimeScreen({required this.number, required this.name});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return ViewModelBuilder<SetTimeViewModel>.reactive(
      onModelReady: (model) => model.init(context, number, name),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            Constants.timeMessage,
            style: AppTheme.textStyle.screenTitle,
          ),
          elevation: 0.0,
          backgroundColor: AppTheme.colors.primaryColor1,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: Dimensions.s30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: Dimensions.paddingS),
                GestureDetector(
                    onTap: () => model.datePicker(context),
                    child: Row(
                      children: [
                        TextLineWidget(Constants.selectDate, model.selectDate),
                        const Spacer(),
                        Icon(
                          Icons.date_range,
                          size: Dimensions.s24,
                          color: AppTheme.colors.primaryColor1,
                        ),
                      ],
                    )),
                const SizedBox(height: Dimensions.paddingS),
                GestureDetector(
                    onTap: () => model.timePicker(context),
                    child: Row(
                      children: [
                        TextLineWidget(Constants.selectTime, model.selectTime),
                        const Spacer(),
                        Icon(
                          Icons.access_time,
                          size: Dimensions.s24,
                          color: AppTheme.colors.primaryColor1,
                        ),
                      ],
                    )),
                const SizedBox(height: Dimensions.paddingS),
                Row(
                  children: [
                    TextLineWidget(Constants.phoneNumber, number),
                    const Spacer(),
                    Icon(
                      Icons.phone_android_outlined,
                      size: Dimensions.s24,
                      color: AppTheme.colors.primaryColor1,
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.padding,
                  child: TextFormField(
                    controller: model.messageController,
                    minLines: 5,
                    maxLines: 7,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: Constants.addMessageHere,
                    ),
                  ),
                ),
                const Divider(thickness: 1.5),
                const SizedBox(height: Dimensions.paddingXL),
                CustomButton(
                  callback: () => model.validation(context),
                  title: Constants.set,
                )
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => SetTimeViewModel(),
    );
  }
}
