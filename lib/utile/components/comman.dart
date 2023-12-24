import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

space(double h, double w) {
  return SizedBox(
    height: h,
    width: w,
  );
}

line(h, w, color, {hasDecoration = false, buttonPadding = 0.0}) {
  return hasDecoration == true
      ? Container(
          width: w,
          height: h,
          padding: EdgeInsets.only(bottom: buttonPadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.w),
            color: color,
          ),
        )
      : Container(
          width: w,
          height: h,
          color: color,
        );
}
