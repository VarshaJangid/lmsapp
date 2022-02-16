import '/ui/drawer/side_drawer_tile_widget.dart';
import '/components/context_extensions.dart';
import '/ui/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import '/values/app_constants.dart';
import '/values/app_routes.dart';
import '/values/dimensions.dart';
import '/services/auth.dart';
import '/theme/theme.dart';

class SideDrawerWidget extends StatelessWidget {
  List<String> menuList = [
    Constants.name,
    Constants.email,
    Constants.phoneNumber,
    Constants.email,
    Constants.email,
    Constants.email
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.getScreenWidth(aspectRatio: 1 / 2),
      child: Drawer(
        child: Container(
          height: context.getScreenHeight(aspectRatio: 1),
          width: context.getScreenWidth(aspectRatio: 1 / 2),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            AppTheme.colors.primaryColor1.withOpacity(.7),
            AppTheme.colors.primaryColor1.withOpacity(0.4),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Column(
            children: <Widget>[
              const SizedBox(height: Dimensions.s50),
              InkWell(
                child: SideDrawerItemWidget(
                  imageName: Icons.person,
                  name: Constants.profile,
                ),
                onTap: () {
                  AppRoutes.dismiss(context);
                  AppRoutes.goto(context, ProfileScreen());
                },
              ),
              const Spacer(),
              Row(
                children: [
                  const SizedBox(width: Dimensions.s10,),
                  const Icon(Icons.settings, color: Colors.white,),
                  const SizedBox(width: Dimensions.s10,),
                  const Text('Settings', style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),),
                  const SizedBox(width: Dimensions.s10,),
                  Container(width: 2, height: 20, color: Colors.white,),
                  const SizedBox(width: Dimensions.s10,),
                  const Icon(Icons.logout, color: Colors.white,),
                  const SizedBox(width: Dimensions.s10,),
                  GestureDetector(
                    onTap: () => auth.removeUserFromSharedPrefs(context),
                    child: const Text(
                      Constants.logout,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              const SizedBox(height: Dimensions.padding),
            ],
          ),
        ),
      ),
    );
  }
}