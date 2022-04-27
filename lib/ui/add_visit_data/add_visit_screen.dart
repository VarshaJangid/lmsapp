import '/components/app_textfield.dart';
import '/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import '/values/app_constants.dart';
import 'add_visit_view_model.dart';
import '/values/dimensions.dart';
import '/theme/theme.dart';

class AddVisitDataScreen extends StatelessWidget {
  const AddVisitDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return ViewModelBuilder<AddDataViewModel>.reactive(
      onModelReady: (model) => model.init(context),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            Constants.addDetails,
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
                const SizedBox(height: Dimensions.paddingL),
                GestureDetector(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: Dimensions.paddingXL,
                    child: Text(
                      model.category == ''
                          ? Constants.category
                          : model.category,
                      style: TextStyle(
                        color: model.category == ''
                            ? AppTheme.colors.lightGrey
                            : Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  onTap: () => model.buildCategoryDialog(context),
                ),
                Divider(
                  color: AppTheme.colors.blueGrey,
                  thickness: 1.2,
                ),
                model.category == Constants.other
                    ? AppTextField(
                        controller: model.otherController,
                        labelText: Constants.other,
                        keyboardType: TextInputType.name,
                        obscureText: false,
                        action: TextInputAction.next,
                      )
                    : const SizedBox(height: 0),
                AppTextField(
                  controller: model.companyNameController,
                  labelText: Constants.companyName,
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  action: TextInputAction.next,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: AppTextField(
                        controller: model.addressController,
                        labelText: Constants.address,
                        keyboardType: TextInputType.name,
                        obscureText: false,
                        action: TextInputAction.next,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .3,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: AppTheme.colors.primaryColor1),
                        onPressed: () async {
                          await model.getLocation();
                        },
                        child: const Text(
                          Constants.location,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                AppTextField(
                  controller: model.addressSecondController,
                  labelText: Constants.address + " (Optional)",
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  action: TextInputAction.next,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: Dimensions.s24,
                        ),
                        const Text(
                          Constants.rajasthan,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: Dimensions.s20,
                        ),
                        Container(
                          width: Dimensions.padding * 1.4,
                          height: 1,
                          color: AppTheme.colors.blueGrey,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: Dimensions.s24,
                        ),
                        const Text(
                          Constants.jaipur,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: Dimensions.s20,
                        ),
                        Container(
                          width: Dimensions.padding * 1.5,
                          height: 1,
                          color: AppTheme.colors.blueGrey,
                        ),
                      ],
                    ),
                  ],
                ),
                AppTextField(
                  controller: model.emailController,
                  labelText: Constants.email,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  action: TextInputAction.next,
                ),
                AppTextField(
                  controller: model.contactNumberController,
                  labelText: Constants.contactNumber,
                  keyboardType: TextInputType.phone,
                  obscureText: false,
                  action: TextInputAction.next,
                ),
                AppTextField(
                  controller: model.nameController,
                  labelText: Constants.name,
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  action: TextInputAction.next,
                ),
                AppTextField(
                  controller: model.remarkController,
                  labelText: Constants.remark,
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  action: TextInputAction.next,
                ),
                AppTextField(
                  controller: model.averageUseController,
                  labelText: Constants.averageDailyUse,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  action: TextInputAction.done,
                ),
                const SizedBox(height: Dimensions.s20),
                GestureDetector(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: Dimensions.s20 * 1.5,
                    child: Text(
                      model.interest == ''
                          ? Constants.interest
                          : model.interest,
                      style: TextStyle(
                        color: model.interest == ''
                            ? AppTheme.colors.lightGrey
                            : Colors.black,
                        fontSize: Dimensions.s16,
                      ),
                    ),
                  ),
                  onTap: () => model.buildInterestDialog(context),
                ),
                Divider(
                  color: AppTheme.colors.blueGrey,
                  thickness: 1.2,
                ),
                const SizedBox(height: Dimensions.paddingM),
                model.interest == 'No'
                    ? const SizedBox(
                        height: 0,
                      )
                    : GestureDetector(
                        child: SizedBox(
                          width: Dimensions.padding * 2,
                          height: Dimensions.s20 * 1.5,
                          child: Text(
                            model.selectDate == ''
                                ? Constants.nextFollow
                                : model.selectDate,
                            style: TextStyle(
                              color: model.selectDate == ''
                                  ? AppTheme.colors.lightGrey
                                  : Colors.black,
                              fontSize: Dimensions.s16,
                            ),
                          ),
                        ),
                        onTap: () => model.nextFollowUp(context),
                      ),
                Divider(
                    color: model.interest == 'No'
                        ? Colors.white
                        : AppTheme.colors.blueGrey,
                    thickness: 1.2),
                const SizedBox(
                  height: Dimensions.s12,
                ),
                CustomButton(
                    callback: () => model.validation(context),
                    title: Constants.addDetails),
                const SizedBox(
                  height: Dimensions.s12,
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => AddDataViewModel(),
    );
  }
}
