import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '/services/auth.dart';
import 'package:stacked/stacked.dart';
import '/values/dimensions.dart';
import 'orders_view_model.dart';
import '/theme/theme.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return ViewModelBuilder<OrdersViewModel>.reactive(
      onModelReady: (model) => model.init(context),
      builder: (context, model, child) =>  const Padding(
        padding: EdgeInsets.fromLTRB(Dimensions.s24,Dimensions.s5,Dimensions.s24,0),

        // child: SingleChildScrollView(
        //   child: Wrap(
        //     spacing: Dimensions.paddingL,
        //     runSpacing: Dimensions.paddingM,
        //     children: [
        //       Container(
        //         width: Dimensions.padding * 1.58,
        //         height: Dimensions.padding * 1.6,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(Dimensions.s6),
        //           boxShadow: [
        //             BoxShadow(
        //                 blurRadius: 55,
        //                 offset: const Offset(0.0, Dimensions.s15),
        //                 color: AppTheme.colors.primaryColor1.withOpacity(0.1))
        //           ],
        //           color: Colors.white,
        //         ),
        //         padding: const EdgeInsets.all(20.0),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           children: [
        //             Container(
        //               width: Dimensions.paddingXL * 1.3,
        //               height: Dimensions.paddingXL * 1.3,
        //               decoration: BoxDecoration(
        //                   color: AppTheme.colors.primaryColor1.withOpacity(.2),
        //                   borderRadius: BorderRadius.circular(Dimensions.paddingL)),
        //               child: Center(
        //                 child: Text(
        //                   "1",
        //                   style: AppTheme.textStyle.heading1,
        //                 ),
        //               ),
        //             ),
        //             const Text(
        //               "Title",
        //               style: TextStyle(
        //                   color: Color(0xFF444444),
        //                   fontSize: Dimensions.s16,
        //                   fontWeight: FontWeight.w600),
        //             ),
        //           ],
        //         ),
        //       ),
        //       Container(
        //         width: Dimensions.padding * 1.58,
        //         height: Dimensions.padding * 1.6,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(Dimensions.s6),
        //           boxShadow: [
        //             BoxShadow(
        //                 blurRadius: 55,
        //                 offset: const Offset(0.0, Dimensions.s15),
        //                 color: AppTheme.colors.primaryColor1.withOpacity(0.1))
        //           ],
        //           color: Colors.white,
        //         ),
        //         padding: const EdgeInsets.all(20.0),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           children: [
        //             Container(
        //               width: Dimensions.paddingXL * 1.3,
        //               height: Dimensions.paddingXL * 1.3,
        //               decoration: BoxDecoration(
        //                   color: AppTheme.colors.primaryColor1.withOpacity(.2),
        //                   borderRadius: BorderRadius.circular(Dimensions.paddingL)),
        //               child: Center(
        //                 child: Text(
        //                   "2",
        //                   style: AppTheme.textStyle.heading1,
        //                 ),
        //               ),
        //             ),
        //             const Text(
        //               "Title",
        //               style: TextStyle(
        //                   color: Color(0xFF444444),
        //                   fontSize: Dimensions.s16,
        //                   fontWeight: FontWeight.w600),
        //             ),
        //           ],
        //         ),
        //       ),
        //       Container(
        //         width: Dimensions.padding * 1.58,
        //         height: Dimensions.padding * 1.6,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(Dimensions.s6),
        //           boxShadow: [
        //             BoxShadow(
        //                 blurRadius: 55,
        //                 offset: const Offset(0.0, Dimensions.s15),
        //                 color: AppTheme.colors.primaryColor1.withOpacity(0.1))
        //           ],
        //           color: Colors.white,
        //         ),
        //         padding: const EdgeInsets.all(20.0),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           children: [
        //             Container(
        //               width: Dimensions.paddingXL * 1.3,
        //               height: Dimensions.paddingXL * 1.3,
        //               decoration: BoxDecoration(
        //                   color: AppTheme.colors.primaryColor1.withOpacity(.2),
        //                   borderRadius: BorderRadius.circular(Dimensions.paddingL)),
        //               child: Center(
        //                 child: Text(
        //                   "3",
        //                   style: AppTheme.textStyle.heading1,
        //                 ),
        //               ),
        //             ),
        //             const Text(
        //               "Title",
        //               style: TextStyle(
        //                   color: Color(0xFF444444),
        //                   fontSize: Dimensions.s16,
        //                   fontWeight: FontWeight.w600),
        //             ),
        //           ],
        //         ),
        //       ),
        //       Container(
        //         width: Dimensions.padding * 1.58,
        //         height: Dimensions.padding * 1.6,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(Dimensions.s6),
        //           boxShadow: [
        //             BoxShadow(
        //                 blurRadius: 55,
        //                 offset: const Offset(0.0, Dimensions.s15),
        //                 color: AppTheme.colors.primaryColor1.withOpacity(0.1))
        //           ],
        //           color: Colors.white,
        //         ),
        //         padding: const EdgeInsets.all(20.0),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           children: [
        //             Container(
        //               width: Dimensions.paddingXL * 1.3,
        //               height: Dimensions.paddingXL * 1.3,
        //               decoration: BoxDecoration(
        //                   color: AppTheme.colors.primaryColor1.withOpacity(.2),
        //                   borderRadius: BorderRadius.circular(Dimensions.paddingL)),
        //               child: Center(
        //                 child: Text(
        //                   "4",
        //                   style: AppTheme.textStyle.heading1,
        //                 ),
        //               ),
        //             ),
        //             const Text(
        //               "Title",
        //               style: TextStyle(
        //                   color: Color(0xFF444444),
        //                   fontSize: Dimensions.s16,
        //                   fontWeight: FontWeight.w600),
        //             ),
        //           ],
        //         ),
        //       ),
        //       Container(
        //         width: Dimensions.padding * 1.58,
        //         height: Dimensions.padding * 1.6,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(Dimensions.s6),
        //           boxShadow: [
        //             BoxShadow(
        //                 blurRadius: 55,
        //                 offset: const Offset(0.0, Dimensions.s15),
        //                 color: AppTheme.colors.primaryColor1.withOpacity(0.1))
        //           ],
        //           color: Colors.white,
        //         ),
        //         padding: const EdgeInsets.all(20.0),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           children: [
        //             Container(
        //               width: Dimensions.paddingXL * 1.3,
        //               height: Dimensions.paddingXL * 1.3,
        //               decoration: BoxDecoration(
        //                   color: AppTheme.colors.primaryColor1.withOpacity(.2),
        //                   borderRadius: BorderRadius.circular(Dimensions.paddingL)),
        //               child: Center(
        //                 child: Text(
        //                   "5",
        //                   style: AppTheme.textStyle.heading1,
        //                 ),
        //               ),
        //             ),
        //             const Text(
        //               "Title",
        //               style: TextStyle(
        //                   color: Color(0xFF444444),
        //                   fontSize: Dimensions.s16,
        //                   fontWeight: FontWeight.w600),
        //             ),
        //           ],
        //         ),
        //       ),
        //       Container(
        //         width: Dimensions.padding * 1.58,
        //         height: Dimensions.padding * 1.6,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(Dimensions.s6),
        //           boxShadow: [
        //             BoxShadow(
        //                 blurRadius: 55,
        //                 offset: const Offset(0.0, Dimensions.s15),
        //                 color: AppTheme.colors.primaryColor1.withOpacity(0.1))
        //           ],
        //           color: Colors.white,
        //         ),
        //         padding: const EdgeInsets.all(20.0),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           children: [
        //             Container(
        //               width: Dimensions.paddingXL * 1.3,
        //               height: Dimensions.paddingXL * 1.3,
        //               decoration: BoxDecoration(
        //                   color: AppTheme.colors.primaryColor1.withOpacity(.2),
        //                   borderRadius: BorderRadius.circular(Dimensions.paddingL)),
        //               child: Center(
        //                 child: Text(
        //                   "6",
        //                   style: AppTheme.textStyle.heading1,
        //                 ),
        //               ),
        //             ),
        //             const Text(
        //               "Title",
        //               style: TextStyle(
        //                   color: Color(0xFF444444),
        //                   fontSize: Dimensions.s16,
        //                   fontWeight: FontWeight.w600),
        //             ),
        //           ],
        //         ),
        //       ),
        //       Container(
        //         width: Dimensions.padding * 1.58,
        //         height: Dimensions.padding * 1.6,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(Dimensions.s6),
        //           boxShadow: [
        //             BoxShadow(
        //                 blurRadius: 55,
        //                 offset: const Offset(0.0, Dimensions.s15),
        //                 color: AppTheme.colors.primaryColor1.withOpacity(0.1))
        //           ],
        //           color: Colors.white,
        //         ),
        //         padding: const EdgeInsets.all(20.0),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           children: [
        //             Container(
        //               width: Dimensions.paddingXL * 1.3,
        //               height: Dimensions.paddingXL * 1.3,
        //               decoration: BoxDecoration(
        //                   color: AppTheme.colors.primaryColor1.withOpacity(.2),
        //                   borderRadius: BorderRadius.circular(Dimensions.paddingL)),
        //               child: Center(
        //                 child: Text(
        //                   "7",
        //                   style: AppTheme.textStyle.heading1,
        //                 ),
        //               ),
        //             ),
        //             const Text(
        //               "Title",
        //               style: TextStyle(
        //                   color: Color(0xFF444444),
        //                   fontSize: Dimensions.s16,
        //                   fontWeight: FontWeight.w600),
        //             ),
        //           ],
        //         ),
        //       ),
        //       Container(
        //         width: Dimensions.padding * 1.58,
        //         height: Dimensions.padding * 1.6,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(Dimensions.s6),
        //           boxShadow: [
        //             BoxShadow(
        //                 blurRadius: 55,
        //                 offset: const Offset(0.0, Dimensions.s15),
        //                 color: AppTheme.colors.primaryColor1.withOpacity(0.1))
        //           ],
        //           color: Colors.white,
        //         ),
        //         padding: const EdgeInsets.all(20.0),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           children: [
        //             Container(
        //               width: Dimensions.paddingXL * 1.3,
        //               height: Dimensions.paddingXL * 1.3,
        //               decoration: BoxDecoration(
        //                   color: AppTheme.colors.primaryColor1.withOpacity(.2),
        //                   borderRadius: BorderRadius.circular(Dimensions.paddingL)),
        //               child: Center(
        //                 child: Text(
        //                   "8",
        //                   style: AppTheme.textStyle.heading1,
        //                 ),
        //               ),
        //             ),
        //             const Text(
        //               "Title",
        //               style: TextStyle(
        //                   color: Color(0xFF444444),
        //                   fontSize: Dimensions.s16,
        //                   fontWeight: FontWeight.w600),
        //             ),
        //           ],
        //         ),
        //       ),
        //       Container(
        //         width: Dimensions.padding * 1.58,
        //         height: Dimensions.padding * 1.6,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(Dimensions.s6),
        //           boxShadow: [
        //             BoxShadow(
        //                 blurRadius: 55,
        //                 offset: const Offset(0.0, Dimensions.s15),
        //                 color: AppTheme.colors.primaryColor1.withOpacity(0.1))
        //           ],
        //           color: Colors.white,
        //         ),
        //         padding: const EdgeInsets.all(20.0),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           children: [
        //             Container(
        //               width: Dimensions.paddingXL * 1.3,
        //               height: Dimensions.paddingXL * 1.3,
        //               decoration: BoxDecoration(
        //                   color: AppTheme.colors.primaryColor1.withOpacity(.2),
        //                   borderRadius: BorderRadius.circular(Dimensions.paddingL)),
        //               child: Center(
        //                 child: Text(
        //                   "9",
        //                   style: AppTheme.textStyle.heading1,
        //                 ),
        //               ),
        //             ),
        //             const Text(
        //               "Title",
        //               style: TextStyle(
        //                   color: Color(0xFF444444),
        //                   fontSize: Dimensions.s16,
        //                   fontWeight: FontWeight.w600),
        //             ),
        //           ],
        //         ),
        //       ),
        //       Container(
        //         width: Dimensions.padding * 1.58,
        //         height: Dimensions.padding * 1.6,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(Dimensions.s6),
        //           boxShadow: [
        //             BoxShadow(
        //                 blurRadius: 55,
        //                 offset: const Offset(0.0, Dimensions.s15),
        //                 color: AppTheme.colors.primaryColor1.withOpacity(0.1))
        //           ],
        //           color: Colors.white,
        //         ),
        //         padding: const EdgeInsets.all(20.0),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           children: [
        //             Container(
        //               width: Dimensions.paddingXL * 1.3,
        //               height: Dimensions.paddingXL * 1.3,
        //               decoration: BoxDecoration(
        //                   color: AppTheme.colors.primaryColor1.withOpacity(.2),
        //                   borderRadius: BorderRadius.circular(Dimensions.paddingL)),
        //               child: Center(
        //                 child: Text(
        //                   "10",
        //                   style: AppTheme.textStyle.heading1,
        //                 ),
        //               ),
        //             ),
        //             const Text(
        //               "Title",
        //               style: TextStyle(
        //                   color: Color(0xFF444444),
        //                   fontSize: Dimensions.s16,
        //                   fontWeight: FontWeight.w600),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        child: Center(
          child: Text("No Data"),
        ),
      ),
      viewModelBuilder: () => OrdersViewModel(),
    );
  }
}
