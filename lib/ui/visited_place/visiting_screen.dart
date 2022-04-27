import '/ui/visited_place/widget/visited_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/ui/visited_place/visited_view_model.dart';
import '/ui/add_visit_data/add_visit_screen.dart';
import '/components/context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '/values/app_constants.dart';
import '/values/dimensions.dart';
import '/values/app_routes.dart';
import '/theme/theme.dart';

class VisitingScreen extends StatelessWidget {
  const VisitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return ViewModelBuilder<VisitedViewModel>.reactive(
      onModelReady: (model) => model.init(context),
      builder: (context, model, child) => Scaffold(
        body: SizedBox(
          width: context.getScreenWidth(aspectRatio: 1),
          child: Column(
            children: [
              const SizedBox(height: Dimensions.s10),
              StreamBuilder<QuerySnapshot>(
                stream: model.usersStream,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text(Constants.somethingWentWrong);
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppTheme.colors.primaryColor1,
                      ),
                    );
                  }
                  return Expanded(
                    child: Container(
                      width: context.getScreenWidth(aspectRatio: 1),
                      margin: const EdgeInsets.only(
                          left: Dimensions.s10, right: Dimensions.s10),
                      child: ListView(
                        children: snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                          return VisitedWidget(data: data);
                        }).toList(),
                      ),
                    ),
                  );
                },
              )
              // VisitedPlaceScreen(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            elevation: 0.0,
            child: const Icon(Icons.add),
            backgroundColor: AppTheme.colors.primaryColor1,
            onPressed: () => AppRoutes.goto(context, const AddVisitDataScreen())),
      ),
      viewModelBuilder: () => VisitedViewModel(),
    );
  }
}
