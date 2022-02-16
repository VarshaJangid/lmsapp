import 'package:flutter/material.dart';
import '/values/app_routes.dart';
import '/values/app_assets.dart';
import '/values/dimensions.dart';
import '/services/auth.dart';
import '/theme/theme.dart';

class ProfileScreen extends StatelessWidget {
  Widget textfield({@required hintText}) {
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              letterSpacing: 2,
              color: AppTheme.colors.primaryColor1,
              fontWeight: FontWeight.bold,
            ),
            fillColor: Colors.white30,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppTheme.colors.primaryColor1,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: Dimensions.padding*4.5,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: Dimensions.s10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: Dimensions.s20,),
                    textfield(hintText: auth.currentUser.name,),
                    textfield(hintText: auth.currentUser.email,),
                    textfield(hintText: auth.currentUser.mobileNo,),
                    textfield(hintText: auth.currentUser.address,),
                    const SizedBox(height: Dimensions.s30,),
                  ],
                ),
              )
            ],
          ),
          CustomPaint(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(Dimensions.s20),
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: Dimensions.s24,
                    letterSpacing: 1.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(Assets.welcome),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = AppTheme.colors.primaryColor1;
    Path path = Path()
      ..relativeLineTo(0, Dimensions.padding * 1.5)
      ..quadraticBezierTo(size.width / 2, 225, size.width, Dimensions.padding*1.5)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
