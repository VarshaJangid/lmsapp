import 'package:cloud_firestore/cloud_firestore.dart';
import '/ui/followups/widget/followups_widget.dart';
import '/components/slide_delete_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import '/values/app_constants.dart';
import 'followups_view_model.dart';
import '/values/dimensions.dart';
import '/services/firebase.dart';
import '/theme/theme.dart';

class FollowUpsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return ViewModelBuilder<FollowUpsViewModel>.reactive(
      onModelReady: (model) => model.init(context),
      builder: (context, model, child) => StreamBuilder<QuerySnapshot>(
        stream: model.usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text(Constants.somethingWentWrong);
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                  color: AppTheme.colors.primaryColor1),
            );
          }
          return snapshot.data!.docs.isEmpty
              ? Center(
                  child: Text(
                    Constants.noData,
                    style: AppTheme.textStyle.alertText.copyWith(
                      fontSize: Dimensions.s14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(
                      Dimensions.paddingM, 0, Dimensions.paddingM, 0),
                  child: Wrap(
                    spacing: Dimensions.paddingL,
                    runSpacing: Dimensions.paddingM,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return SlideMenu(menuItems: [
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () => deleteData(document.id),
                        ),
                      ], child: FollowUpsWidget(data: data));
                    }).toList(),
                  ),
                );
        },
      ),
      viewModelBuilder: () => FollowUpsViewModel(),
    );
  }
}
