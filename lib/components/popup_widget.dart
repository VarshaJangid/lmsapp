import '/ui/add_visit_data/add_visit_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/values/dimensions.dart';
import '/values/app_routes.dart';
import '/theme/theme.dart';

class PopUpWidget extends StatelessWidget {
  final AddDataViewModel model;
  final String title;

  PopUpWidget({required this.title, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        model.category = title;
        model.categoryController.text = title;
        model.notifyListeners();
        AppRoutes.dismiss(context);
      },
      child: Column(
        children: [
          const SizedBox(height: Dimensions.s10,),
          Text(title, style: AppTheme.textStyle.screenTitle
              .copyWith(color: Colors.black),
          ),
          const SizedBox(height: Dimensions.s10,),
          Divider(thickness: 1, color: AppTheme.colors.primaryColor1.withOpacity(.2),)
        ],
      ),
    );
  }
}
