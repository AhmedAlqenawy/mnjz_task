import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle gotham(
  double fontSize,
  Color color,
  FontWeight fontWeight, {
  bool underline = false,
  bool overLine = false,
}) {
  fontSize = fontSize - 2.sp;
  //openSans
  return TextStyle(
    fontFamily: "Gotham",
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    decoration: underline != false
        ? TextDecoration.underline
        : overLine != false
            ? TextDecoration.lineThrough
            : TextDecoration.none,
  );
}
