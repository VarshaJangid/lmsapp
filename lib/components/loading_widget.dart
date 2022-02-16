import 'package:flutter/material.dart';
import 'dart:math';

import '/theme/theme.dart';

class FullScreenLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.maxFinite,
      height: double.maxFinite,
      child: Align(
        alignment: Alignment.center,
        child: Center(
          child: CircularProgressIndicator(
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            backgroundColor: AppTheme.colors.primaryColor1,
          ),
        ),
      ),
    );
  }
}

class LoadingWidget extends StatefulWidget {
  final double radius;
  final double iconSize;
  final double size;

  LoadingWidget({this.radius = 60.0, this.iconSize = 30.0, this.size = 100.0});

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  Animation<double>? animationRotation;
  Animation<double>? animationRadiusIn;
  Animation<double>? animationRadiusOut;
  AnimationController? controller;

  double? radius;
  double? dotRadius;
  double? size;

  @override
  void initState() {
    super.initState();

    radius = widget.radius;
    dotRadius = widget.iconSize;
    size = widget.size;

    print(dotRadius);

    controller = AnimationController(
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: const Duration(milliseconds: 3000),
        vsync: this);

    animationRotation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller!,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    animationRadiusIn = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller!,
        curve: const Interval(0.75, 1.0, curve: Curves.elasticIn),
      ),
    );

    animationRadiusOut = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller!,
        curve: const Interval(0.0, 0.25, curve: Curves.elasticOut),
      ),
    );

    controller!.addListener(() {
      setState(() {
        if (controller!.value >= 0.75 && controller!.value <= 1.0) {
          radius = widget.radius * animationRadiusIn!.value;
        } else if (controller!.value >= 0.0 && controller!.value <= 0.25) {
          radius = widget.radius * animationRadiusOut!.value;
        }
      });
    });

    controller!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      //color: Colors.black12,
      child: Center(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
//              Image(
//                image: AssetImage(
//                  Assets.logo_round,
//                ),
//                width: size / 2,
//                height: size / 2,
//                fit: BoxFit.fitWidth,
//              ),
              RotationTransition(
                turns: animationRotation!,
                child: Stack(
                  children: [
                    Transform.translate(
//                      child: BadgeWidget(
//                        backGroundColor: AppTheme.colors.lowWastage,
//                        assetName: Assets.lowWastage,
//                      ),
                      offset: Offset(
                        radius! * cos(0.0),
                        radius! * sin(0.0),
                      ),
                    ),
                    Transform.translate(
//                      child: BadgeWidget(
//                        backGroundColor: AppTheme.colors.chemicalFree,
//                        assetName: Assets.lessChemical,
//                      ),
                      offset: Offset(
                        radius! * cos(0.0 + 1 * pi / 4),
                        radius! * sin(0.0 + 1 * pi / 4),
                      ),
                    ),
                    Transform.translate(
//                      child: BadgeWidget(
//                        backGroundColor: AppTheme.colors.waterBlue,
//                        assetName: Assets.conservesWater,
//                      ),
                      offset: Offset(
                        radius! * cos(0.0 + 2 * pi / 4),
                        radius! * sin(0.0 + 2 * pi / 4),
                      ),
                    ),
                    Transform.translate(
//                      child: BadgeWidget(
//                        backGroundColor: AppTheme.colors.healthierOpinion,
//                        assetName: Assets.healthierOpinion,
//                      ),
                      offset: Offset(
                        radius! * cos(0.0 + 3 * pi / 4),
                        radius! * sin(0.0 + 3 * pi / 4),
                      ),
                    ),
                    Transform.translate(
//                      child: BadgeWidget(
//                        backGroundColor: AppTheme.colors.healthierOpinion,
//                        assetName: Assets.healthierOpinion,
//                      ),
                      offset: Offset(
                        radius! * cos(0.0 + 4 * pi / 4),
                        radius! * sin(0.0 + 4 * pi / 4),
                      ),
                    ),
                    Transform.translate(
//                      child: BadgeWidget(
//                        backGroundColor: AppTheme.colors.healthierOpinion,
//                        assetName: Assets.healthierOpinion,
//                      ),
                      offset: Offset(
                        radius! * cos(0.0 + 5 * pi / 4),
                        radius! * sin(0.0 + 5 * pi / 4),
                      ),
                    ),
                    Transform.translate(
//                      child: BadgeWidget(
//                        backGroundColor: AppTheme.colors.healthierOpinion,
//                        assetName: Assets.healthierOpinion,
//                      ),
                      offset: Offset(
                        radius! * cos(0.0 + 6 * pi / 4),
                        radius! * sin(0.0 + 6 * pi / 4),
                      ),
                    ),
                    Transform.translate(
//                      child: BadgeWidget(
//                        backGroundColor: AppTheme.colors.healthierOpinion,
//                        assetName: Assets.healthierOpinion,
//                      ),
                      offset: Offset(
                        radius! * cos(0.0 + 7 * pi / 4),
                        radius! * sin(0.0 + 7 * pi / 4),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}
