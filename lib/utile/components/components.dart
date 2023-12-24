import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

 import '../constants/colors.dart';
import '../fonts.dart';

navigateTo(context, widget, {void Function()? than}) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    ).then((value) => than);

Future<void> navigateToAndFinish(context, widget) =>
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ), (Route<dynamic> route) {
      return false;
    });

void navigateToAndReplacement(context, widget) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      /*      (Route<dynamic> route){
      return false;
    }*/
    );

AppBar defaultAppBar(
    {required String title,
    required BuildContext context,
    List<Widget>? actions,
    double? titleSize,
    double? elevation,

    Color? leadingColor,
    void Function()? onTap,
    bool withBack = false,
    Color? shadowColor}) {
  return AppBar(
    title: Text(
      title,
      style: openSans(
          titleSize ?? 20.sp,  Colors.black, FontWeight.bold),
    ),
    centerTitle: true,
    elevation: elevation,
    surfaceTintColor: Colors.transparent,
    backgroundColor: Colors.white,
     leading: withBack
        ? GestureDetector(
            onTap: onTap ??
                () {
                  Navigator.of(context).pop();
                },
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: leadingColor ?? black,
              size: 20.r,
            ),
          )
        : null,
    actions: actions,
  );
}
