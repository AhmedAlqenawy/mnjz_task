import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../fonts.dart';

defaultAppBar(
  String title,
) {
  return AppBar(
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Text(
      title,
      style: openSans(20.sp, Colors.white, AppFontWeight.bold),
      textScaleFactor: 1,
    ),
  );
}
