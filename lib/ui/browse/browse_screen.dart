import '/ui/drawer/side_drawer_widget.dart';
import '/ui/followups/followups_screen.dart';
import '../visited_place/visiting_screen.dart';
import 'package:flutter/material.dart';
import '/ui/orders/orders_screen.dart';
import '/values/app_constants.dart';
import '/values/dimensions.dart';
import '/theme/theme.dart';

class BrowseScreen extends StatefulWidget {
  @override
  _BrowseScreenState createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  final Shader linearGradient = LinearGradient(
    colors: <Color>[
      AppTheme.colors.primaryColor1,
      AppTheme.colors.secondaryColorGreen
    ],
  ).createShader(const Rect.fromLTWH(
      0.0, 0.0, Dimensions.padding * 2, Dimensions.paddingXXL));
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 10.0,
        child: SideDrawerWidget(),
      ),
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppTheme.colors.primaryColor1,
        centerTitle: false,
        leading: IconButton(
            onPressed: () => scaffoldKey.currentState!.openDrawer(),
            icon: const Icon(Icons.menu)),
        title: Text(
          Constants.browse,
          style: AppTheme.textStyle.screenTitle,
        ),
        bottom: PreferredSize(
          preferredSize: const Size(
              Dimensions.paddingXL * 1.25, Dimensions.paddingXL * 1.4),
          child: Container(
            color: Colors.white,
            child: TabBar(
              controller: controller,
              tabs: const [
                Tab(text: Constants.followUps),
                Tab(text: Constants.todayVisiting),
                Tab(text: Constants.orders),
              ],
              indicatorColor: AppTheme.colors.secondaryColorGreen,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = linearGradient,
              ),
              isScrollable: false,
              unselectedLabelStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [FollowUpsScreen(), VisitingScreen(), OrdersScreen()],
      ),
    );
  }
}